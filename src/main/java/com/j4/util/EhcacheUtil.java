package com.j4.util;

import net.sf.ehcache.CacheManager;
import net.sf.ehcache.constructs.blocking.BlockingCache;

public class EhcacheUtil {
	// 获取页面缓存

	private static CacheManager cacheManager = CacheManager.getInstance();
	private static BlockingCache cache = new BlockingCache(cacheManager.getEhcache("SimplePageCachingFilter"));// 配置的cache名称;

	
	public static void setCacheDisabled(boolean flag) {
		cache.setDisabled(flag);
		cache.removeAll();
	}
	public static boolean  isCacheDisabled() {
		return cache.isDisabled();
	}
	public static void clearCache() {
		cache.removeAll();
	}

}
