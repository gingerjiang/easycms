/**
 *
 */
package com.j4.base;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.guice.transactional.Transactional;

import com.j4.common.obj.BaseEntity;
import com.j4.common.obj.Pager;

/**
 * Service基类
 */
public abstract class CrudService<D extends CrudDao<T>, T extends BaseEntity<T>> {

	/**
	 * 持久层对象
	 */
	@Inject
	protected D dao;

	/**
	 * 获取单条数据
	 *
	 * @param id
	 * @return
	 */
	public T get(Integer id) {
		return dao.get(id);
	}

	/**
	 * 获取单条数据
	 *
	 * @param entity
	 * @return
	 */
	public T get(T entity) {
		return dao.get(entity);
	}

	/**
	 * 查询列表数据
	 *
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity) {
		return dao.findList(entity);
	}

	public Pager<T> findPage(Pager<T> pager, T entity) {
		entity.setPager(pager);
		pager.setList(dao.findPage(entity));
		pager.setRecords(dao.findCount(entity));
		return pager;
	}

	/**
	 * 保存数据（插入或更新）
	 * @param entity
	 */
	@Transactional
	public void save(T entity) {
		if (null == entity.getId()) {
			dao.insert(entity);
		} else {
			dao.update(entity);
		}
	}

	/**
	 * 更新数据
	 * @param entity
	 */
	@Transactional
	public int update(T entity) {
		return dao.update(entity);
	}

	/**
	 * 删除数据
	 * @param entity
	 */
	@Transactional
	public int delete(T entity) {
		return dao.delete(entity);
	}

	/**
	 * 删除数据
	 * @param id
	 */
	@Transactional
	public int delete(Integer id) {
		return dao.delete(id);
	}
	
}
