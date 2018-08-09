package com.springboot.mapper;

import java.util.List;
import java.util.Map;

/**
 * xml配置方式
 */
public interface TestMapper {

    List<Map<String,Object>> test();

    List<Map<String,Object>> getSvclog(String rid);
}
