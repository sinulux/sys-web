package com.springboot.common.filter;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * web MVC 适配器 * 配置拦截器、处理静态资源、配置消息转换等
 */
@Component
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Bean
    public LogIntercepter logInterceptor() {
        return new LogIntercepter();
    }

    /**
     * 注册拦截器
     *
     * @param registry 拦截器注册中心
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 拦截器里有@Autowire或者@Resource注入的属性就这么用
        registry.addInterceptor(logInterceptor()).addPathPatterns("/**");
        super.addInterceptors(registry);
    }

    /**
     * 静态资源处理
     * 将请求的如css、html等静态资源定位到项目指定位置
     *
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        super.addResourceHandlers(registry);
    }
}
