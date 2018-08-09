package com.springboot.service.system.impl;

import com.springboot.entity.MenuEo;
import com.springboot.mapper.MenuMapper;
import com.springboot.service.system.IMenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MenuServiceImpl implements IMenuService {

    @Resource
    private MenuMapper menuMapper;

    @Override
    public List<MenuEo> getMenuTree(MenuEo eo) {
        return menuMapper.getMenuTree(eo);
    }

    @Override
    public Integer saveMenuInfo(MenuEo eo) {
        if(eo.getId() == null){
            menuMapper.saveMenuInfo(eo);
        }else{
            menuMapper.updateMenuInfo(eo);
            eo.setRid(eo.getId());
        }
        return eo.getRid();
    }

    @Override
    public Integer del(MenuEo eo) {
        return menuMapper.del(eo);
    }
}
