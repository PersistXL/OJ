<%--
  Created by IntelliJ IDEA.
  User: mlw
  Date: 18-4-13
  Time: 下午2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
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
            <blockquote class="layui-elem-quote mylog-info-tit" style="height: 70px" ;>
                <ul class="layui-tab-title">
                    <li class="layui-btn " onclick="sysUser.add()"><i class="layui-icon">&#xe61f;</i>添加教师
                    </li>
                </ul>
            </blockquote>
            <div class="larry-separate"></div>

            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <div class="layui-form ">
                    <table id="example" class="layui-table lay-even " data-name="articleCatData">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>工号</th>
                            <th>名字</th>
                            <th>性别</th>
                            <th>邮箱</th>
                            <th>电话</th>
                            <th>所属类别</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="list">
                        </tbody>
                    </table>
                </div>
                <div id="demo1"></div>
            </div>
        </div>
    </div>
</section>


<%@include file="layer.jsp" %>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script>
    let sysUser;
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    let searchInfo;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        sysUser = {
            page: function () {
                layui.laypage({
                    cont: 'demo1',
                    pages: totalSize, //总页数
                    curr: currentIndex,
                    last: totalSize,
                    groups: 5,//连续显示分页数
                    skin: '#1E9FFF',
                    jump: function (obj, first) {
                        currentIndex = obj.curr;
                        if (!first) {
                            sysUser.list();
                        }
                    }
                });
            },
            list: function () {
                searchInfo = {
                    currentIndex: currentIndex,
                    pageSize: pageSize
                };

                $.ajax({
                    url: baseUrl + "sysUser/list",
                    type: "post",
                    data: searchInfo,
                    success: function (data) {
                        currentIndex = data.currentIndex;
                        totalSize = data.totalSize;
                        sysUser.page();
                        laytpl($("#list-tpl").text()).render(data.data, function (html) {
                            $("#list").html(html);
                        });
                        form.render();
                    }
                });
            },
            add: function () {
                layer.open({
                    type: 1,
                    title: '添加',
                    area: ["50%", "80%"]
                    , content: $("#add")
                });
            },
            addAjax: function () {
                let data = $("#add-form").serialize();

                $.post(baseUrl + "/sysUser/add", data, function (data) {
                    if (data.msg) {
                        layer.msg(data.msg);
                        setTimeout("location.reload();", 1000);

                    }
                })
            },
            delete: function (phone) {
                layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "/sysUser/delete", {phone: phone}, function (data) {
                        if (data.result) {
                            layer.msg(data.msg);
                            setTimeout("location.reload();", 500);
                        }
                    })
                });
            },
            update: function (id,no,name,gender,email,phone,department) {

                $("#update-id").val(id);
                $("#no-update").val(no);
                $("#name-update").val(name);
                $("input:radio[value=" + gender + "]").prop('checked', 'true');
                $("#no-update").val(no);
                $("#phone-update").val(phone);
                $("#email-update").val(email);
                $("#dept-update").val(department);
                form.render();

                layer.open({
                    type: 1,
                    title: '添加',
                    area: ["50%", "80%"]
                    , content: $("#update")
                });
            },
            updateAjax: function () {
                let data = $("#update-form").serialize();
                $.post(baseUrl + "/sysUser/update", data, function (data) {
                    if (data.msg) {
                        layer.msg(data.msg);
                        setTimeout("location.reload();", 1000);

                    }
                })
            }
        };

        $(function () {
            sysUser.list();
        })
    });
</script>

</body>
</html>