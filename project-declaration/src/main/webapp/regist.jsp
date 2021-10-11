<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册-郑州大学项目申报中心</title>
<link href="user/css/jwnming1.css" rel="stylesheet" type="text/css" />
<link href="user/css/jwnming2.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--
.STYLE1 {
	color: #ffffff;
	font-size: 12px;
}
.STYLE6 {
	font-size: 12px;
	color: #5593ce;
}
.STYLE8 {color: #ffffff}
.STYLE11 {font-size: 12px; color: #bab92b; }
.STYLE12 {
	color: #8da6c4;
	font-size: 12px;
}
input{ width:230px;}
select{ width:234px;}
#file{width:234px;}

-->
</style>
<script>
	function gooo(id){
		if(id!=""){
		location.href='?x='+id;
		}
	}
 	function checkf(){
		f=document.form1;
		if(f.name.value==""){
		  alert("请填写姓名");
		  return false;
		}
		if(f.age.value==""){
		  alert('年龄不能为空');
		  return false;
		}
		if(f.password.value==""){
		   alert("密码不能为空");
		   return false;
		}
		if(f.password.value!=f.repassword.value){
			alert('密码不一致');
			return false;
		}
		if(f.department.value==""){
			alert("学院信息不能为空");
			return false;
		}
		if(f.major.value==""){
			alert("专业不能为空");
			return false;
		}
		
		if(f.clazz.value==""){
			alert("班级不能为空");
			return false;
		}
     /* if(f.laboratory.value==""){
        alert("实验室不能为空");
        return false;
      }*/
      if(f.mobile.value==""){
        alert("手机号不能为空");
        return false;
      }
      if(f.teacherId.value==""){
        alert("指导老师不能为空");
        return false;
      }
      if(f.file.value==""){
          alert("头像文件不能为空");
          return false;
      }
      else{
        alert("提醒：若不能跳转，证明信息填写不规范！请确认提交。。。");
      }

	}
	function checkusername(name){
 
	jQuery(function() {
	  // Your code using failsafe $ alias here...
		jQuery.ajax({
		   type: "GET",
		   url: "checkusername.php?name="+name+" "+Math.random(),
		   dataType: 'html',
		   success: function(msg){
			   //alert(msg);
			 
			 	document.getElementById("username_result").innerHTML=msg;
			 
		   }
		 });
	});

	}
</script>
<script src="js/jquery.js" language="javascript"></script>
</head>

<body style="background-color: #C0E0FF;">

<table width="450" height="400" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color: #6bcbca;">
  <tr>
    <td height="660"  align="center" valign="top" >
      <form id="form1" name="form1" method="post" action="${pageContext.request.contextPath}/user/regist" enctype="multipart/form-data" onsubmit="return checkf();">
        <table width="465" height="500" border="0" align="center" cellpadding="0" cellspacing="0" >
          <tr>
            <td  height="10" colspan="3"></td>
          </tr>
          <tr>
            <td width="16" height="453">&nbsp;</td>
            <td width="500" align="center" valign="middle">
              <table width="100%" height="403" border="0" cellpadding="0" cellspacing="0">
                <tr bordercolor="#185089">
                  <td height="22" colspan="4" align="left" style="border-bottom:solid #8BA9C5 2px;padding-bottom: 10px;">
                    <img src="${pageContext.request.contextPath}/admin/img/zzu_logo.png" height="45"/><span class="STYLE8"style="font-size:16px; margin-left: 20px;">用户注册</span></td>
                </tr>
                <tr>
                  <td colspan="4"></td>
                </tr>
                <tr>
                  <td height="24" align="right"><span class="STYLE1">姓名：</span></td>
                  <td colspan="2" align="left"><input name="name" type="text" id="name" /></td>
                  <td align="left"><span class="STYLE11" style="color: red;">*填写真实名称</span></td>
                </tr>
                <tr>
                  <td height="22" align="right"><span class="STYLE1">密码：</span></td>
                  <td colspan="2" align="left"><input name="password" type="password" id="password" /></td>
                  <td align="left"><span class="STYLE11" style="color: red;">*输入密码</span></td>
                </tr>
                <tr>
                  <td height="26" align="right"><span class="STYLE1" >重复密码：</span></td>
                  <td colspan="2" align="left"><input name="repassword" type="password" id="repassword" /></td>
                  <td align="left"><span class="STYLE11" style="color: red;">*请再输入一遍</span></td>
                </tr>
                <tr>
                  <td height="24" align="right"><span class="STYLE1">性别：</span></td>
                  <td colspan="2" align="left">
                      <select name="sex" id="sex">
                        <option value="1">男</option>
                        <option value="0">女</option>
                      </select></td>
                  <td align="left"><span class="STYLE11" style="color: red;">*必填项</span></td>
                </tr>
                <tr>
                  <td height="24" align="right"><span class="STYLE1">年龄：</span></td>
                  <td colspan="2" align="left"><input name="age" type="text" id="age"  oninput="value=value.replace(/[^\d]/g,'')"/></td>
                  <td align="left"><span class="STYLE11" style="color: red;">*必填项</span></td>
                </tr>
                <tr>
                  <td height="24" align="right"><span class="STYLE1">年级：</span></td>
                  <td colspan="2" align="left">
                    <select name="level" id="level">
                      <option value="2019">2019</option>
                      <option value="2018">2018</option>
                      <option value="2017">2017</option>
                      <option value="2016">2016</option>
                      <option value="2015">2015</option>
                      <option value="2014">2014</option>
                      <option value="2013">2013</option>
                      <option value="2012">2012</option>
                      <option value="2012">2011</option>
                      <option value="2012">2010</option>
                      <option value="2012">2009</option>
                    </select></td>
                  <td align="left"><span class="STYLE11" style="color: red;">*必填项</span></td>
                </tr>
                <tr>
                  <td height="30" align="right"><span class="STYLE1">所属学院：</span></td>
                  <td colspan="2" align="left">
                    <input name="department" type="text" id="department" /></td>
                  <td align="left"><span class="STYLE11" style="color: red;">*必填项</span></td>
                </tr>
                <tr>
                  <td height="30" align="right"><span class="STYLE1">所属专业：</span></td>
                  <td colspan="2" align="left">
                    <input name="major" type="text" id="major" /></td>
                  <td align="left"><span class="STYLE11" style="color: red;">*必填项</span></td>
                </tr>
                <tr>
                  <td height="30" align="right"><span class="STYLE1">班级：</span></td>
                  <td colspan="2" align="left">
                    <input name="clazz" type="text" id="clazz" /></td>
                  <td align="left"><span class="STYLE11" style="color: red;">*必填项</span></td>
                </tr>
                <tr>
                  <td height="25" align="right"><span class="STYLE1">实验室名称：</span></td>
                  <td colspan="2" align="left">
                    <input name="laboratory" type="text" id="laboratory" /></td>
                  <td align="left"><span class="STYLE11" style="color: #a48d6b;">*选填</span></td>
                </tr>
                <tr>
                  <td width="19%" height="23" align="right"><span class="STYLE1">联系方式：</span></td>
                  <td colspan="2" align="left"><input name="mobile" type="text" id="mobile" oninput="value=value.replace(/[^\d]/g,'')" /></td>
                  <td width="27%" align="left"><span class="STYLE11" style="color: red;">*请填务必填写</span></td>
                </tr>
                <tr>
                  <td width="19%" height="23" align="right"><span class="STYLE1">电子邮件：</span></td>
                  <td colspan="2" align="left"><input name="email" type="text" id="email" /></td>
                  <td width="27%" align="left"><span class="STYLE11" style="color: red;">*请填务必填写</span></td>
                </tr>
                <tr>
                  <td width="19%" height="23" align="right"><span class="STYLE1">指导老师：</span></td>
                  <td colspan="2" align="left">
                    <select id="teacherId" name="teacherId">

                      <c:forEach var="t" items="${sessionScope.listTeacher}">
                        <option value="${t.id}">${t.id}-${t.name}</option>
                      </c:forEach>
                    </select>
                  </td>
                  <td width="27%" align="left"><span class="STYLE11" style="color: red;">*请填务必填写</span></td>
                </tr>
                <tr>
                  <td height="24" align="right"><span class="STYLE1">头像上传：</span></td>
                  <td colspan="2" align="left"><input name="file" type="file" id="file" accept=".jpg"/></td>
                  <td align="left"><span class="STYLE11" style="color: red;">*目前只支持jpg格式</span></td>
                </tr>
                <tr>
                  <td colspan="4">&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="4">&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="2" align="left"></td>
                  <td height="27" align="right"><input type="submit" value="确认注册" /></td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/login.jsp">返回登录</a>
                    &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/index.jsp">首页</a></td>

                </tr>
              </table></td>
          </tr>
        </table>

      </form>
	 <br />
   <table width="100%" height="55" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="100" align="center" valign="middle"><span style="color:white;" class="STYLE6">版权所有：郑州大学项目申报管理中心 <br />
              <br />
          河南省郑州市中原区科学大道100号 郑州大学新(主)校区 邮编:450001</span></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
