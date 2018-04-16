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
                console.log(searchInfo);

                $.ajax({
                    url: baseUrl + "sysUser/list",
                    type: "post",
                    data: searchInfo,
                    success: function (data) {
                        console.log(data);
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
                let classedIds = "";
                let floorIds = "";
                let classes = $(".classId");
                let floors = $(".floorId");
                for (let i = 0; i < classes.length; ++i) {
                    if ($(classes[i]).prop("checked")) classedIds += $(classes[i]).val() + ",";
                }
                data += "&classIds=" + classedIds;
                for (let i = 0; i < floors.length; ++i) {
                    if ($(floors[i]).prop("checked")) floorIds += $(floors[i]).val() + ",";
                }
                data += "&floorIds=" + floorIds;
                $.post(baseUrl + "/teacher/add", data, function (data) {
                    layer.msg(data.msg);
                    if (data.msg) {
                        setTimeout("location.reload()", 500);
                    }
                })
            },
        };

        $(function () {
            sysUser.list();
        })
    });
</script>

</body>
</html>