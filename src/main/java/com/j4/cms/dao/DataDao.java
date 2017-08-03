package com.j4.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.j4.base.CrudDao;
import com.j4.cms.obj.Data;
import com.j4.cms.obj.Model;

public interface DataDao extends CrudDao<Data> {

	List<Data> findLimit(Data entity);

	Data findOne(Data entity);

	void updateState(Data entity);

	void updateModelCode(@Param("tableName") String tableName, @Param("newModelCode") String newModelCode,
			@Param("oldModelCode") String oldModelCode);
	
	void deleteBy(Model model);
}
