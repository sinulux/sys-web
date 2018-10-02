package com.springboot.service.system;

import com.springboot.entity.mybatis.OrganEO;

import java.util.List;

public interface IOrganService {

    public List<OrganEO> getOrganTree(OrganEO eo);

    public Integer saveOrganInfo(OrganEO eo);

    Integer del(OrganEO eo);

}
