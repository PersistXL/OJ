<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../public/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
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

<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <form id="update-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
                <blockquote class="layui-elem-quote mylog-info-tit" style="height: 70px;">

                    <div class="layui-input-inline">
                        <div class="layui-inline">
                            <shiro:hasPermission name="moduleThree:update">
                                <a class="layui-btn" onclick="_subject.addsingleEntry()"><i class="layui-icon">&#xe621;</i>添加题库</a>
                            </shiro:hasPermission>
                        </div>
                    </div>

                </blockquote>
            </form>

            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">

                <div class="layui-form">
                    <table class="layui-table">

                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>题库</th>
                            <th>备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="subject_info">

                        </tbody>
                    </table>
                </div>
                <div id="demo7"></div>
            </div>
            <div id="demo1"></div>
        </div>
    </div>
</section>


<!-- 添加题库窗口 -->
<div id="addInfo" style="display: none;width: auto; margin-top: 20px;">
    <div>
        <form class="layui-form" action="">
            <div class="layui-form-item"  id="qbid">
                <label class="layui-form-label">题库编号：</label>
                <div class="layui-input-inline">
                    <label class="layui-form-label" name="qb_id"></label>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">题库名称：</label>
                <div class="layui-input-inline">
                    <textarea placeholder="题库名称" class="layui-textarea" name="qb_name"></textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">题库备注：</label>
                <div class="layui-input-inline" style="width: 50%">
                    <textarea placeholder="备注信息，可以为空" class="layui-textarea" name="qb_comment"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-inline " id="add">
                    <button class="layui-btn" onclick="_subject.addsingleEntryInfo()">提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
                <div class="layui-input-inline " id="update">
                    <button class="layui-btn" onclick="_subject.updateInfo_new()">更新</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
    </div>
</div>

</body>


<script type="text/javascript">
    var _subject;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;
        _subject = {


            page: function () {

                $.post("${baseurl}/subject/selectQuestions", function (data) {

                    _subject.paging();

                    var _html = "";
                    for (var i = 0; i < data.data.length; i++) {
                        _html += `<tr>
                            <td>` + (i+1) + `</td>
                            <td><span class = "hide_title">` + data.data[i].name + `</span></td>
                            <td>` + data.data[i].comment + `</td>
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
                    cont: 'demo1'
                    , pages: 100 //分页的总页数
                    , groups: 5 //连续显示分页数
                    , jump: function (obj, first) {
                        //得到了当前页，用于向服务端请求对应数据
                        var curr = obj.curr;
                    }
                });
            },


            addsingleEntry: function () {
                $("#update").hide();
                $("#add").show();
                $("#qbid").hide();

                layer.open({
                    type: 1,
                    title: '录入题库',
                    area: ['100%', '100%'],
                    skin: 'yourclass',
                    content: $('#addInfo')
                });
            },


            deleteSubjectInfo: function (id)
            {
                layer.confirm('是否删除信息？',
                    function (index)
                    {
                        $.post("${baseurl}/subject/deleteQbankById",
                            {id: id},
                            function (data)
                            {
                                layer.msg(data.msg);
                                location.reload();
                            }
                        );
                    layer.close(index);
                    });
            },


            updataInfo: function (id) {

                layui.use('form', function () {
                    var $ = layui.jquery, form = layui.form();
                    $.post("${baseurl}/subject/selectQbankById", {id: id}, function (data) {
                        $("#add").hide();
                        $("#update").show();
                        $("#qbid").show();


                        $("label[name='qb_id']").val(data.data.id);
                        $("textarea[name='qb_name']").val(data.data.name);
                        $("textarea[name='qb_comment']").val(data.data.comment);

                        layer.open({
                            type: 1,
                            title: '题库预览',
                            area: ['100%', '100%'],
                            skin: 'yourclass',
                            content: $('#addInfo')
                        });
                    });
                    form.render();

                });
            },


            updateInfo_new: function () {
                var qbid = $("label[name='qb_id']").val();
                var qbname = $("textarea[name='qb_name']").val();
                var qbcomment = $("textarea[name='qb_comment']").val();
                $.post("${baseurl}/subject/updateQbankById", {
                    qbid: qbid,
                    qbname: qbname,
                    qbcomment: qbcomment
                }, function (data) {
                    layer.msg(data.msg);
                });
            },



            addsingleEntryInfo: function ()
            {
                var qbname = $("textarea[name='qb_name']").val();
                var qbcomment = $("textarea[name='qb_comment']").val();
                $.post("${baseurl}/subject/addQbank",
                        {
                            qbname: qbname,
                            qbexplain: "placeholder",
                            qbcomment: qbcomment
                        },
                        function (data)
                        {
                            layer.msg(data.msg);
                        }
                    );
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
        });
    });


</script>

</html>
