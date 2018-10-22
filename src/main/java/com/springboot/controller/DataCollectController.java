package com.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/collect")
public class DataCollectController {

    @RequestMapping("index")
    public String index(){
        return "/collect/index";
    }
}
