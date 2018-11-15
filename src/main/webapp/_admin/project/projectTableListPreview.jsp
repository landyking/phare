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
    <div class="layui-card-header" id="show-title"></div>
    <div class="layui-card-body " id="show-container">
    </div>
</div>
</body>
<script id="tpl" type="text/html">
    {{#  layui.each(d.tables, function(index, item){ }}
    <fieldset class="layui-elem-field layui-field-title">
        <legend>{{ item.name }} - {{ item.code }}</legend>
        <div class="layui-field-box">
            <span>{{ item.description }}</span>
            <table class="layui-table" lay-size="sm">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col width="150">
                    <col width="100">
                    <col width="100">
                </colgroup>
                <thead>
                <tr>
                    <th>编码</th>
                    <th>名称</th>
                    <th>类型</th>
                    <th>可空</th>
                    <th>主键</th>
                </tr>
                </thead>
                <tbody>
                {{# layui.each(item.columns, function(index, col){ }}
                <tr>
                    <td>{{ col.code }}</td>
                    <td>{{ col.name }}</td>
                    <td>{{ col.dbType + "(" + col.typeLength + ")" }}</td>
                    <td>{{ col.nullableFlag==1?'是':'' }}</td>
                    <td>{{ col.pkFlag==1?'是':'' }}</td>
                </tr>
                {{# }); }}
                </tbody>
            </table>
        </div>
    </fieldset>
    {{#  }); }}
</script>
<script src="static/layui/layui.js"></script>
<script src="static/js/layui.config.js"></script>
<script>
    layui.use(['jquery', "hyUtil", 'laytpl'], function () {
        var $ = layui.$;
        var laytpl = layui.laytpl;
        var projectId = hy.getURLParam("id");
        $.post("admin/project/exportProjectJson", {id: projectId}, function (rst) {
            $("#show-title").text(rst.name + "("+rst.code+") - " + rst.description);
            laytpl($("#tpl").html()).render(rst, function (html) {
                $("#show-container").html(html);
            });
        })
    });
</script>
</html>