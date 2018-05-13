<%--
  Created by IntelliJ IDEA.
  User: Persist
  Date: 2018/4/10
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <title>作业列表</title>
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
<div id="previewAdd" style="display: none;width: 90%;margin-left: 5%;margin-bottom: 50px">

</div>
<div id="analysisPreview" style="display: none;width: 90%;margin-left: 5%;margin-bottom: 50px">
    
</div>
<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <div class="layui-collapse" lay-accordion="" style="margin-top: 10px" id="jobList">
                    <h4>暂无</h4>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    //动态拼接教师端作业列表
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

            //使用Ajax传值

            //查询班课的名称
            $.post("${baseurl}/jobList/selectSubjectClassesName", function (data) {
                var _html = ""
                $.post("${baseurl}/jobList/selectSubject", function (data1) {
                    for (var i = 0; i < data.data.length; i++) {
                        teacherId = data1.data[0].teacher_id
                        classId = data.data[i].clID
                        _html += `<div class="layui-colla-item">
                        <h2 class="layui-colla-title" style="margin-bottom: 10px">班课：` + data.data[i].ClassesName + `</h2>
                        <div class="layui-colla-content">
                        <table class="layui-table">
                                  <colgroup>
                                    <col width="200">
                                    <col width="200">
                                    <col width="200">
                                    <col width="200">
                                  </colgroup>
                                  <thead>
                                    <tr>
                                      <th style="text-align: center">测试名称</th>
                                      <th style="text-align: center">题目数量</th>
                                      <th style="text-align: center">试卷成绩</th>
                                      <th style="text-align: center">相关操作</th>
                                    </tr>
                                  </thead>
                                  <tbody id="studentMessage">`
                        for (var j = data1.data.length-1; j >=0 ; j--) {
                            var s = data1.data[j].subject_id
                            var classesId = data1.data[j].classes_id
                            testPaperId = data1.data[j].testPaperId
                            subjectId = data1.data[j].subject_id
                            if (classId === data1.data[j].classes_id) {
                                _html += (`<tr>
                                      <td style="text-align: center">` + data1.data[j].name + `</td>
                                      <td style="text-align: center">` + s.split("_").length + `</td>
                                      <td style="text-align: center">` + data1.data[j].score + `</td>
                                      <td style="text-align: center">
                                      <a class="layui-btn  layui-btn-small layui-btn-normal " onclick="preview(` + classesId + `,'` + testPaperId + `')">
                                      <i class="layui-icon">&#xe623;</i>预览</a>
                                      <a class="layui-btn  layui-btn-small layui-btn-normal " onclick="analysis(` + classesId + `,'` + testPaperId + `','`+subjectId+`')">
                                      <i class="layui-icon">&#xe623;</i>分析</a>
                                      </td>
                                    </tr>
                                `)
                            }
                        }
                        _html += `</tbody></table>
                       </div>
                    </div>`
                        $("#jobList").html(_html);
                        element.init();
                    }
                });
            })
            //查询教师对应的试卷的信息

        });
    });

    function preview(classesId, testPaperId) {
        $.post("${baseurl}/jobList/selectStudentTestpaper",
            {
                classesId : classesId,
                testPaperId : testPaperId,
                teacherId : teacherId
            },
            function (data) {
                var _html = "";
                _html += (`<table class="layui-table">
                      <colgroup>
                        <col width="150">
                        <col width="150">
                        <col width="200">
                        <col width="150">
                      </colgroup>
                      <thead>
                        <tr>
                          <th style="text-align: center">学生学号</th>
                          <th style="text-align: center">学生姓名</th>
                          <th style="text-align: center">成绩</th>
                          <th style="text-align: center">状态</th>
                        </tr>
                      </thead>`)
                for (var i = 0; i < data.data.length; i++) {
                    _html += (`<tbody>
                <tr>
                  <td style="text-align: center">` + data.data[i].no + `</td>
                  <td style="text-align: center">` + data.data[i].studentName + `</td>
                  <td style="text-align: center">` + (data.data[i].testpaper_student_score === undefined ? "未答题" : data.data[i].testpaper_student_score) + `</td>
                  <td style="text-align: center">` + (data.data[i].testpaper_student_score === undefined ? "未提交" : "已提交") + `</td>
                </tr>
            </tbody>`)
                }
                _html += (`</table>`)
                $("#previewAdd").html(_html);
            });
        layer.open({
            type: 1
            , title: "预览作业情况"
            , area: ["100%", "100%"]
            , skin: 'yourclass'
            , content: $("#previewAdd")
        });
    }
    function analysis(classesId,testPaperId,subjectId) {
        $.post("${baseurl}/jobList/analysisPreview",{classesId,testPaperId},function (data1) {
            $.post("${baseurl}/jobList/selectSubjectName",{subjectId},function (data){
                $.post("${baseurl}/jobList/wrongMessage",{classesId,subjectId},function (data2) {
                    var _html = "";
                    _html += (`<table class="layui-table">
                      <colgroup>
                        <col width="60">
                        <col width="200">
                        <col width="100">
                        <col width="100">
                        <col width="100">
                        <col width="100">
                      </colgroup>
                      <thead>
                        <tr>
                          <th style="text-align: center">编号</th>
                          <th style="text-align: center">试题名称</th>
                          <th style="text-align: center">作答人数</th>
                          <th style="text-align: center">答错人数</th>
                          <th style="text-align: center">最多错误选项</th>
                          <th style="text-align: center">错误率</th>
                        </tr>
                      </thead>`)
                    for (var i = 0; i < data.data.length; i++) {
                        var num = 0;
                        var count = new Array(5);
                        count[0] = 0;
                        count[1] = 0;
                        count[2] = 0;
                        count[3] = 0;
                        count[4] = 0;

                        for (var m = 0; m <data2.data.length; m++) {
                            if (data.data[i].subjectId == data2.data[m].subject_id) {
                                num += 1;
                                if (data2.data[m].wrong_options == "A") {
                                    count[0] +=1;
                                }else if (data2.data[m].wrong_options == "B") {
                                    count[1] +=1;
                                }else if (data2.data[m].wrong_options == "C") {
                                    count[2] +=1;
                                }else if (data2.data[m].wrong_options == "D") {
                                    count[3] +=1;
                                }else if (data2.data[m].wrong_options == "E") {
                                    count[4] +=1;
                                }
                            }
                        }
                        let max = 0;
                        let index = -1;
                        for (let i = 0; i < count.length ; i++) {
                            if(count[i] >= max){
                                max = count[i]
                                index = i;
                            }
                        }
                        var chose = ""
                        switch(index)
                        {
                            case 0:
                                chose = "A"
                                break;
                            case 1:
                                chose = "B"
                                break;
                             case 2:
                                chose = "C"
                                break;
                             case 3:
                                chose = "D"
                                break;
                             case 4:
                                chose = "E"
                                break;

                            default:
                                chose = "无"
                        }
                        var errorRate = ""
                        if (num == 0){
                            errorRate = "0"
                        }else{
                            errorRate = (num / (data1.data)).toFixed(2);
                        }
                        _html += (`<tbody>
                <tr>
                  <td style="text-align: center">` + (i + 1) + `</td>
                  <td style="text-align: center">` + data.data[i].subject + `</td>
                  <td style="text-align: center">` + data1.data + `</td>
                  <td style="text-align: center">` + num + `</td>
                  <td style="text-align: center">` + chose + `</td>
                  <td style="text-align: center">` + errorRate + `</td>
                </tr>
            </tbody>`)
                    }
                    _html += (`</table>`)
                    $("#analysisPreview").html(_html);
                })
            })
        })
        layer.open({
            type: 1
            , title: "错题情况预览"
            , area: ["100%", "100%"]
            , skin: 'yourclass'
            , content: $("#analysisPreview")
        });
    }
</script>

</body>
</html>
