package com.springboot.service.common.impl;

import com.springboot.mapper.CommonMapper;
import com.springboot.service.common.ICommonService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class CommonServiceImpl implements ICommonService {
    @Resource
    private CommonMapper commonMapper;

    @Override
    public List<Map<String, Object>> getConstantList(Map<String, Object> params) {
        return commonMapper.getConstantList(params);
    }
}
