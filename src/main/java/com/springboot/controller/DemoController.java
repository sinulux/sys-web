package com.springboot.controller;

import com.springboot.common.busi.ResponseData;
import com.springboot.common.util.LabelUtils;
import com.springboot.dao.business.IAdviceDao;
import com.springboot.entity.business.AdviceEO;
import com.springboot.entity.mybatis.UserEO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/test")
public class DemoController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 测试时发现只有放在方法内的对象（或者ModelAndView）才能被ftl解析
     * 支持如下几种对象传递参数
     *
     * @param mv
     * @return
     */
    @GetMapping("/freemarker")
    public ModelAndView index(ModelAndView mv, Map<String, Object> map, ModelMap mm, Model m) {
        logger.info("this is a freemarker page !");
        mv.setViewName("freemarker");
        map.put("mkey", "Map key");
        mm.put("mmkey", "modelMap key");
        m.addAttribute("model", "model");
        ModelMap test = new ModelMap();
        test.addAttribute("test", "哈哈哈哈哈，这个不行啊");//看看单独new的对象能否被解析到
        mv.addObject("key", "Hello,I am a freemarker page !  You are successful of ModelAndView !");
        return mv;
    }

    @GetMapping("/freemarker2")
    public String freemarker2(Model mv) {
        logger.info("this is a freemarker page !");
        mv.addAttribute("key", "Hello,I am a freemarker page !  You are successful of Model !");
        return "freemarker";
    }

    @GetMapping("/freemarker3")
    public String freemarker3(Map<String, Object> map) {
        logger.info("this is a freemarker page !");
        map.put("key", "Hello,I am a freemarker page !  You are successful of Model !");
        return "freemarker";
    }

    @GetMapping("/freemarker4")
    public String freemarker4(ModelMap map) {
        logger.info("this is a freemarker page !");
        map.put("key", "Hello,I am a freemarker page !  You are successful of Model !");
        return "freemarker";
    }

    @GetMapping("/freemarker5")
    public String freemarker5(String key) {
        // 非对象结构ftl不能获取到key
        logger.info("this is a freemarker page !");
        key = "Hello,I am a freemarker page !  You are successful of Model !";
        logger.info(key);
        return "freemarker";
    }

    @GetMapping("/freemarker6")
    public ModelAndView freemarker6() {
        logger.info("this is a freemarker page !");
        String key = "Hello,I am a freemarker page !  You are successful of Model !";
        ModelAndView modelAndView = new ModelAndView("freemarker");
        modelAndView.addObject("key",key);
        return modelAndView;
    }

    @RequestMapping("hello")
    @ResponseBody
    public String getHello(){
        return "hello";
    }

    @RequestMapping("layerPage")
    public String testOpenLayer(Map map, UserEO userEO){
        map.put("key","this is a layer page");
        userEO.setUserName("傻了吧唧的，名字都起不好");
        List<Map<String,Object>> firstList = new ArrayList<>();
        List<Map<String,Object>> secList = new ArrayList<>();
        List<Map<String,Object>> secList2 = new ArrayList<>();
        List<Map<String,Object>> secList3 = new ArrayList<>();

        Map<String,Object> item1 = new HashMap<>();
        item1.put("name","wang");
        item1.put("busi","主套餐");
        item1.put("secList",secList);
        firstList.add(item1);

        Map<String,Object> item2 = new HashMap<>();
        item2.put("name","wang");
        item2.put("busi","其他业务");
        Map<String,Object> item21 = new HashMap<>();
        item21.put("name","wang");
        item21.put("busi","彩铃");
        Map<String,Object> item22 = new HashMap<>();
        item22.put("name","wang");
        item22.put("busi","20G流量半年包");
        secList2.add(item21);
        secList2.add(item22);
        item2.put("secList",secList2);
        firstList.add(item2);

        Map<String,Object> item3 = new HashMap<>();
        item3.put("name","li");
        item3.put("busi","已办业务");
        Map<String,Object> item31 = new HashMap<>();
        item31.put("name","li");
        item31.put("busi","50M家庭宽带，赠送分返12月，每月返还30元");
        Map<String,Object> item32 = new HashMap<>();
        item32.put("name","li");
        item32.put("busi","IPTV有线电视2年套餐");
        secList3.add(item31);
        secList3.add(item32);
        item3.put("secList",secList3);
        firstList.add(item3);
        map.put("firstList",firstList);
        return "/test/layerPage";
    }

    @Autowired
    private IAdviceDao adviceDao;
    @RequestMapping("miniui_grid")
    public String miniui_grid(Map map, Model model){
        map.put("key","this is a miniui_grid page");
        AdviceEO adviceEO = new AdviceEO();
        adviceEO.setNum(System.currentTimeMillis());
        adviceEO.setContent("测试数据");
        adviceEO.setAddress("合肥市蜀山区和谐花园");
        adviceDao.save(adviceEO);
        model.addAttribute("date",new Date());
        return "/test/miniui_grid";
    }

    @RequestMapping("beanSet")
    @ResponseBody
    public ResponseData beanSet(){
        LabelUtils.register();
        return ResponseData.success();
    }

    @RequestMapping("/site/role")
    public String role(){
        return "/site/system/role";
    }

}
