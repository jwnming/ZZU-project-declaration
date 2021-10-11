<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<script>
	function gooo(id){
		if(id!=""){
		location.href='?x='+id;
		}
	}
	$(function () {


    })

function apply1(){
	var f=document.form1;
	if(f.name.value==""){
		alert('申请项目名不能为空');
		return false;
	}
	if(f.category.value==""){
		alert('请选择申请项目类型');
		return false;
	}
	if(f.description.value==""){
		alert('项目简介不能为空');
		return false;
	}
    if(f.funds.value==""){
        alert('经费申请不能为空');
        return false;
    }
    if(f.file.value==""){
        alert('申请文件不能为空');
        return false;
    }
    alert("请确认？")

}
</script>
</head>

<body>

      <%--个人信息--%>
      <table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#AEDEF4">
        <tr>
          <td height="25" colspan="8" align="center" bgcolor="#FFF9DF">申报者--基本信息</td>
        </tr>
        <tr>
          <td height="25" align="center" bgcolor="#FFF9DF">姓名</td>
          <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
            <div align="left"><input type="text" size="50" disabled="disabled" value="${sessionScope.user.name}"/></div></td>
          <td align="left" bgcolor="#FFF9DF" class="t5"><div align="center">手机号</div></td>
          <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
            <div align="left">
              <input type="text" size="50" disabled="disabled" value="${sessionScope.user.mobile}"/>
            </div></td>
          </td>
        </tr>
        <tr>
          <td height="25" align="center" bgcolor="#FFF9DF">年龄</td>
          <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
            <div align="left">
             <input type="text" size="50" disabled="disabled" value="${sessionScope.user.age}"/>
            </div>
           </td>
          <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">年级</div></td>
          <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
            <div align="left">
              <input type="text" size="50" disabled="disabled" value="${sessionScope.user.level}"/>
            </div>
        </tr>
        <tr>
          <td height="25" align="center" bgcolor="#FFF9DF">院系</td>
          <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
            <div align="left">
              <input type="text" size="50" disabled="disabled" value="${sessionScope.user.department}"/>
            </div>
          </td>
          <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">专业</div></td>
          <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
            <div align="left">
              <input type="text" size="50" disabled="disabled" value="${sessionScope.user.major}"/>
            </div>
        </tr>
        <tr>
          <td width="10%" height="25" align="center" bgcolor="#FFF9DF">指导老师</td>
          <td align="center" bgcolor="#FFFFFF" class="t5">
            <div align="left">
              <input type="text"size="20" disabled="disabled" value="${sessionScope.user.teacher.name}"/>
            </div></td>
          <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">职务</div></td>
          <td align="center" bgcolor="#FFFFFF" class="t5"><div align="left">
              <input type="text"size="20" disabled="disabled" value="${sessionScope.user.teacher.job}"/>
          </div></td>
          <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">电话</div></td>
          <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
            <div align="left">
                <input type="text"size="20" disabled="disabled" value="${sessionScope.user.teacher.mobile}"/>
            </div></td>
        </tr>
      </table>
      <%--项目信息--%>
        <form action="${pageContext.request.contextPath}/project/addProjectAndDocument.do" method="post" enctype="multipart/form-data" name="form1" id="form1" onsubmit="return apply1();">
          <table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#AEDEF4">
            <tr>
              <td height="25" colspan="8" align="center" bgcolor="#FFF9DF">项目申报--基本信息</td>
            </tr>
            <tr>
              <td height="25" align="center" bgcolor="#FFF9DF">项目名称</td>
              <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
                <div align="left"><input name="name" type="text" id="name" size="50" /><span style="color:red;">*</span></div></td>
              <td align="left" bgcolor="#FFF9DF" class="t5"><div align="center">经费来源</div></td>
              <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
                <select name="applyyear" id="applyyear" style="width:130px;">
                <option value="" >申请校方供给</option></select><span style="color:red;">*</span>（目前只支持校方审批经费）</td>
            </tr>
            <tr>
              <td height="25" align="center" bgcolor="#FFF9DF">项目类型</td>
              <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                <div align="left">
                  <select name="category" id="category" style="width:180px;">
                    <option value="">请选择...</option>
                    <c:forEach items="${sessionScope.category}" var="category">
                      <option value="${category.name}">${category.name}</option>
                      <%--<option value="2">实验室建设经费</option>
                      <option value="3">实验室软件项目</option>--%>
                    </c:forEach>
                  </select><span style="color:red;">*</span>(提交后不可修改)
                  </div></td>
              <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">审核后通知</div></td>
              <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                  <div align="left">
                      <input type="text" size="30" disabled="disabled" value="${sessionScope.user.email}"/>（申报人邮箱）
                  </div></td>
            </tr>

            <tr>
              <td height="25" align="center" bgcolor="#FFF9DF">备注简介</td>
              <td colspan="7" align="center" bgcolor="#FFFFFF" class="t5"><div align="left">
                <input name="description" type="text" id="description" size="110" /><span style="color:red;">*</span>
              </div></td>

            </tr>
              <tr>
                  <td width="10%" height="25" align="center" bgcolor="#FFF9DF">申报日期</td>
                  <td align="center" bgcolor="#FFFFFF" class="t5">
                      <div align="left">
                          <input value="当天日期" type="text" size="20"  disabled="disabled"/>
                      </div></td>
                  <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">审核状态</div></td>
                  <td align="center" bgcolor="#FFFFFF" class="t5"><div align="left">
                      <input  type="text" value="待审核" size="20" disabled="disabled"/>
                  </div></td>
                  <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">进度</div></td>
                  <td align="center" bgcolor="#FFFFFF" class="t5">
                      <div align="left">
                          <input type="text" size="12" disabled="disabled" value="未完成" />
                      </div></td>
                  <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">项目logo</div></td>
                  <td align="center" bgcolor="#FFFFFF" class="t5">
                      <div align="left">
                          <input type="text" size="12"  value="审核后修改" disabled="disabled"/>
                      </div></td>
              </tr>
          </table>

          <table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#AEDEF4">
            <tr>
              <td width="86" rowspan="2" align="center" bgcolor="#FFF9DF">申请经费</td>
              <td height="25" align="center" bgcolor="#FFF9DF">项目计划需求经费</td>
              <td height="25" align="center" bgcolor="#FFF9DF">项目匹配申请经费</td>
            </tr>
            <tr>
              <td height="25" align="center" bgcolor="#FFFFFF">金额
                <input type="text" value="0.00" disabled size="12" />
                （学生申请无需填写）</td>
              <td height="25" align="center" bgcolor="#FFFFFF">金额
                  <input name="funds" type="text" id="funds" oninput="value=value.replace(/[^\d]/g,'')" size="12" /><span style="color:red;">*</span>
                  （万）</td>
            </tr>
            <tr>
              <td height="30" align="center" bgcolor="#FFF9DF">附件1</td>
              <td height="25" colspan="2" align="left" bgcolor="#FFFFFF"  style="color:#999999; padding-left:5px;">
                <div align="left">
                  <input type="file" name="file" id="file" size="60"><span style="color:red;">*</span>
                  （<span class="STYLE1">申报材料ppt格式、word格式或rar压缩文件</span>）</div>
                <div align="left"></div></td>
            </tr>



            <tr>
              <td align="center" bgcolor="#FFF9DF">&nbsp;</td>
              <td height="25" colspan="2" align="left" bgcolor="#FFFFFF"  style="color:#999999; padding-left:20px;"><input type="submit" name="Submit" value="提交" size="20"/></td>
            </tr>
          </table>
        </form>
</body>
</html>
