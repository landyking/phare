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
                    <label class="layui-form-label">描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="description" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">类型</label>
                    <div class="layui-input-block">
                        <select name="type" class="hy-select"
                                lay-data="{url:'admin/dict/listSelectItem?dictCode=operateLogType',firstEmpty:true,firstEmptyLabel:'全部'}">
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">发生时间</label>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input type="text" name="dateMin" autocomplete="off" class="layui-input hy-calendar">
                    </div>
                    <div class="layui-form-mid">-</div>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input type="text" name="dateMax" autocomplete="off" class="layui-input hy-calendar">
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
                url: 'admin/operateLog/listOperateLog',
                toolbar: false,
                cols: [[
                    {field: 'createTime', title: '创建时间', width: 160},
                    {field: 'username', title: '操作人', width: 100},
                    {field: 'type', title: '类型', width: 130},
                    {field: 'id', title: 'id', hide: true},
                    {field: 'description', title: '描述'}
                ]]
            },
            toolbarListener: {},
            rowMenuListener: {}
        });
    });
</script>
</html>