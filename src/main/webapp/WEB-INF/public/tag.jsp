<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="baseurl" value="<%=basePath%>"></c:set>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script>
    var baseUrl = "${baseurl}";
</script>