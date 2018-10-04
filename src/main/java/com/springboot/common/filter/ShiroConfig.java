package com.springboot.common.filter;

import com.springboot.cache.RedisShiroCacheManager;
import com.springboot.common.session.RedisShiroSessionDao;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.DelegatingFilterProxy;

import java.util.HashMap;
import java.util.Map;

/**
 * @author wangshibao
 * @className: ShiroConfig
 * @description: shiro配置
 * @dateTime 2018/4/18 15:38
 */
@Configuration
@Slf4j
public class ShiroConfig {

    /**
     * @description:自定义realm
     * @dateTime 2018/4/18 15:44
     */
    @Bean
    public ShiroAuthRealm createMyRealm() {
        // 加密相关
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        // 散列算法
        hashedCredentialsMatcher.setHashAlgorithmName(ShiroUtil.HASH_ALGORITHM_NAME);
        // 散列次数
        hashedCredentialsMatcher.setHashIterations(ShiroUtil.HASH_ITERATIONS);
        ShiroAuthRealm shiroAuthRealm = new ShiroAuthRealm();
        shiroAuthRealm.setCredentialsMatcher(hashedCredentialsMatcher);
        log.debug("自定义realm注入完成");
        return shiroAuthRealm;
    }

    /**
     * @description: 自定义sessionDao
     * @dateTime 2018/4/24 10:47
     */
    public RedisShiroSessionDao createRedisShiroSessionDao() {
        RedisShiroSessionDao sessionDao = new RedisShiroSessionDao();
        // 设置缓存管理器
        sessionDao.setCacheManager(createCacheManager());
        log.debug("自定义sessionDao");
        return sessionDao;
    }

    /**
     * @description: 自定义shiro session cookie
     * @dateTime 2018/4/24 11:09
     */
    public SimpleCookie createSessionIdCookie() {
        SimpleCookie simpleCookie = new SimpleCookie(ShiroUtil.SESSIONID_COOKIE_NAME);
        // 保证该系统不会受到跨域的脚本操作攻击
        simpleCookie.setHttpOnly(true);
        // 定义Cookie的过期时间，单位为秒，如果设置为-1表示浏览器关闭，则Cookie消失
        simpleCookie.setMaxAge(-1);
        log.debug("自定义SessionIdCookie");
        return simpleCookie;
    }


    /**
     * @description: 自定义sessionManager
     * @dateTime 2018/4/24 10:37
     */
    public SessionManager createMySessionManager() {
        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        // 自定义sessionDao
        sessionManager.setSessionDAO(createRedisShiroSessionDao());
        // session的失效时长,单位是毫秒
        sessionManager.setGlobalSessionTimeout(ShiroUtil.GLOBAL_SESSION_TIMEOUT);
        // 删除失效的session
        sessionManager.setDeleteInvalidSessions(true);
        // 所有的session一定要将id设置到Cookie之中，需要提供有Cookie的操作模版
        sessionManager.setSessionIdCookie(createSessionIdCookie());
        // 定义sessionIdCookie模版可以进行操作的启用
        sessionManager.setSessionIdCookieEnabled(true);
        log.info("配置sessionManager");
        return sessionManager;
    }

    /**
     * @description: 记住我cookie
     * @dateTime 2018/4/24 15:39
     */
    public SimpleCookie createRemeberMeCookie() {
        SimpleCookie simpleCookie = new SimpleCookie(ShiroUtil.REMEBER_ME_COOKIE_NAME);
        // 保证该系统不会受到跨域的脚本操作攻击
        simpleCookie.setHttpOnly(true);
        // 定义Cookie的过期时间，单位为秒，如果设置为-1表示浏览器关闭，则Cookie消失
        simpleCookie.setMaxAge(2592000);
        log.debug("自定义RemeberMeCookie");
        return simpleCookie;
    }

    /**
     * @description: 自定义记住我
     * @dateTime 2018/4/24 15:35
     */
    public CookieRememberMeManager createRememberMeManager() {
        CookieRememberMeManager cookieRememberMeManager = new CookieRememberMeManager();
        // 设置记住我的cookie
        cookieRememberMeManager.setCookie(createRemeberMeCookie());
        log.debug("配置RemeberMeManager");
        return cookieRememberMeManager;
    }

    /**
     * @description: 自定义缓存管理器
     * @dateTime 2018/4/24 15:59
     */
    public RedisShiroCacheManager createCacheManager() {
        RedisShiroCacheManager redisShiroCacheManager = new RedisShiroCacheManager();
        log.debug("自定义CacheManager");
        return redisShiroCacheManager;
    }

    /**
     * @description: 注意方法返回值SecurityManager为org.apache.shiro.mgt.SecurityManager, 不要导错包
     * @dateTime 2018/4/18 15:48
     */
    public SecurityManager createSecurityManager() {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        // 自定义realm
        securityManager.setRealm(createMyRealm());
        // 自定义sessionManager
        securityManager.setSessionManager(createMySessionManager());
        // 自定义rememberMeManager
        securityManager.setRememberMeManager(createRememberMeManager());
        // 自定义cacheManager
        securityManager.setCacheManager(createCacheManager());
        log.debug("配置securityManager");
        return securityManager;
    }

    /**
     * @description: shiro web过滤器
     * @dateTime 2018/4/18 15:50
     */
    @Bean("shiroFilter")
    public ShiroFilterFactoryBean createShiroFilter() {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(createSecurityManager());
        // 如果不设置默认会自动寻找Web工程根目录下的"/login.jsp"页面
        shiroFilterFactoryBean.setLoginUrl("/login/loginIn");
        shiroFilterFactoryBean.setSuccessUrl("/index/goIndex");
        shiroFilterFactoryBean.setUnauthorizedUrl("/common/403");

        // 过滤器 配置不会被过滤的链接 顺序判断 过虑器链定义，从上向下顺序执行，一般将/**放在最下边
        Map<String, String> filterChainDefinitionMap = new HashMap<>();
        // 验证码1
        filterChainDefinitionMap.put("/login/getGhCode", "anon");
        // 验证码2
        filterChainDefinitionMap.put("/login/getCode", "anon");
        // 开放登陆
        filterChainDefinitionMap.put("/login/userLogin", "anon");

        // 对静态资源设置匿名访问 anon:所有url都可以匿名访问
        filterChainDefinitionMap.put("/css/**", "anon");
        filterChainDefinitionMap.put("/images/**", "anon");
        filterChainDefinitionMap.put("/js/**", "anon");
        filterChainDefinitionMap.put("/plugins/**", "anon");

        // authc:所有url都必须认证通过才可以访问
        filterChainDefinitionMap.put("/**", "authc");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        log.debug("注入资源访问配置完成：" + filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }

    /**
     * 解决UnavailableSecurityManagerException异常问题
     * @return
     */
    @Bean
    public FilterRegistrationBean delegatingFilterProxy(){
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        DelegatingFilterProxy proxy = new DelegatingFilterProxy();
        proxy.setTargetFilterLifecycle(true);
        proxy.setTargetBeanName("shiroFilter");
        filterRegistrationBean.setFilter(proxy);
        return filterRegistrationBean;
    }

}