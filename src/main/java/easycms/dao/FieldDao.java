package easycms.dao;

import easycms.base.CrudDao;
import easycms.obj.Field;

public interface FieldDao extends CrudDao<Field> {

	
	void deleteBy(int subjectId);
	
	Integer maxSeq(int subjectId);
}
