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
        <label class="layui-form-label">ico</label>
        <div class="layui-input-block">
            <input type="text" name="ico" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="ico" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="ico" lay-filter="ico" value="2" title="选项1" checked>
             <input type="radio" name="ico" lay-filter="ico" value="3" title="选项2">

              <select name="ico" lay-verify="required" class="hy-select" lay-filter="ico" lay-data="{url:'admin/dict/listSelectItem?dictCode=ico'}"> </select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">name</label>
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
        <label class="layui-form-label">orderFlag</label>
        <div class="layui-input-block">
            <input type="text" name="orderFlag" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="orderFlag" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="orderFlag" lay-filter="orderFlag" value="2" title="选项1" checked>
             <input type="radio" name="orderFlag" lay-filter="orderFlag" value="3" title="选项2">

              <select name="orderFlag" lay-verify="required" class="hy-select" lay-filter="orderFlag" lay-data="{url:'admin/dict/listSelectItem?dictCode=orderFlag'}"> </select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">pid</label>
        <div class="layui-input-block">
            <input type="text" name="pid" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="pid" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="pid" lay-filter="pid" value="2" title="选项1" checked>
             <input type="radio" name="pid" lay-filter="pid" value="3" title="选项2">

              <select name="pid" lay-verify="required" class="hy-select" lay-filter="pid" lay-data="{url:'admin/dict/listSelectItem?dictCode=pid'}"> </select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">type</label>
        <div class="layui-input-block">
            <input type="text" name="type" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="type" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="type" lay-filter="type" value="2" title="选项1" checked>
             <input type="radio" name="type" lay-filter="type" value="3" title="选项2">

              <select name="type" lay-verify="required" class="hy-select" lay-filter="type" lay-data="{url:'admin/dict/listSelectItem?dictCode=type'}"> </select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">url</label>
        <div class="layui-input-block">
            <input type="text" name="url" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="url" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="url" lay-filter="url" value="2" title="选项1" checked>
             <input type="radio" name="url" lay-filter="url" value="3" title="选项2">

              <select name="url" lay-verify="required" class="hy-select" lay-filter="url" lay-data="{url:'admin/dict/listSelectItem?dictCode=url'}"> </select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">useFlag</label>
        <div class="layui-input-block">
            <input type="text" name="useFlag" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="useFlag" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="useFlag" lay-filter="useFlag" value="2" title="选项1" checked>
             <input type="radio" name="useFlag" lay-filter="useFlag" value="3" title="选项2">

              <select name="useFlag" lay-verify="required" class="hy-select" lay-filter="useFlag" lay-data="{url:'admin/dict/listSelectItem?dictCode=useFlag'}"> </select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">createTime</label>
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
    layui.use(['jquery', 'hyForm', 'form', 'common'], function () {
        var $ = layui.$;
        var hyForm = layui.hyForm;
        var form = layui.form;
        hyForm.render({
            loadUrl: null,
            saveUrl: 'admin/Permission/updatePermission'
        });
    });
</script>
</html>