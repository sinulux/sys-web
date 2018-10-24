package com.springboot.controller;

import com.springboot.common.busi.ResponseData;
import com.springboot.dao.business.IBaseContentDao;
import com.springboot.entity.business.BaseContentEO;
import com.springboot.entity.mongo.ContentMongoEO;
import com.springboot.service.mongodb.impl.MongoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("info")
public class InfoMgrController {
    @Autowired
    private IBaseContentDao baseContentDao;

    @Autowired
    private MongoServiceImpl mongoService;

    @RequestMapping("menuTpl")
    public String goIndex(){
        return "/info/index";
    }

    @RequestMapping("getTpl")
    @ResponseBody
    public ResponseData getTpl(Long id){
        if(id == null){
            id = baseContentDao.getLastVersion();
        }
        ContentMongoEO mongoEO = new ContentMongoEO();
        if(id != null){
            mongoEO = mongoService.queryById(id);
        }
        return ResponseData.success(mongoEO.getContent(),"获取数据成功");
    }

    @RequestMapping("saveTpl")
    @ResponseBody
    public ResponseData saveTpl(String content){
        BaseContentEO baseContentEO = new BaseContentEO();
        baseContentEO.setTitle("menu tpl");
        baseContentEO.setContentName("菜单模板");
        baseContentEO.setTypeCode(BaseContentEO.TypeCode.menuTpl.name());
        baseContentDao.save(baseContentEO);
        ContentMongoEO mongoEO = new ContentMongoEO();
        mongoEO.setId(baseContentEO.getId());
        mongoEO.setContent(content);
        mongoEO.setType("menu");
        mongoService.save(mongoEO);
        return ResponseData.success();
    }

    @RequestMapping("getTplList")
    @ResponseBody
    public ResponseData getTplList(){
        Map<String,Object> paramMap = new HashMap<String,Object>();
        paramMap.put("typeCode",BaseContentEO.TypeCode.menuTpl.name());
        List<BaseContentEO> eos = baseContentDao.getEntities(BaseContentEO.class, paramMap);
        if(eos != null && !eos.isEmpty()){
            for(BaseContentEO eo:eos){
                ContentMongoEO mongoEO = mongoService.queryById(eo.getId());
                eo.setArticle(mongoEO.getContent());
            }
        }else{
            eos = new ArrayList<BaseContentEO>();
        }
        return ResponseData.success(eos,"获取数据成功");
    }
}
