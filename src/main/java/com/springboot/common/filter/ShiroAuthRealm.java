package com.springboot.common.filter;

import com.springboot.common.busi.ResponseData;
import com.springboot.entity.mybatis.UserEO;
import com.springboot.service.system.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wangshibao
 * @className: ShiroAuthRealm
 * @description: 自定义realm
 * @dateTime 2018/4/18 15:40
 */
@Slf4j
public class ShiroAuthRealm extends AuthorizingRealm {

    /**
     * 用户业务逻辑,因为使用的spring的自动装配，
     * 所以MyRealm 也要添加到IOC容器中，不然会出现userService为null
     */
    @Autowired
    private IUserService userService;
    /**
     * 散列次数
     */
    public static final int HASH_ITERATIONS = 2;

    /**
     * @description: 加密密码
     * @author wangshibao
     * @dateTime 2018/4/23 15:01
     */
    public static String encrypt(String password, String salt) {
        Md5Hash md5Hash = new Md5Hash(password, salt, HASH_ITERATIONS);
        return md5Hash.toString();
    }

    public static void main(String[] args) {
        System.out.println(encrypt("111111", "1"));
    }

    /**
     * @description: 用于认证
     * @author cheng
     * @dateTime 2018/4/18 15:42
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken newToken = (UsernamePasswordToken) token;
        // 获取用户账号
        String userAccount = newToken.getUsername();
        log.info("用户{}请求认证", userAccount);
        // 依据用户账号查找用户
        ResponseData apiResponse = userService.selectByUserAccount(userAccount);
        // 账号不存在
        if (apiResponse == null || apiResponse.getData() == null) {
            throw new UnknownAccountException("帐号不存在");
        }
        UserEO userEO = (UserEO) apiResponse.getData();
        // 使用主键作为加盐
        Long salt = userEO.getId();
        // 获取用户状态
        String userStatus = userEO.getStatus();
        // 获取用户密码
        String userPassword = userEO.getPassWord();
        // 获取用户输入密码
        String inputPassword = String.valueOf(newToken.getPassword());
        // 密码错误
        if (!userPassword.equals(encrypt(inputPassword, String.valueOf(salt)))) {
            throw new IncorrectCredentialsException("密码错误");
        }
        // 账号锁定
        if (userStatus == UserEO.Status.Locked.name()) {
            throw new LockedAccountException("帐号已锁定");
        }
        // 账号禁用
        if (userStatus == UserEO.Status.Disabled.name()) {
            throw new DisabledAccountException("帐号不可用");
        }
        // 保存当前用户信息到shiro session中
        ShiroUtil.setCurrentUser(userEO);
        // 与UsernamePasswordToken(userAccount, userPassword)进行比较
        // 如果没有配置Shiro加密，会直接进行比较
        // 如果配置了Shiro的加密,会先对UsernamePasswordToken(userAccount, userPassword)中的密码进行加密，
        // 再和SimpleAuthenticationInfo(userAccount, userPassword, ByteSource.Util.bytes(salt), this.getName())中的密码进行比较
        // 注意salt不能用Long 后期可以采用UUID加密
        return new SimpleAuthenticationInfo(userAccount, userPassword, ByteSource.Util.bytes(String.valueOf(salt)), this.getName());
    }

    /**
     * @description: 用于授权
     * @dateTime 2018/4/18 15:42
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        // 获取用户账号
        // String userAccount = (String) principals.getPrimaryPrincipal();
        // 依据用户账号在数据库中查找权限信息
        log.info("用户请求授权");
        // 角色
        List<String> roles = new ArrayList<>();
        roles.add("admin");
        roles.add("user");
        // 权限
        List<String> permissions = new ArrayList<>();
        permissions.add("admin:select");
        permissions.add("admin:delete");

        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        simpleAuthorizationInfo.addStringPermissions(permissions);
        simpleAuthorizationInfo.addRoles(roles);
        return simpleAuthorizationInfo;
    }

}