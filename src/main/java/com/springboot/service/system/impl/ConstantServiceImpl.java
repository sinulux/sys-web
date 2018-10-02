package com.springboot.service.system.impl;

import com.springboot.entity.mybatis.ConstantEO;
import com.springboot.mapper.ConstantMapper;
import com.springboot.service.system.IConstantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ConstantServiceImpl implements IConstantService {

    @Autowired
    private ConstantMapper constantMapper;

    @Override
    public List<Map<String, Object>> getConstantPageList(Map<String,Object> params) {
        return constantMapper.getConstantPageList(params);
    }

    @Override
    public boolean saveConstant(ConstantEO eo) {
        if(eo.getRid() == null){
            Integer count = constantMapper.getCountByCode(eo);
            if(count > 0){
                return false;
            }
            constantMapper.saveConstant(eo);
        }else{
            constantMapper.updateConstant(eo);
        }
        return true;
    }

    @Override
    public ConstantEO getOneById(Integer id) {
        return constantMapper.getOneById(id);
    }

    @Override
    public Long getConstantPageCnt(Map<String, Object> params) {
        return constantMapper.getConstantPageCnt(params);
    }

    @Override
    public void del(Integer id) {
        constantMapper.del(id);
    }
}
