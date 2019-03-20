<%--
  Created by IntelliJ IDEA.
  User: Persist
  Date: 2018/4/3
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <title>错题本</title>
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
</style>
<body>
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
<div id="watchWrongTitle" style="display:none;width: 90%;margin-left: 5%;margin-bottom: 50px">

</div>
<%--<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">

                <div class="layui-form">
                    <table class="layui-table">
                        <colgroup>
                            <col width="60">
                            <col width="210">
                            <col width="110">
                            <col width="110">
                            <col width="110">
                            <col width="110">
                            <col width="110">
                            <col width="110">
                            &lt;%&ndash;<col width="100">&ndash;%&gt;
                            <col width="110">
                            <col width="110">
                            <col width="230">
                        </colgroup>

                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>题目</th>
                            <th>选项A</th>
                            <th>选项B</th>
                            <th>选项C</th>
                            <th>选项D</th>
                            <th>选项E</th>
                            <th>正确选项</th>
                            &lt;%&ndash;<th>题库</th>&ndash;%&gt;
                            <th>知识点</th>
                            <th>难易度</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="wrongTitle">

                        </tbody>
                    </table>
                </div>
                <div id="demo7"></div>
            </div>
            <div id="demo1"></div>
        </div>
    </div>
</section>--%>
<script src="${baseurl}/public/js/layui/layui.js" charset="utf-8"></script>
<script>
    //动态拼接错题信息
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
                _html = ""
                $.post("${baseurl}/wrongTitle/selectStudentId", function (data2) {
                    stu = data2.data
                    $.post("${baseurl}/wrongTitle/selectWrongTitleNo",{stu:stu}, function (data) {
                        var dataList = data.data.testPaperList;
                        userName = data.data.user.userName
                        dataList1 = dataList;
                for (var j = 0; j < data1.data.length; j++) {
                    if (data1.data[j].ClassesName==null) {
                        ClassesName = "未加入班课";
                    }else {
                        ClassesName = data1.data[j].ClassesName
                    }
                    var num = 1;
                    _html += (`<div class="layui-colla-item" style="margin-bottom: 10px;"><h3 class="layui-colla-title">班课：`
                        + ClassesName + `</h3><div class="layui-colla-content">
                                    <div class="layui-form">
                                        <table class="layui-table">
                                            <colgroup>
                            <col width="60">
                            <col width="210">
                            <col width="110">
                            <col width="110">
                            <col width="110">
                            <col width="110">
                            <col width="110">
                            <col width="110">
                            <%--<col width="100">--%>
                            <col width="110">
                            <col width="110">
                            <col width="230">
                        </colgroup>

                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>题目</th>
                            <th>选项A</th>
                            <th>选项B</th>
                            <th>选项C</th>
                            <th>选项D</th>
                            <th>选项E</th>
                            <th>正确选项</th>
                            <%--<th>题库</th>--%>
                            <th>知识点</th>
                            <th>难易度</th>
                            <th>操作</th>
                        </tr>
                        </thead><tbody>`)
                        for (let i = dataList.length-1; i >= 0 ; i--) {
                            if (dataList[i].classes_id === data1.data[j].classes_id) {
                                _html += `<tr>
                            <td>` + (num++) + `</td>
                            <td ><span class = "hide_title">` + dataList[i].subject + `</span></td>
                            <td><span class = "hide_title">` + dataList[i].option_a + `</span></td>
                            <td><span class = "hide_title">` + dataList[i].option_b + `</span></td>
                            <td><span class = "hide_title">` + dataList[i].option_c + `</span></td>
                            <td><span class = "hide_title">` + dataList[i].option_d + `</span></td>
                            <td><span class = "hide_title">` + dataList[i].option_e + `</span></td>
                            <td>` + dataList[i].correct + `</td>
                            <!--<td><span class = "hide_title">` + dataList[i].questionsName + `</span></td>-->
                            <td ><span class = "hide_title">` + dataList[i].chapter + `</span></td>
                            <td>` + (dataList[i].facility === undefined ? "暂无" : dataList[i].facility) + `</td>
                            <td>

                                <div class="layui-btn-group">

                                        <a class="layui-btn layui-btn-mini" onclick="deleteWrongTitle(` + dataList[i].id + `)">
                                            <i class="layui-icon">&#xe640;</i>
                                            删除
                                        </a>
                                    <a class="layui-btn layui-btn-mini" onclick="previewWrongTitle(` + dataList[i].id + `,'`+dataList[i].classes_id+`')">
                                        <i class="layui-icon">&#xe602;</i>
                                        预览
                                    </a>
                                </div>
                            </td>
                        </tr>`
                            }

                        }
                        _html+=`</tbody></table></div></div></div>`
                        }
                        $("#notice").html(_html);
                        element.init();
                    });

                })
            });


        })
    });

    function deleteWrongTitle(id) {
        layer.confirm('是否删除信息？', function (index) {
            $.post("${baseurl}/wrongTitle/deleteWrongTitle", {id: id,stu:stu}, function (data) {
                layer.msg(data.msg);
                location.reload();
            });
            layer.close(index);
        });
    }

    function previewWrongTitle(id,classes_id) {
        var _html = "";
        var num = 1
        for (var i = 0; i < dataList1.length; i++) {
            if(dataList1[i].classes_id == classes_id) {
                _html += (`<fieldset class="layui-elem-field site-demo-button checkboxAll" style="margin-top: 30px;">
    <legend>试题` + (num++) + `：</legend>
    <div class="layui-field-box">
    <b>题目：</b>
    <p>` + dataList1[i].subject + `</p>
    </div>`);
                if (dataList1[i].subject_img !== undefined) {
                    _html += (`<b style="margin-left: 12px">题目图片</b>
    <div class="layui-field-box box">
    <img width="300px" height="300px" src="` + dataList1[i].subject_img + `"/><br>
    </div>`)
                }
                _html += (`<div class="layui-field-box">
    <label><b>选项A：</b></label>` + dataList1[i].option_a + `
    </div>
    <div class="layui-field-box">

    <label><b>选项B：</b></label>` + dataList1[i].option_b + `
    </div>
    <div class="layui-field-box">

    <label><b>选项C：</b></label>` + dataList1[i].option_c + `
    </div>
    <div class="layui-field-box">

    <label><b>选项D：</b></label>` + dataList1[i].option_d + `
    </div>`)

                if (dataList1[i].subject_e === undefined) {

                    _html += (`<div class="layui-field-box">

    <label><b>选项E：</b></label>` + dataList1[i].option_e + `
    </div>

    <div class="layui-field-box">

    <label><b>正确答案：</b></label>` + dataList1[i].correct + `
    </div>`)
                }
                _html += (`</fieldset>`);
            }
        }
        layer.open({
            type: 1,
            title: "查看错题",
            area: ["100%", "100%"],
            skin: 'yourclass',
            content: $('#watchWrongTitle')
        });
        $("#watchWrongTitle").html(_html);
    }
</script>

</body>
</html>
