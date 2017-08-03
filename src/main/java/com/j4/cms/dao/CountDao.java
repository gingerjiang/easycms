package com.j4.cms.dao;

import java.util.List;
import java.util.Map;

import com.j4.cms.obj.Model;

public interface CountDao {

	
	List<Map<String, Object>> numModelCode();
	
	
	List<Model> findModel();
	
	
	List<Map<String, Object>> numMonth();
}
