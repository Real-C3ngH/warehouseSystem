<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>仓库管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/main.css">
</head>

<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <header class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">仓库管理系统</div>

        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>
        </ul>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="https://c3ngh-blog.oss-cn-hangzhou.aliyuncs.com/img/C3ngH.jpg" class="layui-nav-img">
                    admin
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="#">仪表盘</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>
    </header>

    <aside class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航 -->
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">仓库管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this">
                            <a onclick="jump2Page('${pageContext.request.contextPath}/jsp/warehouse/dashboard.jsp')">仪表盘</a>
                        </dd>
                        <dd><a onclick="jump2Page('${pageContext.request.contextPath}/jsp/warehouse/info.jsp')">仓库信息</a></dd>
                        <dd><a onclick="jump2Page('${pageContext.request.contextPath}/jsp/warehouse/stock.jsp')">仓库库存</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">供货商管理</a>
                    <dl class="layui-nav-child">
                        <dd><a onclick="jump2Page('${pageContext.request.contextPath}/jsp/supplier/info.jsp')">供货商信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">材料管理</a>
                    <dl class="layui-nav-child">
                        <dd><a onclick="jump2Page('${pageContext.request.contextPath}/jsp/item/info.jsp')">材料信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">材料操作</a>
                    <dl class="layui-nav-child">
                        <dd><a onclick="jump2Page('${pageContext.request.contextPath}/jsp/operation/purchase.jsp')">仓库进货</a></dd>
                        <dd><a onclick="jump2Page('${pageContext.request.contextPath}/jsp/operation/outflow.jsp')">仓库出货</a></dd>
                        <dd><a onclick="jump2Page('${pageContext.request.contextPath}/jsp/operation/dispatch.jsp')">两仓互调</a></dd>
                        <dd><a onclick="jump2Page('${pageContext.request.contextPath}/jsp/operation/history.jsp')">台账历史</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </aside>

    <main class="layui-body">
        <!-- 内容主体区域 -->
        <iframe id="mainContent" width="100%" height="100%" style="background-color: #fefefe;" allowTransparency="true"></iframe>
    </main>

    <footer class="layui-footer">
        <!-- 底部固定区域 -->
        <div style="text-align: center; font-size: 14px;">2025 ©张承浩 计算机科学与技术学院 软件工程2302</div>
    </footer>
</div>

<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/res/js/main.js"></script>
<script>
    layui.use(['element', 'layer', 'util'], () => {
        let element = layui.element, layer = layui.layer, util = layui.util;

        // 弹出信息
        util.event('lay-header-event', {
            menuRight: () => {
                layer.open({
                    type: 1,
                    content: '<div style="padding: 15px;">一个简单的仓库管理系统</div><div style="padding: 15px;">for 软件设计综合训练</div>',
                    area: ['260px', '100%'],
                    offset: 'rt',
                    anim: 1,
                    shadeClose: true,
                    resize: false
                });
            }
        });

        // 禁止回退
        $('#mainContent').on('load', () => {
            history.pushState(null, null, document.URL);
            window.addEventListener('popstate', () => {
                history.pushState(null, null, document.URL);
            });
        });

        // 默认跳转到仪表盘
        jump2Page("${pageContext.request.contextPath}/jsp/warehouse/dashboard.jsp");
    });
</script>

</body>
</html>
