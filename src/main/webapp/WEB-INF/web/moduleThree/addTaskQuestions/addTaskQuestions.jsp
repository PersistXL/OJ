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
<section class="larry-grid" style="width: 49% ;float: left">
    <div class="larry-personal">
        <div class="layui-tab">
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <shiro:hasPermission name="moduleThree:update">
                    <a class="layui-btn" onclick="_subject.addsingleEntry()"><i class="layui-icon">&#xe621;</i>单个录入</a>
                    <a class="layui-btn"><i class="layui-icon">&#xe61e;</i>Excel导入</a>
                </shiro:hasPermission>
                <div class="layui-form">
                    <table class="layui-table">
                        <colgroup>
                            <col width="70">
                            <col width="250">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="">
                            <col width="100">
                            <col width="100">
                            <col width="270">
                        </colgroup>

                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>题目</th>
                            <th>选项A</th>
                            <th>选项B</th>
                            <th>选项C</th>
                            <th>选项D</th>
                            <th>正确选项</th>
                            <th>题库</th>
                            <th>章节</th>
                            <th>难易度</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="subject_info">

                        </tbody>
                    </table>
                </div>
                <div id="demo1"></div>
            </div>

        </div>
    </div>
</section>
<section class="larry-grid"  style="width: 49% ;float: right
">
    <div class="larry-personal">
        <div class="layui-tab">
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <shiro:hasPermission name="moduleThree:update">
                    <a class="layui-btn" onclick="_subject.addsingleEntry()"><i class="layui-icon">&#xe621;</i>单个录入</a>
                    <a class="layui-btn"><i class="layui-icon">&#xe61e;</i>Excel导入</a>
                </shiro:hasPermission>
                <div class="layui-form">
                    <table class="layui-table">
                        <colgroup>
                            <col width="70">
                            <col width="250">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="">
                            <col width="100">
                            <col width="100">
                            <col width="270">
                        </colgroup>

                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>题目</th>
                            <th>选项A</th>
                            <th>选项B</th>
                            <th>选项C</th>
                            <th>选项D</th>
                            <th>正确选项</th>
                            <th>题库</th>
                            <th>章节</th>
                            <th>难易度</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="subject_info">

                        </tbody>
                    </table>
                </div>
                <div id="demo1"></div>
            </div>

        </div>
    </div>
</section  style="width: 49% ;float: left">
<div id="previewSubjectInfo" style="display: none;">
</div>
</body>
<script type="text/javascript">
    let _subject;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        let element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;
        _subject = {
            page: function () {
                $.post("${baseurl}/subject/selectQuestions", function (data) {
                    let _html = "";
                    for (let i = 0; i < data.data.length; i++) {
                        _html += "<option value='" + data.data[i].id + "'>" + data.data[i].name + "</option>";
                    }
                    $("#questions_id").html(_html);
                    form.render();
                });

                $.post("${baseurl}/subject/selectSubject", function (data) {
                    _subject.paging();
                    let _html = "";
                    for (let i = 0; i < data.data.length; i++) {
                        _html += `<tr>
                            <td>` + (i + 1) + `</td>
                            <td ><span class = "hide_title">` + data.data[i].subject + `</span></td>
                            <td><span class = "hide_title">` + data.data[i].option_a + `</span></td>
                            <td><span class = "hide_title">` + data.data[i].option_b + `</span></td>
                            <td><span class = "hide_title">` + data.data[i].option_c + `</span></td>
                            <td><span class = "hide_title">` + data.data[i].option_d + `</span></td>
                            <td>` + data.data[i].correct + `</td>
                            <td><span class = "hide_title">` + data.data[i].questionsName + `</span></td>
                            <td>` + data.data[i].chapter + `</td>
                            <td>` + data.data[i].facility + `</td>
                            <td>

                                <div class="layui-btn-group">
                                    <shiro:hasPermission name="moduleThree:update" >
                                        <a class="layui-btn layui-btn-mini" onclick="_subject.updataInfo(` + data.data[i].id + `)" >
                                            <i class="layui-icon">&#xe642;</i>
                                            编辑
                                        </a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="moduleThree:delete">
                                        <a class="layui-btn layui-btn-mini" onclick="_subject.deleteSubjectInfo(` + data.data[i].id + `)">
                                            <i class="layui-icon">&#xe640;</i>
                                            删除
                                        </a>
                                    </shiro:hasPermission>
                                    <a class="layui-btn layui-btn-mini" onclick="_subject.previewSubjectInfo(` + data.data[i].id + `)">
                                        <i class="layui-icon">&#xe602;</i>
                                        预览
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
                    cont: 'demo1'
                    , pages: 100 //分页的总页数
                    , groups: 5 //连续显示分页数
                    , jump: function (obj, first) {
                        //得到了当前页，用于向服务端请求对应数据
                        let curr = obj.curr;
                    }
                });
            },
            previewSubjectInfo: function (id) {
                $.post("${baseurl}/subject/selectSubjectById", {id: id}, function (data) {
                    let _html = "";
                    _html += `<fieldset class="layui-elem-field">
        <legend>试题：</legend>
        <div class="layui-field-box">
            <b>题目：</b>
            <p>` + data.data.subject + `</p>
        </div>`;
                    if (data.data.subject_img !== '') {
                        _html += `<div class="layui-field-box box">
            <img width="300px" height="300px" src="` + data.data.subject_img + `"/><br>
            <b>题目图片</b>
        </div>`;
                    }
                    _html += `<div class="layui-field-box">
            <p> <b>选项A：</b>` + data.data.option_a + `</p>
        </div>
        <div class="layui-field-box">

            <p><b>选项B：</b>` + data.data.option_b + `</p>
        </div>
        <div class="layui-field-box">

            <p><b>选项C：</b>` + data.data.option_c + `</p>
        </div>
        <div class="layui-field-box">

            <p><b>选项D：</b>` + data.data.option_d + `</p>
        </div>
        <div class="layui-field-box">
            <b>正确选项：</b>
            <p>` + data.data.correct + `</p>
        </div>
    </fieldset>
    <fieldset class="layui-elem-field " style="margin-top: 20px;">
        <legend>题目相关信息：</legend>
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>题库</th>
                <th>章节</th>
                <th>难易度</th>
                <th>备注</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>` + data.data.questionsName + `</td>
                <td>` + data.data.chapter + `</td>
                <td>` + data.data.facility + `</td>
                <td>` + data.data.type + `</td>
            </tr>
            </tbody>
        </table>
    </fieldset>`;
                    $("#previewSubjectInfo").html(_html);
                    layer.open({
                        type: 1,
                        title: '试题预览',
                        area: ['100%', '100%'],
                        skin: 'yourclass',
                        content: $('#previewSubjectInfo')
                    });
                });
            },
        }
        $(function () {
            _subject.page();
        });
    });
</script>

</html>
