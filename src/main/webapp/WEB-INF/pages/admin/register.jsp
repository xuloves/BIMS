<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <style type="text/css">
        #myform {
            margin-top: 100px;
            opacity: 0.5;
            text-align: center;
        }

        body {
            background: url("/static/img/background01.jpg");
            background-size: cover;
        }
    </style>
</head>
<body>

<!--<form role="form" class="form-inline">-->
<div id="myform">
    <form role="form" class="form-horizontal" id="form">
        <h1><span style="color: chartreuse">注册个人信息</span></h1>
        <br/><br/><br/>
        <div class="form-group">
            <label class="col-sm-4 control-label"><span style="color: yellow">&nbsp;用户名:</span></label>
            <div class="col-sm-4">
                <input type="text" name="username" class="form-control" placeholder="请输入用户名"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label"><span style="color: yellow">&nbsp;密&nbsp;码:</span></label>
            <div class="col-sm-4">
                <input type="text" name="password" id="password" class="form-control" placeholder="请输入密码"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label"><span style="color: yellow">确认密码:</span></label>
            <div class="col-sm-4">
                <input type="text" name="pwd" id="pwd" class="form-control" placeholder="请确认密码"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-2">
                <input type="button" id="register" class="btn btn-success col-sm-4" value="确定">
            </div>
            <div class="col-sm-2">
                <input type="reset" id="return" class="btn btn-warning col-sm-4" value="取消"/>
            </div>
        </div>
    </form>
</div>
</body>
<script src="/static/js/jquery-3.3.1.js"></script>
<script src="/static/js/lay/modules/layer.js"></script>
<script>
    $(function () {
        $("#return").click(function () {
            history.back();
        });
        $("#register").click(function () {
            var pwd1 = $("#password").val();
            var pwd2 = $("#pwd").val();
            if (pwd1 != pwd2) {
                layer.msg("输入密码不相同");
            } else {
                $.ajax({
                    type: "get",
                    url: "/user/register.json",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: $("#form").serialize(),
                    success: function (data) {
                        if (data.code == "1") {
                            layer.msg(data.message);
                            setTimeout(function () {
                                window.location.href = "/user/login";
                            }, 2000);
                        } else {
                            layer.msg(data.message);
                        }
                    }, error: function () {
                        layer.msg("操作失败");
                    }
                });
            }
        })
    });
</script>
</html>