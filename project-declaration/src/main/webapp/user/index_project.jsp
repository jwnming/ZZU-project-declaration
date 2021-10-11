<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf8" />
        <meta name="renderer" content="webkit" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>优秀负责人</title>
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
<table align="center" style="background-color: #d7e8f1;">
    <tr>
        <!--左栏-->
        <td style="width:140px;height: 160px;background-color: #d7e8f1;">
            <!--负责人信息-->
            <div style="width:218px;height:31px;background-color:lightskyblue;margin:10px 0px 10px 10px;text-align: center;padding-top:10px;">
                <a href="${pageContext.request.contextPath}/user/getUserByIdExhibition/${sessionScope.getProjectByIdExhibition.user_id}" style="width:200px;height:34px;font-size:16px;"><img src="images/ico_003.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;负&nbsp;&nbsp;责&nbsp;&nbsp;人&nbsp;&nbsp;信&nbsp;&nbsp;息</a>
            </div>
            <!--刷新-->
            <div style="width:218px;height:31px;background-color:lightskyblue;margin:10px 0px 10px 10px;text-align: center;padding-top:10px;">
                <a href="${pageContext.request.contextPath}/project/getProjectByIdExhibition/${sessionScope.getProjectByIdExhibition.id}" style="width:200px;height:34px;font-size:16px;"><img src="images/ico_003.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点&nbsp;&nbsp;击&nbsp;&nbsp;刷&nbsp;&nbsp;新&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </div>
            <div style="height: 90px;"></div>


        </td>
         <!--右栏-->
        <td style="width:960px;height: 160px;background-color: #d7e8f1;padding-left:6px; padding-bottom: 100px;padding-top: 20px;">

            <%--个人信息--%>
            <table width="99%"  border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#AEDEF4">
                <tr>
                    <td height="25" colspan="8" align="center" bgcolor="#FFF9DF">您好！${sessionScope.user.name},你正在查看优秀项目基本信息</td>
                </tr>


                <tr>
                    <td height="25" align="center" bgcolor="#FFF9DF">项目名</td>
                    <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
                        <div align="left"><input type="text" size="30" disabled="disabled" value="${sessionScope.getProjectByIdExhibition.name}"/></div></td>
                    <td height="25" align="center" bgcolor="#FFF9DF">项目描述</td>
                    <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
                        <div align="left"><input type="text" size="30" disabled="disabled" value="${sessionScope.getProjectByIdExhibition.description}"/></div></td>
                </tr>
                <tr>
                    <td height="25" align="center" bgcolor="#FFF9DF">项目分类</td>
                    <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
                        <div align="left"><input type="text" size="30" disabled="disabled" value="${sessionScope.getProjectByIdExhibition.category}"/></div></td>
                    <td height="25" align="center" bgcolor="#FFF9DF">该项目负责人</td>
                    <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
                        <div align="left"><input type="text" size="30" disabled="disabled" value="${sessionScope.getProjectByIdExhibition.user_name}"/></div></td>
                </tr>


            </table>
        </td>
    </tr>

</table>


<!--脚部-->
<iframe src="commons_foot.jsp" frameborder="0" style="width:100%;height: 300px;"></iframe>
</body>
</html>