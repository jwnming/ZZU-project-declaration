<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      <td width="5%" height="25" align="center" bgcolor="#EFFBFE">ID</td>
      <td align="center" bgcolor="#EFFBFE">项目名称</td>
      <td align="center" bgcolor="#EFFBFE">项目类型 </td>
      <td align="center" bgcolor="#EFFBFE">申请经费(万)</td>
      <td align="center" bgcolor="#EFFBFE">提交时间</td>
      <td align="center" bgcolor="#EFFBFE">申报材料</td>
      <td align="center" bgcolor="#EFFBFE">状态</td>

    </tr>



    <c:forEach items="${sessionScope.userProjectList}" var="project">
      <tr onmouseout="this.style.backgroundColor='#ffffff'" bgcolor="#ffffff"  onmouseover="this.style.backgroundColor='#E6F2FF'"      >
        <td height="25" align="center"  >${project.id}</td>
        <td align="center" class="t5"><div align="left"><strong>${project.name}</strong></div></td>
        <td align="center">&nbsp;${project.category}</td>
        <td align="center">${project.funds}</td>
        <td align="center"><span style="color: #e68900;"><fmt:formatDate value="${project.declare_time}" pattern="yyyy年MM月dd日"/></span></td>
        <td align="center"><a href="${pageContext.request.contextPath}/documents/downloadDocument/${project.documents_id}">${project.documents_id}-下载</a></td>
        <c:if test="${project.status==0}">
          <td align="center" style="color: saddlebrown;">	  等待核实信息	  </td>
        </c:if>
        <c:if test="${project.status==1}">
          <td align="center" style="color: greenyellow;">	  审核通过	  </td>
        </c:if>
        <c:if test="${project.status==2}">
          <td align="center" style="color: red;">	  审核未通过	  </td>
        </c:if>
      </tr>

    </c:forEach>
	    <tr>
      <td height="25" bgcolor="#FFFFFF">&nbsp;</td>
      <td colspan="5" bgcolor="#FFFFFF">&nbsp;
	  <span class='pagelink'></span> <span class='pagelink'><button disabled="disabled"><-</button></span> <a class='pagelink' href='#?NowPage=1'><font color=green>[1]</font></a>  <span class='pagelink'><button disabled="disabled">-></button></span>
          <span class='pagelink'></span> <button disabled="disabled" style="margin-left: 30px;">转到</button>&nbsp;第&nbsp;<input id='JumpSelect' type='text' size='2' value='1'onBlur="javascript:if(isNaN(parseInt(this.value)) || parseInt(this.value) > 1){alert('您输入的数字只能在 1 ～ 1之间，请重新输入'); return false;}location.href='#" title='鼠标外部单击，文章转向'> 页	  </td>
      <td bgcolor="#FFFFFF"><form id="form2" name="form2" method="get" action="">
        <select name="applyyear" id="applyyear">
            <option value="" >全部</option></select>
      </form>  </td>
    </tr>
</table>

</body>
</html>
