<%--  去 StuInfoController.java 中看接口代码  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/personal.css" media="all">
</head>
<body>
<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <blockquote class="layui-elem-quote mylog-info-tit">
                <ul class="layui-tab-title">
                    <li class="layui-btn " onclick="addStudent()"><i class="layui-icon">&#xe61f;</i>添加学生
                    </li>
                </ul>
            </blockquote>
        </div>
    </div>
</section>
<div id="addStudentInfo" style="margin: 10px;display: none">
    <form id="student-add" lay-filter="menu-add" class="layui-form layui-form-pane" method="post">
        <div class="layui-form-item" style="margin-left: 26%;margin-top: 4%">
            <label class="layui-form-label">学号(用户名)</label>
            <div class="layui-input-inline">
                <input type="text" name="no" required
                       placeholder="" autocomplete="off" class="layui-input ">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 26%">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required
                       placeholder="" autocomplete="off" class="layui-input ">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 26%">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <input type="text" name="gender" required
                       placeholder="" autocomplete="off" class="layui-input ">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 26%">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" required
                       placeholder="" autocomplete="off" class="layui-input ">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 26%">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline">
                <input type="text" name="email" required
                       placeholder="" autocomplete="off" class="layui-input ">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 24%">
            <div class="layui-input-block">
                <a class="layui-btn" onclick="addStudentAjax()">添加</a>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <!--
            <blockquote class="layui-elem-quote mylog-info-tit" style="height: 70px">
                <ul class="layui-tab-title">
                    <li class="layui-btn " onclick="sysUser.add()"><i class="layui-icon">&#xe61f;</i>添加教师
                    </li>
                </ul>
            </blockquote>
            <div class="larry-separate"></div>
            -->

            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <div class="layui-form ">
                    <table id="example" class="layui-table lay-even " data-name="articleCatData">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>用户名</th>
                            <th>名字</th>
                            <th>性别</th>
                            <th>邮箱</th>
                            <th>电话</th>
                            <th>UUID</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="list">
                        </tbody>
                    </table>
                </div>
                <div id="demo1"></div>
            </div>
        </div>
    </div>
</section>

