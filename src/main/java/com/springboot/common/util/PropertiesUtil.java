package com.springboot.common.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Iterator;
import java.util.Properties;

public class PropertiesUtil {
    public static String getProperty(String key) {
        Properties prop = new Properties();
        try {
            //读取属性文件a.properties
            String dir = System.getProperty("user.dir");
            InputStream in = new BufferedInputStream(new FileInputStream(dir + "/src/main/resources/application.properties"));
            prop.load(in);     ///加载属性列表
            Iterator<String> it = prop.stringPropertyNames().iterator();
            while (it.hasNext()) {
                String tmpKey = it.next();
                if (tmpKey.equals(key)) {
                    System.out.println(key + ":" + prop.getProperty(key));
                    in.close();
                    return prop.getProperty(key);
                }
            }
            ///保存属性到b.properties文件
            FileOutputStream oFile = new FileOutputStream("tmpSimilar.properties", true);//true表示追加打开
            prop.setProperty("date", DateUtils.getDate());
            prop.store(oFile, "The New properties file");
            oFile.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args){
        String dir = System.getProperty("user.dir");
        System.out.println(dir);
        getProperty("test-open");
    }
}