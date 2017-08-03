package com.j4.cms.obj;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.j4.common.obj.BaseEntity;

public class Data extends BaseEntity<Data> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String c1;//
	private String c2;//
	private String c3;//
	private String c4;//
	private String c5;//
	private String c6;//
	private String c7;//
	private String c8;//
	private String c9;//
	private String c10;//
	private String c11;//
	private String c12;//
	private String c13;//
	private String c14;//
	private String c15;//
	private String c16;//
	private int modelId;// 对应模型id
	private int state;// 状态，已发布，未发布
	private Date createTime;// 创建时间
	private String createBy;// 创建人，账号
	private Date updateTime;// 更新时间
	private String updateBy;// 更新人

	
	private String tableName;
	private int limit = 0;
	
	private Date date1;
	private Date date2;
	
	
	public String getC1() {
		return c1;
	}

	public void setC1(String c1) {
		this.c1 = c1;
	}

	public String getC2() {
		return c2;
	}

	public void setC2(String c2) {
		this.c2 = c2;
	}

	public String getC3() {
		return c3;
	}

	public void setC3(String c3) {
		this.c3 = c3;
	}

	public String getC4() {
		return c4;
	}

	public void setC4(String c4) {
		this.c4 = c4;
	}

	public String getC5() {
		return c5;
	}

	public void setC5(String c5) {
		this.c5 = c5;
	}

	public String getC6() {
		return c6;
	}

	public void setC6(String c6) {
		this.c6 = c6;
	}

	public String getC7() {
		return c7;
	}

	public void setC7(String c7) {
		this.c7 = c7;
	}

	public String getC8() {
		return c8;
	}

	public void setC8(String c8) {
		this.c8 = c8;
	}

	public String getC9() {
		return c9;
	}

	public void setC9(String c9) {
		this.c9 = c9;
	}

	public String getC10() {
		return c10;
	}

	public void setC10(String c10) {
		this.c10 = c10;
	}

	public String getC11() {
		return c11;
	}

	public void setC11(String c11) {
		this.c11 = c11;
	}

	public String getC12() {
		return c12;
	}

	public void setC12(String c12) {
		this.c12 = c12;
	}

	public String getC13() {
		return c13;
	}

	public void setC13(String c13) {
		this.c13 = c13;
	}

	public String getC14() {
		return c14;
	}

	public void setC14(String c14) {
		this.c14 = c14;
	}

	public String getC15() {
		return c15;
	}

	public void setC15(String c15) {
		this.c15 = c15;
	}

	public String getC16() {
		return c16;
	}

	public void setC16(String c16) {
		this.c16 = c16;
	}

	public int getModelId() {
		return modelId;
	}

	public void setModelId(int modelId) {
		this.modelId = modelId;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	@JsonIgnore
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	@JsonIgnore
	public Date getDate1() {
		return date1;
	}

	public void setDate1(Date date1) {
		this.date1 = date1;
	}
	@JsonIgnore
	public Date getDate2() {
		return date2;
	}

	public void setDate2(Date date2) {
		this.date2 = date2;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}
	
}
