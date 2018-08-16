package com.springboot.service.common;

import java.util.List;
import java.util.Map;

public interface ICommonService {

    public List<Map<String, Object>> getConstantList(Map<String, Object> params);
}