<!-- 数据定义见 main\java\com.thoughtWorks\entity\Student.java -->
<script id="list-tpl" type="text/html">
    {{# layui.each(d, function(index, item){ }}
    <tr>
        <td>{{ index+1}}</td>
        <td>{{ item.no}}</td>
        <td>{{ item.name}}</td>
        <td>{{ item.gender}}</td>
        <td>{{ item.email}}</td>
        <td>{{ item.phone}}</td>
        <td>{{ item.uuid}}</td>
        {{ } }}
        <td>
            <button class="layui-btn layui-btn-mini " style="background: #21a1a1"
                    onclick="sysUser.update('{{item.id}}',`{{item.no}}`,'{{item.name}}','{{item.gender}}','{{item.email}}','{{item.phone}}')">
                <i class="layui-icon">&#xe642;</i>修改
            </button>
            <button class="layui-btn layui-btn-mini  layui-btn-danger" onclick="sysUser.delete('{{item.no}}')">
                <i class="layui-icon">&#xe60a;</i>删除
            </button>
        </td>
    </tr>
    {{# }); }}

</script>

<!--
<div id="add" style="margin: 10px;display: none">
    <form id="add-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width:120px;">工号</label>
            <div class="layui-input-inline" style="width:250px;">
                <input type="text" name="no" lay-verify="required"
                       placeholder="请输入工号" id="no-add" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width:120px;">名字</label>
            <div class="layui-input-inline" style="width:250px;">
                <input type="text" name="name"
                       placeholder="请输入名称" id="name-add" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width:120px;">性别</label>
            <div class="layui-input-inline" style="width:250px;">
                <input type="radio" name="gender" value="男" title="男">
                <input type="radio" name="gender" value="女" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width:120px;">电话</label>
            <div class="layui-input-inline" style="width:250px;">
                <input type="text" name="phone"
                       placeholder="请输入电话号码" id="phone-add" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width:120px;">邮箱</label>
            <div class="layui-input-inline" style="width:250px;">
                <input type="text" name="email"
                       placeholder="请输入邮箱" id="email-add" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <div>
                <div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width:120px;">部门</label>
                        <div class="layui-input-inline" style="width:250px;">
                            <select id="dept" name="deptId" lay-filter="department">
                                <option value="0">请选择一个部门</option>

                            </select>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <div class="layui-form-item" style="margin-top: 30px">

            <div class="layui-input-block">
                <a class="layui-btn" onclick="sysUser.addAjax()">立即提交</a>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
-->

<div id="update" style="margin: 10px;display: none">
    <form id="update-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
        <input type="text" name="id" id="update-id" style="display: none">
        <input type="text" name="no" id="no-update" style="display: none">
        <!--
        <div class="layui-form-item">
            <label class="layui-form-label" style="width:120px;">学号</label>
            <div class="layui-input-inline" style="width:250px;">
                <input type="text" name="no" lay-verify="required"
                       placeholder="请输入学号" id="no-update" autocomplete="off" class="layui-input" disabled>
            </div>
        </div>
        -->
        <div class="layui-form-item">
            <label class="layui-form-label" style="width:120px;">姓名</label>
            <div class="layui-input-inline" style="width:250px;">
                <input type="text" name="name"
                       placeholder="请输入姓名" id="name-update" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width:120px;">性别</label>
            <div class="layui-input-inline" style="width:250px;">
                <input type="radio" name="gender" value="男" title="男">
                <input type="radio" name="gender" value="女" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width:120px;">电话</label>
            <div class="layui-input-inline" style="width:250px;">
                <input type="text" name="phone"
                       placeholder="请输入电话号码" id="phone-update" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width:120px;">邮箱</label>
            <div class="layui-input-inline" style="width:250px;">
                <input type="text" name="email"
                       placeholder="请输入邮箱" id="email-update" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <!--
        <div class="layui-form-item">
            <div>
                <div id="show_dept">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width:120px;">UUID</label>
                        <div class="layui-input-inline" style="width:250px;">
                            <select id="uuid-update" name="deptId" lay-filter="uuid">
                                <option value="0">请选择一个部门</option>

                            </select>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        -->

        <div class="layui-form-item" style="margin-top: 30px">

            <div class="layui-input-block">
                <a class="layui-btn" onclick="sysUser.updateAjax()">确认修改</a>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script>
    let sysUser;
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    let searchInfo;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        sysUser = {
            page: function () {
                layui.laypage({
                    cont: 'demo1',
                    pages: totalSize, //总页数
                    curr: currentIndex,
                    last: totalSize,
                    groups: 5,//连续显示分页数
                    skin: '#1E9FFF',
                    jump: function (obj, first) {
                        currentIndex = obj.curr;
                        if (!first) {
                            sysUser.list();
                        }
                    }
                });
            },
            list: function () {
                searchInfo = {
                    currentIndex: currentIndex,
                    pageSize: pageSize
                };

                $.ajax({
                    url: baseUrl + "stuinfo/list",
                    type: "post",
                    data: searchInfo,
                    success: function (data) {
                        currentIndex = data.currentIndex;
                        totalSize = data.totalSize;
                        sysUser.page();
                        laytpl($("#list-tpl").text()).render(data.data, function (html) {
                            $("#list").html(html);
                        });
                        form.render();
                    }
                });
            },

            /*
            add: function () {
                layer.open({
                    type: 1,
                    title: '添加',
                    area: ["50%", "80%"]
                    , content: $("#add")
                });
            },


            addAjax: function () {
                let data = $("#add-form").serialize();

                $.post(baseUrl + "/sysUser/add", data, function (data) {
                    if (data.msg) {
                        layer.msg(data.msg);
                        setTimeout("location.reload();", 1000);

                    }
                })
            },
            */


            delete: function (no) {
                layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "/stuinfo/delete", {number: no}, function (data) {
                        if (data.result) {
                            layer.msg(data.msg);
                            setTimeout("location.reload();", 500);
                        }
                    })
                });
            },


            update: function (id,no,name,gender,email,phone) {

                $("#update-id").val(id);
                $("#no-update").val(no);
                $("#name-update").val(name);
                $("input:radio[value=" + gender + "]").prop('checked', 'true');
                $("#phone-update").val(phone);
                $("#email-update").val(email);

                form.render();

                layer.open({
                    type: 1,
                    title: '更新信息',
                    area: ["50%", "80%"]
                    , content: $("#update")
                });
            },
            updateAjax: function () {
                let data = $("#update-form").serialize();
                $.post(baseUrl + "/stuinfo/update", data, function (data) {
                    if (data.result) {
                        layer.msg(data.msg);
                        setTimeout("location.reload();", 1000);

                    }
                })
            }
        };

        $(function () {
            sysUser.list();
        })
    });
    function addStudent() {
        layer.open({
            type: 1,
            title: '添加学生',
            area: ['35%', '50%'],
            skin: 'yourclass',
            content: $('#addStudentInfo')
        });
    }
    function addStudentAjax() {
        let data = $("#student-add").serialize();
        $.post('${baseurl}/studentClass/studentRegister', data, (data) => {
                layer.msg(data.result);
                if (data.result) {
                    setTimeout('location.reload()', 500);
                }
            }
        )
    }
</script>

</body>
</html>