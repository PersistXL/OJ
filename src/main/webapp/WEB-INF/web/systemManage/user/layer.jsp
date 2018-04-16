<%--
  Created by IntelliJ IDEA.
  User: mlw
  Date: 18-4-16
  Time: 上午9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script id="list-tpl" type="text/html">
    {{# layui.each(d, function(index, item){ }}
    <tr>
        <td>{{ index+1}}</td>
        <td>{{ item.no}}</td>
        <td>{{ item.name}}</td>
        <td>{{ item.gender}}</td>
        <td>{{ item.email}}</td>
        <td>{{ item.phone}}</td>
        <td>{{ item.department}}</td>
        {{ } }}
        <td>
            <button class="layui-btn layui-btn-mini " style="background: #21a1a1"
                    onclick="sysUser.update('{{item.id}}',`{{item.identityCard}}`,'{{item.departmentId}}','{{item.directionId}}','{{item.name}}','{{item.gender}}','{{ item.classify}}','{{item.deptId}}')">
                <i class="layui-icon">&#xe642;</i>修改
            </button>
            <button class="layui-btn layui-btn-mini  layui-btn-danger" onclick="sysUser.delete('{{item.phone}}')">
                <i class="layui-icon">&#xe60a;</i>删除
            </button>
        </td>
    </tr>
    {{# }); }}

</script>

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
                       placeholder="请输入身份证" id="phone-add" autocomplete="off" class="layui-input ">
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
                <div id="show_dept">
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