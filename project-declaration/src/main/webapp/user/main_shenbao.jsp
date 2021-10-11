<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf8" />
        <meta name="renderer" content="webkit" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>郑州大学项目申报中心</title>
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

<c:if test="${sessionScope.user == null}"><br />
    <div style="height:350px;text-align:center;"><H2>您还没登录?</H2></div>
</c:if>
<c:if test="${sessionScope.user != null}">
<!--内容-->
<table align="center" style="background-color: #d7e8f1;">
    <tr>
        <!--左栏-->
        <td style="width:240px;height: 500px;background-color: #d7e8f1;">


            <!--项目申请按钮-->
            <div style="width:218px;height:31px;background-color:lightskyblue;margin:10px 0px 10px 10px;text-align: center;padding-top:10px;">
                <a href="project_form.jsp" target="jwnming" style="width:200px;height:34px;font-size:16px;"><img src="images/ico_003.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我&nbsp;&nbsp;要&nbsp;&nbsp;申&nbsp;&nbsp;报&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </div>
            <!--已申请列表-->
            <div style="width:218px;height:31px;background-color:lightskyblue;margin:10px 0px 10px 10px;text-align: center;padding-top:10px;">
                <a href="${pageContext.request.contextPath}/project/getAllProjectByUserId.do" target="jwnming" style="width:200px;height:34px;font-size:16px;"><img src="images/ico_003.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项&nbsp;&nbsp;目&nbsp;&nbsp;列&nbsp;&nbsp;表&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </div>
            <!--经费申请-->
           <%-- <div style="width:218px;height:31px;background-color:lightskyblue;margin:10px 0px 10px 10px;text-align: center;padding-top:10px;">
                <a href="project_founds.jsp" target="jwnming" style="width:200px;height:34px;font-size:16px;"><img src="images/ico_003.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;经&nbsp;&nbsp;费&nbsp;&nbsp;申&nbsp;&nbsp;请&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </div>--%>
            <!--设备采购-->
            <div style="width:218px;height:31px;background-color:lightskyblue;margin:10px 0px 10px 10px;text-align: center;padding-top:10px;">
                <a href="${pageContext.request.contextPath}/purchase/toAdd.do" target="jwnming" style="width:200px;height:34px;font-size:16px;"><img src="images/ico_003.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;设&nbsp;&nbsp;备&nbsp;&nbsp;采&nbsp;&nbsp;购&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </div>         
            <!--设备列表-->
            <div style="width:218px;height:31px;background-color:lightskyblue;margin:10px 0px 10px 10px;text-align: center;padding-top:10px;">
                <a href="${pageContext.request.contextPath}/purchase/getUserDevices.do" target="jwnming" style="width:200px;height:34px;font-size:16px;"><img src="images/ico_003.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;采&nbsp;&nbsp;购&nbsp;&nbsp;列&nbsp;&nbsp;表&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </div>

            <!--项目验收-->
            <div style="width:218px;height:31px;background-color:lightskyblue;margin:10px 0px 10px 10px;text-align: center;padding-top:10px;">
                <a href="${pageContext.request.contextPath}/purchase/getUserPassProjects.do" target="jwnming" style="width:200px;height:34px;font-size:16px;"><img src="images/ico_003.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项&nbsp;&nbsp;目&nbsp;&nbsp;验&nbsp;&nbsp;收&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </div>


            <!--个人信息-->
            <div style="width:218px;height:190px;background-color: #6bcbca;margin:10px 0px 10px 10px;text-align: center;padding-top:10px;">
                <table style="margin-left: 17px;">

                    <tr>
                        <td rowspan="3" colspan="2"><img src="${pageContext.request.contextPath}${sessionScope.user.picture}" style="width:50px;"/></td>
                        <td>姓名：</td>
                        <td>${sessionScope.user.name}</td>
                    </tr>
                    <tr>
                        <td>性别：</td>
                        <c:if test="${sessionScope.user.sex==1}">
                            <td>男</td>
                        </c:if>
                        <c:if test="${sessionScope.user.sex==0}">
                            <td>女</td>
                        </c:if>
                    </tr>
                    <tr>
                        <td>年龄：</td>
                        <td>${sessionScope.user.age}</td>
                    </tr>
                    <tr>
                        <td colspan="2">院系：</td>
                        <td colspan="2">${sessionScope.user.department}</td>

                    </tr>
                    <tr>
                        <td colspan="2">专业班级</td>
                        <td colspan="2">${sessionScope.user.level}${sessionScope.user.major}${sessionScope.user.clazz}</td>
                    </tr>
                    <tr>
                        <td colspan="4"><br /><br /></td>
                    </tr>
                    <tr>
                        <td colspan="4"><button><a href="${pageContext.request.contextPath}/user/user_form.jsp" target="jwnming">查看&修改个人信息</a></button></td>
                    </tr>
                </table>

            </div>
        </td>
         <!--右栏-->
        <td style="width:960px;height: 500px;background-color: #d7e8f1;padding-left:6px;">
            <iframe name="jwnming" src="default.jsp" style="width:100%;height:100%;" scrolling="no" frameborder="0">
            </iframe>
        </td>
    </tr>

</table>
</c:if>

<!--脚部-->
<iframe src="commons_foot.jsp" frameborder="0" style="width:100%;height: 300px;"></iframe>
</body>
</html>