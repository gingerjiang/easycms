package com.j4.cms.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.guice.transactional.Transactional;

import com.j4.base.CrudService;
import com.j4.cms.dao.CfgDao;
import com.j4.cms.dao.ColumnDao;
import com.j4.cms.obj.Cfg;
import com.j4.cms.obj.Column;

public class ColumnService extends CrudService<ColumnDao, Column> {

	@Inject
	CfgDao cfgDao;
	public List<Column> findList(Column entity) {
		List<Column> list = dao.findList(entity);
		//查询字符限制输入长度
		Cfg cfg = new Cfg();
		cfg.setC(1);
		for (Column c : list) {
			cfg.setC1(c.getMappingData());
			String length = cfgDao.get(cfg).getC3();
			c.setLength(length);
		}
		return list;
	}
	
	@Transactional
	public int delete(String ids) {
		int result = 0;
		for (String id : ids.split(",")) {
			result = dao.delete(Integer.parseInt(id));
		}
		return result;
	}
}
