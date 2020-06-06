<%--
  Created by IntelliJ IDEA.
  User: 今何许
  Date: 2020/5/20
  Time: 15:36
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书信息</title>
    <link rel="stylesheet" href="/static/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/static/css/admin.css"/>
    <link rel="stylesheet" href="/static/css/layui.css"/>
</head>
<body>
<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">图书信息</strong><small></small></div>
    </div>

    <hr>

    <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
            <div class="am-btn-toolbar">
                <div class="am-btn-group am-btn-group-xs">
                    <a href="/book/edit">
                        <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增
                        </button>
                    </a>
                </div>
            </div>
        </div>
        <div class="am-u-sm-12 am-u-md-3">

        </div>
        <div class="am-u-sm-12 am-u-md-3">
            <div class="am-input-group am-input-group-sm">
                <span class="am-input-group-btn">
             <button id="delete" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span
                     class="am-icon-trash-o"></span> 删除
                                    </button>
          </span>
            </div>
        </div>
    </div>
    <div class="am-g">
        <div class="am-u-sm-12">
            <form class="am-form">
                <table class="am-table am-table-striped am-table-hover table-main">
                    <thead>
                    <tr>
                        <th class="table-check"><input id="selectAll" type="checkbox"></th>
                        <th class="table-id">ID</th>
                        <th class="table-title">名称</th>
                        <th class="table-type">作者</th>
                        <th class="table-author am-hide-sm-only">出版社</th>
                        <th class="table-type">库存</th>
                        <th class="table-type">是否可借</th>
                        <th class="table-type">借阅次数</th>
                        <th class="table-set">操作</th>
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
                            <td><input type="checkbox" id="box" name="id" value="${book.id}"></td>
                            <td>${book.id}</td>
                            <td>${book.name}</td>
                            <td>${book.author}</td>
                            <td>${book.publicer}</td>
                            <td>${book.inventory}</td>
                            <td><c:choose>
                                <c:when test="${book.inventory>0}">是</c:when>
                                <c:otherwise>否</c:otherwise>
                            </c:choose></td>
                            <td>${book.count}</td>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <a href="/book/edit?id=${book.id}">
                                            <div class="col-sm-offset-4 col-sm-4"><span
                                                    class="am-icon-pencil-square-o"></span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
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
                                <a href="/book/books?page=${page.prePage}">«</a>
                            </li>
                            <li>
                                <a href="#">共${page.pages}页</a>
                            </li>
                            <li>
                                <a href="/book/books?page=${page.nextPage}">»</a>
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
<script src="/static/js/jquery-3.3.1.js"></script>
<script src="/static/js/lay/modules/layer.js"></script>
<script>
    $(function () {
        $("#selectAll").click(function () {
            var istrue = $(this).prop("checked");
            $("input[id='box']:checkbox").prop("checked", istrue);
        });

        $("input[id='box']:checkbox").click(function () {
            var allLength = $("input[id='box']:checkbox").length;
            var checkedLength = $("input[id='box']:checkbox:checked").length;
            if (allLength == checkedLength) {
                $("#selectAll").prop("checked", true);
            } else {
                $("#selectAll").prop("checked", false);
            }
        });

        $("#delete").click(function () {
                idArr = [];
                $(":checkbox[name='id']:checked").each(function () {
                    var id = $(this).val();
                    if (id != "") {
                        idArr.push(id);
                    }
                });
                //为空前台刷新
                if (idArr.length == 0) {
                    $(":checkbox[name='id']:checked").each(function () {
                        $(this).parent().parent().remove();
                    });

                } else {
                    $.ajax({
                        url: "/book/delete.json",
                        type: "post",
                        traditional: "true",
                        dataType: "json",
                        data: {
                            "idArr": idArr
                        },
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
                }
            }
        )
    });
</script>
</html>