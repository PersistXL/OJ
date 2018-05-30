<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
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

<section id="title_subject" class="larry-grid" style="width: 100%; ">
    <div class="larry-personal">
        <div class="layui-tab">
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                    <legend>第一步:请填写试卷信息</legend>
                </fieldset>
                <div style="margin: 0 auto;width: 400px;">
                    <form lay-filter="role-add" class="layui-form layui-form-pane" method="post">
                        <div class="layui-input-inline" style="margin-bottom: 15px">
                            <input type="text" hidden id="idAll">
                            <label class="layui-form-label" style="width: 100px;font-size: 14px">试卷名称</label>
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input style="width: 173px;" type="text" id="name" name=""
                                           autocomplete="off"
                                           placeholder="请输入试卷名称" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <br>

                        <%--<div class="layui-input-inline" style="margin-bottom: 15px">--%>
                            <%--<label class="layui-form-label" style="width: 100px;font-size: 14px">结束时间</label>--%>
                            <%--<div class="layui-inline">--%>
                                <%--<div class="layui-input-inline">--%>
                                    <%--<input style="width: 173px;" class="layui-input" id="time" placeholder="选择时间"--%>
                                           <%--onclick="layui.laydate({elem: this, istime: true,min: laydate.now(), format: 'YYYY-MM-DD hh:mm:ss'})">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<br>--%>

                        <%--<div class="layui-input-inline" style="margin-bottom: 15px">--%>
                            <%--<label class="layui-form-label" style="width: 100px;font-size: 14px">试卷总分</label>--%>
                            <%--<div class="layui-inline">--%>
                                <%--<div class="layui-input-inline">--%>
                                    <%--<input style="width: 173px;" type="number" id="score" name=""--%>
                                           <%--autocomplete="off"--%>
                                           <%--placeholder="请输入分数" class="layui-input">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<br>--%>

                        <%--<div class="layui-input-inline" style="margin-bottom: 15px">--%>
                            <%--<label class="layui-form-label" style="width: 100px;font-size: 14px">班课</label>--%>
                            <%--<div class="layui-inline">--%>
                                <%--<div class="layui-input-inline">--%>
                                    <%--<select name="classes_id" lay-verify="required" lay-search="" id="classes_id">--%>
                                        <%--<option value="0">班课</option>--%>

                                    <%--</select>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                    </form>
                    <button class="layui-btn" onclick="titleSubject()">下一步</button>
                </div>
            </div>
        </div>
    </div>
</section>
<div id="select_subject" hidden>
    <section class="larry-grid" style="width: 49% ;float: left">
        <div class="larry-personal">
            <div class="layui-tab">
                <div class="larry-separate"></div>
                <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                        <legend>第二步:选择题目</legend>
                    </fieldset>
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
                                    <a class="layui-btn" id="choseAll" onclick="_subject.chose()"><i
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
                                <th><input type="checkbox" name="selectAll" lay-skin="primary" lay-filter="allChoose" value=""></th>
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
                        <legend>第三步:创建试题</legend>
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
                                    class="layui-icon">&#xe602;</i>完成创建</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</div>
<div id="previewSubjectInfo" style="display: none;">
</div>
</body>
<script type="text/javascript">
    let _subject;
    let totalSize = 5;
    let currentIndex = 1;
    let pageSize = 10;
    let chapterLists = [];
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        //全选
        form.on('checkbox(allChoose)', function(data){
            var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
            child.each(function(index, item){
                item.checked = data.elem.checked;
            });
            form.render('checkbox');
        });
        //通过判断是否全部选中来确定全选按钮是否选中
        form.on('checkbox(itemChoose)',function(data) {
            var sib = $(data.elem).parents('table').find('tbody input[type="checkbox"]:checked').length;
            var total = $(data.elem).parents('table').find('tbody input[type="checkbox"]').length;
            if (sib == total) {
                $(data.elem).parents('table').find('thead input[type="checkbox"]').prop("checked", true);
                form.render();
            } else {
                $(data.elem).parents('table').find('thead input[type="checkbox"]').prop("checked", false);
                form.render();
            }
        })
        //批量选择试题
        $("#choseAll").click(function(){

            var child = $("#tab_1").find('tbody input[type="checkbox"]:checked');
            var $checkbox="";
            child.each(function(){
                $checkbox += $(this).attr("tbl")+",";
            })
            console.log($checkbox)
            if($checkbox.length !== 0){
                layer.confirm('确定选择选中的试题？',{icon:3, title:'提示信息'},function(index){
                    var index = layer.msg('正在选择中，请稍候',{icon: 16,time:false,shade:0.8});
                    setTimeout(function(){
                        //批量选择数据
                        $.post("${baseurl}/Testpaper/addTestpaperCursorAll", {
                            subjectId: $checkbox
                        }, function (data) {
                            layer.msg(data.msg);
                            _subject.page();
                            selectTestpaperCursor();
                        });
                       /* $('#testpaper li input[type="checkbox"],#selectAll').prop("checked",false);
                        form.render();
                        layer.close(index);
                        layer.msg("批量选择成功");*/
                    }/*,2000*/);
                })
            }else{
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
            chose: function () {

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
                let name = $("#name").val();
                // let closeTime = $("#time").val();
                // let score = $("#score").val();
                // var classes_id = $("select[name='classes_id']").val();

                if (name == "" ) {
                    layer.msg("试卷名称不能为空");
                } else {
                    <%--$.post("${baseurl}/Testpaper/selectTestpaperNameIs",--%>
                    //     {
                    //         name: name,
                    //         classesId: classes_id
                    //     }, function (isHave) {
                    //         if (isHave.data) {
                                $.post("${baseurl}/Testpaper/addTestpaperCursorToTestpaper", {
                                    subjectId: subjectId,
                                    name: name
                                    // score: score,
                                    // closeTime: closeTime,
                                    // classesId: classes_id
                                }, function (data) {
                                    layer.confirm(data.msg, function (index) {
                                        location.reload();
                                        layer.close(index);
                                    });
                                });
                            // } else {
                            //     layer.msg(isHave.msg);
                            // }
                        // });

                }
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
                    idAll.push(data.data[i].id);
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

    function titleSubject() {
        let subjectId = $("#idAll").val();
        let name = $("#name").val();
        // let closeTime = $("#time").val();
        // let score = $("#score").val();
        // var classes_id = $("select[name='classes_id']").val();
        // var classes_Name = $("select[name='classes_id']").find("option:selected").text();

        if (name == "" ) {
            layer.msg("试卷名称不能为空");
        } else {
            $(".name_1").html(name)
            // $(".time_1").html(closeTime)
            // $(".sum_1").html(score)
            // $(".class_2").html(classes_id)
            // $(".class_1").html(classes_Name)
            $("#title_subject").hide();
            $("#select_subject").show();
        }
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

        // document.getElementById('LAY_demorange_s').onclick = function () {
        //     start.elem = this;
        //     laydate(start);
        // }
        // document.getElementById('LAY_demorange_e').onclick = function () {
        //     end.elem = this
        //     laydate(end);
        // }

    });
</script>
</html>
