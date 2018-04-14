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
                alert(123);

                // searchInfo = {
                //     currentIndex: currentIndex,
                //     pageSize: pageSize
                // };
                // console.log(searchInfo);
                //
                // $.ajax({
                //     url: baseUrl + "sysUser/add",
                //     type: "post",
                //     data: searchInfo,
                //     success: function (data) {
                //         currentIndex = data.page.currentIndex;
                //         totalSize = data.page.totalSize;
                //         sysUser.page();
                //     }
                // });
            }
        };

    });

    $(function () {
        sysUser.list();
    })
</script>

</body>
</html>