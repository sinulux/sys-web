package com.springboot.common.util;

import com.springboot.common.busi.SpringContextHolder;
import com.springboot.tag.common.conf.MyFreeMarkerConfigurer;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.support.DefaultListableBeanFactory;
import org.springframework.beans.factory.support.GenericBeanDefinition;
import org.springframework.context.ApplicationContext;

public class LabelUtils {

    public static void register(){
        ApplicationContext ctx = SpringContextHolder.getApplicationContext();
        BeanDefinition bean = new GenericBeanDefinition();
        //类的全路径
        String beanName = MyFreeMarkerConfigurer.class.getName();
        bean.setBeanClassName(beanName);
        DefaultListableBeanFactory factory = (DefaultListableBeanFactory) ctx.getAutowireCapableBeanFactory();
        //删除Bean
        String beanId ="freemarkerConfig";
        if(factory.containsBean(beanId)){
            factory.removeBeanDefinition(beanId);
        }
        //注册Bean
        factory.registerBeanDefinition("freemarkerConfig", bean);
    }
}
