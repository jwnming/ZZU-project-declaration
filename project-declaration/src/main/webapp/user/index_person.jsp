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
        <td style="width:240px;height: 300px;background-color: #d7e8f1;">
            <!--负责人信息-->
            <div style="width:218px;height:31px;background-color:lightskyblue;margin:10px 0px 10px 10px;text-align: center;padding-top:10px;">
                <a href="${pageContext.request.contextPath}/user/getUserByIdExhibition/${sessionScope.getUserByIdExhibition.id}" style="width:200px;height:34px;font-size:16px;"><img src="images/ico_003.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;负&nbsp;&nbsp;责&nbsp;&nbsp;人&nbsp;&nbsp;信&nbsp;&nbsp;息</a>
            </div>
            <!--刷新-->
            <div style="width:218px;height:31px;background-color:lightskyblue;margin:10px 0px 10px 10px;text-align: center;padding-top:10px;">
                <a href="${pageContext.request.contextPath}/user/getUserByIdExhibition/${sessionScope.getUserByIdExhibition.id}" style="width:200px;height:34px;font-size:16px;"><img src="images/ico_003.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点&nbsp;&nbsp;击&nbsp;&nbsp;刷&nbsp;&nbsp;新&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </div>
            <div style="height: 190px;">

            </div>

        </td>
         <!--右栏-->
        <td style="width:960px;height: 300px;background-color: #d7e8f1;padding-left:6px; padding-bottom: 10px;padding-top: 20px;">

            <%--个人信息--%>
            <table width="99%" height="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#AEDEF4">
                <tr>
                    <td height="25" colspan="8" align="center" bgcolor="#FFF9DF">您好！${sessionScope.user.name},你正在查看优秀负责人个人基本信息</td>
                </tr>
                <tr>
                    <td colspan="2" rowspan="2" bgcolor="#FFF9DF" class="t5"><img src="${pageContext.request.contextPath}${sessionScope.getUserByIdExhibition.picture}" style="width:50px;margin-left:20px;"/></td>
                    <td align="left" colspan="6" bgcolor="#FFFFFF" class="t5">
                        <span style="color: #e68900;">注意：本信息是优秀项目负责人公开信息，请勿恶意传播！！</span>
                    </td>
                </tr>

                <tr>
                    <td height="25" align="center" bgcolor="#FFF9DF">姓名</td>
                    <td colspan="2" align="left" bgcolor="#FFFFFF" class="t5">
                        <div align="left"><input type="text" size="30" disabled="disabled" value="${sessionScope.getUserByIdExhibition.name}"/></div></td>
                    <td height="25" align="center" bgcolor="#FFF9DF">所在实验室</td>
                    <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
                        <div align="left"><input type="text" size="30" disabled="disabled" value="${sessionScope.getUserByIdExhibition.laboratory}"/></div></td>
                </tr>

                <tr>
                    <td height="25" align="center" bgcolor="#FFF9DF">性别</td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <select disabled="disabled" style="width:139px;">
                                <c:if test="${sessionScope.getUserByIdExhibition.sex ==1}">
                                    <option value=1">男</option>
                                    <option value=0">女</option>
                                </c:if>
                                <c:if test="${sessionScope.getUserByIdExhibition.sex==0}">
                                    <option value=1" >男</option>
                                    <option value=0" selected>女</option>
                                </c:if>

                            </select>
                        </div>
                    </td>
                    <td height="25" align="center" bgcolor="#FFF9DF">年龄</td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text" size="30" disabled="disabled" value="${sessionScope.getUserByIdExhibition.age}"/>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">年级</div></td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text" size="30" disabled="disabled" value="${sessionScope.getUserByIdExhibition.level}"/>
                        </div>
                    <td height="25" align="center" bgcolor="#FFF9DF">院系</td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text" size="30" disabled="disabled" value="${sessionScope.getUserByIdExhibition.department}"/>
                        </div>
                    </td>
                </tr>
                <tr>

                    <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">专业</div></td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text" size="30" disabled="disabled" value="${sessionScope.getUserByIdExhibition.major}"/>
                        </div>
                    <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">班级</div></td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text" size="30" disabled="disabled" value="${sessionScope.getUserByIdExhibition.clazz}"/>
                        </div>
                </tr>
                <tr>
                    <td width="10%" height="25" align="center" bgcolor="#FFF9DF">指导老师</td>
                    <td align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text"size="20" disabled="disabled" value="${sessionScope.getUserByIdExhibition.teacher.name}"/>
                        </div></td>
                    <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">职务</div></td>
                    <td align="center" bgcolor="#FFFFFF" class="t5"><div align="left">
                        <input type="text"size="20" disabled="disabled" value="${sessionScope.getUserByIdExhibition.teacher.job}"/>
                    </div></td>
                    <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">电话</div></td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text"size="20" disabled="disabled" value="${sessionScope.getUserByIdExhibition.teacher.mobile}"/>
                        </div></td>
                </tr>
                <tr>
                    <td width="10%" colspan="8" height="25" align="center" bgcolor="#FFF9DF">
                        &nbsp;
                    </td>

                </tr>
            </table>
        </td>
    </tr>

</table>


<!--脚部-->
<iframe src="commons_foot.jsp" frameborder="0" style="width:100%;height: 300px;"></iframe>
</body>
</html>