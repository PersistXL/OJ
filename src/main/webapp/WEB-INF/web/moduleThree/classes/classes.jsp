<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>OJ</title>
    <link rel="stylesheet" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/personal.css" media="all">
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <script src="${baseurl}/public/common/layui/layui.js" charset="utf-8"></script>
</head>
<style>
    .hide_title {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
    }

    .hide_title1 {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
        overflow: hidden;
    }

    fieldset {
        margin: 10px 50px;
    }

    .box {
        width: 300px;
        text-align: center;
        font-szie: 18px;
    }
</style>
<body>
<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <form id="update-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
                <blockquote class="layui-elem-quote mylog-info-tit" style="height: 70px;">
                    <div class="layui-input-inline">
                        <div class="layui-inline">
                            <shiro:hasPermission name="moduleThree:update">
                                <a class="layui-btn" onclick="_subject.creatClasses()"><i
                                        class="layui-icon">&#xe621;</i>创建班课</a>
                            </shiro:hasPermission>
                        </div>
                    </div>

                </blockquote>
            </form>

            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">

                <div class="layui-form">
                    <table class="layui-table">
                        <colgroup>
                            <col width="60">
                        </colgroup>

                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>班课名称</th>
                            <th>创建时间</th>
                            <th>班课口令</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="subject_info">

                        </tbody>
                    </table>
                </div>
                <div id="demo7"></div>
            </div>
            <div id="demo1"></div>
        </div>
    </div>
</section>
<div id="creatClasses" style="display: none;width: auto; margin-top: 20px;">
    <div>
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">班课名称：</label>
                <div class="layui-input-inline">
                    <input name="className" required lay-verify="required" placeholder="请输入班课名称" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">班课口令：</label>
                <div class="layui-input-inline">
                    <input name="code" id="code" readonly lay-verify="required" autocomplete="off"
                           class="layui-input"><span style="color: gainsboro;">班课口令自动生成</span>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <div class="layui-input-inline">
                    <button class="layui-btn" onclick="_subject.addClassInfo()">立即提交
                    </button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
    </div>
</div>
<div id="previewClassesInfo" style="display: none;width: auto; margin-top: 20px;">
    <div class="layui-form">
        <table class="layui-table">
            <colgroup>
                <col width="60">
            </colgroup>

            <thead>
            <tr>
                <th>编号</th>
                <th>学生姓名</th>
                <th>学生账号</th>
                <th>性别</th>
                <th>手机号</th>
            </tr>
            </thead>
            <tbody id="previewClasses">

            </tbody>
        </table>
    </div>
