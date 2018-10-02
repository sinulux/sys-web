package com.springboot.service.system.impl;

import com.springboot.entity.mybatis.OrganEO;
import com.springboot.mapper.OrganMapper;
import com.springboot.service.system.IOrganService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrganServiceImpl implements IOrganService {

    @Resource
    private OrganMapper organMapper;

    @Override
    public List<OrganEO> getOrganTree(OrganEO eo) {
        return organMapper.getOrganTree(eo);
    }

    @Override
    public Integer saveOrganInfo(OrganEO eo) {
        if (eo.getId() == null) {
            organMapper.saveOrganInfo(eo);
        } else {
            organMapper.updateOrganInfo(eo);
            eo.setId(eo.getId());
        }
        return eo.getId();
    }

    @Override
    public Integer del(OrganEO eo) {
        return organMapper.del(eo);
    }
}
