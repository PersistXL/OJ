<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <title>ModuleOne</title>

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
<div id="view" style="display: none;width: 90%;margin-left: 5%;margin-bottom: 50px">

</div>

<div id="watchadd" style="display: none;width: 90%;margin-left: 5%;margin-bottom: 50px">

</div>

<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <div class="layui-collapse" lay-filter="test" style="margin-top:20px;" id="notice">
                    <h3>暂无</h3>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="${baseurl}/public/js/layui/layui.js" charset="utf-8"></script>
<script>
    //动态拼接测试题信息
    $(function () {

        layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree', 'layedit'], function () {
            window.jQuery = window.$ = layui.jquery;
            window.layer = layui.layer;

            var element = layui.element(),
                form = layui.form(),
                layedit = layui.layedit,
                laytpl = layui.laytpl;


            //全选
            form.on('checkbox(allChoose)', function (data) {
                var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
                child.each(function (index, item) {
                    item.checked = data.elem.checked;
                });
                form.render('checkbox');
            });
                $.post("${baseurl}/moduleOne/findTestpaperClasses", function (data1) {
                    var _html = ""
                    $.post("${baseurl}/moduleOne/findTestpaper", function (data) {
                        for (var i = 0; i < data1.data.length; i++) {
                            _html += (`<div class="layui-colla-item" style="margin-bottom: 10px;"><h3 class="layui-colla-title">班课：`
                                + data1.data[i].ClassesName + `</h3>
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
                                                <th style="text-align: center">测试名称</th>
                                                <th style="text-align: center">题目数量</th>
                                                <th style="text-align: center">成绩</th>
                                                <th style="text-align: center">状态</th>
                                                <th style="text-align: center">操作</th>
                                            </tr>
                                            </thead>`)
                            for (var j = data.data.length-1; j >=0 ; j--) {
                                StudentId = data.data[i].studentId
                                dataListObject = data.data[i].no
                                if ((data1.data[i].classes_id) === data.data[j].classes_id) {
                                    var s = data.data[j].subject_id;
                                        var score = data.data[j].studentScore;
                                    if (score != null) {
                                        score = score;
                                        var q = "";
                                    } else {
                                        score = "未答题";
                                        q = "!";
                                    }
                                    var d2 = new Date();
                                    var d1 = data.data[j].closeTime;
                                    if (d1 >= d2) {
                                        var status = "开放";
                                    } else {
                                        status = "已截止";
                                        var q = "";
                                    }
                                    _html += (`<tbody>
                        <tr>
                        <td style="text-align: center">` + data.data[j].name + `</td>
                            <td style="text-align: center">` + s.split("_").length + `</td>
                            <td style="text-align: center">` + score + `</td>
                            <td style="text-align: center">` + status + `</td>
                            <td style="text-align: center">`)
                                    if (data.data[j].studentScore == null && d1 >= d2) {
                                        _html += (`<a class="layui-btn  layui-btn-small layui-btn-normal " onclick="work(` + data.data[j].testpaperId + `)">
                            <i class="layui-icon">&#xe642;</i>答题</a>`)
                                    } else {
                                        _html += (`<a class="layui-btn  layui-btn-small" onclick="watch(` + data.data[j].testpaperId + `)">
                            <i class="layui-icon">&#xe60a;</i>预览</a>`)
                                    }
                                    _html += (`</td>
                        </tr>
                        </tbody>`)
                                }
                            }
                            _html += (`</table></div>
                                </div>
                            </div>`);
                        }
                        $("#notice").html(_html);
                        element.init();
                    })
                });

            });
        });

    function work(id) {
        $.post("${baseurl}/moduleOne/selectTestpaperById", {id: id}, function (data) {
            ID = id;
            testQuestions = data;
            totalScore = data.testpaper.score;
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
                                    <label><input type="radio" style="width: 10px;height: 10px;" name="` + data.data[i].id + `" value="A" class="checkboxA"> <b>选项A：</b></label>` + data.data[i].option_a + `
                                </div>
                                <div class="layui-field-box">

                                    <label><input type="radio" style="width: 10px;height: 10px;" name="` + data.data[i].id + `"  value="B" class="checkboxB"> <b>选项B：</b></label>` + data.data[i].option_b + `
                                </div>
                                <div class="layui-field-box">

                                    <label><input type="radio" style="width: 10px;height: 10px;" name="` + data.data[i].id + `"  value="C" class="checkboxC"><b>选项C：</b></label>` + data.data[i].option_c + `
                                </div>
                                <div class="layui-field-box">

                                    <label><b><input type="radio" style="width: 10px;height: 10px;" name="` + data.data[i].id + `"  value="D" class="checkboxD">选项D：</b></label>` + data.data[i].option_d + `
                                </div>`)

                if (data.data[i].subject_e === undefined) {

                                _html += (`<div class="layui-field-box">

                                    <label><b><input type="radio" style="width: 10px;height: 10px;" name="` + data.data[i].id + `"  value="E" class="checkboxD">选项E：</b></label>` + data.data[i].option_e + `
                                </div>`)
}
                    _html += (`</fieldset>`);
                }
            _html += `<input type="button" style="margin-left: 50%;margin-bottom: 25px;margin-top: 10px" value="交卷" class="layui-btn layui-btn-radius" onclick="examination_paper()">`
            $("#view").html(_html);
        });
        layer.open({
            type: 1,
            title: "在线答题",
            area: ["100%", "100%"],
            skin: 'yourclass',
            content: $('#view')
        });
    }

    function examination_paper() {
        // $(this).attr("disabled",true)
        let score = 0;  //未答题前成绩为0
        let checkBoxs = []; //自定义选项的数组
        var userName = dataListObject;
        for (var i = 0; i < testQuestions.data.length; i++) {
            checkBoxs.push($("input[name='" + testQuestions.data[i].id + "']:checked").val());
            if (testQuestions.data[i].correct == checkBoxs[i]) {
                score = score + (totalScore / testQuestions.data.length);
            } else {
                var falseid = testQuestions.data[i].id;
                //存储错题的id
                $.post("${baseurl}/wrongTitle/wrongTitleId",{subjectId : falseid,studentId : userName,wrongOptions : checkBoxs[i]},function (data) {

                });
            }
        }
        //存储成绩
        $.post("${baseurl}/moduleOne/inseretScore", {id: ID, testpaperStudentScore: score,studentId : StudentId}, function (data) {
            if (data.result) {
                layer.msg(data.msg);
                setTimeout("location.reload()", 500);
            }
        });
    };

    function watch(id) {
        $.post("${baseurl}/moduleOne/selectTestpaperById", {id: id}, function (data) {
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
                                </div>`)
                }
                _html += (`</fieldset>`);
            }
            $("#watchadd").html(_html);
        });
        layer.open({
            type: 1,
            title: "试题预览",
            area: ["100%", "100%"],
            skin: 'yourclass',
            content: $('#watchadd')
        });
    }

</script>
</body>
</html>
