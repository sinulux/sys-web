package com.springboot.tpl.controller;

import com.springboot.dao.mongo.impl.ContentMongoDaoImpl;
import com.springboot.entity.mongo.ContentMongoEO;
import com.springboot.tpl.util.HtmlRegUtils;
import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @Autowired
    private ContentMongoDaoImpl contentMongoDao;

    @RequestMapping(value = "/tpl/{id:[\\d\\.]+}", produces = "text/html;charset=UTF-8")
    public String getHtml(@PathVariable long id, Model model,
                          HttpServletRequest request, HttpServletResponse response) throws IOException, TemplateException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Configuration cfg = new Configuration();
        cfg.setDefaultEncoding("UTF-8");
        StringTemplateLoader loader = new StringTemplateLoader();
        ContentMongoEO contentMongoEO = contentMongoDao.queryById(id);
        if (contentMongoEO == null) {
            contentMongoEO = new ContentMongoEO();
            contentMongoEO.setContent("这是测试模板：{mine:demo file=test/test_tag.ftl/}，嘿嘿！");
        }
        String parseLabel = HtmlRegUtils.parseLabel(contentMongoEO.getContent());
        loader.putTemplate("template", parseLabel);
        cfg.setTemplateLoader(loader);

        Template temp = cfg.getTemplate("template", "utf-8");
        /* 创建数据模型 */
        Map root = new HashMap();
        root.put("model", "");

        Writer out = new StringWriter(2048);
        temp.process(root, out);
        String html = out.toString().replaceAll("[\\n\\r]", "");
        out.flush();
        model.addAttribute("tplContent", html);
        return "/design/preview";
    }
}
