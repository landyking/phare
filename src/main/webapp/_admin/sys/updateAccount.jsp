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
            width: 85px;
        }

        .layui-input-block {
            margin-left: 115px;
        }
    </style>
</head>
<body>
<form class="layui-form" lay-filter="dataForm">
    <input type="hidden" name="id">
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-block">
            <input type="text" name="username" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属单位</label>
        <div class="layui-input-inline">
            <input type="text" name="depName" required lay-verify="required" autocomplete="off" class="layui-input"
                   readonly>
            <input type="hidden" name="depId" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline" style="width: 80px;">
            <button type="button" class="layui-btn" id="lookupDepartment">选择
            </button>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">描述</label>
        <div class="layui-input-block">
            <input type="text" name="description"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">启用</label>
        <div class="layui-input-block">
            <select name="enableFlag" lay-verify="required" class="hy-select" lay-filter="enableFlag"
                    lay-data="{url:'admin/dict/listSelectItem?dictCode=yesOrNo'}"> </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">最后登录ip</label>
        <div class="layui-input-block">
            <input type="text" name="lastLoginIp" autocomplete="off" class="layui-input"
                   disabled>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">最后登录时间</label>
        <div class="layui-input-block">
            <input type="text" name="lastLoginTime" autocomplete="off"
                   class="layui-input" disabled>
        </div>
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
        hyForm.render({
            loadUrl: "admin/account/loadAccount?id=" + hy.getURLParam("id"),
            saveUrl: 'admin/account/updateAccount',
            afterLoad: function (layFilter, data) {
                //custom init code
                $("#lookupDepartment").click(function () {
                    hy.department.openSelectRadio(function (success, data, closeFn) {
                        if (success) {
                            $("input[name=depId]").val(data[0].id);
                            $("input[name=depName]").val(data[0].name);
                            closeFn();
                        }
                    }, {parentInclude: true});
                });
            }
        });
    });
</script>
</html>
