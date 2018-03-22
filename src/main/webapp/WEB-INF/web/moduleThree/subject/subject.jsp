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
<body>

<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <shiro:hasPermission name="moduleThree:update">
                    <a class="layui-btn" onclick="addsingleEntry()"><i class="layui-icon">&#xe621;</i>单个录入</a>
                    <a class="layui-btn"><i class="layui-icon">&#xe61e;</i>Excel导入</a>
                </shiro:hasPermission>
                <div class="layui-form">
                    <table class="layui-table">
                        <colgroup>
                            <col width="70">
                            <col width="300">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="">
                            <col width="">
                            <col width="100">
                            <col width="300">
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
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>在Java中，负责对字节代码解释执行的是</td>
                            <td>应用服务器</td>
                            <td>垃圾回收器</td>
                            <td>编译器</td>
                            <td>虚拟机</td>
                            <td>B</td>
                            <td>2017-2018年度考试试题</td>
                            <td>第一章</td>
                            <td>简单</td>
                            <td>

                                <div class="layui-btn-group">
                                    <shiro:hasPermission name="moduleThree:update">
                                        <a class="layui-btn layui-btn-small">
                                            <i class="layui-icon">&#xe642;</i>
                                            编辑
                                        </a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="moduleThree:delete">
                                        <a class="layui-btn layui-btn-small">
                                            <i class="layui-icon">&#xe640;</i>
                                            删除
                                        </a>
                                    </shiro:hasPermission>
                                    <a class="layui-btn layui-btn-small">
                                        <i class="layui-icon">&#xe602;</i>
                                        预览
                                    </a>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div id="demo7"></div>
            </div>
            <div id="demo1"></div>
        </div>
    </div>
</section>
<div id="updatainfo" style="display: none;width: auto; margin-top: 20px;">
    <div>
        <form class="layui-form" action="">
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">题目：</label>
                <div class="layui-input-inline" style="width: 50%">
                    <textarea placeholder="请输入题目" class="layui-textarea" name="subject"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">选项A：</label>
                <div class="layui-input-inline">
                    <input name="option_a" required lay-verify="required" placeholder="请输入内容" autocomplete="off"
                           class="layui-input">
                </div>
                <label class="layui-form-label">选项B：</label>
                <div class="layui-input-inline">
                    <input name="option_b" required lay-verify="required" placeholder="请输入内容" autocomplete="off"
                           class="layui-input">
                </div>

                <label class="layui-form-label">选项C：</label>
                <div class="layui-input-inline">
                    <input name="option_c" required lay-verify="required" placeholder="请输入内容" autocomplete="off"
                           class="layui-input">
                </div>

                <label class="layui-form-label">选项D：</label>
                <div class="layui-input-inline">
                    <input name="option_d" required lay-verify="required" placeholder="请输入内容" autocomplete="off"
                           class="layui-input">
                </div>
                <label class="layui-form-label">正确选项：</label>
                <div class="layui-input-inline">
                    <select name="correct" lay-verify="required" lay-search="">
                        <option value="A">选项A</option>
                        <option value="B">选项B</option>
                        <option value="C">选项C</option>
                        <option value="D">选项D</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">题目图片：</label>
                <div class="layui-input-inline">
                    <div style="width:140px; height: 200px;border: 2px solid #e2e2e2;margin-bottom: 10px">
                        <img id="imagesToUpdate" class="head_image" style="width: 100%"
                             height="100%"/>
                    </div>
                    <div>
                        <input type="file" name="file" class="layui-upload-file" style="width: auto"
                               lay-title="题目图片">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">题库：</label>
                <div class="layui-input-inline">
                    <select name="questions_id" lay-verify="required" lay-search="" id="questions_id">
                        <option value="0">试题</option>

                    </select>
                </div>
                <label class="layui-form-label">章节：</label>
                <div class="layui-input-inline">
                    <input name="chapter" required lay-verify="required" placeholder="章节" autocomplete="off"
                           class="layui-input">
                </div>
                <label class="layui-form-label">难易度：</label>
                <div class="layui-input-inline">
                    <select name="facility" lay-verify="required" lay-search="">
                        <option value="简单">简单</option>
                        <option value="较易">较易</option>
                        <option value="一般">一般</option>
                        <option value="较难">较难</option>
                        <option value="困难">困难</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">备注：</label>
                <div class="layui-input-inline" style="width: 50%">
                    <textarea placeholder="备注信息：可以为空" class="layui-textarea" name="type"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <div class="layui-input-inline ">
                    <button class="layui-btn" onclick="addsingleEntryInfo()">立即提交
                    </button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
    </div>
</div>
</body>
<script>
    $(function () {
        layui.use('form', function () {
            var $ = layui.jquery, form = layui.form();

            //全选
            form.on('checkbox(allChoose)', function (data) {
                var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
                child.each(function (index, item) {
                    item.checked = data.elem.checked;
                });
                form.render('checkbox');
            });

            $.post("${baseurl}/subject/selectQuestions", function (data) {
                var _html = "";
                for (var i = 0; i <data.data.length; i++) {
                    _html += "<option value='" + data.data[i].id + "'>" + data.data[i].name + "</option>";
                }
                $("#questions_id").html(_html);
                form.render();
            });
        });

    });
    //分页
    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage
            , layer = layui.layer;

        laypage({
            cont: 'demo1'
            , pages: 100 //总页数
            , groups: 5 //连续显示分页数
        });
    });

    function addsingleEntry() {
        layer.open({
            type: 1,
            title: '录入题目',
            area: ['100%', '100%'],
            skin: 'yourclass',
            content: $('#updatainfo')
        });
    }

    function addsingleEntryInfo() {
       var subject = $("textarea[name='subject']").val();
       var option_a = $("input[name='option_a']").val();
       var option_b = $("input[name='option_b']").val();
       var option_c = $("input[name='option_c']").val();
       var option_d = $("input[name='option_d']").val();
       var correct = $("select[name='correct']").val();
        var imagesToUpdate = $("input[name='file']").val();
        var questions_id = $("select[name='questions_id']").val();
        var chapter = $("input[name='chapter']").val();
       var facility = $("select[name='facility']").val();
       var type = $("textarea[name='type']").val();
       $.post("${baseurl}/subject/addSubject",{
          subject: subject,
          optionA : option_a,
          optionB: option_b,
          optionC: option_c,
          optionD: option_d,
          correct: correct,
          subjectImg: imagesToUpdate,
          questionsId: questions_id,
          chapter: chapter,
          facility: facility,
          type: type
       },function (data) {
           layer.msg(data.msg);
       });

    }

    //图片上传
    layui.use('upload', function () {
        layui.upload({
            url: '${baseurl}/subject/updateImage' //上传接口
            , success: function (res) { //上传成功后的回调
                if (res.result) {
                    $("#imagesToUpdate").text("").attr("src", HEAD_IMAGE_PREFIX + res.data);
                    imgName = res.data;
                }
            }
        });
    });


</script>

</html>
