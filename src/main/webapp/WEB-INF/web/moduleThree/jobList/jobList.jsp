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
            $.post("${baseurl}/jobList/selectSubjectClassesName",function (data) {
                var _html =""
                for (var i =0;i<data.data.length;i++) {
                    teacherId = data.data[0].teacher_id

                    _html += (`<div class="layui-colla-item">
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
                                  <tbody id="studentMessage"></tbody>
                        `)
                    _html +=(`</table>
                       </div>
                    </div>`)
                    $("#jobList").html(_html);
                    element.init();
                }
            })
            //使用Ajax传值
           $.post("${baseurl}/jobList/selectSubject", function (data) {
                dataList = data.data
                testName = []
                console.log(data.data)
                var _html = "";
                for (var i =0;i<data.data.length;i++) {
                    var s = data.data[i].subject_id
                    var id = data.data[i].classes_id
                    var name = data.data[i].name
                                    _html +=(`<tr>
                                      <td style="text-align: center">` + data.data[i].name + `</td>
                                      <td style="text-align: center">`+ s.split("_").length+`</td>
                                      <td style="text-align: center">` + data.data[i].score + `</td>
                                      <td style="text-align: center">
                                      <a class="layui-btn  layui-btn-small layui-btn-normal " onclick="preview(`+id+`,'`+name+`')">
                                      <i class="layui-icon">&#xe623;</i>预览</a>
                                      </td>
                                    </tr>
                                `)

                }
                $("#studentMessage").html(_html);
                element.init();
            });
        });
    });
function preview(classesId,name) {
    $.post("${baseurl}/jobList/selectStudentTestpaper",
        {
            classesId ,
            name,
            teacherId
        },
        function (data) {
        var _html = "";
        _html +=(`<table class="layui-table">
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
        for(var i = 0; i<data.data.length;i++){
                _html += (`<tbody>
                <tr>
                  <td style="text-align: center">` + data.data[i].no + `</td>
                  <td style="text-align: center">` + data.data[i].studentName + `</td>
                  <td style="text-align: center">` + (data.data[i].testpaper_student_score ===undefined ? "未答题" : data.data[i].testpaper_student_score) + `</td>
                  <td style="text-align: center">`+(data.data[i].testpaper_student_score ===undefined ? "未提交" : "已提交")+`</td>
                </tr>
            </tbody>`)
    }
  _html +=(`</table>`)
        $("#previewAdd").html(_html);
    })
    layer.open({
        type: 1
        ,title : "预览作业情况"
        ,area: ["100%", "100%"]
        ,skin: 'yourclass'
        ,content: $("#previewAdd")
    });
}
</script>

</body>
</html>
