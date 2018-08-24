package com.springboot.mapper;

import com.springboot.entity.OrganEo;

import java.util.List;

public interface OrganMapper {

    public List<OrganEo> getOrganTree(OrganEo eo);

    public Integer saveOrganInfo(OrganEo eo);

    void updateOrganInfo(OrganEo eo);

    Integer del(OrganEo eo);

}
