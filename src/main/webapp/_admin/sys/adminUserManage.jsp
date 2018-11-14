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
    <div class=" layui-card-header layuiadmin-card-header-auto">
        <form class="layui-form" id="filterForm">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label" style="width:85px;">账号</label>
                    <div class="layui-input-block" style="margin-left:115px;">
                        <input type="text" name="username" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label" style="width:85px;">描述</label>
                    <div class="layui-input-block" style="margin-left:115px;">
                        <input type="text" name="description" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">启用</label>
                    <div class="layui-input-block" style="width:100px;">
                        <select name="enableFlag" class="hy-select"
                                lay-data="{url:'admin/dict/listSelectItem?dictCode=yesOrNo',firstEmpty:true,firstEmptyLabel:'全部'}">
                        </select>
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
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm layui-btn-normal"
                        lay-data="{url:'_admin/sys/addAccount.jsp',height:350,title:'新增用户'}" lay-event="dialog">新增
                </button>
            </div>
        </script>
        <script type="text/html" id="tableRowMenu">
            <a class="layui-btn layui-btn-xs" lay-event="dialog"
               lay-data="{url:'_admin/sys/updateAccount.jsp',params:{id:'?'},height:410,title:'编辑用户信息'}">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs"
               lay-data="{url:'admin/account/deleteAccount',params:{id:'?'}}" lay-event="ajax">删除</a>
            <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="changePass">修改密码</a>
            <a class="layui-btn layui-btn-xs layui-btn-normal"
               lay-data="{url:'_admin/sys/assignRoleToAccount.jsp',params:{id:'?'},title:'分配角色',width:530,height:450}"
               lay-event="dialog">分配角色</a>
        </script>
    </div>
</div>
</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/layui.config.js"></script>
<script>
    layui.use(['singleTableList', 'jquery'], function () {
        var $ = layui.$;
        layui.singleTableList.render({
            layFilter: 'dataTable',
            tableConfig: {
                url: 'admin/account/listAccount',
                cols: [[
                    {type: 'numbers'},
                    {field: 'id', title: 'id', hide: true},
                    {field: 'username', title: '账号', width: 150},
                    {field: 'description', title: '描述'},
                    {field: 'roles', title: '拥有角色'},
                    {field: 'enableFlag', title: '启用', width: 70},
                    {field: 'lastLoginIp', title: '最后登录IP', width: 150, hide: true},
                    {field: 'lastLoginTime', title: '最后登录时间', width: 160},
                    {fixed: 'right', title: '操作', toolbar: '#tableRowMenu', width: 255}
                ]]
            },
            toolbarListener: {},
            rowMenuListener: {
                'changePass': function (row, obj, stable) {
                    layer.prompt({
                        formType: 0,
                        title: '请输入修改后的密码'
                    }, function (value, index, elem) {
                        $.post("admin/account/changePassword", {
                            id: row.id,
                            password: value
                        }, function (rst) {
                            if (rst.code == 0) {
                                layer.close(index);
//                                stable.reload();
                                layer.msg("修改成功");
                            } else {
                                layer.msg("操作失败:" + rst.msg);
                            }
                        });
                    });
                }
            }
        });
    });
</script>
</html>