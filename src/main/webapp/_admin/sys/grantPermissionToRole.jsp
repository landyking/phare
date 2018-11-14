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
    </style>
</head>
<body>
<form class="layui-form" lay-filter="dataForm">
    <div class="layui-form-item">
        <label class="layui-form-label">编码</label>
        <div class="layui-input-block">
            <input type="text" name="id" disabled autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" disabled autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">url</label>
        <div class="layui-input-block">
            <input type="text" name="url" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-block" id="roleDiv" style="height:190px;overflow-y: scroll;"></div>
    </div>
    <hr/>
    <div class="layui-form-item" style="text-align: center;">
        <button class="layui-btn" lay-submit lay-filter="save">提交</button>
        <button class="layui-btn layui-btn-primary hy-close-window">关闭</button>
    </div>
</form>

</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/layui.config.js"></script>
<script>
    layui.use(['jquery', 'hyForm', 'form', 'common', "hyUtil"], function () {
        var $ = layui.$;
        var hyForm = layui.hyForm;
        var form = layui.form;
        var promise = $.post('admin/role/listRole', {
            limit: 1000
        });
        hyForm.render({
            loadUrl: "admin/permission/loadPermission?id=" + hy.getURLParam("id"),
            saveUrl: 'admin/account/grantPermissionToRole',
            afterLoad: function (layFilter, data) {
                promise.done(function (rst) {
                    if (rst.code == 0) {
                        $.each(rst.data, function (idx, one) {
                            var marker = "";
                            if (data.roleIds && data.roleIds.indexOf(one.id) > -1) {
                                marker = 'checked';
                            }
                            $("#roleDiv").append('<input type="checkbox" name="role.' + one.id + '" title="' + one.name + '" ' + marker + '>');
                        });
                        form.render('checkbox');
                    } else {
                        layui.layer.msg('加载所有角色失败: ' + rst.msg);
                    }
                });
            },
            beforeSave: function (data) {
                var arr = [];
                $.each(data.field, function (k, v) {
                    if (k.startsWith("role.") && v == 'on') {
                        arr.push(k.substr(5));
                    }
                });
                data.field.roleIds = arr.join(",");
            }
        });
    });
</script>
</html>