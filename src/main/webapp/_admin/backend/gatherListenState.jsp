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
    <link rel="stylesheet" href="static/layui/css/layui.css">
    <link rel="stylesheet" href="static/css/common.css">
</head>
<body>
<div class="layui-card">
    <div class=" layui-card-header layuiadmin-card-header-auto">
        <form class="layui-form" id="filterForm">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <button class="layui-btn  layui-btn-normal" >
                        停止采集监听服务
                    </button>
                    <button class="layui-btn layui-btn-normal" >
                        启动采集监听服务
                    </button>
                </div>
            </div>
        </form>
    </div>
    <div class="layui-card-body">
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col>
                <col>
            </colgroup>
            <thead>
            </thead>
            <tbody>
            <tr>
                <td class="layui-bg-green">服务状态</td>
                <td>正常</td>
            </tr>
            <tr>
                <td class="layui-bg-green">启动时间</td>
                <td>2018-10-22 22:22:22</td>
            </tr>
            <tr>
                <td class="layui-bg-green">监听端口</td>
                <td>11066</td>
            </tr>
            <tr>
                <td class="layui-bg-green">当前连接</td>
                <td>200</td>
            </tr>
            <tr>
                <td class="layui-bg-green">累计连接数</td>
                <td>3000</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/layui.config.js"></script>
<script>
    layui.use(['singleTableList', 'layer'], function () {

    });
</script>
</html>