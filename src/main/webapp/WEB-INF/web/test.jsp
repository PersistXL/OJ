<%--
  Created by IntelliJ IDEA.
  User: 马欢欢
  Date: 2018/3/21
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <blockquote class="layui-elem-quote mylog-info-tit">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="text" name="title" lay-verify="title" autocomplete="off"
                               placeholder="姓名" class="layui-input">
                    </div>
                    <button class="layui-btn"><i class="layui-icon">&#xe615;</i>搜索</button>
                    <shiro:hasPermission name="moduleOne:add">
                        <ul class="layui-tab-title">
                            <li class="layui-btn " onclick="teacher.add()"><i class="layui-icon">&#xe61f;</i>添加教师
                            </li>
                        </ul>
                    </shiro:hasPermission>
                </div>
            </blockquote>
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <a class="layui-btn"><i class="layui-icon">&#xe621;</i>打印</a>
                <a class="layui-btn"><i class="layui-icon">&#xe61e;</i>导出</a>
                <div class="layui-form">
                    <table class="layui-table">
                        <colgroup>
                            <col width="50">
                            <col width="200">
                            <col width="200">
                            <col width="150">
                            <col width="200">
                            <col width="280">
                        </colgroup>

                        <thead>
                        <tr>
                            <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
                            <th>工号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>方向</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="checkbox" name="" lay-skin="primary"></td>
                            <td>1453265278</td>
                            <td>张老师</td>
                            <td>女</td>
                            <td>金融服务</td>
                            <td>
                                <shiro:hasPermission name="moduleOne:update">
                                    <a class="layui-btn  layui-btn-small layui-btn-normal"
                                       onclick="updataStudentinfo()"><i
                                            class="layui-icon">&#xe642;</i> 编辑</a>
                                </shiro:hasPermission>
                                <a class="layui-btn  layui-btn-small" onclick="studentInfoPreview()"><i
                                        class="layui-icon">&#xe60a;</i>预览</a>
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

<div id="updatainfo" style="display: none;width: auto;">
    <div>
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">工号</label>
                <div class="layui-input-inline">
                    <input name="password" required lay-verify="required" placeholder="学号" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">方向</label>
                <div class="layui-input-inline">
                    <select name="modules" lay-verify="required" lay-search="">
                        <option value="">方向</option>
                        <option value="1">金融方向</option>
                        <option value="1">电子信息技术</option>
                        <option value="2">软件服务</option>
                        <option value="3">酒店管理</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input name="password" required lay-verify="required" placeholder="姓名" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline">
                    <input name="date" lay-verify="required" placeholder="性别" autocomplete="off"
                           class="layui-input" type="text">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block " style="margin-left: 24%">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="InfoPreview" style="display: none;width: auto;">
    <div>
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">工号</label>
                <div class="layui-input-inline">
                    <input name="password" required lay-verify="required" placeholder="学号" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">方向</label>
                <div class="layui-input-inline">
                    <select name="modules" lay-verify="required" lay-search="">
                        <option value="">方向</option>
                        <option value="1">金融方向</option>
                        <option value="1">电子信息技术</option>
                        <option value="2">软件服务</option>
                        <option value="3">酒店管理</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input name="password" required lay-verify="required" placeholder="姓名" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline">
                    <input name="date" lay-verify="required" placeholder="性别" autocomplete="off"
                           class="layui-input" type="text">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block " style="margin-left: 24%">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
