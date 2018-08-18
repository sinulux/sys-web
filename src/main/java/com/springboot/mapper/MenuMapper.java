package com.springboot.mapper;

import com.springboot.entity.BtnInfoEO;
import com.springboot.entity.MenuEo;

import java.util.List;
import java.util.Map;

public interface MenuMapper {

    public List<MenuEo> getMenuTree(MenuEo eo);

    public Integer saveMenuInfo(MenuEo eo);

    void updateMenuInfo(MenuEo eo);

    Integer del(MenuEo eo);

    Long getBtnPageCnt(Map<String, Object> params);

    List<Map<String,Object>> getBtnPageList(Map<String, Object> params);

    void saveBtnInfo(BtnInfoEO eo);

    void updateBtnInfo(BtnInfoEO eo);

    BtnInfoEO getOneById(Integer id);

    void delBtnById(Integer id);
}
