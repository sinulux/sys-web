package com.springboot.mapper;

import com.springboot.entity.MenuEo;

import java.util.List;

public interface MenuMapper {

    public List<MenuEo> getMenuTree(MenuEo eo);

    public Integer saveMenuInfo(MenuEo eo);

    void updateMenuInfo(MenuEo eo);

    Integer del(MenuEo eo);
}
