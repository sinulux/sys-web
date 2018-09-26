package com.springboot.tag.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/{module}")
public class DynamicTagController {

    @ResponseBody
    @RequestMapping(value = "/{action:[\\w]+}/{id:[\\d\\.]+}", produces = "text/html;charset=UTF-8")
    public Object getHtml(@PathVariable String module, @PathVariable String action, @PathVariable long id,
                          HttpServletRequest request, HttpServletResponse response) {
        System.out.println(module);
        System.out.println(action);
        System.out.println(id);
        return "";
    }
}
