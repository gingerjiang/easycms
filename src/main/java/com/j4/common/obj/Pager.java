package com.j4.common.obj;

import java.io.Serializable;
import java.util.List;

/**
 * jqGrid 分数bean
 * @author Administrator
 *
 */
public class Pager<T> implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer page = 1;//当前页码
	private Integer total = 0;//页码总数
	private Integer rows = 20;//每页多少行数据
	private Integer records = 0;//数据行总数;
	private List<T> list;//数据
	
	private Integer start = 0;//mysql oracle 使用
	private Integer end = 0;//oracle 使用
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getTotal() {
		total = (records  +  rows  - 1) / rows;
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public Integer getRecords() {
		return records;
	}
	public void setRecords(Integer records) {
		this.records = records;
	}
	public Integer getStart() {
		start = (page - 1) * rows;
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getEnd() {
		end = page * rows;
		return end;
	}
	public void setEnd(Integer end) {
		this.end = end;
	}
	
}
