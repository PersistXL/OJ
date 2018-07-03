<%--
  Created by IntelliJ IDEA.
  User: Persist
  Date: 2018/5/8
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <title>布置作业</title>
    <link rel="stylesheet" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/personal.css" media="all">
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <script src="${baseurl}/public/common/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<div id="editSubjectInfo" hidden>
    <section class="larry-grid" style="width: 49% ;float: left">
        <div class="larry-personal">
            <div class="layui-tab">
                <div class="larry-separate"></div>
                <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                        <legend>第一步:选择题目</legend>
                    </fieldset>
                    <input type="text" hidden id="idAll">
                    <input type="text" hidden id="Testpapername">
                    <input type="text" hidden id="Testpaperid">
                    <input type="text" hidden class="TestpaperId" id="TId">
                    <blockquote class="layui-elem-quote mylog-info-tit" style="height: 120px;">
                        <form id="update-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
                            <div class="layui-input-inline">
                                <label class="layui-form-label" style="width: 100px;font-size: 14px">题库</label>
                                <div class="layui-inline">
                                    <div class="layui-input-inline" id="tiku">
                                        <select name="select_questions" id="select_questions"
                                                lay-verify="required" lay-filter="questionBankToKnowledgePoint"
                                                lay-search="">
                                            <option value="">请选择</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-input-inline">
                                <label class="layui-form-label" style="width: 100px;font-size: 14px">难易度</label>
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <select name="select_facility" id="select_facility" lay-filter="modules_1"
                                                lay-verify="required"
                                                lay-search="">
                                            <option value="">请选择</option>
                                            <option value="">请选择</option>
                                            <option value="简单">简单</option>
                                            <option value="较易">较易</option>
                                            <option value="一般">一般</option>
                                            <option value="较难">较难</option>
                                            <option value="困难">困难</option>
                                            <option value="未指定">未指定</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="layui-input-inline">

                                <label class="layui-form-label" style="width: 100px;font-size: 14px">知识点</label>
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <select name="select_chapter" id="select_chapter" lay-verify="required"
                                                lay-search="">
                                            <option value="">请选择</option>
                                        </select>

                                    </div>
                                </div>


                            </div>
                            <div class="layui-input-inline">
                                <div class="layui-inline">
                                    <a class="layui-btn" onclick="_subject.page()"><i
                                            class="layui-icon">&#xe615;</i>搜索</a>
                                </div>
                            </div>
                            <div class="layui-input-inline">
                                <div class="layui-inline">
                                    <a class="layui-btn" id="choseAll"><i
                                            class="layui-icon">&#xe642;</i>选择所有选中项</a>
                                </div>
                            </div>
                        </form>
                    </blockquote>
                    <div class="layui-form">
                        <table class="layui-table" id="tab_1">
                            <colgroup>
                                <col width="50">
                                <col width="70">
                                <col width="150">
                                <col width="100">
                                <col width="100">
                                <col width="100">
                                <col width="180">
                            </colgroup>

                            <thead>
                            <tr>
                                <th><input type="checkbox" id="checkboxAll_id" name="selectAll" lay-skin="primary"
                                           lay-filter="allChoose" value=""></th>
                                <th>编号</th>
                                <th>题目</th>
                                <th>题库</th>
                                <th>知识点</th>
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
    <section class="larry-grid" style="width: 49% ;float: right">
        <div class="larry-personal">
            <div class="layui-tab">
                <div class="larry-separate"></div>
                <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                        <legend>第二步:修改试题</legend>
                    </fieldset>

                    <span style="color:grey">试卷名称：<span class="name_1"></span>&nbsp;&nbsp;&nbsp;</span>
                    <div class="layui-form">
                        <table class="layui-table">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>题目</th>
                                <th>题库</th>
                                <th>知识点</th>
                                <th>难易度</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="cursorTaskQuestions">

                            </tbody>
                        </table>
                    </div>
                    <div class="layui-input-inline">
                        <div class="layui-inline">
                            <a class="layui-btn" onclick="_subject.createTestpaper()"><i
                                    class="layui-icon">&#xe602;</i>完成修改</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</div>
<div id="previewSubject" hidden>

</div>
<div id="previewSubjectInfo" hidden>

