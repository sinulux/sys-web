package com.springboot.service.system;

import com.springboot.entity.OrganEo;

import java.util.List;

public interface IOrganService {

    public List<OrganEo> getOrganTree(OrganEo eo);

    public Integer saveOrganInfo(OrganEo eo);

    Integer del(OrganEo eo);

}
