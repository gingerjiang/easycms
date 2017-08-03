package com.j4.util;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUtil {
	private static Log logger = LogFactory.getLog(JsonUtil.class);
	private static ObjectMapper mapper;

	static {
		mapper = new ObjectMapper();
	}

	/**
	 * 如果JSON字符串为Null或"null"字符串,返回Null. 如果JSON字符串为"[]",返回空集合.
	 * 
	 */
	public static <T> T fromJson(String jsonString, Class<T> clazz) {
		if (StringUtils.isEmpty(jsonString)) {
			return null;
		}

		try {
			return mapper.readValue(jsonString, clazz);
		} catch (Exception e) {
			logger.warn("parse json string error:" + jsonString, e);
			return null;
		}
	}
	/**
	 * 如果JSON字符串为Null或"null"字符串,返回Null. 如果JSON字符串为"[]",返回空集合.
	 * 
	 * 如需读取集合如List/Map,且不是List<String>这种简单类型时使用如下语句: List<MyBean> beanList = JsonUtil.fromJson(listString, new TypeReference<List<MyBean>>() {});
	 */
	@SuppressWarnings("rawtypes")
	public static <T> T fromJson(String jsonString, TypeReference valueTypeRef) {
		if (StringUtils.isEmpty(jsonString)) {
			return null;
		}
		try {
			return mapper.readValue(jsonString, valueTypeRef);
		} catch (Exception e) {
			logger.warn("parse json string error:" + jsonString, e);
			return null;
		}
	}
	/**
	 * 如果对象为Null,返回"null". 如果集合为空集合,返回"[]".
	 */
	public static String toJson(Object object) {

		try {
			return mapper.writeValueAsString(object);
		} catch (Exception e) {
			logger.warn("write to json string error:" + object, e);
			return null;
		}
	}
	 public static void main(String[] args) throws Exception {  
		 System.out.println(toJson(null));
	 }
}
