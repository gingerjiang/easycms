/**
 * 
 */
package com.j4.util;

import java.security.SecureRandom;
import java.util.UUID;

/**
 * 封装各种生成唯一性ID算法的工具类.
 */
public class IdGen {

	private static SecureRandom random = new SecureRandom();

	static Snowflake snowFlake = new Snowflake(2, 3);

	/**
	 * 封装JDK自带的UUID, 通过Random数字生成, 中间无-分割.
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public static long nextLongId() {
		return snowFlake.nextId();
	}

	/**
	 * 使用SecureRandom随机生成Long.
	 */
	public static long randomLong() {
		return Math.abs(random.nextLong());
	}

	// static ExecutorService cachedThreadPool =
	// Executors.newCachedThreadPool();
	public static void main(String[] args) {
		System.out.println(IdGen.nextLongId());
	}

}
