package com.springboot.controller;

import com.springboot.common.busi.ResponseData;
import com.springboot.entity.mybatis.ConstantEO;
import com.springboot.vo.PaginationVO;
import com.springboot.service.system.IConstantService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/constant")
public class ConstantController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IConstantService constantService;

    @RequestMapping("/constant")
    public String getConstantPage() {
        logger.info("常量主页面...");
        return "/pages/system/constant/constant_list";
    }

    @RequestMapping("/list")
    @ResponseBody
    public PaginationVO getConstantPageList(Integer pageIndex, Integer pageSize, String key) {
        logger.info("常量分页查询...");
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("pageIndex", pageIndex);
        params.put("startNum", (pageIndex - 1) * pageSize);
        params.put("pageSize", pageSize);
        params.put("key", key);
        Long constantPageCnt = constantService.getConstantPageCnt(params);
        List<Map<String, Object>> constantPageList = constantService.getConstantPageList(params);
        return new PaginationVO(pageIndex, pageSize, constantPageCnt, constantPageList);
    }

    @RequestMapping("/save")
    @ResponseBody
    public ResponseData saveConstant(ConstantEO eo) {
        boolean b = constantService.saveConstant(eo);
        if (b) {
            return ResponseData.success("保存成功！");
        } else {
            return ResponseData.fail("保存失败，编码已存在！");
        }
    }

    @RequestMapping("/getOneById")
    @ResponseBody
    public ConstantEO getOneById(Integer id) {
        return constantService.getOneById(id);
    }

    @RequestMapping("/del")
    @ResponseBody
    public ResponseData delConstant(Integer id) {
        try {
            constantService.del(id);
        } catch (Exception e) {
            return ResponseData.fail(e.getMessage());
        }
        return ResponseData.success("删除成功！");
    }
}