</div>
<div id="view" style="text-align: center;" hidden>
    <form lay-filter="role-add" class="layui-form layui-form-pane" method="post">
        <br>
        <div class="layui-input-inline" style="margin-bottom: 15px">
            <label class="layui-form-label" style="width: 100px;font-size: 14px">结束时间</label>
            <input type="text" hidden id="name">
            <input type="text" hidden id="subject_id">
            <input type="text" hidden id="teacher_id">
            <input type="text" hidden id="id">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input style="width: 173px;" class="layui-input" id="time" placeholder="选择时间"
                           onclick="layui.laydate({elem: this, istime: true,min: laydate.now(), format: 'YYYY-MM-DD hh:mm:ss'})">
                </div>
            </div>
        </div>
        <br>

        <div class="layui-input-inline" style="margin-bottom: 15px">
            <label class="layui-form-label" style="width: 100px;font-size: 14px">试卷总分</label>
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input style="width: 173px;" type="number" id="score" name=""
                           autocomplete="off"
                           placeholder="请输入分数" class="layui-input">
                </div>
            </div>
        </div>
        <br>

        <div class="layui-input-inline" style="margin-bottom: 15px">
            <label class="layui-form-label" style="width: 100px;font-size: 14px">班课</label>
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <select name="classes_id" lay-verify="required" lay-search="" id="classes_id">
                        <option value="0">班课</option>

                    </select>
                </div>
            </div>
        </div>
    </form>
    <button class="layui-btn" onclick="addTestPaper()">确认</button>
