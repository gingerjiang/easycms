package easycms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import easycms.base.CrudDao;
import easycms.obj.Data;
import easycms.obj.Subject;

public interface DataDao extends CrudDao<Data> {

	List<Data> findLimit(Data entity);

	Data findOne(Data entity);

	void updateState(Data entity);

	void updateSubjectCode(@Param("tableName") String tableName, @Param("newSubjectCode") String newSubjectCode,
			@Param("oldSubjectCode") String oldSubjectCode);
	
	void deleteBy(Subject subject);
}
