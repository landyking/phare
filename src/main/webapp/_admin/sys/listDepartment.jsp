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
    <link rel="stylesheet" href="static/ztree/zTreeStyle/zTreeStyle.css">
    <style type="text/css">
        .ztree li span.button.switch.level0 {visibility:hidden; width:1px;}
        .ztree li ul.level0 {padding:0; background:none;}
    </style>
</head>
<body>
<div class="layui-row" style="background-color: #ffffff; padding:20px 20px 0px 20px;">
    <div class="layui-col-xs3">
        <fieldset class="layui-elem-field">
            <%--<legend>单位</legend>--%>
            <div class="layui-field-box">
                <div class="layui-col-md12" id="treeDiv" style="padding-bottom: 20px;">
                    <ul id="depTree" class="ztree"
                        style="height: 100%;overflow: auto;"></ul>
                </div>

            </div>
        </fieldset>
    </div>
    <div class="layui-col-xs9">
        <fieldset class="layui-elem-field">
            <%--<legend>单位管理</legend>--%>
            <div class="layui-field-box">
                <div class="layui-form-query">
                    <form class="layui-form" id="filterForm">
                        <div class="" style="margin-left: -35px;">
                            <div class="layui-inline">
                                <label class="layui-form-label">单位名称</label>
                                <div class="layui-input-block">
                                    <input type="text" name="name" placeholder="请输入" autocomplete="off"
                                           class="layui-input">
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
                <div>
                    <table id="dataTable" lay-filter="dataTable"></table>
                    <script type="text/html" id="tableToolbar">
                        <div class="layui-btn-container">
                            <button class="layui-btn layui-btn-sm layui-btn-normal"
                                    lay-data="{url:'_admin/sys/addDepartment.jsp',height:350,title:'新增单位'}"
                                    lay-event="dialog">新增单位
                            </button>
                        </div>
                    </script>
                </div>

            </div>
        </fieldset>
    </div>
</div>

</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/layui.config.js"></script>
<script src="static/ztree/jquery-1.4.4.min.js"></script>
<script src="static/ztree/jquery.ztree.all.js"></script>
<script>
    var tree$ = window.jQuery;
    layui.use(['singleTableList', 'jquery', 'hyUtil'], function () {
        var $ = layui.$;
        var depTable = null;
        var renderTableByPid = function (pid) {
            if (depTable == null) {
                depTable = layui.singleTableList.render({
                    layFilter: 'dataTable',
                    calcHeightOffset: 170,
                    tableConfig: {
                        url: 'admin/department/listDepartment?pid=' + pid,
                        cols: [[
                            {type: 'numbers', fixed: true},
                            //{checkbox: true, fixed: true},
                            {field: 'name', title: '单位名称'},
                            {field: 'id', title: '单位编号'},
                            {field: 'address', title: '单位地址'},
                            {field: 'createTime', title: '创建时间',hide:true},
                            {field: 'description', title: '描述',hide:true},
//                            {field: 'latitude', title: '纬度'},
//                            {field: 'longitude', title: '经度'},
                            {field: 'pname', title: '上级单位'},
                            {field: 'updateTime', title: '更新时间'},
                            {fixed: 'right', title: '操作', toolbar: '#tableRowMenu', width: 130}
                        ]],
                        done: function () {
//                    console.log("#############");
                        }
                    },
                    toolbarListener: {},
                    rowMenuListener: {}
                });
            } else {
                depTable.reload({
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    url: 'admin/department/listDepartment?pid=' + pid
                })
            }
        };
        $(window).on("comm.depTreeSelected", function (evt, oevt, tid, node) {
            renderTableByPid(node.id);
        });

        var resetTreeHeight = function () {
            var fullHeight = $(window).innerHeight();
            $("#treeDiv").css("height", fullHeight - 102);
        };
        $(window).resize(resetTreeHeight);
        resetTreeHeight();

        tree$(document).ready(function () {
            var expandFlag = false;

            function ajaxDataFilter(treeId, parentNode, responseData) {
                if (responseData) {
                    responseData = {
                        id:"0",
                        name:"单位树",
                        iconOpen:"static/ztree/zTreeStyle/img/diy/1_open.png",
                        iconClose:"static/ztree/zTreeStyle/img/diy/1_close.png",
                        children:responseData.data
                    };
                }
                return responseData;
            }

            var zTreeOnAsyncSuccess = function (event, treeId, treeNode, msg) {
                if (!expandFlag) {
                    expandFlag = true;
                    var zTree = tree$.fn.zTree.getZTreeObj(treeId);
                    var rootList = zTree.getNodes()[0].children;
                    //console.log(rootList);
                    $.each(rootList, function (idx, data) {
                        zTree.expandNode(data);
                    });
                }

                zTree.selectNode(rootList[0]);
                zTreeOnClick(null, treeId, rootList[0]);
            };
            var zTreeOnClick = function (event, treeId, treeNode) {
                $(window).trigger("comm.depTreeSelected", arguments);
            };
            var zsetting = {
                view: {
                    dblClickExpand: function (treeId, treeNode) {
                        return treeNode.level > 0;
                    }
                },
                async: {
                    autoParam: ["id=pid"],
                    enable: true,
                    url: "admin/department/treeDepartment",
                    dataFilter: ajaxDataFilter
                },
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "id",
                        pIdKey: "pid"
                        //rootPId: '0'
                    }
                },
                callback: {
                    onAsyncSuccess: zTreeOnAsyncSuccess,
                    onClick: zTreeOnClick
                }
            };
            tree$.fn.zTree.init(tree$("#depTree"), zsetting);
        });
    });


</script>
</html>