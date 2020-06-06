<%--
  Created by IntelliJ IDEA.
  User: 今何许
  Date: 2020/5/21
  Time: 15:15
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书归还</title>
    <link rel="stylesheet" href="/static/css/layui.css">
    <link rel="stylesheet" href="/static/css/bootstrap.css">
</head>
<body>
<form class="layui-form" id="form">
    <div class="layui-form-item">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-block">
            <input type="text"
                   name="id" required lay-verify="required"
                   placeholder="请输入编号"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <br>
        <label class="layui-form-label">图书ID</label>
        <div class="layui-input-block">
            <input type="text"
                   name="bid" required lay-verify="required"
                   placeholder="请输入ID"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <br>
        <label class="layui-form-label">归还人</label>
        <div class="layui-input-block">
            <input type="text"
                   name="lender" required lay-verify="required"
                   placeholder="请输入归还人"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <div class="col-sm-offset-4 col-sm-4"><input type="button" id="isreturn" class="btn btn-success col-sm-4"
                                                             value="归还"></div>
                <div class="col-sm-4">
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    <button id="return" class="layui-btn layui-btn">返回</button>
                </div>
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
    $("#isreturn").click(function () {
        $.ajax({
            type: "post",
            url: "/lend/return.json",
            dataType: "json",
            data: $("#form").serialize(),
            success: function (data) {
                if (data.code == "1") {
                    layer.msg(data.message);
                    setTimeout(function () {
                        window.location.reload();
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