</div>
</body>
<script type="text/javascript">
    let _subject;
    let totalSize = 5;
    let currentIndex = 1;
    let pageSize = 10;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        let element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;
        _subject = {
            page: function () {
                $.post("${baseurl}/Testpaper/selectClasses", function (data) {
                    console.log(data)
                    let _html = "";
                    for (let i = 0; i < data.data.length; i++) {
                        _html += `<tr>
                            <td>` + (i + 1) + `</td>
                            <td ><span class = "hide_title">` + data.data[i].name + `</span></td>
                            <td><span class = "hide_title">` + data.data[i].time + `</span></td>
                            <td><span class = "hide_title">` + data.data[i].code + `</span></td>
                            <td>

                                <div class="layui-btn-group">
                                        <shiro:hasPermission name="createClass:delete" >
                                        <a class="layui-btn layui-btn-mini" onclick="_subject.deleteClassesInfo(` + data.data[i].id + `)">
                                            <i class="layui-icon">&#xe640;</i>
                                            删除
                                        </a>
                                        </shiro:hasPermission>
                                    <a class="layui-btn layui-btn-mini" onclick="_subject.selectClassesByIdToStudents(` + data.data[i].id + `)">
                                        <i class="layui-icon">&#xe602;</i>
                                        学生信息
                                    </a>
                                </div>
                            </td>
                        </tr>`;
                    }
                    $("#subject_info").html(_html);
                    form.render();
                });
            },
            paging: function () {
                layui.laypage({
                    cont: 'demo1',
                    pages: totalSize, //总页数
                    last: totalSize,
                    curr: currentIndex,
                    groups: 5,//连续显示分页数
                    skin: '#1E9FFF',
                    jump: function (obj, first) {
                        currentIndex = obj.curr;
                        if (!first) {
                            _subject.page();
                        }
                    }
                });
            },
            addＥxcel: function () {
                layer.open({
                    type: 1,
                    title: 'Ｅxcel录入题目',
                    area: ['100%', '100%'],
                    skin: 'yourclass',
                    content: $('#addＥxcel')
                });
            },
            creatClasses: function () {
                var num = "";
                for (var i = 0; i < 6; i++) {
                    num += Math.floor(Math.random() * 10);
                }
                $("#code").val(num)
                layer.open({
                    type: 1,
                    title: '创建班课',
                    area: ['100%', '100%'],
                    skin: 'yourclass',
                    content: $('#creatClasses')
                });
            },
            deleteClassesInfo: function (id) {
                layer.confirm('删除班课将丢失班课中的学生信息！是否删除？', function (index) {
                    $.post("${baseurl}/Testpaper/deleteClassByTeacherId", {id: id}, function (data) {
                        layer.msg(data.msg);
                        location.reload();
                    });
                    layer.close(index);
                });
            },
            selectClassesByIdToStudents: function (id) {
                $.post("${baseurl}/Testpaper/selectClassesByIdToStudents", {id: id}, function (data) {
                    let _html = "";
                    for (let i = 0; i < data.data.length; i++) {
                        _html += `<tr>
                            <td>` + (i + 1) + `</td>
                            <td ><span class = "hide_title">` + data.data[i].name + `</span></td>
                            <td><span class = "hide_title">` + data.data[i].no + `</span></td>
                            <td><span class = "hide_title">` + data.data[i].gender + `</span></td>
                            <td><span class = "hide_title">` + (data.data[i].phone=== undefined ?"暂无":data.data[i].phone) + `</span></td>
                        </tr>`;
                    }
                    $("#previewClasses").html(_html);
                    layer.open({
                        type: 1,
                        title: '试题预览',
                        area: ['100%', '100%'],
                        skin: 'yourclass',
                        content: $('#previewClassesInfo')
                    });
                });
            },
            addClassInfo: function () {
                let name = $("input[name='className']").val();
                let code = $("input[name='code']").val();
                $.post("${baseurl}/Testpaper/addClasses", {
                    name: name,
                    code: code
                }, function (data) {
                    layer.msg(data.msg);
                });

            }
        }
        $(function () {
            _subject.page();
            //图片上传
            layui.use('upload', function () {
                layui.upload({
                    url: '${baseurl}/Testpaper/updateImage' //上传接口
                    , success: function (res) { //上传成功后的回调
                        if (res.result) {
                            $("#imagesToUpdate").text("").attr("src", HEAD_IMAGE_PREFIX + res.data);

                            $("input[name='file_img']").val(HEAD_IMAGE_PREFIX + res.data);
                        }
                    }
                });
            });

            $('#formSumbit').submit(function (event) {
                //首先验证文件格式
                var fileName = $(this).find("input[name=file]").val();
                var fileType = (fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length)).toLowerCase();
                event.preventDefault();
                var form = $(this);
                if (fileName === '') {
                    layer.msg('请选择文件');
                } else if (fileType !== 'xls' && fileType !== 'xlsx') {
                    layer.msg('文件格式不正确，excel文件！');
                } else if (form.hasClass('upload')) {
                    //普通表单
                    $.ajax({
                        type: form.attr('method'),
                        url: form.attr('action'),
                        data: form.serialize(),
                        dataType: "JSON"
                    }).success(function (data) {
                        layer.msg(data.msg)
                        //成功提交
                    });
                }
                else {
                    // mulitipart form,如文件上传类
                    var formData = new FormData(this);
                    $.ajax({
                        type: form.attr('method'),
                        url: form.attr('action'),
                        data: formData,
                        dataType: "JSON",
                        mimeType: "multipart/form-data",
                        contentType: false,
                        cache: false,
                        processData: false,
                        error: function (XHR, textStatus, errorThrown) {
                            layer.msg("网络错误！XHR=" + XHR + "\ntextStatus=" + textStatus
                                + "\nerrorThrown=" + errorThrown);
                        },
                        success: function (data) {
                            layer.confirm(data.msg, function (index) {
                                //do something
                                $("#msg").html(data.msg)
                                layer.close(index);
                            });
                        }
                    });
                }
            });
        });
    });


</script>

</html>
