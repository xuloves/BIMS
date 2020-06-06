<%--
  Created by IntelliJ IDEA.
  User: 今何许
  Date: 2020/5/20
  Time: 15:36
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>排行榜</title>
    <link rel="stylesheet" href="/static/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/static/css/admin.css"/>
    <link rel="stylesheet" href="/static/css/layui.css"/>
</head>
<body>
<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">排行榜</strong><small></small></div>
    </div>

    <hr>

    <div class="am-g">
        <div class="am-u-sm-12">
            <form class="am-form">
                <table class="am-table am-table-striped am-table-hover table-main">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>名称</th>
                        <th>作者</th>
                        <th>出版社</th>
                        <th>借阅次数</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${fn:length(books)==0}">
                        <tr>
                            <td colspan="7" style="text-align: center">暂无数据</td>
                        </tr>
                    </c:if>
                    <c:forEach items="${books}" var="book">
                        <tr>
                            <td>${book.id}</td>
                            <td>${book.name}</td>
                            <td>${book.author}</td>
                            <td>${book.publicer}</td>
                            <td>${book.count}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="am-cf">
                    共 ${page.total} 条记录
                    <div class="am-fr">
                        <ul class="am-pagination">
                            <li>
                                <a href="/book/list?page=${page.prePage}">«</a>
                            </li>
                            <li>
                                <a href="#">共${page.pages}页</a>
                            </li>
                            <li>
                                <a href="/book/list?page=${page.nextPage}">»</a>
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