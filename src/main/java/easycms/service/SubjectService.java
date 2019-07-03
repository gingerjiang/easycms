package easycms.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.guice.transactional.Transactional;

import com.google.common.collect.Lists;

import easycms.base.CrudService;
import easycms.dao.DataDao;
import easycms.dao.FieldDao;
import easycms.dao.SubjectDao;
import easycms.obj.Field;
import easycms.obj.Node;
import easycms.obj.Subject;

public class SubjectService extends CrudService<SubjectDao, Subject> {

	@Inject
	DataDao dataDao;
	@Inject
	FieldDao fieldDao;

	public List<Node> findTree() {
		return dao.findTree();
	}
	/**
	 * 后台管理首页菜单
	 * @return
	 */
	public List<Node> menu() {
		List<Subject> subjects = dao.getByParentId(0);
		List<Node> allNodes = findTree();
		List<Node> nodes = Lists.newArrayList();
		for (Subject m : subjects) {
			Node n = recursive(allNodes, m.getId());
			nodes.add(n);
		}
		return nodes;
	}
	/**
	 * 递归处理首页菜单
	 * @param list
	 * @param id
	 * @return
	 */
	private Node recursive(List<Node> list, int id) {
		Node pnode = getNode(list, id);
		List<Node> childs = getChilds(list, pnode.getId());
		// 遍历子节点
		for (Node child : childs) {
			Node n = recursive(list, child.getId()); // 递归
			pnode.getNodes().add(n);
		}
		return pnode;
	}

	private List<Node> getChilds(List<Node> list, int id) {
		List<Node> childs = Lists.newArrayList();
		for (Node node : list) {
			if (id == node.getpId()) {
				childs.add(node);
			}
		}
		return childs;
	}

	private Node getNode(List<Node> list, int id) {
		Node temp = new Node();
		for (Node node : list) {
			if (id == node.getId()) {
				temp = node;
				break;
			}
		}
		return temp;
	}

	public List<Subject> getByParentId(Integer pid) {
		return dao.getByParentId(pid);
	}

	public Subject getParent(Integer id) {
		Subject node = dao.get(id);
		node = dao.get(node.getParentId());
		return node;
	}
	public List<Subject> getChilds(Integer id) {
		return dao.getChilds(id);
	}

	@Transactional
	@Override
	public void save(Subject entity) {
		if (null == entity.getId()) {
			dao.insert(entity);
			// 默认插入2个列
			Field field1 = new Field();
			field1.setSubjectId(entity.getId());
			field1.setName("标题");
			field1.setType("text");
			field1.setSeq(1);
			field1.setRemark("标题");
			field1.setWidth(200);
			field1.setAllowBlank("0");
			field1.setListShow("1");
			field1.setStatus(1);
			field1.setMappingData("c1");
			fieldDao.insert(field1);
			Field field2 = new Field();
			field2.setSubjectId(entity.getId());
			field2.setName("内容");
			field2.setType("editor");
			field2.setSeq(5);
			field2.setRemark("");
			field2.setWidth(200);
			field2.setAllowBlank("1");
			field2.setListShow("0");
			field2.setStatus(1);
			field2.setMappingData("c15");
			fieldDao.insert(field2);
		} else {
			dao.update(entity);
		}
	}

	@Transactional
	public int delete(String id) {
		int subjectId = Integer.parseInt(id);
		Subject subject = dao.get(subjectId);
		// 删除模型
		dao.delete(subjectId);
		// 删除配置的字段信息
		fieldDao.deleteBy(subjectId);
		// 删除时数据
		dataDao.deleteBy(subject);
		return 1;
	}
	@Transactional
	public int copy(String id) {
		int subjectId = Integer.parseInt(id);
		Subject subject = dao.get(subjectId);
		Field c = new Field();
		c.setSubjectId(subjectId);
		List<Field> fields = fieldDao.findList(c);
		subject.setId(null);
		dao.insert(subject);
		for (Field co : fields) {
			co.setSubjectId(subject.getId());
			fieldDao.insert(co);
		}
		return 1;
	}
}
