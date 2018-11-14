<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
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
        <label class="layui-form-label">id</label>
        <div class="layui-input-block">
            <input type="text" name="id" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="id" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="id" lay-filter="id" value="2" title="选项1" checked>
             <input type="radio" name="id" lay-filter="id" value="3" title="选项2">

              <select name="id" lay-verify="required" class="hy-select" lay-filter="id" lay-data="{url:'admin/dict/listSelectItem?dictCode=id'}"> </select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属工程</label>
        <div class="layui-input-block">
            <input type="text" name="projectId" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="projectId" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="projectId" lay-filter="projectId" value="2" title="选项1" checked>
             <input type="radio" name="projectId" lay-filter="projectId" value="3" title="选项2">

              <select name="projectId" lay-verify="required" class="hy-select" lay-filter="projectId" lay-data="{url:'admin/dict/listSelectItem?dictCode=projectId'}"> </select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="name" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="name" lay-filter="name" value="2" title="选项1" checked>
             <input type="radio" name="name" lay-filter="name" value="3" title="选项2">

              <select name="name" lay-verify="required" class="hy-select" lay-filter="name" lay-data="{url:'admin/dict/listSelectItem?dictCode=name'}"> </select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">描述</label>
        <div class="layui-input-block">
            <input type="text" name="description" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="description" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="description" lay-filter="description" value="2" title="选项1" checked>
             <input type="radio" name="description" lay-filter="description" value="3" title="选项2">

              <select name="description" lay-verify="required" class="hy-select" lay-filter="description" lay-data="{url:'admin/dict/listSelectItem?dictCode=description'}"> </select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-block">
            <input type="text" name="createTime" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="createTime" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="createTime" lay-filter="createTime" value="2" title="选项1" checked>
             <input type="radio" name="createTime" lay-filter="createTime" value="3" title="选项2">

              <select name="createTime" lay-verify="required" class="hy-select" lay-filter="createTime" lay-data="{url:'admin/dict/listSelectItem?dictCode=createTime'}"> </select>
            -->
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
            loadUrl: "admin/tableInfo/loadTableInfo?id=" + hy.getURLParam("id"),
            saveUrl: 'admin/tableInfo/updateTableInfo',
            afterLoad: function (layFilter, data) {
                //custom init code
            }
        });
    });
</script>
</html>