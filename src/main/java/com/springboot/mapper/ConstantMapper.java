package com.springboot.mapper;

import com.springboot.entity.mybatis.ConstantEO;

import java.util.List;
import java.util.Map;

public interface ConstantMapper {

    public List<Map<String,Object>> getConstantPageList(Map<String,Object> params);

    public Long getConstantPageCnt(Map<String,Object> params);

    void saveConstant(ConstantEO eo);

    Integer getCountByCode(ConstantEO eo);

    ConstantEO getOneById(Integer id);

    void updateConstant(ConstantEO eo);

    void del(Integer id);
}