</div>
<div class="layui-tab-content larry-personal-body clearfix mylog-info-box">

    <div class="layui-form">
        <table class="layui-table">
            <colgroup>
                <col width="60">
                <col width="120">
                <col width="120">
                <col width="120">
                <col width="150">
            </colgroup>

            <thead>
            <tr>
                <th>编号</th>
                <th>试卷名称</th>
                <th>题目数量</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="testPaper_info">

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
    let childAllSelect;
    let chapterLists = [];
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        //全选
        form.on('checkbox(allChoose)', function (data) {
            var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
            child.each(function (index, item) {
                item.checked = data.elem.checked;
            });
            form.render('checkbox');
        });
        //通过判断是否全部选中来确定全选按钮是否选中
        form.on('checkbox(itemChoose)', function (data) {
            var sib = $(data.elem).parents('table').find('tbody input[type="checkbox"]:checked').length;
            var total = $(data.elem).parents('table').find('tbody input[type="checkbox"]').length;
            childAllSelect = $(data.elem).parents('table').find('thead input[type="checkbox"]');
            if (sib == total) {
                $(data.elem).parents('table').find('thead input[type="checkbox"]').prop("checked", true);
                form.render();
            } else {
                $(data.elem).parents('table').find('thead input[type="checkbox"]').prop("checked", false);
                form.render();
            }
        })
        //批量选择试题
        $("#choseAll").click(function () {
            var child = $("#tab_1").find('tbody input[type="checkbox"]:checked');
            var $checkbox = "";
            child.each(function () {
                $checkbox += $(this).attr("tbl") + ",";
            })
            if ($checkbox.length !== 0) {
                layer.confirm('确定选择选中的试题？', {icon: 3, title: '提示信息'}, function (index) {
                    var index = layer.msg('正在选择中，请稍候', {icon: 16, time: false, shade: 0.8});
                    setTimeout(function () {
                        //批量选择数据
                        $.post("${baseurl}/Testpaper/addTestpaperCursorAll", {
                            subjectId: $checkbox
                        }, function (data) {
                            layer.msg(data.msg);
                            _subject.page();
                            $(".layui-table").find('thead input[type="checkbox"]').prop("checked", false);
                            selectTestpaperCursor();
                        });
                        form.render();
                        layer.close(index);
                    }, 2000);
                })
            } else {
                layer.msg("请选择需要批量选择的试题");
            }
        })
        _subject = {
            page: function () {
                var select_questions = $("select[name='select_questions']").val();
                var select_facility = $("select[name='select_facility']").val();
                var select_chapter = $("#select_chapter option:selected").val();
                // var select_chapter = 1;


                $.post("${baseurl}/subject/selectSubject", {
                    questionsId: select_questions,
                    chapter: select_chapter,
                    facility: select_facility,
                    currentIndex: currentIndex,
                    pageSize: pageSize
                }, function (data) {
                    $.post("${baseurl}/Testpaper/selectTestpaperCursor", function (value) {
                        _subject.paging();
                        currentIndex = data.page.currentIndex;
                        totalSize = data.page.totalSize;
                        _subject.paging();
                        let _html = "";

                        for (let i = 0; i < data.data.length; i++) {
                            let isHave = false;
                            value.data.map(item => {
                                if (data.data[i].id === item.subject_id) {
                                    isHave = true;
                                }
                            });

                            _html += `<tr>
                            <td><input type="checkbox" name="selectAll" lay-skin="primary" id="testpaper" lay-filter="itemChoose" tbl="` + data.data[i].id + `"></td>
                            <td>` + (i + 1) + `</td>
                            <td ><span class = "hide_title">` + data.data[i].subject + `</span></td>
                            <td><span class = "hide_title1">` + data.data[i].questionsName + `</span></td>
                            <td ><span class = "hide_title1">` + data.data[i].chapter + `</span></td>
                            <td>` + (data.data[i].facility === undefined ? "未指定" : data.data[i].facility) + `</td>
                            <td>

                                <div class="layui-btn-group">`

                            if (!isHave) {
                                _html += `<a class="layui-btn layui-btn-mini" onclick="_subject.addTestpaperCursor(` + data.data[i].id + `)" >
                                            <i class="layui-icon">&#xe642;</i>
                                            选择
                                        </a>`
                            } else {

                            }

                            _html += `<a class="layui-btn layui-btn-mini" onclick="_subject.previewSubjectInfo(` + data.data[i].id + `)">
                                        <i class="layui-icon">&#xe602;</i>
                                        预览
                                    </a>
                                </div>
                            </td>
                        </tr>`;
                        }
                        $("#subject_info").html(_html);
                        form.render('checkbox');
                    });
                })
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
            createTestpaper: function () {

                let subjectId = $("#idAll").val();
                let name = $("#Testpapername").val();
                let testpaperid = $("#TId").val()
                $.post("${baseurl}/Testpaper/updateTestpaperCursorToTestpaper", {
                    subjectId: subjectId,
                    name: name,
                    id:testpaperid
                }, function (data) {
                    layer.confirm(data.msg, function (index) {
                        location.reload();
                        layer.close(index);
                    });
                });
            },
            removeTestpaperCursor: function (id) {
                layer.confirm('是否移除试题？', function (index) {
                    $.post("${baseurl}/Testpaper/deleteTestpaperCursor", {id: id}, function (data) {
                        layer.msg(data.msg);
                        _subject.page();
                        selectTestpaperCursor();
                    });
                    layer.close(index);
                });
            }, editSubjectInfo: function (id, subject_id, name) {
                $(".name_1").html(name)
                $("#title_subject").hide();
                $("#select_subject").show();
                $(".TestpaperId").val(id)
                deleteTestpaper();
                $.post("${baseurl}/Testpaper/updateTestpaperCursor", {
                    subjectId: subject_id
                }, function (data) {
                    layer.msg(data.msg);
                    _subject.page();
                    $(".layui-table").find('thead input[type="checkbox"]').prop("checked", false);
                    selectTestpaperCursor();
                });
                layer.open({
                    type: 1,
                    title: "编辑试卷",
                    area: ["100%", "100%"],
                    skin: 'yourclass',
                    content: $('#editSubjectInfo')
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
                <th>知识点</th>
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
            addTestpaperCursor: function (id) {
                $.post("${baseurl}/Testpaper/addTestpaperCursor", {
                    subjectId: id
                }, function (data) {
                    layer.msg(data.msg);
                    _subject.page();
                    selectTestpaperCursor();
                });

            }
        };

        if (document.getElementById('select_chapter') != null) {
            form.on('select(questionBankToKnowledgePoint)', function (dataOfSelect) {
                $.post("${baseurl}/Testpaper/selectTestpaperCursorOfChapter", {questionBankId: dataOfSelect.value}, function (data) {
                    let _html = `<option value=''>请选择</option>`

                    $("#select_chapter").html(_html).append(loadOptionsHtml(data.data));
                    form.render();
                });
            });
        }

        function loadOptionsHtml(data) {
            let _html = "<option value=''>请选择</option>";
            for (let i = 0; i < data.length; ++i) {
                _html += `<option value="` + data[i].chapter + `">` + data[i].chapter + `</option>`;
            }
            return _html;
        }

        function selectClasses() {
            $.post("${baseurl}/Testpaper/selectClasses", function (data) {
                let _html = "";
                for (let i = 0; i < data.data.length; i++) {
                    _html += "<option value='" + data.data[i].id + "'>" + data.data[i].name + "</option>";
                }
                $("#classes_id").html(_html);
                form.render();
            });
        }

        function selectTestpaperCursor() {
            $.post("${baseurl}/Testpaper/selectTestpaperCursor", function (data) {
                let _html = ""
                let idAll = [];
                for (let i = 0; i < data.data.length; i++) {
                    idAll.push(data.data[i].subject_id);
                    let count = i + 1;
                    _html += `<tr>
                        <th>` + count + `</th>
                        <th>` + data.data[i].subject + `</th>
                        <th>` + data.data[i].questionsName + `</th>
                        <th>` + data.data[i].chapter + `</th>
                        <th>` + (data.data[i].facility === undefined ? "未指定" : data.data[i].facility) + `</th>
                        <th>
                            <a class="layui-btn layui-btn-mini" onclick="_subject.removeTestpaperCursor(` + data.data[i].id + `)">
                                <i class="layui-icon">&#xe602;</i>
                                移除
                            </a>
                        </th></tr>`;
                }
                $("#cursorTaskQuestions").html(_html);
                $("#idAll").val(idAll.join("_"));
            });
        }

        function selectQuestions() {
            $.post("${baseurl}/subject/selectQuestions", function (data) {
                let _html = "<option value=''>请选择</option><option value=''>请选择</option>";
                for (let i = 0; i < data.data.length; i++) {
                    _html += "<option value='" + data.data[i].id + "'>" + data.data[i].name + "</option>";
                }
                $("#select_questions").html(_html);
                form.render();
            });
        }

        function deleteTestpaper() {
            $.post("${baseurl}/Testpaper/deleteTestpaper", function (data) {

            });
        }

        $(function () {
            _subject.page();
            selectClasses();
            deleteTestpaper();
            selectTestpaperCursor();
            selectQuestions();
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
        });
    });
</script>
<script type="text/javascript">
    let _testPaper;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        let element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;
        _testPaper = {
            page: function () {
                $.post("${baseurl}/homework/selectHomework", function (data) {
                    let _html = "";
                    for (var i = 0; i < data.data.length; i++) {
                        var s = data.data[i].subject_id
                        _html += (`<tr>
                <th>` + (i + 1) + `</th>
                <th>` + data.data[i].name + `</th>
                <th>` + s.split("_").length + `</th>
                <th>` + data.data[i].time + `</th>
                <th>
                <div class="layui-btn-group">
                                        <a class="layui-btn layui-btn-mini" onclick="smartTestPaper(` + data.data[i].id + `,'` + data.data[i].name + `','` + data.data[i].subject_id + `','` + data.data[i].teacher_id + `')" >
                                            <i class="layui-icon">&#xe642;</i>
                                            布置作业
                                        </a>
                                    <a class="layui-btn layui-btn-mini" onclick="previewSubjectInfo(` + data.data[i].id + `,'` + data.data[i].subject_id + `')">
                                        <i class="layui-icon">&#xe602;</i>
                                        预览
                                    </a>
                                    <a class="layui-btn layui-btn-mini" onclick="_subject.editSubjectInfo(` + data.data[i].id + `,'` + data.data[i].subject_id + `','` + data.data[i].name + `')">
                                        <i class="layui-icon">&#xe602;</i>
                                        编辑
                                    </a>
                                        <a class="layui-btn layui-btn-mini" onclick="deleteTestPaperInfo(` + data.data[i].id + `)">
                                            <i class="layui-icon">&#xe640;</i>
                                            删除
                                        </a>
                                </div>
                </th>
            </tr>`)
                    }
                    $("#testPaper_info").html(_html);
                    form.render();
                })

            }
        }

        function selectClasses() {
            $.post("${baseurl}/Testpaper/selectClasses", function (data) {
                let _html = "";
                for (let i = 0; i < data.data.length; i++) {
                    _html += "<option value='" + data.data[i].id + "'>" + data.data[i].name + "</option>";
                }
                $("#classes_id").html(_html);
                form.render();
            });
        }

        $(function () {
            _testPaper.page();
            selectClasses();
        });
    });

    function deleteTestPaperInfo(id) {
        layer.confirm('是否删除信息？', function (index) {
            $.post("${baseurl}/homework/deleteTestPaperInfo", {id: id}, function (data) {
                layer.msg(data.msg);
                location.reload();
            });
            layer.close(index);
        });
    }

    function smartTestPaper(id, name, suject_id, teacher_id) {
        $("#id").val(id);
        $("#name").val(name);
        $("#subject_id").val(suject_id);
        $("#teacher_id").val(teacher_id);
        layer.open({
            type: 1,
            title: "布置作业",
            area: ["50%", "50%"],
            skin: 'yourclass',
            content: $('#view')
        });
    }

    function addTestPaper() {
        let teacherId = $("#teacher_id").val();
        let subjectId = $("#subject_id").val();
        let id = $("#id").val();
        let name = $("#name").val();
        let closeTime = $("#time").val();
        let score = $("#score").val();
        var classes_id = $("select[name='classes_id']").val();
        if (closeTime == "") {
            layer.msg("试卷结束时间不能为空");
        } else if (score == "") {
            layer.msg("试卷总分不能为空")
        } else if (classes_id == "") {
            layer.msg("请正确选择班课")
        } else {
            $.post("${baseurl}/Testpaper/selectTestpaperNameIs",
                {
                    name: name,
                    classesId: classes_id,
                    teacherId: teacherId
                }, function (isHave) {
                    if (isHave.data) {
                        $.post("${baseurl}/homework/addTestpaper", {
                            id: id,
                            subjectId: subjectId,
                            name: name,
                            score: score,
                            closeTime: closeTime,
                            classesId: classes_id,
                            teacherId: teacherId
                        }, function (data) {
                            layer.confirm(data.msg, function (index) {
                                location.reload();
                                layer.close(index);
                            });
                        });
                    } else {
                        layer.msg(isHave.msg);
                    }
                });
        }
    }

    function previewSubjectInfo(id, subjectId) {
        $.post("${baseurl}/homework/previewTestpaper", {subjectId: subjectId}, function (data) {
            var _html = "";
            for (var i = 0; i < data.data.length; i++) {
                _html += (`<fieldset class="layui-elem-field site-demo-button checkboxAll" style="margin-top: 30px;">
    <legend>试题` + (i + 1) + `：</legend>
    <div class="layui-field-box">
    <b>题目：</b>
    <p>` + data.data[i].subject + `</p>
    </div>`);
                if (data.data[i].subject_img !== undefined) {
                    _html += (`<b style="margin-left: 12px">题目图片</b>
    <div class="layui-field-box box">
    <img width="300px" height="300px" src="` + data.data[i].subject_img + `"/><br>
    </div>`)
                }
                _html += (`<div class="layui-field-box">
    <label><b>选项A：</b></label>` + data.data[i].option_a + `
    </div>
    <div class="layui-field-box">

    <label><b>选项B：</b></label>` + data.data[i].option_b + `
    </div>
    <div class="layui-field-box">

    <label><b>选项C：</b></label>` + data.data[i].option_c + `
    </div>
    <div class="layui-field-box">

    <label><b>选项D：</b></label>` + data.data[i].option_d + `
    </div>`)

                if (data.data[i].subject_e === undefined) {

                    _html += (`<div class="layui-field-box">

    <label><b>选项E：</b></label>` + data.data[i].option_e + `
    </div>

    <div class="layui-field-box">

    <label><b>正确答案：</b></label>` + data.data[i].correct + `
    </div>`)
                }
                _html += (`</fieldset>`);
            }
            $("#previewSubject").html(_html);
        })
        layer.open({
            type: 1,
            title: "预览试题",
            area: ["100%", "100%"],
            skin: 'yourclass',
            content: $('#previewSubject')
        });
    }
</script>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        var start = {
            min: laydate.now()
            , max: '2099-06-16 23:59:59'
            , istoday: false
            , choose: function (datas) {
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };

        var end = {
            min: laydate.now()
            , max: '2099-06-16 23:59:59'
            , istoday: false
            , choose: function (datas) {
                start.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };
    });
</script>
</html>
