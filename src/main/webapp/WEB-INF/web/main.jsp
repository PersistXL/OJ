<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../public/tag.jsp" %>

<html lang="en">
<head>
    <title>高职学生信息管理系统</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <!-- load css -->
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/font_bmgv5kod1961tt9.css">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/main.css" media="all">
</head>
<body>
<div class="larry-grid larry-wrapper">
    <div class="row" id="infoSwitch">
    </div>
    <div class="row shortcut" id="shortcut">
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-2 ">
            <section class="panel clearfix">
                <div class="symbol shortcut-bg1"><i class="larry-icon larry-daishenhe1"
                                                    data-icon="larry-daishenhe1"></i></div>
                <div class="value">
                    <a data-href="html/temp.html">
                        <h1 id="count1">10</h1>
                    </a>
                    <p>待审的文章</p>
                </div>
            </section>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-2 ">
            <section class="panel">
                <div class="symbol shortcut-bg2"><i class="larry-icon larry-fabu2" data-icon="larry-fabu2"></i></div>
                <div class="value">
                    <a data-href="html/temp.html">
                        <h1 id="count2">26</h1>
                    </a>
                    <p>我发布的文章</p>
                </div>
            </section>
        </div>
    </div>
    <!-- 首页信息 -->

</div>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="${baseurl}/public/common/bootstrap/js/bootstrap.min.js"></script>
<%--<script type="text/javascript" src="${baseurl}/public/common/jsplugin/jquery.leoweather.min.js"></script>--%>
<script type="text/javascript" src="${baseurl}/public/common/jsplugin/echarts.min.js"></script>
<!-- 引入当前页面js文件 -->
<script type="text/javascript" src="${baseurl}/public/js/main.js"></script>
</body>
</html>