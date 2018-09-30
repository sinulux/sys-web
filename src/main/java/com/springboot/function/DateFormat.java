package com.springboot.function;

import freemarker.template.SimpleDate;
import freemarker.template.TemplateMethodModelEx;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * 自定义函数实现类
 */
@Component
public class DateFormat implements TemplateMethodModelEx {
    private final String DEFAULT_FORMAT = "yyyy-MM-dd HH:mm:ss";

    @Override
    public Object exec(List list) {
        if(ObjectUtils.isEmpty(list)){
            return "[parse error ,param is null]";
        }
        String dateStr;
        SimpleDate simpleDate = (SimpleDate) list.get(0);
        if(list.size() == 1){
            dateStr = new SimpleDateFormat(DEFAULT_FORMAT).format(simpleDate.getAsDate());
        }else{
            dateStr = new SimpleDateFormat(list.get(1).toString()).format(simpleDate.getAsDate());
        }
        return dateStr;
    }
}
