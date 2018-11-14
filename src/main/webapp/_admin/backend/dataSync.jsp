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
                    <label class="layui-form-label">类型</label>
                    <div class="layui-input-block" style="width:100px;">
                        <select name="dataType" class="hy-select"
                                lay-data="{url:'admin/dict/listSelectItem?dictCode=syncType',firstEmpty:true,firstEmptyLabel:'全部'}">
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">触发方式</label>
                    <div class="layui-input-block" style="width:100px;">
                        <select name="triggerType" class="hy-select"
                                lay-data="{url:'admin/dict/listSelectItem?dictCode=triggerType',firstEmpty:true,firstEmptyLabel:'全部'}">
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">时间</label>
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
        <script type="text/html" id="tableToolbar">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm layui-btn-normal"
                        lay-data="{url:'_admin/backend/manualTriggerSync.jsp',title:'手动同步',height:250,width:350}"
                        lay-event="dialog">手动同步
                </button>
                <button class="layui-btn layui-btn-sm layui-btn-normal"
                        lay-data="{url:'_admin/backend/configSyncPeriod.jsp',title:'数据同步周期',height:250}" lay-event="dialog">同步周期设置
                </button>
            </div>
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
            toolbar: false,
            tableConfig: {
                url: 'admin/syncHistory/listSyncHistory',
                cols: [[
                    {type: 'numbers', fixed: true},
                    //{checkbox: true, fixed: true},
                    {field: 'id', title: '主键', hide: true},
                    {field: 'createTime', title: '更新时间'},
                    {field: 'triggerType', title: '触发方式'},
                    {field: 'dataType', title: '数据类型'},
                    {field: 'updateCount', title: '更新行数'},
                    {field: 'latestTime', title: '最新时间戳'}
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