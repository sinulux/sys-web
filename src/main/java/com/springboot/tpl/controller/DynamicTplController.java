package com.springboot.tpl.controller;

import com.springboot.common.busi.SpringContextHolder;
import freemarker.cache.StringTemplateLoader;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

/**
 * 解析字符串模板
 */
@Controller
@RequestMapping("/site")
public class DynamicTplController {

    @ResponseBody
    @RequestMapping(value = "/tpl/{id:[\\d\\.]+}", produces = "text/html;charset=UTF-8")
    public Object getHtml(@PathVariable long id,
                          HttpServletRequest request, HttpServletResponse response) throws IOException, TemplateException {
        System.out.println(id);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        // 系统启动时可以创建一个实例，此处测试，直接new
        FreeMarkerConfigurer cfg = SpringContextHolder.getBean(FreeMarkerConfigurer.class);
        cfg.getConfiguration().setDefaultEncoding("UTF-8");
        StringTemplateLoader loader = new StringTemplateLoader();
        loader.putTemplate("template","测试一下：${username!}");
        cfg.getConfiguration().setTemplateLoader(loader);

        Template temp = cfg.getConfiguration().getTemplate("template","utf-8");
        /* 创建数据模型 */
        Map root = new HashMap();
        root.put("username","小样 哈哈哈哈！");

        Writer out = new StringWriter(2048);
        temp.process(root, out);
        String html = out.toString().replaceAll("[\\n\\r]", "");
        out.flush();
        return html;
    }
}
