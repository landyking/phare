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
                    <label class="layui-form-label">编码</label>
                    <div class="layui-input-block">
                        <input type="text" name="code" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">描述</label>
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
            <%--<div class="layui-btn-container">
                <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="dialog"
                   lay-data="{url:'_admin/sys/addDict.jsp',title:'新增字典信息',height:250}">新增</a>
            </div>--%>
        </script>
        <script type="text/html" id="tableRowMenu">
            <a class="layui-btn layui-btn-xs" lay-event="dialog"
               lay-data="{url:'_admin/sys/updateDict.jsp',params:{id:'?'},title:'编辑字典信息',height:300}">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="dialog"
               lay-data="{url:'_admin/sys/dictItemManage.jsp',params:{id:'?'},title:'编辑字典信息',width:800,height:700}">字典项管理</a>
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
                url: 'admin/dict/listDict',
                cols: [[
                    {field: 'id', title: 'id', hide: true},
                    {field: 'description', title: '字典描述', minWidth: 200},
                    {field: 'code', title: '字典编码', minWidth: 200},
                    {field: 'itemCount', title: '项数量', minWidth: 100},
                    {field: 'deleteFlag', title: '删除标记', hide: true},
                    {field: 'createTime', title: '创建时间', width: 160},
                    {field: 'updateTime', title: '更新时间', width: 160},
                    {fixed: 'right', title: '操作', toolbar: '#tableRowMenu', width: 150}
                ]]
            },
            toolbarListener: {
                'add': function (checkStatus, data, obj) {
                    layer.msg('添加');
                }
            },
            rowMenuListener: {
                'edit': function (row, obj) {
                    layer.msg('编辑操作');
                }
            }
        });
    });
</script>
</html>