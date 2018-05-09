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
<div id="view" style="text-align: center;" hidden>
    <form lay-filter="role-add" class="layui-form layui-form-pane" method="post">
        <br>
        <div class="layui-input-inline" style="margin-bottom: 15px">
            <label class="layui-form-label" style="width: 100px;font-size: 14px">结束时间</label>
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
    <button class="layui-btn" onclick="titleSubject()">确认</button>
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
                    console.log(data)
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
                                        <a class="layui-btn layui-btn-mini" onclick="addTestPaper(` + data.data[i].id + `,'` + data.data[i].name + `','` + data.data[i].subject_id + `','` + data.data[i].teacher_id + `')" >
                                            <i class="layui-icon">&#xe642;</i>
                                            布置作业
                                        </a>
                                    <a class="layui-btn layui-btn-mini" onclick="_subject.previewSubjectInfo(` + data.data[i].id + `)">
                                        <i class="layui-icon">&#xe602;</i>
                                        预览
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
        _subject = {}
        $(function () {
            _testPaper.page();
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

    function addTestPaper(id, name, suject_id, teacher_id) {
        layer.open({
            type: 1,
            title: "布置作业",
            area: ["50%", "50%"],
            skin: 'yourclass',
            content: $('#view')
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
