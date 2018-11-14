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
        <label class="layui-form-label">编码</label>
        <div class="layui-input-block">
            <input type="text" name="code" required lay-verify="required" autocomplete="off" class="layui-input">

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属表</label>
        <div class="layui-input-block">
            <input type="text" name="tableCode" required lay-verify="required" autocomplete="off" class="layui-input"
                   readonly>
            <input type="hidden" name="tableId" required lay-verify="required" autocomplete="off" class="layui-input"
                   readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input">

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">描述</label>
        <div class="layui-input-block">
            <input type="text" name="description" autocomplete="off" class="layui-input">
            <!--
             <textarea name="description" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">可空</label>
        <div class="layui-input-block">
            <select name="nullableFlag" lay-verify="required" class="hy-select" lay-filter="nullableFlag"
                    lay-data="{url:'admin/dict/listSelectItem?dictCode=yesOrNo'}"></select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否主键</label>
        <div class="layui-input-block">
            <select name="pkFlag" lay-verify="required" class="hy-select" lay-filter="pkFlag"
                    lay-data="{url:'admin/dict/listSelectItem?dictCode=yesOrNo'}"></select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">外键引用id</label>
        <div class="layui-input-block">
            <input type="text" name="fkId"  autocomplete="off" class="layui-input">
            <!--
             <textarea name="fkId" required lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>

             <input type="radio" name="fkId" lay-filter="fkId" value="2" title="选项1" checked>
             <input type="radio" name="fkId" lay-filter="fkId" value="3" title="选项2">

             <select name="fkId" lay-verify="required" class="hy-select" lay-filter="fkId" lay-data="{url:'admin/dict/listSelectItem?dictCode=fkId'}"></select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">默认值</label>
        <div class="layui-input-block">
            <input type="text" name="defVal" autocomplete="off" class="layui-input">
                    </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">数据类型</label>
        <div class="layui-input-block">
            <input type="text" name="dataType"  autocomplete="off" class="layui-input">
            <!--
                          <select name="dataType" lay-verify="required" class="hy-select" lay-filter="dataType" lay-data="{url:'admin/dict/listSelectItem?dictCode=dataType'}"></select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">数据库类型</label>
        <div class="layui-input-block">
            <input type="text" name="dbType" required lay-verify="required" autocomplete="off" class="layui-input">
            <!--
                          <select name="dbType" lay-verify="required" class="hy-select" lay-filter="dbType" lay-data="{url:'admin/dict/listSelectItem?dictCode=dbType'}"></select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类型长度</label>
        <div class="layui-input-block">
            <input type="number" name="typeLength" required lay-verify="required|number" autocomplete="off" class="layui-input">
            <!--
                          <select name="typeLength" lay-verify="required" class="hy-select" lay-filter="typeLength" lay-data="{url:'admin/dict/listSelectItem?dictCode=typeLength'}"></select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类型精度</label>
        <div class="layui-input-block">
            <input type="number" name="typePrecision" required lay-verify="required|number" autocomplete="off" value="0"
                   class="layui-input">
            <!--
            <select name="typePrecision" lay-verify="required" class="hy-select" lay-filter="typePrecision" lay-data="{url:'admin/dict/listSelectItem?dictCode=typePrecision'}"></select>
            -->
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">常量引用id</label>
        <div class="layui-input-block">
            <input type="text" name="constantId"  autocomplete="off" class="layui-input">
            <!--
                          <select name="constantId" lay-verify="required" class="hy-select" lay-filter="constantId" lay-data="{url:'admin/dict/listSelectItem?dictCode=constantId'}"></select>
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
    layui.use(['jquery', 'hyForm', 'form', 'common', 'hyUtil'], function () {
        var $ = layui.$;
        var hyForm = layui.hyForm;
        var form = layui.form;
        hyForm.render({
            loadUrl: null,
            saveUrl: 'admin/tableColumn/addTableColumn',
            afterLoad: function (layFilter) {
                $("input[name=tableCode]").val(hy.getURLParam("tableCode"));
                $("input[name=tableId]").val(hy.getURLParam("tableId"));
            }
        });
    });
</script>
</html>