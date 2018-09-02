package com.springboot.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/role")
@Slf4j
public class RoleController {

    @RequestMapping("/list")
    public String getIndex(){
        return "/role/list";
    }

    @RequestMapping("/roleInfo")
    public String roleInfo(HttpServletRequest request){
        request.setAttribute("role_info_id","role_info");
        return "/role/role_info";
    }
}
