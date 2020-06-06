<%--
  Created by IntelliJ IDEA.
  User: 今何许
  Date: 2020/5/20
  Time: 21:17
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书编辑</title>
    <link rel="stylesheet" href="/static/css/layui.css">
    <link rel="stylesheet" href="/static/css/bootstrap.css">
</head>
<body>
<form class="layui-form" id="form">
    <div class="layui-form-item">
        <c:choose>
            <c:when test="${empty book.id}">
                <label class="layui-form-label">ID</label>
                <div class="layui-input-block">
                    <input type="text" name="id"
                           value="${book.id}" required lay-verify="required" placeholder="ID"
                           autocomplete="off"
                           class="layui-input">
                </div>
                <br>
            </c:when>
            <c:otherwise>
                <input type="hidden" name="id" value="${book.id}">
            </c:otherwise>
        </c:choose>
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <input type="text"
                   value="${book.name}" name="name" required lay-verify="required"
                   placeholder="请输入名称"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <br>
        <label class="layui-form-label">作者</label>
        <div class="layui-input-block">
            <input type="text"
                   value="${book.author}" name="author" required lay-verify="required"
                   placeholder="请输入作者"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <br>
        <label class="layui-form-label">出版社</label>
        <div class="layui-input-block">
            <input type="text"
                   value="${book.publicer}" name="publicer" required
                   lay-verify="required"
                   placeholder="请输入出版社" autocomplete="off"
                   class="layui-input">
        </div>
        <br>
        <label class="layui-form-label">库存</label>
        <div class="layui-input-block">
            <input type="text"
                   value="${book.inventory}" name="inventory" required
                   lay-verify="required"
                   placeholder="请输入库存" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <div class="col-sm-offset-4 col-sm-4"><input type="button" id="save" class="btn btn-success col-sm-4"
                                                         value="提交"></div>
            <div class="col-sm-4">
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                <button id="return" class="layui-btn layui-btn">返回</button>
            </div>
        </div>
    </div>
</form>
</body>
<script src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/js/lay/modules/layer.js"></script>
<script>
    $("#return").click(function () {
        history.back();
    });
    $("#save").click(function () {
        $.ajax({
            type: "post",
            url: "/book/save.json",
            dataType: "json",
            data: $("#form").serialize(),
            success: function (data) {
                if (data.code == "1") {
                    layer.msg(data.message);
                    setTimeout(function () {
                        window.location.href = "/book/books";
                    }, 1000);
                } else {
                    layer.msg(data.message);
                }
            }, error: function () {
                layer.msg("操作失败");
            }
        });
    });
</script>
</html>
