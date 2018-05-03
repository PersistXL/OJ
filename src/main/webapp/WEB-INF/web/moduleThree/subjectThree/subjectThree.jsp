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

                    <%--<div class="layui-input-inline">--%>
                        <%--<label class="layui-form-label" style="width: 100px;font-size: 14px">题库</label>--%>
                        <%--<div class="layui-inline">--%>
                            <%--<div class="layui-input-inline">--%>
                                <%--<select name="select_questions" id="select_questions" lay-filter="modules_1"--%>
                                        <%--lay-verify="required" lay-search=""--%>
                                <%-->--%>
                                    <%--<option value="">请选择</option>--%>
                                <%--</select>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="layui-input-inline">--%>
                        <%--<label class="layui-form-label" style="width: 100px;font-size: 14px">难易度</label>--%>
                        <%--<div class="layui-inline">--%>
                            <%--<div class="layui-input-inline">--%>
                                <%--<select name="select_facility" lay-filter="modules_1" lay-verify="required"--%>
                                        <%--lay-search="">--%>
                                    <%--<option value="">请选择</option>--%>
                                    <%--<option value="">请选择</option>--%>
                                    <%--<option value="简单">简单</option>--%>
                                    <%--<option value="较易">较易</option>--%>
                                    <%--<option value="一般">一般</option>--%>
                                    <%--<option value="较难">较难</option>--%>
                                    <%--<option value="困难">困难</option>--%>
                                <%--</select>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="layui-input-inline">--%>
                        <%--<label class="layui-form-label" style="width: 100px;font-size: 14px">知识点</label>--%>
                        <%--<div class="layui-inline">--%>
                            <%--<div class="layui-input-inline">--%>
                                <%--<input type="text" name="select_chapter"--%>
                                       <%--autocomplete="off"--%>
                                       <%--placeholder="请输入知识点" class="layui-input">--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="layui-input-inline">
                        <div class="layui-inline">
                            <%--<a class="layui-btn" onclick="currentIndex = 1;_subject.page()"><i--%>
                                    <%--class="layui-icon">&#xe615;</i>搜索</a>--%>
                            <shiro:hasPermission name="moduleThree:update">
                                <%--<a class="layui-btn" onclick="_subject.addsingleEntry()"><i--%>
                                        <%--class="layui-icon">&#xe621;</i>单个录入</a>--%>
                                <a class="layui-btn" onclick="_subject.addＥxcel()"><i class="layui-icon">&#xe61e;</i>Excel导入</a>
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
                            <col width="200">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="230">
                        </colgroup>

                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>章节</th>
                            <th>题号</th>
                            <th>题目</th>
                            <th>难度</th>
                            <th>题型</th>
                            <th>assetbundle</th>
                            <th>modelName</th>
                            <th>Model tip</th>
                            <th>选项A</th>
                            <th>选项B</th>
                            <th>选项C</th>
                            <th>选项D</th>
                            <th>选项E</th>
                            <th>正确选项</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="subject_info">

                        </tbody>
                    </table>
                </div>
                <div id="demo7"></div>
            </div>
            <%--<div id="demo1"></div>--%>
        </div>
    </div>
