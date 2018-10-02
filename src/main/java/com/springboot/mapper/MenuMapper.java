package com.springboot.mapper;

import com.springboot.entity.mybatis.BtnInfoEO;
import com.springboot.entity.mybatis.MenuEO;

import java.util.List;
import java.util.Map;

public interface MenuMapper {

    public List<MenuEO> getMenuTree(MenuEO eo);

    public Integer saveMenuInfo(MenuEO eo);

    void updateMenuInfo(MenuEO eo);

    Integer del(MenuEO eo);

    Long getBtnPageCnt(Map<String, Object> params);

    List<Map<String,Object>> getBtnPageList(Map<String, Object> params);

    void saveBtnInfo(BtnInfoEO eo);

    void updateBtnInfo(BtnInfoEO eo);

    BtnInfoEO getOneById(Integer id);

    void delBtnById(Integer id);
}
