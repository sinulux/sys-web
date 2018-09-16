#打包
    cd 项目跟目录（和pom.xml同级）
    mvn clean package
    #或者执行下面的命令
    #排除测试代码后进行打包,可以使用IDEA的Terminal控制台更快捷
    mvn clean package  -Dmaven.test.skip=true
#运行
## 普通运行方式
    java -Dfile.encoding=GBK -jar  target/demo-0.0.1-SNAPSHOT.jar
## 后台服务方式
nohup java -jar target/demo-0.0.1-SNAPSHOT.jar &
#启动的时选择读取不同的配置文件
    java -jar app.jar --spring.profiles.active=dev
#启动的时候设置jvm参数
    java -Xms10m -Xmx80m -jar app.jar &
#gradle
    如果使用的是gradle,使用下面命令打包
    gradle build
    java -jar build/libs/mymodule-0.0.1-SNAPSHOT.jar

#Apache Shiro
    Filter Chain定义说明：
    
    1、一个URL可以配置多个Filter，使用逗号分隔
    2、当设置多个过滤器时，全部验证通过，才视为通过
    3、部分过滤器可指定参数，如perms，roles
    Shiro内置的FilterChain

    Filter Name	Class
    anon	    org.apache.shiro.web.filter.authc.AnonymousFilter
    authc	    org.apache.shiro.web.filter.authc.FormAuthenticationFilter
    authcBasic	org.apache.shiro.web.filter.authc.BasicHttpAuthenticationFilter
    perms	    org.apache.shiro.web.filter.authz.PermissionsAuthorizationFilter
    port	    org.apache.shiro.web.filter.authz.PortFilter
    rest	    org.apache.shiro.web.filter.authz.HttpMethodPermissionFilter
    roles	    org.apache.shiro.web.filter.authz.RolesAuthorizationFilter
    ssl	        org.apache.shiro.web.filter.authz.SslFilter
    userEO	    org.apache.shiro.web.filter.authc.UserFilter
    anon:所有url都都可以匿名访问
    authc: 需要认证才能进行访问
    userEO:配置记住我或认证通过可以访问
    
    登录认证实现

    在认证、授权内部实现机制中都有提到，最终处理都将交给Real进行处理。因为在Shiro中，最终是通过Realm来获取应用程序中的用户、角色及权限信息的。通常情况下，在Realm中会直接从我们的数据源中获取Shiro需要的验证信息。可以说，Realm是专用于安全框架的DAO. Shiro的认证过程最终会交由Realm执行，这时会调用Realm的getAuthenticationInfo(token)方法。

    该方法主要执行以下操作:
    
    1、检查提交的进行认证的令牌信息
    2、根据令牌信息从数据源(通常为数据库)中获取用户信息
    3、对用户信息进行匹配验证。
    4、验证通过将返回一个封装了用户信息的AuthenticationInfo实例。
    5、验证失败则抛出AuthenticationException异常信息。
    而在我们的应用程序中要做的就是自定义一个Realm类，继承AuthorizingRealm抽象类，重载doGetAuthenticationInfo()，重写获取用户信息的方法。
    
    测试
    
    1、编写好后就可以启动程序，访问http://localhost:8080/userInfo/userList页面，由于没有登录就会跳转到http://localhost:8080/login页面。登录之后就会跳转到index页面，登录后，直接在浏览器中输入http://localhost:8080/userInfo/userList访问就会看到用户信息。上面这些操作时候触发MyShiroRealm.doGetAuthenticationInfo()这个方法，也就是登录认证的方法。
    
    2、登录admin账户，访问：http://127.0.0.1:8080/userInfo/userAdd显示用户添加界面，访问http://127.0.0.1:8080/userInfo/userDel显示403没有权限。上面这些操作时候触发MyShiroRealm.doGetAuthorizationInfo()这个方面，也就是权限校验的方法。
    
    3、修改admin不同的权限进行测试
    
    shiro很强大，这仅仅是完成了登录认证和权限管理这两个功能，更多内容以后有时间再做探讨。