package com.springboot.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@RestController
@RequestMapping("/test")
public class DemoController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 测试时发现只有ModelAndView对象会被freemarker解析
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
//        ModelMap test = new ModelMap();
//        test.addAttribute("test","哈哈哈哈哈，这个不行啊");//看看单独new的对象能否被解析到
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
        logger.info("this is a freemarker page !");
        key = "Hello,I am a freemarker page !  You are successful of Model !";
        logger.info(key);
        return "freemarker";
    }

}
