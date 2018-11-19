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
    <div class="layui-form-item">
        <label class="layui-form-label">单位地址</label>
        <div class="layui-input-block">
            <input type="text" name="address" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="address" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="address" lay-filter="address" value="2" title="选项1" checked>
             <input type="radio" name="address" lay-filter="address" value="3" title="选项2">

             <select name="address" lay-verify="required" class="hy-select" lay-filter="address" lay-data="{url:'admin/dict/listSelectItem?dictCode=address'}"></select>
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

             <select name="createTime" lay-verify="required" class="hy-select" lay-filter="createTime" lay-data="{url:'admin/dict/listSelectItem?dictCode=createTime'}"></select>
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

             <select name="description" lay-verify="required" class="hy-select" lay-filter="description" lay-data="{url:'admin/dict/listSelectItem?dictCode=description'}"></select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">主键|单位编号</label>
        <div class="layui-input-block">
            <input type="text" name="id" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="id" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="id" lay-filter="id" value="2" title="选项1" checked>
             <input type="radio" name="id" lay-filter="id" value="3" title="选项2">

             <select name="id" lay-verify="required" class="hy-select" lay-filter="id" lay-data="{url:'admin/dict/listSelectItem?dictCode=id'}"></select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">纬度</label>
        <div class="layui-input-block">
            <input type="text" name="latitude" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="latitude" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="latitude" lay-filter="latitude" value="2" title="选项1" checked>
             <input type="radio" name="latitude" lay-filter="latitude" value="3" title="选项2">

             <select name="latitude" lay-verify="required" class="hy-select" lay-filter="latitude" lay-data="{url:'admin/dict/listSelectItem?dictCode=latitude'}"></select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">经度</label>
        <div class="layui-input-block">
            <input type="text" name="longitude" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="longitude" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="longitude" lay-filter="longitude" value="2" title="选项1" checked>
             <input type="radio" name="longitude" lay-filter="longitude" value="3" title="选项2">

             <select name="longitude" lay-verify="required" class="hy-select" lay-filter="longitude" lay-data="{url:'admin/dict/listSelectItem?dictCode=longitude'}"></select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">单位名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="name" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="name" lay-filter="name" value="2" title="选项1" checked>
             <input type="radio" name="name" lay-filter="name" value="3" title="选项2">

             <select name="name" lay-verify="required" class="hy-select" lay-filter="name" lay-data="{url:'admin/dict/listSelectItem?dictCode=name'}"></select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上级单位id</label>
        <div class="layui-input-block">
            <input type="text" name="pid" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="pid" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="pid" lay-filter="pid" value="2" title="选项1" checked>
             <input type="radio" name="pid" lay-filter="pid" value="3" title="选项2">

             <select name="pid" lay-verify="required" class="hy-select" lay-filter="pid" lay-data="{url:'admin/dict/listSelectItem?dictCode=pid'}"></select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">更新时间</label>
        <div class="layui-input-block">
            <input type="text" name="updateTime" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="updateTime" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="updateTime" lay-filter="updateTime" value="2" title="选项1" checked>
             <input type="radio" name="updateTime" lay-filter="updateTime" value="3" title="选项2">

             <select name="updateTime" lay-verify="required" class="hy-select" lay-filter="updateTime" lay-data="{url:'admin/dict/listSelectItem?dictCode=updateTime'}"></select>
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
            saveUrl: 'admin/department/addDepartment',
            afterLoad:function(layFilter){
                //custom init code
            }
        });
    });
</script>
</html>