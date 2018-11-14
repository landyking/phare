<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8"> <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" /> <meta http-equiv="Pragma" content="no-cache" /> <meta http-equiv="Expires" content="0" />
    <base href="<%=request.getContextPath()+"/"%>"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <link rel="stylesheet" href="static/layui/css/layui.css">
    <link rel="stylesheet" href="static/css/sign.css">
    <script>(window.top === window.self) || (window.top.location.href = window.self.location.href);</script>
</head>
<body class="layui-unselect lau-sign-body">

<div class="layui-form layui-form-pane lau-sign-form">
    <h1 class="lau-sign-title">登录</h1>
    <p class="lau-sign-subtitle">数据字典管理系统</p>
    <div class="layui-form-item">
        <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i> 账　号</label>
        <div class="layui-input-block">
            <input type="text" name="username" placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i> 密　码</label>
        <div class="layui-input-block">
            <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
    </div>
    <div class="layui-form-item">
        <button type="button" class="layui-btn layui-btn-fluid" lay-submit lay-filter="login">登 入</button>
    </div>
    <div class="layui-form-item lau-sign-other">
    </div>
</div>
<div class="layui-trans lau-sign-footer">
</div>

</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/layui.config.js"></script>
<script>
    layui.use('login');
</script>
</html>