</section>
<%--<div id="addInfo" style="display: none;width: auto; margin-top: 20px;">--%>
    <%--<div>--%>
        <%--<form class="layui-form" action="">--%>
            <%--<div class="layui-form-item layui-form-text">--%>
                <%--<input name="id" hidden>--%>
                <%--<label class="layui-form-label">题目：</label>--%>
                <%--<div class="layui-input-inline" style="width: 50%">--%>
                    <%--<textarea placeholder="请输入题目" class="layui-textarea" name="subject"></textarea>--%>
                <%--</div>--%>
            <%--</div>--%>

            <%--<div class="layui-form-item">--%>
                <%--<label class="layui-form-label">选项A：</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<input name="option_a" required lay-verify="required" placeholder="请输入内容" autocomplete="off"--%>
                           <%--class="layui-input">--%>
                <%--</div>--%>
                <%--<label class="layui-form-label">选项B：</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<input name="option_b" required lay-verify="required" placeholder="请输入内容" autocomplete="off"--%>
                           <%--class="layui-input">--%>
                <%--</div>--%>

                <%--<label class="layui-form-label">选项C：</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<input name="option_c" required lay-verify="required" placeholder="请输入内容" autocomplete="off"--%>
                           <%--class="layui-input">--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="layui-form-item">--%>
                <%--<label class="layui-form-label">选项D：</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<input name="option_d" required lay-verify="required" placeholder="请输入内容" autocomplete="off"--%>
                           <%--class="layui-input">--%>
                <%--</div>--%>
                <%--<label class="layui-form-label">选项E：</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<input name="option_e" required lay-verify="required" placeholder="请输入内容" autocomplete="off"--%>
                           <%--class="layui-input">--%>
                <%--</div>--%>
                <%--<label class="layui-form-label">正确选项：</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<select name="correct" lay-verify="required" lay-search="" id="correct">--%>
                        <%--<option value="A">选项A</option>--%>
                        <%--<option value="B">选项B</option>--%>
                        <%--<option value="C">选项C</option>--%>
                        <%--<option value="D">选项D</option>--%>
                        <%--<option value="E">选项E</option>--%>
                    <%--</select>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="layui-form-item">--%>
                <%--<label class="layui-form-label">题目图片：</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<div style="width:140px; height: 200px;border: 2px solid #e2e2e2;margin-bottom: 10px">--%>
                        <%--<img id="imagesToUpdate" class="head_image" style="width: 100%"--%>
                             <%--height="100%"/>--%>
                    <%--</div>--%>
                    <%--<div>--%>
                        <%--<input type="file" name="file" class="layui-upload-file" style="width: auto"--%>
                               <%--lay-title="题目图片">--%>
                        <%--<input type="text" name="file_img" hidden>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="layui-form-item">--%>

                <%--<label class="layui-form-label">题库：</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<select name="questions_id" lay-verify="required" lay-search="" id="questions_id">--%>
                        <%--<option value="0">试题</option>--%>

                    <%--</select>--%>
                <%--</div>--%>
                <%--<label class="layui-form-label">知识点：</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<input name="chapter" required lay-verify="required" placeholder="请输入知识点关键字" autocomplete="off"--%>
                           <%--class="layui-input">--%>
                <%--</div>--%>
                <%--<label class="layui-form-label">难易度：</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<select name="facility" lay-verify="required" lay-search="" id="facility">--%>
                        <%--<option value="简单">简单</option>--%>
                        <%--<option value="较易">较易</option>--%>
                        <%--<option value="一般">一般</option>--%>
                        <%--<option value="较难">较难</option>--%>
                        <%--<option value="困难">困难</option>--%>
                    <%--</select>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="layui-form-item layui-form-text">--%>
                <%--<label class="layui-form-label">备注：</label>--%>
                <%--<div class="layui-input-inline" style="width: 50%">--%>
                    <%--<textarea placeholder="备注信息：可以为空" class="layui-textarea" name="type"></textarea>--%>
                <%--</div>--%>
            <%--</div>--%>

            <%--<div class="layui-form-item">--%>
                <%--<label class="layui-form-label"></label>--%>
                <%--<div class="layui-input-inline " id="add">--%>
                    <%--<button class="layui-btn" onclick="_subject.addsingleEntryInfo()">立即提交--%>
                    <%--</button>--%>
                    <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
                <%--</div>--%>
                <%--<div class="layui-input-inline " id="update">--%>
                    <%--<button class="layui-btn" onclick="_subject.updateInfo_new()">更新提交--%>
                    <%--</button>--%>
                    <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
                <%--</div>--%>
            <%--</div>--%>

        <%--</form>--%>
    <%--</div>--%>
<%--</div>--%>
<div id="addＥxcel" style="display: none;width: auto; margin-top: 20px;">
    <div class="layui-form  layui-form-item layui-form-text">
        <form id='formSumbit' action="${baseurl}/subject/uploadFileThree" method="POST" enctype="multipart/form-data">
            <div class="layui-form-item">
                <label class="layui-form-label">题库：</label>
                <div class="layui-input-inline">
                    <select name="questions_id" lay-verify="required" lay-search="" id="questions_id_excel">
                        <option value="0">试题</option>

                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">Excel文件：</label>
                <div class="layui-input-inline">
                    <input class="button" type="file" name="file" lay-type="file"><br/>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <div class="layui-input-inline">
                    <input type="submit" value="上传Excel" class="layui-btn"/>
                </div>
            </div>

        </form>
        <br>
        <h3 style="color:green" id="msg"></h3>
    </div>
