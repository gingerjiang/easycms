package com.j4.cms.obj;

import com.j4.common.obj.BaseEntity;

/**
 * 手工配置的数据
 * @author Administrator
 *
 */
public class Cfg extends BaseEntity<Cfg> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int c;
	private String c1;
	private String c2;
	private String c3;
	private int seq;
	public int getC() {
		return c;
	}
	public void setC(int c) {
		this.c = c;
	}
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
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
}
