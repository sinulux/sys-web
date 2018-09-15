package com.springboot.tag.common;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import com.springboot.common.busi.SpringContextHolder;
import freemarker.core.DirectiveCallPlace;
import freemarker.core.Environment;
import freemarker.ext.beans.BeansWrapper;
import freemarker.ext.beans.BeansWrapperBuilder;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

//import static freemarker.template.ObjectWrapper.DEFAULT_WRAPPER;

/**
 * 自定义标签演示类
 * Component注解即可，使用value-ref 是首字母小写的类名
 */
@Component
public class LabelDirective implements TemplateDirectiveModel {

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        // 获取请求该标签对应的action的参数
        // 例如访问该标签的是test/miniui_grid.ftl模板，miniui_grid.ftl则是由
        // /test/miniui_grid?test=qwqwqw这个controller访问得到的
        // 因此这里获取的是test值来自/test/miniui_grid请求
        RequestAttributes requestAttributes =
                RequestContextHolder.currentRequestAttributes();
        ServletRequestAttributes requestAttributes1 = (ServletRequestAttributes) requestAttributes;
        String test = requestAttributes1.getRequest().getParameter("test");
        System.out.println(test);
        // 获取输出对象
        Writer out = env.getOut();
        Configuration configuration1 = env.getConfiguration();
        System.out.println(configuration1.getSettingNames(true));
        // 完整标签
        DirectiveCallPlace currentDirectiveCallPlace = env.getCurrentDirectiveCallPlace();
        TemplateHashModel dataModel = env.getDataModel();
        System.out.println(dataModel);
        String label = currentDirectiveCallPlace.toString();
        System.out.println(label.substring(label.indexOf("@"),label.indexOf(" ")));
        System.out.println(currentDirectiveCallPlace.getBeginColumn());
        System.out.println(currentDirectiveCallPlace.getBeginLine());
        System.out.println(currentDirectiveCallPlace.getEndColumn());
        System.out.println(currentDirectiveCallPlace.getEndLine());
        Environment.Namespace currentNamespace = env.getCurrentNamespace();
        System.out.println(currentNamespace.getTemplate().getName());//标签所在模板路径
        System.out.println(currentNamespace.getTemplate());// 模板内容
        System.out.println(env.getCurrentVisitorNode());
        // 获取参数
        TemplateModel paramValue = (TemplateModel) params.get("num");
        int num = Integer.parseInt(paramValue.toString());
        // 标签内部变量
        //env.setVariable("label_inner_var",DEFAULT_WRAPPER.wrap(num));
        env.setVariable("label_inner_var", getBeansWrapper().wrap(num));
        // 模板变量
        Map root = new HashMap();
        root.put("num", num);
        root.put("desc", "标签指定模板内部");
        // 获取配置信息
        FreeMarkerConfigurer configuration = SpringContextHolder.getBean(FreeMarkerConfigurer.class);
        //configuration.setFreemarkerVariables(null);//注入标签
        // 直接渲染，可能使用的较少
        out.write("标签中：Akishimo num=" + params.get("num") + "的类型为:" + paramValue.getClass());
        // 将数据加载到指定模板
        Template temp = configuration.getConfiguration().getTemplate("test/test_tag.ftl");
        temp.process(root, out);
        if (body != null) {
            body.render(env.getOut());
        } else {
            throw new RuntimeException("标签内部至少要加一个空格");
        }
    }

    public static BeansWrapper getBeansWrapper() {
        BeansWrapper beansWrapper = new BeansWrapperBuilder(Configuration.VERSION_2_3_26).build();
        return beansWrapper;
    }
}