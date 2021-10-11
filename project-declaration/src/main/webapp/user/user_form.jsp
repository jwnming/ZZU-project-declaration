<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
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

function tijiao(){
	var f=document.userForm;

    if(f.password.value==""){
        alert('密码不能为空！');
        return false;
    }
    alert("请确认？")

}
</script>
</head>

<body>

    <br /><br />
        <form action="${pageContext.request.contextPath}/user/userChangePssword.do" method="post" enctype="multipart/form-data" name="userForm" id="userForm" onsubmit="return tijiao();">
                <%--个人信息--%>
            <table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#AEDEF4">
                <tr>
                    <td height="25" colspan="8" align="center" bgcolor="#FFF9DF">您好！${sessionScope.user.name},你可以修改个人基本信息</td>
                </tr>
                <tr>
                    <td colspan="2" rowspan="2" bgcolor="#FFF9DF" class="t5"><img src="${pageContext.request.contextPath}${sessionScope.user.picture}" style="width:50px;margin-left:20px;"/></td>
                    <td align="left" colspan="6" bgcolor="#FFFFFF" class="t5">
                        <span style="color: #e68900;">注意：暂时只能修改登录密码，如需修改个人信息，请联系管理员！！</span>
                    </td>
                </tr>

                <tr>
                    <td height="25" align="center" bgcolor="#FFF9DF">姓名</td>
                    <td colspan="2" align="left" bgcolor="#FFFFFF" class="t5">
                        <div align="left"><input type="text" size="30" disabled="disabled" value="${sessionScope.user.name}"/></div></td>
                    <td align="left" bgcolor="#FFF9DF" class="t5"><div align="center">手机号</div></td>
                    <td colspan="2" align="left" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text" size="30" disabled="disabled" value="${sessionScope.user.mobile}"/>
                        </div></td>
                    </td>
                </tr>
                <tr>
                    <td height="25" align="center" bgcolor="#FFF9DF">所在实验室</td>
                    <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
                        <div align="left"><input type="text" size="30" disabled="disabled" value="${sessionScope.user.laboratory}"/></div></td>
                    <td align="left" bgcolor="#FFF9DF" class="t5"><div align="center">登录密码</div></td>
                    <td colspan="3" align="left" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="password" size="30" name="password" id="password" value="${sessionScope.user.password}"/>
                        </div></td>
                    </td>
                </tr>
                <tr>
                    <td height="25" align="center" bgcolor="#FFF9DF">性别</td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <select disabled="disabled" style="width:139px;">
                                <c:if test="${sessionScope.user.sex ==1}">
                                    <option value=1">男</option>
                                    <option value=0">女</option>
                                </c:if>
                                <c:if test="${sessionScope.user.sex==0}">
                                    <option value=1" >男</option>
                                    <option value=0" selected>女</option>
                                </c:if>

                            </select>
                        </div>
                    </td>
                    <td height="25" align="center" bgcolor="#FFF9DF">年龄</td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text" size="30" disabled="disabled" value="${sessionScope.user.age}"/>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">年级</div></td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text" size="30" disabled="disabled" value="${sessionScope.user.level}"/>
                        </div>
                    <td height="25" align="center" bgcolor="#FFF9DF">院系</td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text" size="30" disabled="disabled" value="${sessionScope.user.department}"/>
                        </div>
                    </td>
                </tr>
                <tr>

                    <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">专业</div></td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text" size="30" disabled="disabled" value="${sessionScope.user.major}"/>
                        </div>
                    <td align="center" bgcolor="#FFF9DF" class="t5"><div align="center">班级</div></td>
                    <td colspan="3" align="center" bgcolor="#FFFFFF" class="t5">
                        <div align="left">
                            <input type="text" size="30" disabled="disabled" value="${sessionScope.user.level}"/>
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
                <tr>

                    <td width="10%" colspan="8" height="25" align="center" bgcolor="#FFF9DF">
                        <input type="submit" value="提交保存密码" />
                    </td>

                </tr>
            </table>
        </form>

</body>
</html>
