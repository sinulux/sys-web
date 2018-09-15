package com.springboot.tag.common;

import com.alibaba.fastjson.JSONObject;
import com.springboot.tag.common.inter.LabelService;

/**
 * 标签处理抽象类，用来实现默认的预处理对象
 */
public class AbstractLabelService implements LabelService{

    @Override
    public boolean before(JSONObject paramObj) {
        return false;
    }

    @Override
    public Object getObject(JSONObject paramObj) {
        return null;
    }

    @Override
    public String objToStr(String content, Object resultObj, JSONObject paramObj) {
        return null;
    }
}
