package com.springboot.controller;

import com.springboot.common.busi.ResponseData;
import com.springboot.entity.mybatis.BtnInfoEO;
import com.springboot.entity.mybatis.MenuEO;
import com.springboot.vo.PaginationVO;
import com.springboot.service.system.IMenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/menu")
public class MenuController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private IMenuService menuService;

    @RequestMapping("/menu_list")
    public String getMenuPage() {
        logger.info("菜单主页面...");
        return "/pages/system/menu/menu_list";
    }

    @RequestMapping("/btnList")
    public String getBtnPage() {
        logger.info("菜单按钮主页面...");
        return "/pages/system/menu/btn_list";
    }

    @RequestMapping("/getMenuTree")
    @ResponseBody
    public List<MenuEO> getMenuTree(MenuEO eo) {
        List<MenuEO> menuTree = new ArrayList<>();
        if (eo.getId() != null) {
            menuTree = this.getChildren(eo);
        } else {
            menuTree = menuService.getMenuTree(eo);
        }
        return menuTree;
    }

    public List<MenuEO> getChildren(MenuEO eo) {
        List<MenuEO> children = new ArrayList<MenuEO>();
        children = menuService.getMenuTree(eo);
        for (MenuEO item : children) {
            eo.setId(item.getId());
            item.setChildren(getChildren(eo));
        }
        return children;
    }

    @RequestMapping("/save")
    @ResponseBody
    public ResponseData save(MenuEO eo) {
        logger.info("保存菜单信息...");
        eo.setCreateUser(1);
        Integer primaryKey = menuService.saveMenuInfo(eo);
        return ResponseData.success(primaryKey, "保存成功！");
    }

    @RequestMapping("/del")
    @ResponseBody
    public ResponseData del(MenuEO eo) {
        logger.info("删除菜单信息...");
        Integer cnt = menuService.del(eo);
        return ResponseData.success(cnt, "删除成功！");
    }

    @RequestMapping("/btn_list")
    @ResponseBody
    public PaginationVO getBtnPageList(Integer pageIndex, Integer pageSize, Long menuId, String key) {
        logger.info("按钮权限分页查询...");
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("pageIndex", pageIndex);
        params.put("startNum", (pageIndex - 1) * pageSize);
        params.put("pageSize", pageSize);
        params.put("menuId", menuId);
        params.put("key", key);
        Long constantPageCnt = menuService.getBtnPageCnt(params);
        List<Map<String, Object>> constantPageList = menuService.getBtnPageList(params);
        return new PaginationVO(pageIndex, pageSize, constantPageCnt, constantPageList);
    }

    @RequestMapping("/saveBtn")
    @ResponseBody
    public ResponseData saveBtnInfo(BtnInfoEO eo) {
        if(eo.getRemark() == null){
            eo.setRemark("");
        }
        boolean b = menuService.saveBtnInfo(eo);
        if (b) {
            return ResponseData.success("保存成功！");
        } else {
            return ResponseData.fail("保存失败，编码已存在！");
        }
    }

    @RequestMapping("/getBtnById")
    @ResponseBody
    public BtnInfoEO getOneById(Integer id) {
        return menuService.getOneById(id);
    }

    @RequestMapping("/delBtn")
    @ResponseBody
    public ResponseData delBtnById(Integer id) {
        try {
            menuService.delBtnById(id);
        } catch (Exception e) {
            return ResponseData.fail(e.getMessage());
        }
        return ResponseData.success("删除成功！");
    }

    @RequestMapping("/batchDelBtn")
    @ResponseBody
    public ResponseData batchDelBtn(@RequestParam("ids[]") List<Integer> ids) {
        try {
            if(ids != null){
                for(Integer id:ids){
                    menuService.delBtnById(id);
                }
            }
        } catch (Exception e) {
            return ResponseData.fail(e.getMessage());
        }
        return ResponseData.success("删除成功！");
    }
}
