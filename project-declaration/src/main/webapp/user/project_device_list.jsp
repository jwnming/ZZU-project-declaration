<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link  href="Css/layout.css" rel="stylesheet" type="text/css" />
<link href="Css/cb.css" rel="stylesheet" type="text/css"   />
<link  href="Css/n.css" rel="stylesheet" type="text/css" />
 
<script type="text/javascript" language="javascript" src="Scripts/common.js"></script>
 <script src="Scripts/date.js"  ></script>
 <style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
-->
 </style>
</head>

<body>

<br />
<form id="form1" name="form1" method="post" action="?action=save"><table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#AEDEF4">
  <tr>
    <td height="25" colspan="18" align="center" bgcolor="#D6F2FD"><input name="itemid" type="hidden" id="itemid" value="" />
      购买清单</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFF9DF">计划编号</td>
    <td align="center" bgcolor="#FFF9DF">设备名称</td>
    <td align="center" bgcolor="#FFF9DF">型号</td>
    <td align="center" bgcolor="#FFF9DF">  数量 </td>
    <td align="center" bgcolor="#FFF9DF">&nbsp;设备来源</td>
    <td align="center" bgcolor="#FFF9DF">经费来源</td>
    <td align="center" bgcolor="#FFF9DF">计划经费</td>
    <td align="center" bgcolor="#FFF9DF">支付总额</td>
    <td align="center" bgcolor="#FFF9DF">管理员验收时间</td>
    <td align="center" bgcolor="#FFF9DF">验收</td>
  </tr>

  <c:forEach items="${sessionScope.userDevices}" var="device">
    <tr onmouseout="this.style.backgroundColor='#ffffff'" bgcolor="#ffffff"  onmouseover="this.style.backgroundColor='#E6F2FF'">
      <td height="25" align="center" bgcolor="#FFF9DF">${device.device_id}</td>
      <td align="center" >${device.device_name}</td>
      <td align="center" >${device.model}</td>
      <td align="center" >  ${device.count} </td>
      <td align="center" >&nbsp;${device.source}</td>
      <td align="center" >校方审核经费</td>
      <td align="center" >${device.plan_expenditure}</td>
      <td align="center" >${device.total_payment}</td>
      <td align="center" >
        <c:if test="${device.device_status == 1}">
          <span style="color: #e68900;"><fmt:formatDate value="${device.arrival_time}" pattern="yyyy年MM月dd日"/></span>
        </c:if>
        <c:if test="${device.device_status == 0}">
          <span style="">---</span>
        </c:if>


       <%-- <fmt:parseDate value="${device.arrival_time}" var="releaseTime" pattern="yyyy-MM-dd"/>                <fmt:formatDate value="${releaseTime}" pattern="yyyy-MM-dd"/>

        <fmt:formatDate value="${releaseTime}" pattern="yyyy-MM-dd"/>--%>
      </td>
      <td align="center" >
        <c:if test="${device.device_status == 1}">
          <span style="color:greenyellow;">已验收</span>
        </c:if>
        <c:if test="${device.device_status == 0}">
          <span style="color:red;">未验收</span>
        </c:if>
        </td>
    </tr>
  </c:forEach>

  <tr></tr>
  <tr>
    <td height="25" bgcolor="#FFFFFF">&nbsp;</td>
    <td colspan="8" bgcolor="#FFFFFF">&nbsp;
      <span class='pagelink'></span> <span class='pagelink'><button disabled="disabled"><-</button></span> <a class='pagelink' href='#?NowPage=1'><font color=green>[1]</font></a>  <span class='pagelink'><button disabled="disabled">-></button></span>
      <span class='pagelink'></span> <button disabled="disabled" style="margin-left: 30px;">转到</button>&nbsp;第&nbsp;<input id='JumpSelect' type='text' size='2' value='1'onBlur="javascript:if(isNaN(parseInt(this.value)) || parseInt(this.value) > 1){alert('您输入的数字只能在 1 ～ 1之间，请重新输入'); return false;}location.href='#'" title='鼠标外部单击，文章转向'> 页	  </td>
    <td bgcolor="#FFFFFF"><form id="form2" name="form2" method="get" action="">
      <select name="applyyear" id="applyyear">
        <option value="" >全部</option></select>
    </form>  </td>
  </tr>

</table> 
</form>

</body>
</html>
