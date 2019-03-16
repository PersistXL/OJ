<%--
  Created by IntelliJ IDEA.
  User: Persist
  Date: 2018/12/16
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../public/tag.jsp" %>
<%@ include file="../public/module.jsp" %>
<html>
<head>
    <title>注册</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/login.css" media="all">
</head>
<body>
<div class="larry-canvas" id="canvas"></div>
<div class="layui-layout layui-layout-login">
    <h1>
        <strong>在线测评系统-注册</strong>
        <em> System</em>
    </h1>
    <div class="layui-user-icon larry-login">
        <input type="text" placeholder="学号" id="no" required class="login_txtbx"/>
    </div>
    <div class="layui-pwd-icon larry-login">
        <input type="text" placeholder="姓名" id="name" required class="login_txtbx"/>
    </div>
    <div class="layui-user-icon larry-login">
        <input type="text" placeholder="电话" id="phone" required class="login_txtbx"/>
    </div>
    <div class="layui-pwd-icon larry-login">
        <input type="text" placeholder="邮箱" id="email" required class="login_txtbx"/>
    </div>
    <div class="layui-submit larry-login" style="margin-top: 2%">
        <button onclick="register()" class="submit_btn">注册</button>
    </div>
    <div class="layui-login-text">
    </div>
</div>
<script type="text/javascript" src="${baseurl}/public/common/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${baseurl}/public/common/jsplugin/jparticle.jquery.js"></script>
<script type="text/javascript" src="${baseurl}/public/js/login.js"></script>
<script type="text/javascript">
    function register() {
        let no = $("#no").val();
        let name = $("#name").val();
        let phone = $("#phone").val();
        let email = $("#email").val();
        $.ajax({
            url: "${baseurl}/studentClass/studentRegister",
            data: {no: no, name: name,phone:phone, email:email},
            success: function (data) {
                if (data.result) {
                    layer.msg("注册成功");
                    location.href = "${baseurl}/toLogin";
                } else {
                    layer.msg(data.msg);
                }
            }
        });
    }
    //为keyListener方法注册按键事件,设置回车事件
    document.onkeydown=keyListener;
    function keyListener(e){
        // 当按下回车键，执行我们的代码
        if(e.keyCode == 13){
            register();
        }
    }
</script>
</body>
</html>
