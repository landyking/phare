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
        .ztree li span.button.switch.level0 {
            visibility: hidden;
            width: 1px;
        }

        .ztree li ul.level0 {
            padding: 0;
            background: none;
        }
    </style>
</head>
<body>
<div class="layui-row" style="background-color: #ffffff; padding:20px 20px 0px 20px;">
    <div class="layui-col-xs2">
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
    <div class="layui-col-xs10">
        <fieldset class="layui-elem-field">
            <%--<legend>单位管理</legend>--%>
            <div class="layui-field-box">
                <div class="layui-form-query">
                    <form class="layui-form" id="filterForm">
                        <div class="" style="margin-left: -55px;">
                            <div class="layui-inline">
                                <label class="layui-form-label">名称</label>
                                <div class="layui-input-block">
                                    <input type="text" name="name" placeholder="请输入" autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">启用</label>
                                <div class="layui-input-block" style="width:80px;">
                                    <select name="useFlag" class="hy-select"
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
                <div>
                    <table id="dataTable" lay-filter="dataTable"></table>
                    <script type="text/html" id="tableRowMenu">
                        <a class="layui-btn layui-btn-xs" lay-event="dialog"
                           lay-data="{url:'_admin/sys/updatePermission.jsp',params:{id:'?'},title:'编辑权限信息',width:500,height:615}">编辑</a>
                        <a class="layui-btn  layui-btn-xs layui-btn-normal"
                           lay-data="{url:'_admin/sys/grantPermissionToRole.jsp',params:{id:'?'},title:'编辑权限信息',width:500,height:510}"
                           lay-event="dialog">授予角色</a>
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
    window.pdep = {};
    layui.use(['singleTableList', 'jquery', 'hyUtil'], function () {
        var $ = layui.$;
        var depTable = null;
        var renderTableByPid = function (pid) {
            if (depTable == null) {
                depTable = layui.singleTableList.render({
                    layFilter: 'dataTable',
                    calcHeightOffset: 150,
                    tableConfig: {
                        toolbar:false,
                        url: 'admin/permission/listPermission?pid=' + pid,
                        cols: [[
                            {type: 'numbers'},
                            {field: 'id', title: '编码', width: 100},
                            {field: 'type', title: '类型', width: 100},
                            {
                                field: 'ico', title: '图标', width: 60, templet: function (data) {
                                return '<i class="layui-icon ' + data.ico + '"></i>';
                            }
                            },
                            {field: 'name', title: '名称', width: 200},
                            {field: 'url', title: 'url'},
                            {field: 'pid', title: '父编码', width: 100},
                            {field: 'useFlag', title: '启用', width: 80},
                            {field: 'orderFlag', title: '排序', width: 80},
                            {field: 'createTime', title: '创建时间', hide: true},
                            {fixed: 'right', title: '操作', toolbar: '#tableRowMenu', width: 150}
                        ]]
                    },
                    toolbarListener: {},
                    rowMenuListener: {}
                });
            } else {
                depTable.reload({
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    url: 'admin/permission/listPermission?pid=' + pid
                })
            }
        };
        $(window).on("comm.permissionTreeSelected", function (evt, oevt, tid, node) {
            var pid = node.id;
            var pname = node.name;
            window.pdep = {pid: pid, pname: encodeURI(pname)};
            renderTableByPid(pid);
        });

        var resetTreeHeight = function () {
            var fullHeight = $(window).innerHeight();
            $("#treeDiv").css("height", fullHeight - 82);
        };
        $(window).resize(resetTreeHeight);
        resetTreeHeight();

        tree$(document).ready(function () {
            var expandFlag = false;

            function ajaxDataFilter(treeId, parentNode, responseData) {
                if (responseData) {
                    responseData = {
                        id: "0",
                        name: "菜单树",
                        iconOpen: "static/ztree/zTreeStyle/img/diy/1_open.png",
                        iconClose: "static/ztree/zTreeStyle/img/diy/1_close.png",
                        children: responseData.data
                    };
                }
                return responseData;
            }

            var zTreeOnAsyncSuccess = function (event, treeId, treeNode, msg) {
                if (!expandFlag) {
                    expandFlag = true;
                    var zTree = tree$.fn.zTree.getZTreeObj(treeId);
                    var rootList = zTree.getNodes();
                    //console.log(rootList);
                    $.each(rootList, function (idx, data) {
                        zTree.expandNode(data);
                    });
                }

                zTree.selectNode(rootList[0]);
                zTreeOnClick(null, treeId, rootList[0]);
            };
            var zTreeOnClick = function (event, treeId, treeNode) {
                $(window).trigger("comm.permissionTreeSelected", arguments);
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
                    url: "admin/permission/treePermission",
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