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
    <div class="layui-card-header layuiadmin-card-header-auto">
        <form class="layui-form" id="filterForm">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">参数编码</label>
                    <div class="layui-input-block">
                        <input type="text" name="code" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">参数描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="description" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <button class="layui-btn" lay-submit lay-filter="searchExec">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <button class="layui-btn layui-btn-normal" lay-filter="searchReset">
                        <i class="layui-icon layui-icon-refresh-3"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>
    <div class="layui-card-body">
        <table id="dataTable" lay-filter="dataTable"></table>
        <script type="text/html" id="tableToolbar">

        </script>
        <script type="text/html" id="tableRowMenu">
            <a class="layui-btn layui-btn-xs" lay-event="dialog"
               lay-data="{url:'_admin/sys/updateParam.jsp',params:{id:'?'},height:410,title:'编辑参数信息'}">编辑</a>
        </script>
    </div>
</div>
</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/layui.config.js"></script>

<script>
    layui.use(['singleTableList'], function () {
        layui.singleTableList.render({
            layFilter: 'dataTable',
            tableConfig: {
                url: 'admin/param/listParam',
                toolbar: false,
                cols: [[
                    {field: 'id', title: 'id', hide: true},
                    {field: 'description', title: '参数描述', width: 200},
                    {field: 'code', title: '参数编码', width: 220},
                    {field: 'content', title: '参数内容', minWidth: 200},
                    {field: 'deleteFlag', title: '删除标记', hide: true},
                    {field: 'createTime', title: '创建时间', width: 160},
                    {field: 'updateTime', title: '更新时间', width: 160},
                    {fixed: 'right', title: '操作', toolbar: '#tableRowMenu', width: 80}
                ]]
            },
            toolbarListener: {
                'add': function (checkStatus, data, obj) {
                    layer.msg('添加');
                },
                'edit': function (checkStatus, data, obj) {
                    if (data.length === 0) {
                        layer.msg('请选择一行');
                    } else if (data.length > 1) {
                        layer.msg('只能同时编辑一个');
                    } else {
                        layer.alert('编辑 [id]：' + checkStatus.data[0].id);
                    }
                }
            },
            rowMenuListener: {
                'detail': function (row, obj) {
                },
                'edit': function (row, obj) {
                    layer.msg('编辑操作');
                }
            }
        });
    });
</script>
</html>