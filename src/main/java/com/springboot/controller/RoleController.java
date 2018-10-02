package com.springboot.controller;

import com.springboot.common.busi.ResponseData;
import com.springboot.dao.business.IRoleDao;
import com.springboot.entity.business.RoleEO;
import com.springboot.vo.QueryRoleVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/role")
@Slf4j
public class RoleController {
    @Autowired
    private IRoleDao roleDao;

    @RequestMapping("/index")
    public String getIndex(){
        return "/role/index";
    }

    @RequestMapping("/list")
    public String roleInfo(Long organId,Model model){
        model.addAttribute("organId",organId);
        return "/role/list";
    }

    @RequestMapping("/getPage")
    @ResponseBody
    public Object getPage(QueryRoleVO queryRoleVO){
        return roleDao.getPage(queryRoleVO);
    }

    @RequestMapping("/save")
    @ResponseBody
    public Object saveEO(RoleEO eo){
        if(eo.getId() != null){
            roleDao.update(eo);
        }else{
            roleDao.save(eo);
        }
        return ResponseData.success("保存成功！");
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(@RequestParam(value = "ids[]")Long[] ids){
        roleDao.delete(RoleEO.class,ids);
        return ResponseData.success("操作成功！");
    }

    @RequestMapping("/edit")
    public String editPage(Long id,Long organId,Model model){
        if(id != null){
            RoleEO entity = roleDao.getEntity(RoleEO.class, id);
            model.addAttribute("eo",entity);
        }
        model.addAttribute("organId",organId);
        return "/role/form";
    }
}
