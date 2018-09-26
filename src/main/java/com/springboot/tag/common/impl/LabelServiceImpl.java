package com.springboot.tag.common.impl;

import com.alibaba.fastjson.JSONObject;
import com.springboot.common.busi.SpringContextHolder;
import com.springboot.tag.common.AbstractLabelService;
import com.springboot.tag.common.Context;
import com.springboot.tag.common.ContextHolder;
import freemarker.core.DirectiveCallPlace;
import freemarker.core.Environment;
import freemarker.ext.beans.BeansWrapper;
import freemarker.ext.beans.BeansWrapperBuilder;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.IOException;
import java.io.Writer;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@Component("labelService")
@Slf4j
public class LabelServiceImpl implements TemplateDirectiveModel {
    @Override
    public void execute(Environment env, Map map,
                        TemplateModel[] templateModels,
                        TemplateDirectiveBody templateDirectiveBody)
            throws TemplateException, IOException {
        log.info("========================标签查询======================");
        // 完整标签
        DirectiveCallPlace currentDirectiveCallPlace = env.getCurrentDirectiveCallPlace();
        String label = currentDirectiveCallPlace.toString();
        String labelName = label.substring(label.indexOf("@")+1,label.indexOf(" "));
        AbstractLabelService labelService;
        // 业务实现
        labelService = SpringContextHolder.getBean(labelName+"BeanService");
        // 标签参数
        JSONObject paramObj = new JSONObject(map);
        // 上下文参数
        RequestAttributes requestAttributes =
                RequestContextHolder.currentRequestAttributes();
        ServletRequestAttributes attributes = (ServletRequestAttributes) requestAttributes;
        Enumeration<String> parameterNames = attributes.getRequest().getParameterNames();
        Map<String,String> contextMap = new HashMap<>();
        while(parameterNames.hasMoreElements()){
            String  name = parameterNames.nextElement();
            contextMap.put(name,attributes.getRequest().getParameter(name));
        }
        Context context = new Context();
        context.setParamMap(contextMap);
        ContextHolder.setContext(context);
        // 执行前置查询
        boolean before = labelService.before(paramObj);
        if(!before){
            return;
        }
        // 执行主程序获取结果
        Object object = labelService.getObject(paramObj);

        // 输出
        // 获取输出对象
        Writer out = env.getOut();
        Map root = new HashMap();
        root.put("resultObj", object);
        root.put("paramObj", paramObj);
        env.setVariable("resultObj", getBeansWrapper().wrap(object));
        if(StringUtils.isNotEmpty(paramObj.getString("file"))){
            String filePathName = paramObj.getString("file");
            FreeMarkerConfigurer configuration = SpringContextHolder.getBean(FreeMarkerConfigurer.class);
            Template temp = configuration.getConfiguration().getTemplate(filePathName);
            temp.process(root, out);
            if (templateDirectiveBody != null) {
                templateDirectiveBody.render(env.getOut());
            }
        }else{
            if (templateDirectiveBody == null) {
                String htmlStr = labelService.objToStr("", object, paramObj);
                out.write(htmlStr);
            }else{
                templateDirectiveBody.render(env.getOut());
            }
        }
    }

    public static BeansWrapper getBeansWrapper() {
        BeansWrapper beansWrapper = new BeansWrapperBuilder(Configuration.VERSION_2_3_26).build();
        return beansWrapper;
    }
}
