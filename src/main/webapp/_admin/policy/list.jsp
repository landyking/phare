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
                    <label class="layui-form-label" style="width:85px;">设备编号</label>
                    <div class="layui-input-block" style="margin-left:115px;">
                        <input type="text" name="devNo" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label" style="width:85px;">设备名称</label>
                    <div class="layui-input-block" style="margin-left:115px;">
                        <input type="text" name="name" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label" style="width:85px;">目的地址</label>
                    <div class="layui-input-block" style="margin-left:115px;">
                        <input type="text" name="dip" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label" style="width:85px;">目的端口</label>
                    <div class="layui-input-block" style="margin-left:115px;">
                        <input type="text" name="dport" placeholder="请输入" autocomplete="off" class="layui-input">
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
    layui.use(['singleTableList', 'layer'], function () {
        layui.singleTableList.render({
            layFilter: 'dataTable',
            tableConfig: {
                url: 'admin/deviceCapturePolicy/listDeviceCapturePolicy',
                cols: [[
                    {type: 'numbers', fixed: true},
                    //{checkbox: true, fixed: true},
                    {field: 'id', title: '主键', hide: true},
                    {field: 'deviceId', title: '设备主键', hide: true},
                    {field: 'devNo', title: '设备编号'},
                    {field: 'name', title: '设备名称'},
                    {field: 'protocol', title: '协议类型'},
                    {field: 'sip', title: '源地址'},
                    {field: 'dip', title: '目的地址'},
                    {field: 'sport', title: '源端口'},
                    {field: 'dport', title: '目的端口'},
                    {field: 'deleteFlag', title: '删除？'},
                    {field: 'createTime', title: '创建时间'},
                    {field: 'updateTime', title: '更新时间'}
                ]]
            }
        });
    });
</script>
</html>