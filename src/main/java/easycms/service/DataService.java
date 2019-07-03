package easycms.service;

import java.util.List;

import javax.inject.Inject;

import easycms.base.CrudService;
import easycms.dao.DataDao;
import easycms.dao.SubjectDao;
import easycms.obj.Data;
import easycms.obj.Subject;

public class DataService extends CrudService<DataDao, Data> {

	@Inject
	SubjectDao subjectDao;
	
	public List<Data> findList(int subjectId) {
		
		Subject subject = subjectDao.get(subjectId);
		Data data = new Data();
		data.setSubjectId(subject.getId());
		data.setTableName(subject.getTableName());
		return this.findList(data);
	}
	
	public Data find(int subjectId, int dataId) {
		Subject subject = subjectDao.get(subjectId);
		Data data = new Data();
		data.setSubjectId(subject.getId());
		data.setTableName(subject.getTableName());
		data.setId(dataId);
		data = dao.get(data);
		return data;
	}
	public Data findOne(int subjectId) {
		
		Subject subject = subjectDao.get(subjectId);
		Data data = new Data();
		data.setSubjectId(subject.getId());
		data.setTableName(subject.getTableName());
		return this.findOne(data);
	}
	public List<Data> findLimit(int subjectId, int rows) {
		Subject subject = subjectDao.get(subjectId);
		Data data = new Data();
		data.setSubjectId(subject.getId());
		data.setTableName(subject.getTableName());
		data.setLimit(rows);
		return this.findLimit(data);
	}
	
	public List<Data> findLimit(Data entity) {
		return dao.findLimit(entity);
	}
	
	public Data findOne(Data entity) {
		return dao.findOne(entity);
	}
	
	public void delete(Subject subject, String ids) {
		for (String id : ids.split(",")) {
			Data d = new Data();
			d.setId(Integer.parseInt(id));
			d.setTableName(subject.getTableName());
			dao.delete(d);
		}
	}
	public void pub(Subject subject, String ids) {
		for (String id : ids.split(",")) {
			Data d = new Data();
			d.setId(Integer.parseInt(id));
			d.setTableName(subject.getTableName());
			d.setState(1);
			dao.updateState(d);
		}
	}
	public void back(Subject subject, String ids) {
		for (String id : ids.split(",")) {
			Data d = new Data();
			d.setId(Integer.parseInt(id));
			d.setTableName(subject.getTableName());
			d.setState(0);
			dao.updateState(d);
		}
	}
}
