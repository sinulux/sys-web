package com.springboot.common.filter;

import com.springboot.entity.mybatis.UserEO;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author wangshibao
 * @className: ShiroUtil
 * @description: 管理shiro session的工具类
 * @dateTime 2018/4/19 10:15
 */
public class ShiroUtil {

    /**
     * 日志管理
     */
    private static Logger log = LoggerFactory.getLogger(ShiroUtil.class);
    /**
     * 当前用户
     */
    private static final String CURRENT_USER = "CURRENT_USER";
    /**
     * shiro加密算法
     */
    public static final String HASH_ALGORITHM_NAME = "md5";
    /**
     * 散列次数
     */
    public static final int HASH_ITERATIONS = 2;
    /**
     * 全局session过期时间
     */
    public static final int GLOBAL_SESSION_TIMEOUT = 60*60*1000;
    /**
     * 自定义shiro session的cookie名称
     */
    public static final String SESSIONID_COOKIE_NAME = "SHIRO_SESSION_ID";
    /**
     * 自定义remeber me的cookie名称
     */
    public static final String REMEBER_ME_COOKIE_NAME = "REMEBER_ME";
    /**
     * shiro session前缀
     */
    public static final String SHIRO_SESSION_PREFIX = "shiro_session:";
    /**
     * shiro cache前缀
     */
    public static final String SHIRO_CACHE_PREFIX = "shiro_cache:";
    /**
     * shiro session过期时间-秒
     */
    public static final int EXPIRE_SECONDS = 60 * 60;

    /**
     * @description: 私有化构造函数
     * @dateTime 2018/4/19 10:15
     */
    private ShiroUtil() {
    }

    /**
     * @description: 获取session
     * @dateTime 2018/4/19 10:38
     */
    public static Session getSession() {
        Session session = null;
        try {
            Subject currentUser = SecurityUtils.getSubject();
            session = currentUser.getSession();
        } catch (Exception e) {
            log.warn("获取shiro当前用户的session时发生了异常", e);
            throw e;
        }
        return session;
    }

    /**
     * @description: 将数据放到shiro session中
     * @dateTime 2018/4/19 10:45
     */
    public static void setAttribute(Object key, Object value) {
        try {
            Session session = getSession();
            session.setAttribute(key, value);
        } catch (Exception e) {
            log.warn("将一些数据放到Shiro Session中时发生了异常", e);
            throw e;
        }
    }

    /**
     * @description: 获取shiro session中的数据
     * @dateTime 2018/4/19 10:48
     */
    public static Object getAttribute(Object key) {
        Object value = null;
        try {
            Session session = getSession();
            value = session.getAttribute(key);
        } catch (Exception e) {
            log.warn("获取shiro session中的数据时发生了异常", e);
            throw e;
        }
        return value;
    }

    /**
     * @description: 删除shiro session中的数据
     * @dateTime 2018/4/19 10:51
     */
    public static void removeAttribute(Object key) {
        try {
            Session session = getSession();
            session.removeAttribute(key);
        } catch (Exception e) {
            log.warn("删除shiro session中的数据时发生了异常", e);
            throw e;
        }
    }

    /**
     * @description: 设置当前用户
     * @dateTime 2018/4/19 10:59
     */
    public static void setCurrentUser(Object user) {
        setAttribute(CURRENT_USER, user);
    }

    /**
     * @description: 获取当前用户
     * @dateTime 2018/4/19 10:59
     */
    public static UserEO getCurrentUser() {
        UserEO userEO = (UserEO) getAttribute(CURRENT_USER);
        return userEO;
    }

    /**
     * @description:删除当前用户
     * @dateTime 2018/4/19 10:59
     */
    public static void removeCurrentUser() {
        removeAttribute(CURRENT_USER);
    }

    /**
     * @description: 加密密码
     * @dateTime 2018/4/23 15:01
     */
    public static String encrypt(String password, String salt) {
        Md5Hash md5Hash = new Md5Hash(password, salt, HASH_ITERATIONS);
        return md5Hash.toString();
    }

}