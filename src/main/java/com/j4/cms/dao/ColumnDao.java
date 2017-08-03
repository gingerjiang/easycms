package com.j4.cms.dao;

import com.j4.base.CrudDao;
import com.j4.cms.obj.Column;

public interface ColumnDao extends CrudDao<Column> {

	
	void deleteBy(int modelId);
}
