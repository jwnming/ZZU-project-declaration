<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

</head>

<body>
<!--项目列表-->
<br />

  <table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#AEDEF4" style="border:1px solid #AEDEF4">
    <tr>
      <td colspan="7"  height="25" align="center" bgcolor="#EFFBFE">项目列表</td>
    </tr>
    <tr>
      <td width="5%" height="25" align="center" bgcolor="#EFFBFE">编号</td>
      <td align="center" bgcolor="#EFFBFE">项目名称</td>
      <td align="center" bgcolor="#EFFBFE">项目类型 </td>
      <td align="center" bgcolor="#EFFBFE">申请经费(万)</td>
      <td align="center" bgcolor="#EFFBFE">提交时间</td>
      <td align="center" bgcolor="#EFFBFE">状态</td>
      <td align="center" bgcolor="#EFFBFE">操作</td>

    </tr>

    <c:forEach items="${sessionScope.userPassProjects}" var="project">
      <tr  onmouseout="this.style.backgroundColor='#ffffff'" bgcolor="#ffffff"  onmouseover="this.style.backgroundColor='#E6F2FF'"      >
        <td height="25" align="center"  >${project.id}</td>
        <td align="center" class="t5"><div align="left"><strong>${project.name}</strong></div></td>
        <td align="center">&nbsp;${project.category}</td>
        <td align="center">${project.funds}</td>
        <td align="center"><span style="color: #e68900;"><fmt:formatDate value="${project.declare_time}" pattern="yyyy年MM月dd日"/></span></td>
        <c:if test="${project.finished==0}">
          <td align="center" style="color: saddlebrown;">	  未完成	  </td>
        </c:if>
        <c:if test="${project.finished==1}">
          <td align="center" style="color: greenyellow;">	  已完成并交付	  </td>
        </c:if>
          <c:if test="${project.finished==2}">
              <td align="center" style="color: greenyellow;">	  待审核	  </td>
          </c:if>

        <%--<c:if test="${project.finished==2}">
          <td align="center" style="color: red;">	  验证未完成	  </td>
        </c:if>--%>
          <c:if test="${project.finished==0}">
              <td align="center"><a href="${pageContext.request.contextPath}/project/projectConfirm/${project.id}/2">项目完成申请验收</a></td>
          </c:if>

          <c:if test="${project.finished==2}">
              <td align="center" style="color: greenyellow;">	  已提交申请	  </td>
          </c:if>
          <c:if test="${project.finished==1}">
              <td align="center" style="color: greenyellow;">	  已完成并交付	  </td>
          </c:if>
      </tr>


    </c:forEach>

</table>
</body>
</html>
