<%--
  Created by IntelliJ IDEA.
  User: 今何许
  Date: 2020/5/20
  Time: 13:47
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台管理</title>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%--    头部--%>
    <c:import url="header.jsp"></c:import>
    <%--    菜单--%>
    <c:import url="menu.jsp"></c:import>
    <div class="layui-body" style="z-index: 0;">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <iframe src="/book/default" name="right" frameborder="0" width="100%" height="1200"></iframe>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
    </div>
</div>
</body>
</html>