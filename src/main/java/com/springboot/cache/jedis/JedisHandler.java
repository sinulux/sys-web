package com.springboot.cache.jedis;

import redis.clients.jedis.Jedis;

/**
 * jedis操作接口 <br/>
 *
 * @version v1.0 <br/>
 * @date 2015年8月21日 <br/>
 */
public interface JedisHandler<T> {

    public T execute(Jedis jedis);
}