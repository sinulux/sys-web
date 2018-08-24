package com.springboot.controller;

import freemarker.template.Configuration;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Freemarker获取模板的方式
 */

@Controller
@RequestMapping(value = "/freemarker")
public class FreemarkerController {
    /**
     * 获取WebRoot目录下的模板
     */
    @RequestMapping(value = "/webRoot1", method = {RequestMethod.GET})
    public void loadWebRootTemplate(Model model, HttpServletRequest request,
                                    HttpServletResponse response, ModelMap modelMap) throws Exception {
        Map<String, Object> root = new HashMap<String, Object>();
        root.put("username", "程序媛");
        Configuration configuration = new Configuration();
        /**
         * request.getServletContext().getRealPath("/")获取的是webRoot目录
         */
        configuration.setDirectoryForTemplateLoading(new File(request.getServletContext().getRealPath("/")));
        configuration.getTemplate("test.ftl").process(root, new PrintWriter(System.out));
    }


    @RequestMapping(value = "/webRoot2", method = {RequestMethod.GET})
    public void loadWebRootTemplateAsServletContextForTemplateLoading(Model model, HttpServletRequest request,
                                                                      HttpServletResponse response, ModelMap modelMap) throws Exception {
        Map<String, Object> root = new HashMap<String, Object>();
        root.put("username", "程序媛");
        Configuration configuration = new Configuration();
        configuration.setServletContextForTemplateLoading(request.getServletContext(), "/");
        configuration.getTemplate("test.ftl").process(root, new PrintWriter(System.out));
    }


    /**
     * classpath下的模板1
     */
    @RequestMapping(value = "/defaultResourceLoader", method = {RequestMethod.GET})
    public void loadClasspathAtDefaultResourceLoaderTemplate(Model model, HttpServletRequest request,
                                                             HttpServletResponse response, ModelMap modelMap) throws Exception {
        Map<String, Object> root = new HashMap<String, Object>();
        root.put("username", "程序媛");
        Configuration configuration = new Configuration();
        configuration.setDirectoryForTemplateLoading(new DefaultResourceLoader().getResource("/com/zlkj/ssm/web/cms/template/ftl").getFile());
        configuration.getTemplate("test.ftl").process(root, new PrintWriter(System.out));
        ;
    }

    /**
     * 获取Classpath下的模板2
     */
    @RequestMapping(value = "/Classpath", method = {RequestMethod.GET})
    public void loadClasspathTemplate(Model model, HttpServletRequest request,
                                      HttpServletResponse response, ModelMap modelMap) throws Exception {
        Map<String, Object> root = new HashMap<String, Object>();

        Map<String, List> userMaps = new HashMap<String, List>();
        List users = new ArrayList();
        userMaps.put("user1", users);
        root.put("mapUser", userMaps);
        root.put("date", new Date());
        root.put("dateStr", "1992-05-06 19:23:45");
        root.put("userList", users);
        root.put("username", "程序媛");
        root.put("html", "<b>粗体</b>");
        root.put("timedate", new Date().getTime());
        Configuration configuration = new Configuration();
        /**
         * request.getServletContext().getRealPath("/")获取的是webRoot目录
         */
        configuration.setClassForTemplateLoading(FreemarkerController.class, "/com/zlkj/ssm/web/cms/template/ftl");
        configuration.getTemplate("index.ftl").process(root, new PrintWriter(System.out));
        ;
    }

    /**
     * 获取WEB-INF下的模板
     */
    @RequestMapping(value = "/WebInfo2", method = {RequestMethod.GET})
    public void loadWebInfoTemplatewEBINFO(Model model, HttpServletRequest request,
                                           HttpServletResponse response, ModelMap modelMap) throws Exception {
        Map<String, Object> root = new HashMap<String, Object>();
        root.put("username", "程序媛");
        Configuration configuration = new Configuration();
        configuration.setDirectoryForTemplateLoading(new File(request.getServletContext().getRealPath("/WEB-INF")));
        configuration.getTemplate("test.ftl").process(root, new PrintWriter(System.out));
    }

}
