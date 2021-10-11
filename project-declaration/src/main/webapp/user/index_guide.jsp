<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf8" />
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>新闻</title>
    <meta name="keywords" content="郑州大学毕设-蒋文明" />
    <meta name="description" content="郑州大学毕设-蒋文明" />
    <meta name="robots" content="All" />
    <meta http-equiv="mobile-agent" content="format=html5;url=http://m.hnsrmyy.net/" />
    <noscript><meta http-equiv="refresh" content="0; url=/noscript.htm" /></noscript>
    <link rel="icon" href="favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="css/normalize.css" type="text/css" />
    <link rel="stylesheet" href="css/index.css" type="text/css" />
    <script language="javascript" type="text/javascript" src="js/KunyiHTML5.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/Kunyilibrary.js"></script>
</head>
<body style="background-color: #d7e8f1;">
<!--头部-->

<jsp:include page="commons_top.jsp"></jsp:include>
<%--<iframe src="commons_top.jsp" frameborder="0" style="width:100%;height: 220px;"></iframe>--%>

<!--内容-->
<%--新闻信息--%><br />
<table width="84%"  border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#AEDEF4">
    <tr>
        <td height="25" colspan="8" align="center" bgcolor="#FFF9DF">您好！${sessionScope.user.name},你正在查看新闻基本信息</td>
    </tr>

    <tr>
        <td colspan="8" align="left" bgcolor="#FFFFFF" class="t5">
            <div align="left" style="height: 430px; " ><img src="${pageContext.request.contextPath}/user/images/guide.jpg" width="100%" height="100%"/></div></td>
    </tr>


</table><br />


<!--脚部-->
<iframe src="commons_foot.jsp" frameborder="0" style="width:100%;height: 300px;"></iframe>
</body>
</html>