<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link href="css/jwnming1.css" rel="stylesheet" type="text/css" />
<link href="css/jwnming2.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {
	color: #ffffff;
	font-size: 12px;
}
.STYLE4 {
	color: #8da8c3;
	font-size: 12px;
}
.STYLE6 {
	font-size: 12px;
	color: #5593ce;
}
-->
</style>
<link href="css/jwnming3_layout.css" rel="stylesheet" type="text/css" />
<script>
function check(){
	f=document.form1;
	if(f.username.value==""){
		alert("请填写用户名");
		return false;
	}
	if(f.password.value==""){
		alert("请填写密码");
		return false;
	}
	if(f.tyeps.value==""){
		alert("请选择用户类型");
		return false;
	}
	if(f.yz.value==""){
		alert("请填写验证码");
		return false;
	}
}
</script>
</head>

<body>
<table width="100%" height="660" border="0" align="center" cellpadding="0" cellspacing="0"  style="margin:0px; padding:0px">
  <tr>
    <td height="660"  align="center" valign="top" background="pictures/bj.gif">
	<table width="465" height="414" border="0" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td  height="152" colspan="3" valign="bottom"><img src="pictures/zzu_logo.png" width="340" height="50" /></td>
      </tr>
      <tr>
        <td width="15" height="262" background="pictures/bj1.gif">&nbsp;</td>
        <td width="420" valign="middle" background="pictures/bj2.gif">
		<form id="form1" name="form1" method="post" action="?action=save" onsubmit="return check();">
		<table width="100%" height="170" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="31%" align="right"><span class="STYLE1">用户名：</span></td>
              <td colspan="3" align="left"><label>
                <input name="username" type="text" id="username" size="30"/>
              </label></td>
            </tr>
            <tr>
              <td align="right"><span class="STYLE1">密码：</span></td>
              <td colspan="3" align="left"><label>
                <input name="password" type="password" id="password" size="30"/>
              </label></td>
            </tr>
            <tr>
              <td align="right"><span class="STYLE1">身份：</span></td>
              <td colspan="3" align="left">
                <label>
                <select name="tyeps" id="select" width="300">
                  <option value="0">请选择...</option>
                  <option value="1">学生</option>
                  <option value="2">其他</option>
                </select>
                </label> &nbsp;&nbsp;<span style="color:silver">(注意：目前只支持本校学生)</span>
                </td>
            </tr>
            <tr>
              <td align="right"><span class="STYLE1">验证码：</span></td>
              <td align="left"><label>
                <input name="yz" type="text" id="yz" size="20"/>
              </label></td>
              <td align="left"><img src="pictures/checkcode.php" onclick="this.src='/inc/checkcode.php';" style="cursor:pointer;" /></td>
              <td align="left"> </td>
            </tr>

            <tr>
              
              <td width="15%" valign="top"><p class="STYLE4">&nbsp;</p>   </td>
              <td width="34%" height="55" align="left"> 
               <input name="image" type="image" style="width:60px; height:55px;" src="pictures/login2.gif" />
              </td>	
              <td width="20%" align="left"><a href="../regist.jsp"><span class="STYLE4">注册新用户</span></a><br />
                  <br /><span class="STYLE4">找回密码</span></td>
              <td>&nbsp;</td>
            </tr>
        </table>
     </form>		
     </td>
        <td width="13" background="pictures/bj3.gif">&nbsp;</td>
      </tr>
    </table>
	<table width="465" height="76" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="76">&nbsp;</td>
      </tr>
    </table>
	<br />
	<table width="100%" height="100" border="0" cellpadding="0" cellspacing="0">
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
