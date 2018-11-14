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
    <style type="text/css">
        .layui-form-label {
            width: 115px;
        }

        .layui-input-block {
            margin-left: 145px;
        }
    </style>
</head>
<body>
<form class="layui-form" lay-filter="dataForm">
    <div class="layui-form-item">
        <label class="layui-form-label">设备信息同步周期</label>
        <div class="layui-input-block">
            <input type="text" name="deviceSyncPeriod" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">策略信息同步周期</label>
        <div class="layui-input-block">
            <input type="text" name="policySyncPeriod" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <hr/>
    <div class="layui-form-item" style="text-align: center;">
        <button class="layui-btn" lay-submit lay-filter="save">更新</button>
        <button class="layui-btn layui-btn-primary hy-close-window">关闭</button>
    </div>
</form>

</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/layui.config.js"></script>
<script>
    layui.use(['jquery', 'hyForm', 'form', 'common'], function () {
        var $ = layui.$;
        var hyForm = layui.hyForm;
        var form = layui.form;
        hyForm.render({
            loadUrl: 'admin/syncHistory/getSyncHistoryC',
            saveUrl: 'admin/syncHistory/updateSyncPeriod',
            afterLoad: function (layFilter) {
                //custom init code
            }
        });
    });
</script>
</html>