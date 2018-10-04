<!DOCTYPE html>
<html lang="z-ch">
<head>
    <title>首页</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, userEO-scalable=no">
    <meta name="keywords"
          content="HTML, CSS, JS, JavaScript, framework, bootstrap, front-end, frontend, web development">
    <meta name="author" content="设计：王齐 <wangqi@bootcss.com>">
    <link href="/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="/plugins/layer/layer.js" type="text/javascript"></script>
    <script src="/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/plugins/niceValidator/dist/jquery.validator.min.js?local=zh-CN" type="text/javascript"></script>
</head>
<body style="background:url(/images/main.jpg) no-repeat;background-size: cover">
    <div class="login-wrap">
        <div class="login-dialog">
            <div class="content">
                <form id="loginForm" method="post" class="form-horizontal login-form" style="margin: 0 auto">
                    <h3>用户登录</h3>
                    <div class="form-group">
                        <input style="background: rgba(0 ,0 ,0 ,0.3);color:#FFFFFF" type="text"
                               class="form-control" id="username" name="username" placeholder="请输入用户名"/>
                    </div>
                    <div class="form-group">
                        <input style="background: rgba(0 ,0 ,0 ,0.3);color:#FFFFFF" type="password"
                               class="form-control" id="password" name="password" placeholder="请输入密码"/>
                    </div>
                    <div class="form-group">
                        <input style="background: rgba(0 ,0 ,0 ,0.3);color:#FFFFFF;width:50%;border-right:0"
                               type="text" class="form-control" id="validCode" name="validCode" placeholder="请输入验证码"/>
                        <img style="float: right;background: rgba(0 ,0 ,0 ,0.3);color:#FFFFFF;width:50%;padding: 1px 1px 1px 1px"
                             src="/login/getGhCode?v=1" class="form-control"
                             onclick="this.src='/login/getGhCode?v='+ new Date().getTime()" alt="登陆验证码"/>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-default col-xs-12">登陆</button>
                    </div>
                    <div class="form-group">
                        <button type="reset" class="btn btn-warning col-xs-12">重置</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="footer-bar">
            Copyright&copy;study platform by wangqi of sunules@qq.com created in 2018
        </div>
    </div>
</body>
<script>
    $("#loginForm").validator({
        fields: {
            username: "用户名:required; length(6~20)",
            validCode: "验证码:required; length(4)",
            password: "密码:required; length(6~20)"
        },
        focusCleanup: true,
        timely: 2,
        theme:'yellow_right_effect',
        msgClass:'n-top',
        valid: function (form) {
            // form.submit();
            var formData = decodeURIComponent($("form").serialize(), true);
            console.log(formData);
            $.post(
                "/login/userLogin",
                formData,
                function (result) {
                    if (result.status == '1') {
                        layer.msg('登录成功！正在进入...', {
                            icon: 16
                            , shade: 0.01,
                            time: 2000
                        }, function (index) {
                            layer.close(index);
                            window.location.href = "/index/goIndex";
                        });
                    } else {
                        layer.alert(result.data, {icon: 2});
                    }
                }
            );
        }
    });
</script>
</html>