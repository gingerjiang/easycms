package com.j4.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 编码设置过滤器
 * 
 */
public class CharsetEncodingFilter implements Filter {

	private String encoding;

	public void destroy() {
		System.out.println("--------destroy---------");
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		filterChain.doFilter(request, response);
	}

	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("--------init---------");
		// this.encoding = arg0.getInitParameter("encoding");
		System.out.println(encoding);
	}

}
