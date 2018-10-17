package com.springboot.tpl.util;

import com.alibaba.fastjson.JSONObject;
import com.springboot.common.busi.SpringContextHolder;
import com.springboot.tpl.service.AbstractTplService;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * parse page template of string
 */
public class HtmlRegUtils {

    // 该正则表达式支持两种闭合方式、支持标签嵌套、支持取单独属性，暂不支持相同标签嵌套
    private static final String LIST_REGEX = "\\{mine:([\\w]+)([^\\}]*)(?:/\\}|\\}(.*?)\\{/mine:\\1\\})";

    // 两种模式，为了应对换行的匹配
    private static final Pattern LIST_PATTERN = Pattern.compile(LIST_REGEX, Pattern.CASE_INSENSITIVE | Pattern.DOTALL);

    /**
     * 标签体 ADD REASON. <br/>
     */
    private static class LabelEntry {
        private String labelName;
        private String param;
        private JSONObject object;

        public LabelEntry(String labelName, String param, JSONObject object) {
            super();
            this.labelName = labelName;
            this.param = param;
            this.object = object;
        }

        public String getLabelName() {
            return labelName;
        }

        public void setLabelName(String labelName) {
            this.labelName = labelName;
        }

        public String getParam() {
            return param;
        }

        public void setParam(String param) {
            this.param = param;
        }

        public JSONObject getMap() {
            return object;
        }

        public void setMap(JSONObject object) {
            this.object = object;
        }
    }

    public static String parseLabel(String content) {

        int index = 0;
        // 结果
        StringBuffer sb = new StringBuffer();
        // 合并标签解析
        List<LabelEntry> labelEntryList = new ArrayList<LabelEntry>();
        // 正则匹配，当解析指定标签时， 不预处理文章类型，防止文章标题被替换
        Matcher m = LIST_PATTERN.matcher(content);
        // 查找
        while (m.find()) {
            // 标签名称
            String labelName = m.group(1).trim();
            // 参数
            String param = m.group(2).trim();
            // 放入list中
            JSONObject object = new JSONObject();
            object.put("labelName", labelName);
            String[] params = param.split(" ");
            for (String s : params) {
                if (s.equals("") || s.trim().equals("")) {
                    continue;
                }
                String[] itemParam = s.split("=");
                object.put(itemParam[0].replaceAll(" ", ""), itemParam[1].replaceAll(" ", ""));
            }
            labelEntryList.add(new LabelEntry(labelName, param, object));
            // 替换
            m.appendReplacement(sb, "\\{" + labelName + ":" + index++ + "\\}");
        }

        m.appendTail(sb);
        //简化后的字符串模板，附带索引
        String result = sb.toString();
        int pos = 0;
        for (LabelEntry entry : labelEntryList) {
            AbstractTplService tplService = SpringContextHolder.getBean(entry.labelName + "TplService");
            String labelResult = tplService.objToStr(entry.object);
            result = result.replace("{" + entry.labelName + ":" + pos + "}", labelResult);
            pos++;
        }
        return result;
    }

    public static void main(String[] args) {
        String content = "测试模板<div>{mine:aa num=1 name=test}{/mine:aa}{mine:bb num=1 name=test}{/mine:bb}{mine:cc a=1 b=2/}</div>";
        System.out.println(parseLabel(content));
        String regEx = "(?s)^(?=.*\\d.*\\d.*\\d).+$";
        System.out.println(Pattern.matches(regEx,"dqwdq123w"));
    }
}
