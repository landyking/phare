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
    <div class="layui-card-body">
        <table id="dataTable" lay-filter="dataTable"></table>
        <script type="text/html" id="tableToolbar">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm layui-btn-normal"
                        lay-data="{url:'_admin/sys/addRole.jsp',title:'新增角色',height:200}"
                        lay-event="dialog">新增
                </button>
            </div>
        </script>
        <script type="text/html" id="permissionListTpl">
            {{#  if(d.permissionCount > 0 ){ }}
            <a class="layui-btn layui-btn-xs" lay-event="dialog"
               lay-data="{url:'_admin/sys/permissionListUnderRole.jsp',params:{id:'?'},width:700,height:600,title:'已授权限列表'}">{{d.permissionCount}}</a>
            {{# }else{ }}
            {{d.permissionCount}}
            {{# } }}
        </script>
        <script type="text/html" id="tableRowMenu">
            <a class="layui-btn layui-btn-xs" lay-event="dialog"
               lay-data="{url:'_admin/sys/updateRole.jsp',params:{id:'?'},height:250,title:'编辑角色'}">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-data="{url:'admin/role/deleteRole',params:{id:'?'}}"
               lay-event="ajax">删除</a>
        </script>
    </div>
</div>
</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/layui.config.js"></script>
<script>
    layui.use(['singleTableList', 'layer'], function () {
        layui.singleTableList.render({
            layFilter: 'dataTable',
            tableConfig: {
                url: 'admin/role/listRole',
                cols: [[
//                    {checkbox: true, fixed: true},
                    {type: 'numbers'},
                    {field: 'id', title: 'id', hide: true},
                    {field: 'name', title: '名称'},
                    {field: 'permissionCount', title: '已授权限数量', width: 120, templet: '#permissionListTpl'},
                    {field: 'createTime', title: '创建时间', width: 160},
                    {fixed: 'right', title: '操作', toolbar: '#tableRowMenu', width: 120}
                ]]
            },
            toolbarListener: {
                'test1': function (checkStatus, data, obj) {
                    layui.layer.msg('test1');
                }
            },
            rowMenuListener: {
                'test2': function (row, obj) {
                    layui.layer.msg('test2');
                }
            }
        });
    });
</script>
</html>