package com.springboot.service.system;

import com.springboot.entity.MenuEo;

import java.util.List;

public interface IMenuService {

    public List<MenuEo> getMenuTree(MenuEo eo);

    public Integer saveMenuInfo(MenuEo eo);

    Integer del(MenuEo eo);
}
