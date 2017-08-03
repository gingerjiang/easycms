/**
 * 
 */
package com.j4.base;

import java.util.List;

/**
 * DAO支持类实现
 */
public interface CrudDao<T> {

	/**
	 * 获取单条数据
	 * @param id
	 * @return
	 */
	public T get(Integer id);
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	public T get(T entity);
	
	/**
	 * 查询数据列表，如果需要分页，请设置分页对象，如：entity.setPage(new Page<T>());
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity);
	
	/**
	 * 分页查询数据
	 * @param entity
	 * @return
	 */
	public List<T> findPage(T entity);
	public int findCount(T entity);
	
	/**
	 * 插入数据
	 * @param entity
	 * @return
	 */
	public int insert(T entity);
	
	/**
	 * 更新数据
	 * @param entity
	 * @return
	 */
	public int update(T entity);
	
	/**
	 * 删除数据
	 * @param id
	 * @see public int delete(T entity)
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 删除数据（一般为逻辑删除，更新del_flag字段为1）
	 * @param entity
	 * @return
	 */
	public int delete(T entity);
	
}