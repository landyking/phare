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
        <label class="layui-form-label">部门id</label>
        <div class="layui-input-block">
            <input type="text" name="depId" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="depId" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="depId" lay-filter="depId" value="2" title="选项1" checked>
             <input type="radio" name="depId" lay-filter="depId" value="3" title="选项2">

             <select name="depId" lay-verify="required" class="hy-select" lay-filter="depId" lay-data="{url:'admin/dict/listSelectItem?dictCode=depId'}"></select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">主键</label>
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
        <label class="layui-form-label">控制类型</label>
        <div class="layui-input-block">
            <input type="text" name="type" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="type" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="type" lay-filter="type" value="2" title="选项1" checked>
             <input type="radio" name="type" lay-filter="type" value="3" title="选项2">

             <select name="type" lay-verify="required" class="hy-select" lay-filter="type" lay-data="{url:'admin/dict/listSelectItem?dictCode=type'}"></select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户id</label>
        <div class="layui-input-block">
            <input type="text" name="userId" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
             <textarea name="userId" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="userId" lay-filter="userId" value="2" title="选项1" checked>
             <input type="radio" name="userId" lay-filter="userId" value="3" title="选项2">

             <select name="userId" lay-verify="required" class="hy-select" lay-filter="userId" lay-data="{url:'admin/dict/listSelectItem?dictCode=userId'}"></select>
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
            saveUrl: 'admin/departmentControl/addDepartmentControl',
            afterLoad:function(layFilter){
                //custom init code
            }
        });
    });
</script>
</html>