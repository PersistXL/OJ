<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <title>ModuleOne</title>
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <script src="${baseurl}/public/common/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/personal.css" media="all">
</head>
<body>

<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <div class="layui-collapse" lay-filter="test" style="margin-top:20px;">
                <div class="layui-colla-item" id="class_id_test">
                    <h2 class="layui-colla-title">班课A<span class="badge glyphicon glyphicon-bullhorn" style="margin-left: 50px; margin-top: -10px"><p style="color: #ff1631">4</p></span></h2>
                    <div class="layui-colla-content">
                        <div class="layui-form">
                            <table class="layui-table">
                                <colgroup>
                                    <col width="200">
                                    <col width="200">
                                    <col width="200">
                                    <col width="200">
                                    <col width="200">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>测试名称</th>
                                    <th>题目数量</th>
                                    <th>成绩</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>第一章测试题</td>
                                    <td>10</td>
                                    <td>未评分</td>
                                    <td>开放</td>
                                    <td>
                                        <a class="layui-btn  layui-btn-small layui-btn-normal">
                                            <i class="layui-icon">&#xe642;</i> 答题</a>
                                        <a class="layui-btn  layui-btn-small">
                                            <i class="layui-icon">&#xe60a;</i>预览</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="${baseurl}/public/js/layui/layui.js" charset="utf-8"></script>
<script>
    //折叠面板
    layui.use(['element', 'layer'], function(){
        var element = layui.element();
        var layer = layui.layer;
    });
    //动态拼接测试题信息
    $(function () {
        layui.use('form', function () {
            var $ = layui.jquery, form = layui.form();

            //全选
            form.on('checkbox(allChoose)', function (data) {
                var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
                child.each(function (index, item) {
                    item.checked = data.elem.checked;
                });
                form.render('checkbox');
            });
            $.post("${baseurl}/moduleOne/findQuestions", function (data) {
                // console.log(data);
                var _html = "";
                for (var i = 0; i < data.data.length; i++) {
                    _html = "<option value='" + data.data[i].id + "'>" + data.data[i].name + "</option>";
                }
                $("#questions_id").html(_html);
                form.render();
            });
        });
    });
</script>
</body>
</html>
