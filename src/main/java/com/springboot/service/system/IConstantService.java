package com.springboot.service.system;

import com.springboot.entity.mybatis.ConstantEO;

import java.util.List;
import java.util.Map;

public interface IConstantService {

    public Long getConstantPageCnt(Map<String,Object> params);

    public List<Map<String,Object>> getConstantPageList(Map<String,Object> params);

    boolean saveConstant(ConstantEO eo);

    ConstantEO getOneById(Integer id);

    void del(Integer id);
}
