package com.springboot.common.util;

import java.util.HashMap;
import java.util.Map;

public class OSUtil {

    public static Map get(){
        Map map = new HashMap();
        map.put("os.name",System.getProperty("os.name"));
        map.put("os.arch",System.getProperty("os.arch"));
        map.put("os.version",System.getProperty("os.version"));
        map.put("file.separator",System.getProperty("file.separator"));
        map.put("path.separator",System.getProperty("path.separator"));
        map.put("line.separator",System.getProperty("line.separator"));
        map.put("user.name",System.getProperty("user.name"));
        map.put("user.home",System.getProperty("user.home"));
        map.put("user.dir",System.getProperty("user.dir"));

        return map;
    }

    public static void main(String[] args){
        Map map = get();
        System.out.println(map);
    }
}
