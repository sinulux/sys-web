package com.springboot.cache;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;

/**
 * @author wangshibao
 * @className: RedisShiroCacheManager
 * @description: redis shiro 缓存管理器
 * @dateTime 2018/4/24 15:58
 */
public class RedisShiroCacheManager implements CacheManager {

    /**
     * @description:
     * @dateTime 2018/4/24 16:05
     */
    @Override
    public <K, V> Cache<K, V> getCache(String name) throws CacheException {
        return new RedisShiroCache<K, V>();
    }
}