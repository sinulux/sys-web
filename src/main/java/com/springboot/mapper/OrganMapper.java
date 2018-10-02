package com.springboot.mapper;

import com.springboot.entity.mybatis.OrganEO;

import java.util.List;

public interface OrganMapper {

    public List<OrganEO> getOrganTree(OrganEO eo);

    public Integer saveOrganInfo(OrganEO eo);

    void updateOrganInfo(OrganEO eo);

    Integer del(OrganEO eo);

}
