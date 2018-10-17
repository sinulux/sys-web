package com.springboot.common.util;

import java.util.regex.Pattern;

public class RegUtil {

    public static final String LABEL_NAME_SPACE = "\\{mine:([\\w]+)([^\\}]*)(?:/\\}|\\}(.*?)\\{/mine:\\1\\})";


    public static void main(String[] args){
        boolean ls = Pattern.matches(LABEL_NAME_SPACE, "{mine:dqwqw/}");
        System.out.println(ls);
    }
}
