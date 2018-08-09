package com.springboot.mapper;

import java.util.List;
import java.util.Map;

public interface CommonMapper {

    public List<Map<String,Object>> getConstantList(Map<String, Object> params);

}
