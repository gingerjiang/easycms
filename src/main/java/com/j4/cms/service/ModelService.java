package com.j4.cms.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.guice.transactional.Transactional;

import com.j4.base.CrudService;
import com.j4.cms.dao.ColumnDao;
import com.j4.cms.dao.DataDao;
import com.j4.cms.dao.ModelDao;
import com.j4.cms.obj.Column;
import com.j4.cms.obj.Model;
import com.j4.cms.obj.Node;

public class ModelService extends CrudService<ModelDao, Model> {

	@Inject
	DataDao dataDao;	
	@Inject
	ColumnDao columnDao;
	public List<Node> findTree() {
		return dao.findTree();
	}
	
	/*public Model getBy(String code) {
		return dao.getBy(code);
	}*/
	
	public List<Model> getByParentId(Integer pid) {
		return dao.getByParentId(pid);
	}
	
	@Transactional
	@Override
	public void save(Model entity) {
		if (null == entity.getId()) {
			dao.insert(entity);
			//默认插入2个列
			Column column1 = new Column();
			column1.setModelId(entity.getId());
			column1.setName("标题");
			column1.setType("text");
			column1.setSeq(1);
			column1.setRemark("标题");
			column1.setWidth(200);
			column1.setAllowBlank("0");
			column1.setListShow("1");
			column1.setStatus(1);
			column1.setMappingData("c1");
			columnDao.insert(column1);
			Column column2 = new Column();
			column2.setModelId(entity.getId());
			column2.setName("内容");
			column2.setType("editor");
			column2.setSeq(5);
			column2.setRemark("");
			column2.setWidth(200);
			column2.setAllowBlank("1");
			column2.setListShow("0");
			column2.setStatus(1);
			column2.setMappingData("c15");
			columnDao.insert(column2);
		} else {
			dao.update(entity);
		}
	}
	
	@Transactional
	public int delete(String id) {
		int modelId = Integer.parseInt(id);
		Model model = dao.get(modelId);
		//删除模型
		dao.delete(modelId);
		//删除配置的字段信息
		columnDao.deleteBy(modelId);
		//删除时数据
		dataDao.deleteBy(model);
		return 1;
	}
}
