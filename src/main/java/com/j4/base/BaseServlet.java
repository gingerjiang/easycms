package com.j4.base;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import com.j4.core.Init;
import com.j4.util.JsonUtil;

public class BaseServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected static final String prefix = "/WEB-INF/views/";

	public void init() throws ServletException {
		super.init();
		Init.getInjector().injectMembers(this);
	}

	public void write(String s, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(s);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}

	}

	// 直接转json写出去
	public void write(Object o, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(JsonUtil.toJson(o));
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}

	}
}
