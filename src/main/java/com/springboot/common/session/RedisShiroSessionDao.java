package com.springboot.common.session;

import com.springboot.common.filter.RedisUtil;
import com.springboot.common.filter.ShiroUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.springframework.util.SerializationUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

/**
 * @author wangshibao
 * @className: RedisShiroSessionDao
 * @description: 使用redis管理shiro session
 * @dateTime 2018/4/24 9:26
 */
@Slf4j
public class RedisShiroSessionDao extends EnterpriseCacheSessionDAO {

    /**
     * @description: 获取加工后的key的字节数组
     * @dateTime 2018/4/24 9:57
     */
    private byte[] getKey(String key) {
        return (ShiroUtil.SHIRO_SESSION_PREFIX + key).getBytes();
    }

    /**
     * @description: 更新会话；如更新会话最后访问时间/停止会话/设置超时时间/设置移除属性等会调用
     * @dateTime 2018/4/24 9:32
     */
    @Override
    public void doUpdate(Session session) {
        // 判断session
        if (session != null && session.getId() != null) {
            byte[] key = getKey(session.getId().toString());
            // 序列化session
            byte[] value = SerializationUtils.serialize(session);
            // 把session信息存储到redis中
            RedisUtil.set(key, value);
            log.info("update session:{}", session);
        }
    }

    /**
     * @description: 删除会话；当会话过期/会话停止（如用户退出时）会调用
     * @dateTime 2018/4/24 9:31
     */
    @Override
    protected void doDelete(Session session) {
        // 判断session
        if (session != null && session.getId() != null) {
            byte[] key = getKey(session.getId().toString());
            // 从redis中删除session
            RedisUtil.del(key);
            log.info("删除session:{}", session);
        }
    }

    /**
     * @description: 如DefaultSessionManager在创建完session后会调用该方法；
     * 如保存到关系数据库/文件系统/NoSQL数据库；即可以实现会话的持久化；
     * 返回会话ID；主要此处返回的ID.equals(session.getId())；
     * @dateTime 2018/4/24 9:32
     */
    @Override
    public Serializable doCreate(Session session) {
        // 判断session
        if (session != null) {
            // 获取sessionId
            Serializable sessionId = super.doCreate(session);
            byte[] key = getKey(sessionId.toString());
            // 序列化session
            byte[] value = SerializationUtils.serialize(session);
            // 把session信息存储到redis中
            RedisUtil.set(key, value);
            // 设置过期时间
            RedisUtil.expire(key, ShiroUtil.EXPIRE_SECONDS);
            log.info("创建session:{}", session);
            return sessionId;
        }
        return null;
    }

    /**
     * @description: 根据会话ID获取会话
     * @dateTime 2018/4/24 9:32
     */
    @Override
    public Session doReadSession(Serializable sessionId) {
        if (sessionId != null) {
            byte[] key = getKey(sessionId.toString());
            byte[] value = RedisUtil.get(key);
            // 反序列化session
            Session session = (Session) SerializationUtils.deserialize(value);
            log.info("获取session:{}", session);
            return session;
        }
        return null;
    }

    /**
     * @description: 获取当前所有活跃用户，如果用户量多此方法影响性能
     * @dateTime 2018/4/24 9:32
     */
    @Override
    public Collection<Session> getActiveSessions() {
        List<Session> sessionList = new ArrayList<>(16);
        // 从redis从查询
        Set<byte[]> keyByteArraySet = RedisUtil.keys(ShiroUtil.SHIRO_SESSION_PREFIX);
        for (byte[] keyByteArray : keyByteArraySet) {
            // 反序列化
            Session session = (Session) SerializationUtils.deserialize(keyByteArray);
            sessionList.add(session);
        }
        return sessionList;
    }

}