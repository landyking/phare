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
<div class="layui-card" style="height: 98%;">
    <div class=" layui-card-header layuiadmin-card-header-auto">
        <div class="layui-form-item">
            <div class="layui-inline">
                <button class="layui-btn layui-btn-sm">
                    新增
                </button>
                <button class="layui-btn layui-btn-sm layui-btn-warm">
                    编辑
                </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger">
                    删除
                </button>
                <button class="layui-btn layui-btn-sm layui-btn-normal">
                    刷新
                </button>
            </div>
        </div>
    </div>
    <div class="layui-card-body" >
        <ul id="tree" class="ztree" style=" overflow:auto;"></ul>
    </div>
</div>
</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/layui.config.js"></script>
<script src="static/ztree/jquery-1.4.4.min.js"></script>
<script src="static/ztree/jquery.ztree.all.js"></script>
<script>
    var zTreeObj,
        setting = {
            view: {
                selectedMulti: false
            }
        },
        zTreeNodes = [
            {"name":"网站导航", open:true, children: [
                { "name":"google", "url":"http://g.cn", "target":"_blank"},
                { "name":"baidu", "url":"http://baidu.com", "target":"_blank"},
                { "name":"sina", "url":"http://www.sina.com.cn", "target":"_blank"}
            ]
            }
        ];

    $(document).ready(function(){
        zTreeObj = $.fn.zTree.init($("#tree"), setting, zTreeNodes);

    });
</script>
</html>