</div>
<div id="previewSubjectInfo" style="display: none;">
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
                var select_questions = $("select[name='select_questions']").val();
                var select_facility = $("select[name='select_facility']").val();
                var select_chapter = $("input[name='select_chapter']").val();
                $.post("${baseurl}/subject/selectQuestions", function (data) {
                    let _html = "<option value=''>请选择</option><option value=''>请选择</option>";
                    let _html_excel = "";
                    for (let i = 0; i < data.data.length; i++) {
                        _html += "<option value='" + data.data[i].id + "'>" + data.data[i].name + "</option>";
                        _html_excel += "<option value='" + data.data[i].id + "'>" + data.data[i].name + "</option>";
                    }
                    $("#questions_id").html(_html);
                    $("#questions_id_excel").html(_html_excel);
                    $("#select_questions").html(_html);
                    form.render();
                });

                $.post("${baseurl}/subject/selectSubject", {
                    questionsId: select_questions,
                    chapter: select_chapter,
                    facility: select_facility,
                    currentIndex: currentIndex,
                    pageSize: pageSize
                }, function (data) {
                    console.log(data)
                    _subject.paging();
                    currentIndex = data.page.currentIndex;
                    totalSize = data.page.totalSize;
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
                            <td><span class = "hide_title">` + data.data[i].option_e + `</span></td>
                            <td>` + data.data[i].correct + `</td>
                            <td><span class = "hide_title">` + data.data[i].questionsName + `</span></td>
                            <td ><span class = "hide_title">` + data.data[i].chapter + `</span></td>
                            <td>` +(data.data[i].facility===undefined ?"暂无":data.data[i].facility) + `</td>
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
            addsingleEntry: function () {
                $("#update").hide();
                $("#add").show();
                layer.open({
                    type: 1,
                    title: '录入题目',
                    area: ['100%', '100%'],
                    skin: 'yourclass',
                    content: $('#addInfo')
                });
            },
            deleteSubjectInfo: function (id) {
                layer.confirm('是否删除信息？', function (index) {
                    $.post("${baseurl}/subject/deleteSubjectById", {id: id}, function (data) {
                        layer.msg(data.msg);
                        location.reload();
                    });
                    layer.close(index);
                });
            },
            updataInfo: function (id) {

                layui.use('form', function () {
                    let $ = layui.jquery, form = layui.form();
                    $.post("${baseurl}/subject/selectSubjectById", {id: id}, function (data) {
                        $("#add").hide();
                        $("#update").show();

                        $("textarea[name='subject']").val(data.data.subject);
                        $("input[name='option_a']").val(data.data.option_a);
                        $("input[name='option_b']").val(data.data.option_b);
                        $("input[name='option_c']").val(data.data.option_c);
                        $("input[name='option_d']").val(data.data.option_d);
                        $("input[name='option_e']").val(data.data.option_e);
                        // $("select[name='correct']").val(data.data.correct);
                        let _html_correct =`<option value="A" `+(data.data.correct === "A"?"selected='selected'":"")+`>选项A</option>
                        <option value="B"`+(data.data.correct === "B"?"selected='selected'":"")+`>选项B</option>
                        <option value="C"`+(data.data.correct === "C"?"selected='selected'":"")+`>选项C</option>
                        <option value="D"`+(data.data.correct === "D"?"selected='selected'":"")+`>选项D</option>
                        <option value="E"`+(data.data.correct === "E"?"selected='selected'":"")+`>选项E</option>`;
                        $("#correct").html(_html_correct);
                        let _html_facility =`<option value="简单" `+(data.data.facility === "简单"?"selected='selected'":"")+`>简单</option>
                        <option value="较易"`+(data.data.facility === "较易"?"selected='selected'":"")+`>较易</option>
                        <option value="一般"`+(data.data.facility === "一般"?"selected='selected'":"")+`>一般</option>
                        <option value="较难"`+(data.data.facility === "较难"?"selected='selected'":"")+`>较难</option>
                        <option value="困难"`+(data.data.facility === "困难"?"selected='selected'":"")+`>困难</option>`;
                        $("#facility").html(_html_facility);
                        let questionsName= data.data.questionsName;
                        $.post("${baseurl}/subject/selectQuestions", function (data) {
                            let _html = "";
                            for (let i = 0; i < data.data.length; i++) {
                                _html += `<option value='` + data.data[i].id + `' `+( questionsName=== data.data[i].name?"selected='selected'":"")+`>` + data.data[i].name + `</option>`;
                            }
                            $("#questions_id").html(_html);
                            form.render();
                        });
                        form.render();
                        $("input[name='file_img']").val(data.data.subject_img);
                        $("input[name='chapter']").val(data.data.chapter);
                        $("textarea[name='type']").val(data.data.type);
                        $("input[name='id']").val(data.data.id);
                        $("#imagesToUpdate").text("").attr("src", data.data.subject_img);
                        layer.open({
                            type: 1,
                            title: '试题预览',
                            area: ['100%', '100%'],
                            skin: 'yourclass',
                            content: $('#addInfo')
                        });
                    });
                    form.render();

                });
            },
            updateInfo_new: function () {
                let id = $("input[name='id']").val();
                let subject = $("textarea[name='subject']").val();
                let option_a = $("input[name='option_a']").val();
                let option_b = $("input[name='option_b']").val();
                let option_c = $("input[name='option_c']").val();
                let option_d = $("input[name='option_d']").val();
                let option_e = $("input[name='option_e']").val();
                let correct = $("select[name='correct']").val();
                let imagesToUpdate = $("input[name='file_img']").val();
                let questions_id = $("select[name='questions_id']").val();
                let chapter = $("input[name='chapter']").val();
                let facility = $("select[name='facility']").val();
                let type = $("textarea[name='type']").val();
                $.post("${baseurl}/subject/updateSubjectById", {
                    id: id,
                    subject: subject,
                    optionA: option_a,
                    optionB: option_b,
                    optionC: option_c,
                    optionD: option_d,
                    optionE: option_e,
                    correct: correct,
                    subjectImg: imagesToUpdate,
                    questionsId: questions_id,
                    chapter: chapter,
                    facility: facility,
                    type: type
                }, function (data) {
                    layer.msg(data.msg);
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
                    if (data.data.subject_img !== undefined) {
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

            <p><b>选项E：</b>` + data.data.option_e + `</p>
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
                <th>知识点</th>
                <th>难易度</th>
                <th>备注</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>` + data.data.questionsName + `</td>
                <td>` + data.data.chapter + `</td>
                <td>` + (data.data.facility === undefined?"暂无": data.data.facility)  + `</td>
                <td>` + (data.data.type=== undefined?"暂无": data.data.type )+ `</td>
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
            addsingleEntryInfo: function () {
                let subject = $("textarea[name='subject']").val();
                let option_a = $("input[name='option_a']").val();
                let option_b = $("input[name='option_b']").val();
                let option_c = $("input[name='option_c']").val();
                let option_d = $("input[name='option_d']").val();
                let option_e = $("input[name='option_e']").val();
                let correct = $("select[name='correct']").val();
                let imagesToUpdate = $("input[name='file_img']").val();
                let questions_id = $("select[name='questions_id']").val();
                let chapter = $("input[name='chapter']").val();
                let facility = $("select[name='facility']").val();
                let type = $("textarea[name='type']").val();
                $.post("${baseurl}/subject/addSubject", {
                    subject: subject,
                    optionA: option_a,
                    optionB: option_b,
                    optionC: option_c,
                    optionD: option_d,
                    optionE: option_e,
                    correct: correct,
                    subjectImg: imagesToUpdate,
                    questionsId: questions_id,
                    chapter: chapter,
                    facility: facility,
                    type: type
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
                    url: '${baseurl}/subject/updateImage' //上传接口
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
                }else
                if (fileType !== 'xls' && fileType !== 'xlsx') {
                    layer.msg('文件格式不正确，excel文件！');
                }else
                if (form.hasClass('upload')) {
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
                        error : function(XHR, textStatus, errorThrown) {
                            layer.msg("网络错误！XHR=" + XHR + "\ntextStatus=" + textStatus
                                + "\nerrorThrown=" + errorThrown);
                        },
                        success : function(data) {
                            layer.confirm(data.msg, function(index){
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
