package com.springboot.tpl.service;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AbstractTplService {

    /**
     * 将查询结果转换为字符串
     *
     * @param paramObj  查询参数
     * @return
     */
    public String objToStr(JSONObject paramObj) {
        log.info("标签参数：{}",paramObj);
        return "method can not implementor";
    }
}
