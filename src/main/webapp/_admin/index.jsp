<%@ page import="org.apache.shiro.subject.Subject" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="app.common.shiro.MyUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <base href="<%=request.getContextPath()+"/"%>"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Phare</title>
    <link rel="stylesheet" href="static/layui/css/layui.css">
    <link rel="stylesheet" href="static/lau/lau.css">
    <script>(window.top === window.self) || (window.top.location.href = window.self.location.href);</script>
</head>
<body class="layui-layout-body layui-unselect">
<div class="layui-layout layui-layout-admin">
    <!--顶部导航开始-->
    <div class="layui-header">
        <a class="layui-logo">数据字典管理系统</a>
        <ul class="layui-nav layui-layout-left" id="layui-hy-topmenu" data-href="admin/menuList">
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item" lay-unselect>
                <a href="javascript:;"><%=((MyUser) SecurityUtils.getSubject().getPrincipal()).getUserName()%>
                </a>
                <dl class="layui-nav-child">
                    <dd><a target="dialog" href="javascript:void(0);"
                           lay-data="{url:'_admin/changeMyPass.jsp',height:320}">修改密码</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-unselect><a href="admin/logout" target="ajax" ajaxDone="refreshPage">安全退出</a>
            </li>
        </ul>
    </div>
    <!--顶部导航结束-->

    <!--侧边菜单开始-->
    <div class="layui-side">
        <div class="lau-side-fold"><i class="layui-icon layui-icon-shrink-right"></i></div>
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree">
                <!--这里可以写菜单结构,也可以放空,使用异步加载-->
            </ul>
        </div>
    </div>
    <!--侧边菜单结束-->

    <!--内容主体区域开始-->
    <div class="layui-body" data-type="" data-title="主页" data-icon="layui-icon-home"
         data-href="_admin/home.jsp"></div>
    <!--内容主体区域结束-->
</div>
</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/layui.config.js"></script>
<script>
    layui.use(['lau', 'hyUtil', 'common'], function () {
    });
</script>
</html>
