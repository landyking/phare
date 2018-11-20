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
                    <label class="layui-form-label">控制类型</label>
                    <div class="layui-input-block" style="width:100px;">
                        <select name="type" class="hy-select"
                                lay-data="{url:'admin/dict/listSelectItem?dictCode=departmentControlType'}">
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
                        <button class="layui-btn layui-btn-sm layui-btn-warm"
                                lay-event="saveGrant">保存授权
                        </button>
                    </div>
                </script>
            </div>
            <div class="layui-col-xs4">
                <fieldset class="layui-elem-field" style="margin-top: 10px;">
                    <div class="layui-field-box">
                        <div>
                            账号（<span id="selectAccountLabel" style="color:red;">未选择</span>）
                            控制类型（<span id="selectTypeLabel" style="color:red;">未选择</span>）
                            授权情况
                        </div>
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
    var selectUserId = null;
    var selectType = null;
    layui.use(['singleTableList', 'layer', 'jquery'], function () {
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
                    {field: 'description', title: '描述'}
                ]]
            },
            rowClickListener: function (obj) {
                selectUserId = obj.data.id;
                var st = $("select[name=type]");
                selectType = st.val();
                $("#selectAccountLabel").text(obj.data.username);
                $("#selectTypeLabel").text(st.parent().find(".layui-this").text());
                $.post("admin/departmentControl/listDepartmentControl", {
                    type: selectType,
                    userId: selectUserId
                }, function (rst) {
                    if (rst.code == 0) {
                        menuTree.checkAllNodes(false);
                        $.each(rst.data, function (idx, one) {
                            var node = menuTree.getNodeByParam("id", one.depId);
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
                'saveGrant': function (checkStatus, data, obj) {
                    if (selectUserId) {
                        var zTree = menuTree;
                        var nodes = zTree.getCheckedNodes(true);
                        var ids = "";
                        $.each(nodes, function (idx, one) {
                            ids += one.id + ",";
                        });
                        $.post("admin/departmentControl/grantDepartmentControl", {
                            userId: selectUserId,
                            depIds: ids,
                            type: selectType
                        }, function (rst) {
                            if (rst.code == 0) {
                                hy.msg("保存成功");
                            } else {
                                hy.msg("保存信息失败");
                            }
                        });
                    } else {
                        hy.msg("未选择账号");
                    }
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

            function zTreeOnCheck(event, treeId, treeNode) {

            }

            var zTreeOnAsyncSuccess = function (event, treeId, treeNode, msg) {
                var zTree = tree$.fn.zTree.getZTreeObj(treeId);
                zTree.expandAll(true);
            };
            var zsetting = {
                check: {
                    enable: true,
                    chkboxType: {"Y": "ps", "N": "s"}
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
                    onCheck: zTreeOnCheck
                }
            };
            menuTree = tree$.fn.zTree.init(tree$("#depTree"), zsetting);
        });
    });
</script>
</html>