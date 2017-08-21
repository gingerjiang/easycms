package com.j4.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.j4.base.CrudDao;
import com.j4.cms.obj.Combo;

public interface ComboDao extends CrudDao<Combo> {

	List<Combo> findBy(@Param("sql") String sql);
}
