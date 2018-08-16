package com.springboot.controller;

import com.springboot.common.busi.ResponseData;
import com.springboot.entity.MenuEo;
import com.springboot.service.system.IMenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private IMenuService menuService;

    @RequestMapping("/menu_list")
    public String getMenuPage() {
        logger.info("菜单主页面...");
        return "/pages/system/menu_list";
    }

    @RequestMapping("/getMenuTree")
    @ResponseBody
    public List<MenuEo> getMenuTree(MenuEo eo) {
        List<MenuEo> menuTree = new ArrayList<>();
        if (eo.getId() != null) {
            menuTree = this.getChildren(eo);
        } else {
            menuTree = menuService.getMenuTree(eo);
        }
        return menuTree;
    }

    public List<MenuEo> getChildren(MenuEo eo) {
        List<MenuEo> children = new ArrayList<MenuEo>();
        children = menuService.getMenuTree(eo);
        for (MenuEo item : children) {
            eo.setId(item.getId());
            item.setChildren(getChildren(eo));
        }
        return children;
    }

    @RequestMapping("/save")
    @ResponseBody
    public ResponseData save(MenuEo eo) {
        logger.info("保存菜单信息...");
        eo.setCreateUser(1);
        Integer primaryKey = menuService.saveMenuInfo(eo);
        return ResponseData.success(primaryKey, "保存成功！");
    }

    @RequestMapping("/del")
    @ResponseBody
    public ResponseData del(MenuEo eo) {
        logger.info("删除菜单信息...");
        Integer cnt = menuService.del(eo);
        return ResponseData.success(cnt, "删除成功！");
    }
}
