package com.springboot.cache.jedis;

import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * jedis操作模板模式 <br/>
 *
 * @version v1.0 <br/>
 * @date 2015年8月21日 <br/>
 */
@Component
public class JedisTemplate {

    private JedisPool jedisPool =new JedisPool("127.0.0.1",6397);

    public <T> T execute(JedisHandler<T> jedisHandler) {
        T result = null;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            result = jedisHandler.execute(jedis);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != jedis) {
                try {
                    jedis.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }
}