package com.springboot.cache;

import com.springboot.common.filter.RedisUtil;
import com.springboot.common.filter.ShiroUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.springframework.util.SerializationUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

/**
 * @author wangshibao
 * @className: RedisShiroCache
 * @description: redis管理shiro缓存
 * @dateTime 2018/4/24 16:04
 */
@Slf4j
public class RedisShiroCache<K, V> implements Cache<K, V> {

    /**
     * @description: 获取加工后的key的字节数组
     * @dateTime 2018/4/24 9:57
     */
    private byte[] getKey(Object key) {
        return (ShiroUtil.SHIRO_CACHE_PREFIX + key).getBytes();
    }

    /**
     * @description: 从缓存中获取数据
     * @dateTime 2018/4/24 16:09
     */
    @Override
    public Object get(Object key) throws CacheException {
        if (key == null) {
            return null;
        }
        // 序列化键
        byte[] keyByteArray = getKey(key);
        // 从redis中获取数据
        byte[] valueByteArray = RedisUtil.get(keyByteArray);
//        log.debug("从缓存中获取数据");
        // 返回对应的数据
        return valueByteArray == null ? null : SerializationUtils.deserialize(valueByteArray);
    }

    /**
     * @description: 保存shiro缓存到redis
     * @dateTime 2018/4/24 16:13
     */
    @Override
    public Object put(Object key, Object value) throws CacheException {
        if (key == null || value == null) {
            return null;
        }
        // 序列化
        byte[] keyByteArray = getKey(key);
        byte[] valueByteArray = SerializationUtils.serialize((Serializable) value);
        RedisUtil.set(keyByteArray, valueByteArray);
        log.debug("保存shiro缓存到redis");
        // 返回保存的值
        return SerializationUtils.deserialize(valueByteArray);
    }

    /**
     * @description: 从redis中删除
     * @dateTime 2018/4/24 16:19
     */
    @Override
    public Object remove(Object key) throws CacheException {
        if (key == null) {
            return null;
        }
        // 序列化
        byte[] keyByteArray = getKey(key);
        byte[] valueByteArray = RedisUtil.get(keyByteArray);
        // 删除
        RedisUtil.del(keyByteArray);
        log.debug("从redis中删除");
        // 返回删除的数据
        return SerializationUtils.deserialize(valueByteArray);
    }

    /**
     * @description: 清空所有的缓存
     * @dateTime 2018/4/24 16:25
     */
    @Override
    public void clear() throws CacheException {
        log.debug("清空所有的缓存");
        RedisUtil.delByPrefix(ShiroUtil.SHIRO_CACHE_PREFIX);
    }

    /**
     * @description: 缓存个数
     * @dateTime 2018/4/24 16:56
     */
    @Override
    public int size() {
        Set<byte[]> keyByteArraySet = RedisUtil.keys(ShiroUtil.SHIRO_CACHE_PREFIX);
        log.debug("获取缓存个数");
        return keyByteArraySet.size();
    }

    /**
     * @description: 获取所有的key
     * @dateTime 2018/4/24 16:59
     */
    @Override
    public Set keys() {
        Set<byte[]> keyByteArraySet = RedisUtil.keys(ShiroUtil.SHIRO_CACHE_PREFIX);
        log.debug("获取缓存所有的key");
        return keyByteArraySet;
    }

    /**
     * @description: 获取所有的value
     * @dateTime 2018/4/24 16:59
     */
    @Override
    public Collection values() {
        Set keySet = this.keys();
        List<Object> valueList = new ArrayList<>(16);
        for (Object key : keySet) {
            byte[] keyByteArray = SerializationUtils.serialize(key);
            byte[] valueByteArray = RedisUtil.get(keyByteArray);
            valueList.add(SerializationUtils.deserialize(valueByteArray));
        }
        log.debug("获取缓存所有的value");
        return valueList;
    }

}