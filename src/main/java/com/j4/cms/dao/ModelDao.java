package com.j4.cms.dao;

import java.util.List;

import com.j4.base.CrudDao;
import com.j4.cms.obj.Node;
import com.j4.cms.obj.Model;

public interface ModelDao extends CrudDao<Model> {

	
	public List<Node> findTree();
	
	
	//public Model getBy(String code);
	
	List<Model> getByParentId(Integer pid);
	
	void deleteBy(String modelId);
}
