package com.springboot.service.common.impl;

import com.springboot.common.busi.ResponseData;
import com.springboot.common.filter.ShiroUtil;
import com.springboot.entity.mybatis.UserEO;
import com.springboot.service.common.ILoginService;
import com.springboot.service.system.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author wangshibao
 * @className: LoginServiceImpl
 * @description:
 * @dateTime 2018/4/19 9:21
 */
@Service
@Transactional
@Slf4j
public class LoginServiceImpl implements ILoginService {

    /**
     * 用户业务逻辑
     */
    @Autowired
    private IUserService userService;

    /**
     * @description: 登录
     * @dateTime 2018/4/19 9:21
     */
    @Override
    public ResponseData login(String userAccount, String userPassword) {
        // 获取当前用户
        Subject subject = SecurityUtils.getSubject();
        // 自己创建令牌
        UsernamePasswordToken token = new UsernamePasswordToken(userAccount, userPassword);
        // 当前登录用户信息
        UserEO userEO = null;
        // 提示信息
        String msg = null;
        try {
            // 记住我
            token.setRememberMe(true);
            subject.login(token);
            // 用户认证成功,获取当前用户
            userEO = ShiroUtil.getCurrentUser();
            // 完成认证的后续操作
            // 修改用户信息
//            userEO.setLastLoginTime(new Date());
//            userService.updateUser(userEO);
            msg = "用户登录成功";
            return ResponseData.success(userEO, msg);
        } catch (UnknownAccountException e) {
            msg = "用户账号不存在";
            log.warn(msg, e);
        } catch (LockedAccountException e) {
            msg = "用户账号被锁定";
            log.warn(msg, e);
        } catch (DisabledAccountException e) {
            msg = "用户账号被禁用";
            log.warn(msg, e);
        } catch (IncorrectCredentialsException e) {
            msg = "用户密码错误";
            log.warn(msg, e);
        }
        // 用户认证失败,删除当前用户
        ShiroUtil.removeCurrentUser();
        return ResponseData.fail(msg);
    }

}