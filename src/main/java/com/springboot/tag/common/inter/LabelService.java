package com.springboot.tag.common.inter;

import com.alibaba.fastjson.JSONObject;

public interface LabelService {

    /**
     * 前置查询
     * @param paramObj
     * @return
     */
    boolean before(JSONObject paramObj);

    /**
     * 查询
     * @param paramObj
     * @return
     */
    Object getObject(JSONObject paramObj);

    /**
     * 将查询结果转换为字符串
     * @param content 标签中间的内容
     * @param resultObj 查询结果对象
     * @param paramObj 查询参数
     * @return
     */
    String objToStr(String content, Object resultObj, JSONObject paramObj);
}
