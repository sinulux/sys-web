package com.springboot.common.util;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;

public class DataCollectUtil {

    public static void get(String url){
        Document doc = null;
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String title = doc.title();
        System.out.println(title);
        Elements types = doc.select("#hd_mainnav .bdt .cur");
        for(Element type:types){
            System.out.println(type.text());
        }
        Elements articles = doc.select("#main article");
        for(Element article:articles){
            System.out.println(article.select("h4 a").attr("href"));
            System.out.println(article.select("h4 a").text());
            System.out.println(article.select("ul .form").text());
            System.out.println(article.select("ul .time").text());
            System.out.println(article.select("ul .type").text());
        }
    }

    public static void main(String[] args){
        get("http://sh.qihoo.com/china/");
    }
}
