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
    <div class="layui-card-body">
        <div class="layui-row">
            <div class="layui-col-xs8">
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
                    <a class="layui-btn layui-btn-danger layui-btn-xs"
                       lay-data="{url:'admin/role/deleteRole',params:{id:'?'}}"
                       lay-event="ajax">删除</a>
                </script>
            </div>
            <div class="layui-col-xs4">
                <fieldset class="layui-elem-field" style="margin-top: 10px;">
                    <div class="layui-field-box">
                        <div>角色（<span id="selectRole" style="color:red;">未选择</span>）授权情况</div>
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
    var selectRoleId = null;
    var menuTree = null;
    layui.use(['singleTableList', 'layer', 'jquery', 'hyUtil'], function () {
        var $ = layui.$;
        layui.singleTableList.render({
            layFilter: 'dataTable',
            calcHeightOffset: 85,
            tableConfig: {
                url: 'admin/role/listRole',
                cols: [[
//                    {checkbox: true, fixed: true},
                    {type: 'numbers'},
                    {field: 'id', title: 'id', hide: true},
                    {field: 'name', title: '名称'},
                    {field: 'createTime', title: '创建时间', width: 160},
                    {fixed: 'right', title: '操作', toolbar: '#tableRowMenu', width: 120}
                ]]
            },
            rowClickListener: function (obj) {
                $("#selectRole").text(obj.data.name);
                selectRoleId = obj.data.id;
                $.post("admin/permission/listPermission?roleId=" + selectRoleId, {limit: 2000}, function (rst) {
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

        var resetTreeHeight = function () {
            var fullHeight = $(window).innerHeight();
            $("#treeDiv").css("height", fullHeight - 121);
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

            function zTreeOnCheck(event, treeId, treeNode) {
                if (selectRoleId) {
                    var zTree = tree$.fn.zTree.getZTreeObj(treeId);
                    var nodes = zTree.getCheckedNodes(true);
                    var ids = "";
                    $.each(nodes, function (idx, one) {
                        ids += one.id + ",";
                    });
                    $.post("admin/account/grantPermissionListToRole", {
                        roleId: selectRoleId,
                        ids: ids
                    }, function (rst) {
                        if (rst.code == 0) {

                        } else {
                            hy.msg("保存授权信息失败");
                        }
                    });
                }
            }

            var zTreeOnAsyncSuccess = function (event, treeId, treeNode, msg) {
                var zTree = tree$.fn.zTree.getZTreeObj(treeId);
                zTree.expandAll(true);
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
                    onCheck: zTreeOnCheck
                }
            };
            menuTree = tree$.fn.zTree.init(tree$("#depTree"), zsetting);
        });
    });
</script>
</html>