package easycms.dao;

import java.util.List;

import easycms.base.CrudDao;
import easycms.obj.Node;
import easycms.obj.Subject;

public interface SubjectDao extends CrudDao<Subject> {

	public List<Node> findTree();
	
	List<Subject> getChilds(Integer id);
	//public Subject getBy(String code);
	
	List<Subject> getByParentId(Integer pid);
	
	void deleteBy(String subjectId);
}
