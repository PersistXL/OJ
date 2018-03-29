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
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>我选择的试题</legend>
            </fieldset>
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">

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
                            <th>题库</th>
                            <th>章节</th>
                            <th>难易度</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="">

                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</section>
<section class="larry-grid" style="width: 49% ;float: right
">
    <div class="larry-personal">
        <div class="layui-tab">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>题库</legend>
            </fieldset>
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <blockquote class="layui-elem-quote mylog-info-tit" style="height: 120px;">
                    <form id="update-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
                            <div class="layui-input-inline">
                                <label class="layui-form-label" style="width: 100px;font-size: 14px">难易度</label>
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <select name="select_questions" id="select_questions" lay-filter="modules_1"
                                                lay-verify="required" lay-search=""
                                        >
                                            <option value="">请选择</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-input-inline">
                                <label class="layui-form-label" style="width: 100px;font-size: 14px">难易度</label>
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <select name="select_facility" lay-filter="modules_1" lay-verify="required"
                                                lay-search="">
                                            <option value="">请选择</option>
                                            <option value="">请选择</option>
                                            <option value="简单">简单</option>
                                            <option value="较易">较易</option>
                                            <option value="一般">一般</option>
                                            <option value="较难">较难</option>
                                            <option value="困难">困难</option>
                                        </select>
                                    </div>
                                </div>
                            </div><br>
                            <div class="layui-input-inline">
                                <label class="layui-form-label" style="width: 100px;font-size: 14px">知识点</label>
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="text" name="select_chapter"
                                               autocomplete="off"
                                               placeholder="请输入知识点" class="layui-input">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-input-inline">
                                <div class="layui-inline">
                                    <a class="layui-btn" onclick="currentIndex = 1;_subject.page()"><i
                                            class="layui-icon">&#xe615;</i>搜索</a>
                                </div>
                            </div>
                    </form>
                </blockquote>
                <div class="layui-form">
                    <table class="layui-table">
                        <colgroup>
                            <col width="70">
                            <col width="150">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="150">
                        </colgroup>

                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>题目</th>
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
</section  style="width: 49%
;
    float: left">
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
                var select_questions = $("select[name='select_questions']").val();
                var select_facility = $("select[name='select_facility']").val();
                var select_chapter = $("input[name='select_chapter']").val();

                $.post("${baseurl}/subject/selectQuestions", {
                    questionsId: select_questions,
                    chapter: select_chapter,
                    facility: select_facility
                }, function (data) {
                    let _html = "<option value=''>请选择</option><option value=''>请选择</option>";
                    for (let i = 0; i < data.data.length; i++) {
                        _html += "<option value='" + data.data[i].id + "'>" + data.data[i].name + "</option>";
                    }
                    $("#questions_id").html(_html);
                    $("#select_questions").html(_html);
                    form.render();
                });

                $.post("${baseurl}/subject/selectSubject",{questionsId:select_questions,chapter:select_chapter,facility:select_facility}, function (data) {
                    _subject.paging();
                    let _html = "";
                    for (let i = 0; i < data.data.length; i++) {
                        _html += `<tr>
                            <td>` + (i + 1) + `</td>
                            <td ><span class = "hide_title">` + data.data[i].subject + `</span></td>
                            <td><span class = "hide_title">` + data.data[i].questionsName + `</span></td>
                            <td>` + data.data[i].chapter + `</td>
                            <td>` + data.data[i].facility + `</td>
                            <td>

                                <div class="layui-btn-group">
                                    <a class="layui-btn layui-btn-mini" onclick="">
                                        <i class="layui-icon">&#xe602;</i>
                                        选择
                                    </a>
                                </div>
                                <a class="layui-btn layui-btn-mini" onclick="_subject.previewSubjectInfo(` + data.data[i].id + `)">
                                        <i class="layui-icon">&#xe602;</i>
                                        预览
                                    </a>
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
