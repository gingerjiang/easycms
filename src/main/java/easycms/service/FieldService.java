package easycms.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.mybatis.guice.transactional.Transactional;

import easycms.base.CrudService;
import easycms.dao.CfgDao;
import easycms.dao.ComboDao;
import easycms.dao.FieldDao;
import easycms.obj.Cfg;
import easycms.obj.Combo;
import easycms.obj.Field;

public class FieldService extends CrudService<FieldDao, Field> {

	@Inject
	CfgDao cfgDao;
	@Inject
	ComboDao comboDao;
	
	public List<Field> findList(Field entity) {
		List<Field> list = dao.findList(entity);
		//查询字符限制输入长度
		Cfg cfg = new Cfg();
		cfg.setC(1);
		for (Field c : list) {
			cfg.setC1(c.getMappingData());
			String length = cfgDao.get(cfg).getC3();
			c.setLength(length);
			//查询下拉列表的数据
			if ("combo".equals(c.getType())) {
				String sql = c.getSql();
				if (StringUtils.isNotEmpty(sql)) {
					List<Combo> combo = comboDao.findBy(sql);
					c.setCombo(combo);
				}
			}
			
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
	
	public Integer maxSeq(int subjectId) {
		return dao.maxSeq(subjectId);
	}
}
