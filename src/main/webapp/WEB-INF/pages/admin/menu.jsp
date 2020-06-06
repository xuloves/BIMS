<%--
  Created by IntelliJ IDEA.
  User: 今何许
  Date: 2020/5/20
  Time: 14:59
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">图书管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/book/list" target="right">排行榜</a>
                    </dd>
                    <dd>
                        <a href="/lend/lendInfo" target="right">借阅信息</a>
                    </dd>
                    <dd>
                        <a href="/book/books" target="right">图书信息</a>
                    </dd>
                    <dd>
                        <a href="/lend/lend" target="right">图书借阅</a>
                    </dd>
                    <dd>
                        <a href="/lend/return" target="right">图书归还</a>
                    </dd>
                </dl>
            </li>
        </ul>
    </div>
</div>
</body>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/static/myplugs/js/plugs.js">
</script>
<script type="text/javascript">
    //添加编辑弹出层
    function updatePwd(title, id) {
        $.jq_Panel({
            title: title,
            iframeWidth: 500,
            iframeHeight: 300,
            url: "updatePwd.html"
        });
    }
</script>
<script src="/static/js/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
</script>
</html>
