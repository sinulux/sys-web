package com.springboot.controller;

import com.springboot.common.busi.ResponseData;
import com.springboot.entity.mybatis.OrganEO;
import com.springboot.service.system.IOrganService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/organ")
public class OrganController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private IOrganService organService;

    @RequestMapping("/index")
    public String getMenuPage() {
        logger.info("组织机构主页面...");
        return "/pages/system/organ/index";
    }

    @RequestMapping("/getOrganTree")
    @ResponseBody
    public List<OrganEO> getOrganTree(OrganEO eo) {
        List<OrganEO> organTree = new ArrayList<>();
        organTree = organService.getOrganTree(eo);
        return organTree;
    }

    @RequestMapping("/save")
    @ResponseBody
    public ResponseData save(OrganEO eo) {
        logger.info("保存组织机构信息...");
        eo.setCreateUser(1);
        eo.setUpdateUser(1);
        Integer primaryKey = organService.saveOrganInfo(eo);
        return ResponseData.success(primaryKey, "保存成功！");
    }

    @RequestMapping("/del")
    @ResponseBody
    public ResponseData del(OrganEO eo) {
        logger.info("删除组织机构信息...");
        Integer cnt = organService.del(eo);
        return ResponseData.success(cnt, "删除成功！");
    }
}
