package com.springboot.tpl.generate;

import com.alibaba.fastjson.JSONObject;
import com.springboot.common.busi.BaseRunTimeException;
import com.springboot.common.busi.SpringContextHolder;
import com.springboot.tpl.service.AbstractTplService;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

@Component
public class DemoTplService extends AbstractTplService {

    @Override
    public String objToStr(JSONObject paramObj){
        FreeMarkerConfigurer cfg = SpringContextHolder.getBean(FreeMarkerConfigurer.class);
        String templatePath = "";
        if(paramObj.getString("file") == null){
            templatePath = paramObj.getString("labelName");
        }else{
            templatePath = paramObj.getString("file");
        }
        try {
            Template template = cfg.getConfiguration().getTemplate(templatePath);
            // make the test data ,then can query form database
            Map root = new HashMap();
            root.put("num", "21");
            root.put("desc", "描述信息");
            Writer out = new StringWriter();
            template.process(root, out);
            String html = out.toString().replaceAll("[\\n\\r]", "");
            return html;
        } catch (IOException e) {
            throw new BaseRunTimeException("模板文件："+e.getMessage());
        } catch (TemplateException e) {
            throw new BaseRunTimeException("模板文件："+e.getMessage());
        }
    }
}
