package com.springboot.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.springboot.entity.mybatis.UserEO;
import com.springboot.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

/**
 * 关于redis的使用案例
 *
 * @author wangshibao
 */
@Service
public class DemoService {

    private Logger logger = LoggerFactory.getLogger(DemoService.class);

    @Autowired
    private StringRedisTemplate template;// 代碼中使用緩存

    @Autowired
    private UserMapper userMapper;

    public UserEO test() {
        //template.delete("userEO"); // 删除缓存
        if (template.hasKey("userEO")) {
            UserEO userEO = (UserEO) JSON.parse(template.opsForValue().get("userEO"));
            logger.debug("------------------已从缓存加载数据-------------------");
            return userEO;
        } else {
            logger.debug("------------------正在从数据库加载数据-------------------");
            UserEO userEO = userMapper.getLoginUserByUserId("sysadmin");
            template.opsForValue().append("userEO", JSONArray.toJSONString(userEO));
            return userEO;
        }
    }

    /**
     * 注解方式生成缓存 userEO_inject 即为缓存的key值
     *
     * @param rid
     * @return
     */
    @Cacheable(value = "userEO_inject")
    public UserEO test(String rid) {
        UserEO userEO = userMapper.getLoginUserByUserId(rid);
        logger.debug("缓存不存在或已失效，正在从数据库加载......");
        return userEO;
    }
}
