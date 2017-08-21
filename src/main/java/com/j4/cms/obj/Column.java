package com.j4.cms.obj;

import java.util.List;

import com.google.common.collect.Lists;
import com.j4.common.obj.BaseEntity;

public class Column extends BaseEntity<Column> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer modelId;// 模型id
	private String name;// 名称
	private String type;// 类型
	private int seq;// 序号
	private String remark;// 备注
	private int width = 100;// 列表显示时宽带
	private String allowBlank;// 允许为空
	private String listShow;// 列表显示
	private String sql;// 下拉对应sql
	private int status;// 状态
	private String mappingData;// 映射字段
	private String length;//数据限制输入长度
	
	private List<Combo> combo = Lists.newArrayList();
	
	public Integer getModelId() {
		return modelId;
	}
	public void setModelId(Integer modelId) {
		this.modelId = modelId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public String getAllowBlank() {
		return allowBlank;
	}
	public void setAllowBlank(String allowBlank) {
		this.allowBlank = allowBlank;
	}
	public String getListShow() {
		return listShow;
	}
	public void setListShow(String listShow) {
		this.listShow = listShow;
	}
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMappingData() {
		return mappingData;
	}
	public void setMappingData(String mappingData) {
		this.mappingData = mappingData;
	}
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	public List<Combo> getCombo() {
		return combo;
	}
	public void setCombo(List<Combo> combo) {
		this.combo = combo;
	}
}
