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
        <div class="layui-row">
            <div class="layui-col-xs8">
                <table id="dataTable" lay-filter="dataTable"></table>
                <script type="text/html" id="tableToolbar">
                    <div class="layui-btn-container">
                        <button class="layui-btn layui-btn-sm layui-btn-normal"
                                lay-data="{url:'_admin/sys/addAccount.jsp',height:350,title:'新增用户'}"
                                lay-event="dialog">新增
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
            <div class="layui-col-xs4">
                <fieldset class="layui-elem-field" style="margin-top: 10px;">
                    <div class="layui-field-box">
                        <div>账号（<span id="selectAccount" style="color:red;">未选择</span>）授权情况</div>
                        <div class="layui-col-md12" id="treeDiv" style="padding-bottom: 20px;">
                            <ul id="depTree" class="ztree"
                                style="height: 100%;overflow: auto;border: 1px solid gray;"></ul>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</div>
</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/layui.config.js"></script>
<script src="static/ztree/jquery-1.4.4.min.js"></script>
<script src="static/ztree/jquery.ztree.all.js"></script>
<script>
    var tree$ = window.jQuery;
    var menuTree = null;
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
                    {field: 'depName', title: '单位', width: 200},
                    {field: 'depId', title: '单位编号', hide: true},
                    {field: 'description', title: '描述'},
                    {field: 'roles', title: '拥有角色'},
                    {field: 'enableFlag', title: '启用', width: 70},
                    {field: 'lastLoginIp', title: '最后登录IP', width: 150, hide: true},
                    {field: 'lastLoginTime', title: '最后登录时间', width: 160},
                    {fixed: 'right', title: '操作', toolbar: '#tableRowMenu', width: 255}
                ]]
            },
            rowClickListener: function (obj) {
                $("#selectAccount").text(obj.data.username);
                $.post("admin/permission/listAuthPermission?userId=" + obj.data.id, {}, function (rst) {
//                    console.log(rst);
                    if (rst.code == 0) {
                        menuTree.checkAllNodes(false);
                        $.each(rst.data, function (idx, one) {
                            var node = menuTree.getNodeByParam("id", one.id);
                            if (node) {
//                            zTree.selectNode(node);
                                menuTree.checkNode(node);
                            }
                        });
                    } else {
                        hy.msg("获取授权情况失败");
                    }
                });
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

        var resetTreeHeight = function () {
            var fullHeight = $(window).innerHeight();
            $("#treeDiv").css("height", fullHeight - 199);
        };
        $(window).resize(resetTreeHeight);
        resetTreeHeight();

        tree$(document).ready(function () {
            function ajaxDataFilter(treeId, parentNode, responseData) {
                if (responseData) {
                    responseData = responseData.data;
                }
                return responseData;
            }

            var zTreeOnAsyncSuccess = function (event, treeId, treeNode, msg) {
                var zTree = tree$.fn.zTree.getZTreeObj(treeId);
                zTree.expandAll(true);
            };
            var zTreeOnClick = function (event, treeId, treeNode) {
                $(window).trigger("comm.permissionTreeSelected", arguments);
            };
            var zsetting = {
                check: {
                    enable: true,
                    chkboxType: {"Y": "ps", "N": "ps"}
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
                    onClick: zTreeOnClick,
                    beforeCheck: function () {
                        return false;
                    }
                }
            };
            menuTree = tree$.fn.zTree.init(tree$("#depTree"), zsetting);
        });
    });
</script>
</html>