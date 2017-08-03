package com.j4.util;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;

import com.j4.cms.obj.Data;

public class BeanUtil {

	
	public static String getProperty(Data data, String name) {
		String v = "";
		try {
			v = BeanUtils.getProperty(data, name);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return v;
	}
}
