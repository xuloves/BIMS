<%--
  Created by IntelliJ IDEA.
  User: 今何许
  Date: 2020/5/21
  Time: 19:29
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>借阅信息</title>
    <link rel="stylesheet" href="/static/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/static/css/admin.css"/>
    <link rel="stylesheet" href="/static/css/layui.css"/>
</head>
<body>
<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">借阅信息</strong><small></small></div>
    </div>

    <hr>

    <div class="am-g">
        <div class="am-u-sm-12">
            <form class="am-form">
                <table class="am-table am-table-striped am-table-hover table-main">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>图书ID</th>
                        <th>名称</th>
                        <th>借阅人</th>
                        <th>借阅时间</th>
                        <th>归还时间</th>
                        <th>是否归还</th>
                        <th>超时</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${fn:length(list)==0}">
                        <tr>
                            <td colspan="7" style="text-align: center">暂无数据</td>
                        </tr>
                    </c:if>
                    <c:forEach items="${list}" var="l">
                        <tr>
                            <td>${l.id}</td>
                            <td>${l.bid}</td>
                            <td>${l.name}</td>
                            <td>${l.lender}</td>
                            <td>${l.ltime}</td>
                            <td>${l.rtime}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${l.lend==1}">是</c:when>
                                    <c:otherwise>否</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${time>l.rtime}">是</c:when>
                                    <c:otherwise>否</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="am-cf">
                    共 ${page.total} 条记录
                    <div class="am-fr">
                        <ul class="am-pagination">
                            <li>
                                <a href="/lend/lendInfo?page=${page.prePage}">«</a>
                            </li>
                            <li>
                                <a href="#">共${page.pages}页</a>
                            </li>
                            <li>
                                <a href="/lend/lendInfo?page=${page.nextPage}">»</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <hr>
            </form>
        </div>
    </div>
</div>
</body>
</html>