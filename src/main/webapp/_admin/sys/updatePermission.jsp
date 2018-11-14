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
        <label class="layui-form-label">编码</label>
        <div class="layui-input-block">
            <input type="text" name="newId" disabled autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图标</label>
        <div class="layui-input-block">
            <input type="text" name="ico" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">排序</label>
        <div class="layui-input-block">
            <input type="text" name="orderFlag" required lay-verify="required|number" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">父编码</label>
        <div class="layui-input-block">
            <input type="text" name="pid" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">
            <select name="type" lay-verify="required" class="hy-select" lay-filter="type"
                    lay-data="{url:'admin/dict/listSelectItem?dictCode=permissionType'}"> </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">url</label>
        <div class="layui-input-block">
            <input type="text" name="url" autocomplete="off" class="layui-input">
            <!--
             <textarea name="url" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">启用</label>
        <div class="layui-input-block">
            <select name="useFlag" lay-verify="required" class="hy-select" lay-filter="useFlag"
                    lay-data="{url:'admin/dict/listSelectItem?dictCode=yesOrNo'}"> </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-block">
            <input type="text" name="createTime" autocomplete="off" class="layui-input" disabled>
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
            loadUrl: "admin/permission/loadPermission?id=" + hy.getURLParam("id"),
            saveUrl: 'admin/permission/updatePermission',
            afterLoad: function (layFilter, data) {
                $("input[name=newId]").val(data.id);
            }
        });
    });
</script>
</html>