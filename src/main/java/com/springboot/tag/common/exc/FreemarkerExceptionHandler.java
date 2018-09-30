package com.springboot.tag.common.exc;

import freemarker.core.DirectiveCallPlace;
import freemarker.core.Environment;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.ObjectUtils;

import java.io.IOException;
import java.io.Writer;

/**
 * freemarker页面上的异常控制 在webmvc-config.xml里面的freemarkerSettings里头配置
 */
@Slf4j
public class FreemarkerExceptionHandler implements TemplateExceptionHandler {
    @Override
    public void handleTemplateException(TemplateException te, Environment env, Writer out)
            throws TemplateException {
        String missingVariable = "undefined";
        log.warn(te.getMessage());
        // 完整标签
        DirectiveCallPlace currentDirectiveCallPlace = env.getCurrentDirectiveCallPlace();
        if(ObjectUtils.isEmpty(currentDirectiveCallPlace)){
            return;
        }
        String label = String.valueOf(currentDirectiveCallPlace);
        String labelName = label.substring(label.indexOf("@")+1,label.indexOf(" "));
        try {
            String[] tmp = te.getMessageWithoutStackTop().split("\n");
            if (tmp.length > 1)
                tmp = tmp[1].split(" ");
            if (tmp.length > 1)
                missingVariable = tmp[1];
            log.error("[出错了，请联系网站管理员：${ " + missingVariable + "}]");
            out.write("[调用标签<span class='text-danger'>"+labelName+"</span>出错了：${ " + missingVariable + "}]，请联系管理员！]");
        } catch (IOException e) {
            throw new TemplateException("Failed to print error message. Cause: " + e, env);
        }
    }
}
