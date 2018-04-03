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
<div id="view" style="display: none;width: 90%;margin-left: 5%;margin-bottom: 50px" >

</div>

<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <div class="layui-collapse" lay-filter="test" style="margin-top:20px;" id="notice">


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
                $.post("${baseurl}/moduleOne/findTestpaper", function (data) {
                    console.log(data);
                    var _html ="";
                    for(var i = 0;i<data.data.length;i++){
                        var s = data.data[i].subject_id;
                        console.log(s)
                        var score=data.data[i].testpaper_student_score;
                        console.log(score)
                        if(score!=null)
                        {
                            score=score;
                            var q="";
                        }else{
                            score="未答题";
                            q="!";
                        }
                        var d2=new Date();
                        var d1=data.data[i].close_time;
                        if(d1>=d2){
                            var status = "开放";
                        }else{
                            status="已截止";
                        }
                        _html+=(`<div class="layui-colla-item" style="margin-bottom: 10px;"><h2 class="layui-colla-title">班课：`
                            +data.data[i].ClassName+`<span class="badge glyphicon glyphicon-bullhorn" style="margin-left: 50px; margin-top: -10px"><p style="color: #ff1631">`
                              +q
                                +`</p></span></h2>
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
                                                <th>测试名称</th>
                                                <th>题目数量</th>
                                                <th>成绩</th>
                                                <th>状态</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>

                                            <tbody id="test_questions">
                                            <tr>
                                                <td>`+data.data[i].name+`</td>
                                                <td>`+s.split("_").length+`</td>
                                                <td>`+score+`</td>
                                                <td>`+status+`</td>
                                                <td>
                                                    <a class="layui-btn  layui-btn-small layui-btn-normal " onclick="work(`+data.data[i].id +`)">
                                                        <i class="layui-icon">&#xe642;</i>答题</a>
                                                    <a class="layui-btn  layui-btn-small">
                                                        <i class="layui-icon">&#xe60a;</i>预览</a>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>`);
                    }
                    $("#notice").html(_html);


                    element.init();
                 });
        });
    });
    function work(id){
        $.post("${baseurl}/moduleOne/selectTestpaperById",{id : id}, function (data){
            console.log(data)
            var _html = "";
            for(var i=0;i<data.data.length;i++) {
                var subject = data.data[i].subject
                _html += (`<fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px;">
                                <legend>试题`+(i+1)+`：</legend>
                                <div class="layui-field-box">
                                    <b>题目：</b>
                                    <p>` + data.data[i].subject + `</p>
                                </div>`);
                                            if (data.data[i].subject_img !== '') {
                                                _html += (`<b style="margin-left: 17px">题目图片</b>
                                                    <div class="layui-field-box box">
                                    <img width="300px" height="300px" src="` + data.data[i].subject_img +`"/><br>
                                </div>`)
                                            }
                                            _html +=( `<div class="layui-field-box">
                                    <label><input type="radio" style="width: 10px;height: 10px;" name="`+data.data[i].id+`" id="a"> <b>选项A：</b></label>` + data.data[i].option_a + `
                                </div>
                                <div class="layui-field-box">

                                    <label><input type="radio" style="width: 10px;height: 10px;" name="`+data.data[i].id+`" id="b"> <b>选项B：</b></label>` + data.data[i].option_b + `
                                </div>
                                <div class="layui-field-box">

                                    <label><input type="radio" style="width: 10px;height: 10px;" name="`+data.data[i].id+`" id="c"><b>选项C：</b></label>` + data.data[i].option_c + `
                                </div>
                                <div class="layui-field-box">

                                    <label><b><input type="radio" style="width: 10px;height: 10px;" name="`+data.data[i].id+`" id="d">选项D：</b></label>` + data.data[i].option_d + `
                                </div>
                    </fieldset>`);
            }
            _html += `<input type="button" style="margin-left: 50%" value="交卷" class="layui-btn layui-btn-radius" onclick="examination_paper()">`
            $("#view").html(_html);
        });
        layer.open({
            type: 1,
            title:"在线答题",
            area:["100%","100%"],
            skin: 'yourclass',
            content: $('#view')
        });
    }
   function examination_paper(){
       alert(document.getElementsByName("id"))
    };
</script>
</body>
</html>
