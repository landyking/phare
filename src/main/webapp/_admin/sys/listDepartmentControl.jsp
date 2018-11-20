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
</head>
<body>
<div class="layui-card">
    <div class=" layui-card-header layuiadmin-card-header-auto">
        <form class="layui-form" id="filterForm">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label" style="width:85px;">筛选项</label>
                    <div class="layui-input-block" style="margin-left:115px;">
                        <input type="text" name="description" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">筛选项2</label>
                    <div class="layui-input-block" style="width:100px;">
                        <select name="auditState" class="hy-select"
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
                <button class="layui-btn layui-btn-sm layui-btn-normal" lay-data="{url:'_admin/departmentControl/addDepartmentControl.jsp'}" lay-event="dialog">新增</button>
                <button class="layui-btn layui-btn-danger layui-btn-sm" lay-data="{url:'admin/departmentControl/deleteDepartmentControl',params:{id:'?'}" lay-event="ajax">删除</button>
                <button class="layui-btn layui-btn-sm"  lay-event="test1">test1</button>
            </div>
        </script>
        <script type="text/html" id="tableRowMenu">
            <a class="layui-btn layui-btn-xs" lay-event="dialog" lay-data="{url:'_admin/departmentControl/updateDepartmentControl.jsp',params:{id:'?'}}">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-data="{url:'admin/departmentControl/deleteDepartmentControl',params:{id:'?'}}" lay-event="ajax">删除</a>
            <a class="layui-btn  layui-btn-xs" lay-event="test2">test2</a>
        </script>
    </div>
</div>
</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/layui.config.js"></script>
<script>
    layui.use(['singleTableList','layer'], function () {
        layui.singleTableList.render({
            layFilter: 'dataTable',
            tableConfig: {
                url: 'admin/departmentControl/listDepartmentControl',
                cols: [[
                    //{type: 'numbers', fixed: true},
                    //{checkbox: true, fixed: true},
                    {field:'createTime',title:'创建时间' },
                    {field:'depId',title:'部门id' },
                    {field:'id',title:'主键' },
                    {field:'type',title:'控制类型' },
                    {field:'userId',title:'用户id' },
                    {fixed: 'right', title: '操作', toolbar: '#tableRowMenu', width: 130}
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