package com.springboot.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.springboot.mapper.TestMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DemoService {

    private Logger logger = LoggerFactory.getLogger(DemoService.class);

    @Autowired
    private StringRedisTemplate template;// 代碼中使用緩存

    @Autowired
    private TestMapper testMapper;

    public List<Map<String, Object>> test() {
//        template.delete("testList"); // 删除缓存
        if(template.hasKey("testList")){
            List<Map<String, Object>> testList = (List<Map<String, Object>>) JSON.parse(template.opsForValue().get("testList"));
            logger.debug("------------------已从缓存加载数据-------------------");
            return testList;
        }else{
            logger.debug("------------------正在从数据库加载数据-------------------");
            List<Map<String, Object>> testList = testMapper.test();
            template.opsForValue().append("testList",JSONArray.toJSONString(testList));
            return testList;
        }
    }

    /**
     * 注解方式生成缓存 svc_log_list即为缓存的key值
     * @param rid
     * @return
     */
    @Cacheable(value = "svc_log_list" )
    public List<Map<String, Object>> test(String rid) {
        List<Map<String,Object>> mapList =  testMapper.getSvclog(rid);
        logger.debug("缓存不存在或已失效，正在从数据库加载......");
        return mapList;
    }
}
