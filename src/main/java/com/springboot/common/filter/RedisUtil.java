package com.springboot.common.filter;

import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.Set;

/**
 * @author wangshibao
 * @className: RedisUtil
 * @description: redis操作工具类
 * @dateTime 2018/4/23 16:12
 */
// 因为工具类中的JedisPool 使用了spring注入，所以该工具类也要加入IOC容器
@Component
public class RedisUtil {

    /**
     * jedisPool
     */
    private static JedisPool jedisPool = new JedisPool("127.0.0.1", 6379);

    /**
     * @description: 静态字段, 通过set注入jedispool
     * @dateTime 2018/4/24 9:45
     */
//    @Autowired
//    public void setJedisPool(JedisPool jedisPool) {
//        RedisUtil.jedisPool = jedisPool;
//    }

    /**
     * @description: 私有化构造函数
     * @dateTime 2018/4/23 16:12
     */
    private RedisUtil() {
    }

    /**
     * @description: 获取jedis
     * @dateTime 2018/4/24 9:47
     */
    public static Jedis getJedis() {
        return jedisPool.getResource();
    }

    /**
     * @description: 保存到redis
     * @dateTime 2018/4/24 10:04
     */
    public static void set(byte[] key, byte[] value) {
        Jedis jedis = getJedis();
        try {
            jedis.set(key, value);
        } finally {
            jedis.close();
        }
    }

    /**
     * @description: 从redis中获取
     * @dateTime 2018/4/24 10:11
     */
    public static byte[] get(byte[] key) {
        Jedis jedis = getJedis();
        try {
            return jedis.get(key);
        } finally {
            jedis.close();
        }
    }

    /**
     * @description: 从redis中删除
     * @dateTime 2018/4/24 10:17
     */
    public static void del(byte[] key) {
        Jedis jedis = getJedis();
        try {
            jedis.del(key);
        } finally {
            jedis.close();
        }
    }

    /**
     * @description: 依据前缀删除key
     * @dateTime 2018/4/24 16:48
     */
    public static void delByPrefix(String keyPrefix) {
        keyPrefix = keyPrefix + "*";
        Jedis jedis = getJedis();
        try {
            Set<byte[]> keyByteArraySet = jedis.keys(keyPrefix.getBytes());
            for (byte[] keyByteArray : keyByteArraySet) {
                jedis.del(keyByteArray);
            }
        } finally {
            jedis.close();
        }
    }

    /**
     * @description: 设置redis过期时间
     * @dateTime 2018/4/24 10:21
     */
    public static void expire(byte[] key, int seconds) {
        Jedis jedis = getJedis();
        try {
            jedis.expire(key, seconds);
        } finally {
            jedis.close();
        }
    }

    /**
     * @description: 从redis中获取指定前缀的key
     * @dateTime 2018/4/24 10:25
     */
    public static Set<byte[]> keys(String shiroSessionPrefix) {
        shiroSessionPrefix = shiroSessionPrefix + "*";
        Jedis jedis = getJedis();
        try {
            return jedis.keys(shiroSessionPrefix.getBytes());
        } finally {
            jedis.close();
        }
    }
}