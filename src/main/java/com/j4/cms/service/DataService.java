package com.j4.cms.service;

import java.util.List;

import javax.inject.Inject;

import com.j4.base.CrudService;
import com.j4.cms.dao.DataDao;
import com.j4.cms.dao.ModelDao;
import com.j4.cms.obj.Data;
import com.j4.cms.obj.Model;

public class DataService extends CrudService<DataDao, Data> {

	@Inject
	ModelDao modelDao;
	public List<Data> findList(int modelId) {
		
		Model model = modelDao.get(modelId);
		Data data = new Data();
		data.setModelId(model.getId());
		data.setTableName(model.getTableName());
		return this.findList(data);
	}
	public Data findOne(int modelId) {
		
		Model model = modelDao.get(modelId);
		Data data = new Data();
		data.setModelId(model.getId());
		data.setTableName(model.getTableName());
		return this.findOne(data);
	}
	public List<Data> findLimit(int modelId, int rows) {
		Model model = modelDao.get(modelId);
		Data data = new Data();
		data.setModelId(model.getId());
		data.setTableName(model.getTableName());
		data.setLimit(rows);
		return this.findLimit(data);
	}
	
	public List<Data> findLimit(Data entity) {
		return dao.findLimit(entity);
	}
	
	public Data findOne(Data entity) {
		return dao.findOne(entity);
	}
	
	public void delete(Model model, String ids) {
		for (String id : ids.split(",")) {
			Data d = new Data();
			d.setId(Integer.parseInt(id));
			d.setTableName(model.getTableName());
			dao.delete(d);
		}
	}
	public void pub(Model model, String ids) {
		for (String id : ids.split(",")) {
			Data d = new Data();
			d.setId(Integer.parseInt(id));
			d.setTableName(model.getTableName());
			d.setState(1);
			dao.updateState(d);
		}
	}
	public void back(Model model, String ids) {
		for (String id : ids.split(",")) {
			Data d = new Data();
			d.setId(Integer.parseInt(id));
			d.setTableName(model.getTableName());
			d.setState(0);
			dao.updateState(d);
		}
	}
}
