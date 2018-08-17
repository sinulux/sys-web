package com.springboot.common.util;

import java.util.HashMap;
import java.util.Map;

public class JDKUtil {

    public static Map get(){
        Map map = new HashMap();
        map.put("java.version",System.getProperty("java.version"));
        map.put("java.vendor",System.getProperty("java.vendor"));
        map.put("java.vendor.url",System.getProperty("java.vendor.url"));
        map.put("java.home",System.getProperty("java.home"));
        map.put("java.vm.specification.version",System.getProperty("java.vm.specification.version"));
        map.put("java.vm.specification.vendor",System.getProperty("java.vm.specification.vendor"));
        map.put("java.vm.specification.name",System.getProperty("java.vm.specification.name"));
        map.put("java.vm.version",System.getProperty("java.vm.version"));
        map.put("java.vm.vendor",System.getProperty("java.vm.vendor"));
        map.put("java.vm.name",System.getProperty("java.vm.name"));
        map.put("java.specification.version",System.getProperty("java.specification.version"));
        map.put("java.specification.vendor",System.getProperty("java.specification.vendor"));
        map.put("java.specification.name",System.getProperty("java.specification.name"));
        map.put("java.class.version",System.getProperty("java.class.version"));
        map.put("java.class.path",System.getProperty("java.class.path"));
        map.put("java.library.path",System.getProperty("java.library.path"));
        map.put("java.io.tmpdir",System.getProperty("java.io.tmpdir"));
        map.put("java.compiler",System.getProperty("java.compiler"));
        map.put("java.ext.dirs",System.getProperty("java.ext.dirs"));
        return map;
    }

    public static void main(String[] args){
        Map map = get();
        System.out.println(map);
    }
}
