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
<div class="layui-fluid">
    <div>
        <ul id="treeDemo" class="ztree fsTree" url="" tableId="fsDatagrid"
            style="height: 300px;overflow: auto;"></ul>
    </div>
    <hr>
    <div class="layui-form-item" style="text-align: center;">
        <button type="button" class="layui-btn layui-btn-normal" id="selectBtn">选择</button>
        <button type="button" onclick="hy.closeCurrentWindow();" class="layui-btn ">关闭</button>
    </div>

</div>
</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/layui.config.js"></script>
<script src="static/ztree/jquery-1.4.4.min.js"></script>
<script src="static/ztree/jquery.ztree.all.js"></script>
<script>
    var tree$ = window.jQuery;
    layui.use(['jquery', 'hyUtil'], function () {
        var $ = layui.$;
        tree$(function () {
            var type = hy.getURLParam('type');
            if (!type) {
                type = 'radio';
            }
            var parentInclude = hy.getURLParam('parentInclude');
            function ajaxDataFilter(treeId, parentNode, responseData) {
                if (responseData) {
                    responseData = responseData.data;
                }
                return responseData;
            }
            var zsetting = {
                async: {
                    enable: true,
                    url: "admin/department/treeDepartment",
                    dataFilter: ajaxDataFilter
                },
                callback: {
                    onAsyncSuccess: zTreeOnAsyncSuccess,
                    onClick: zTreeOnClick
                }
            };
            if (type == 'radio') {
                $.extend(zsetting, {
                    check: {
                        enable: true,
                        chkStyle: "radio",
                        radioType: "all"
                    }
                });
            } else if (type == 'checkbox') {
                $.extend(zsetting, {
                    check: {
                        enable: true,
                        chkboxType: {"Y": "s", "N": "s"}
                    }
                });
            }
            var treeId = "treeDemo";
            tree$.fn.zTree.init(tree$('#' + treeId), zsetting);

            function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
                var zTree = tree$.fn.zTree.getZTreeObj(treeId);
                var allNodes = zTree.getNodes();
                //父节点是否可选
                if (parentInclude == 'false') {
                    tree$.each(zTree.transformToArray(allNodes), function (idx, data) {
                        if (data.isParent) {
                            data.nocheck = true;
                            zTree.updateNode(data);
                        }
                    });
                }
                //展开第一层节点
                $.each(allNodes, function (idx, data) {
                    zTree.expandNode(data);
                });
                //设置默认值
                var defaultData = hy.department.getDefaultData();
                if (defaultData) {
                    if ($.isArray(defaultData)) {
                        $.each(defaultData, function (idx, one) {
                            var node = zTree.getNodeByParam("id", one);
                            if (node) {
//                            zTree.selectNode(node);
                                zTree.checkNode(node);
                            }
                        });
                    } else {
                        var node = zTree.getNodeByParam("id", defaultData);
                        if (node) {
                            zTree.selectNode(node);
                            zTree.checkNode(node);
                        }
                    }
                }
            }

            function zTreeOnClick(event, treeId, treeNode) {
                var zTree = tree$.fn.zTree.getZTreeObj(treeId);
                zTree.checkNode(treeNode);
            }

            $("#selectBtn").click(function () {
                var zTree = tree$.fn.zTree.getZTreeObj(treeId);
                var checkedNodes = zTree.getCheckedNodes();
                if (checkedNodes.length == 0) {
                    hy.msg("请选择单位");
                } else {
                    hy.department.notifySelected(checkedNodes, null, function () {
                        hy.closeCurrentWindow();
                    });

                }
            });

        });
    });


</script>
</html>