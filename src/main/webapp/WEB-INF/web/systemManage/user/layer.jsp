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
                    onclick="teacher.update('{{item.no}}',`{{item.identityCard}}`,'{{item.departmentId}}','{{item.directionId}}','{{item.name}}','{{item.gender}}','{{ item.classify}}','{{item.deptId}}')">
                <i class="layui-icon">&#xe642;</i>修改
            </button>
            <button class="layui-btn layui-btn-mini  layui-btn-danger" onclick="teacher.delete('{{item.no}}')">
                <i class="layui-icon">&#xe60a;</i>删除
            </button>
        </td>
    </tr>
    {{# }); }}

</script>