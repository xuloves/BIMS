<%--
  Created by IntelliJ IDEA.
  User: 今何许
  Date: 2020/5/20
  Time: 14:56
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/css/layui.css">
</head>
<body>
<div class="layui-header">
    <div class="layui-logo">图书后台管理</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->

    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="/static/img/admin.gif" class="layui-nav-img"> 管理员
            </a>
            <dl class="layui-nav-child">
                <dd>
                    <a href="">基本资料</a>
                </dd>
                <dd>
                    <a href="">安全设置</a>
                </dd>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="/user/logout">注销</a>
        </li>
    </ul>
</div>
</body>
</html>
