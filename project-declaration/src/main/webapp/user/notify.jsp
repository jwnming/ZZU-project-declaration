<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />

</head>
<body>

    <table align="center">
        <tr>
            <c:if test="${sessionScope.user == null}">
                <td colspan="2">您还没登录！</td>
            </c:if>
            <c:if test="${sessionScope.user != null}">
                <td>系统提示：</td>
                <td>密码修改成功！！</td>
            </c:if>
        </tr>
    </table>


</body>
</html>