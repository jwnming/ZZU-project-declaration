<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
 
<link  href="Css/layout.css" rel="stylesheet" type="text/css" />
<link href="Css/cb.css" rel="stylesheet" type="text/css"   />
<link  href="Css/n.css" rel="stylesheet" type="text/css" />
<style>
.biankuangs{ border:solid #A6D2FF 1px; border-top:0px; }
#item_text2,#item_text1,#itemtypes2,#item_text3{ /**/display:none;}

.STYLE1 {color: #FF0000}
.STYLE1 {color: #FF0000}
</style> 
<script>
	function gooo(id){
		if(id!=""){
		location.href='?x='+id;
		}
	}
function change_itemtypes2(name){

 
 	document.getElementById("types2").value="";
	document.getElementById("types3").value="";
	if(name=='1'){
       document.getElementById("item_text2").style.display="block"; 
	   
	   document.getElementById("item_text3").style.display="none"; 
	   
	}else if(name=='3'){
 
		document.getElementById("item_text2").style.display="none";
		document.getElementById("item_text3").style.display="block"; 	
	}else{
 
		document.getElementById("item_text2").style.display="none";
		document.getElementById("item_text3").style.display="none"; 
	}
	
}

function change_itemtypes23(name){
 	document.getElementById("types2").value="";
	if(name=='1'){
       document.getElementById("item_text2").style.display="block"; 
	}else{
 
		document.getElementById("item_text2").style.display="none"; 
	}
}

function apply1(){
	var f=document.form1;
	if(f.itemname.value==""){
		alert('申请项目名不能为空');
		return false;
	}
	if(f.itemtypes.value==""){
		alert('请选择申请项目类型');
		return false;
	}
	if(f.fuzeren.value==""){
		alert('项目负责人不能为空');
		return false;
	}
	if(f.zhiwu.value==""){
		alert('项目负责人职务不能为空');
		return false;
	}
	if(f.tel2.value==""){
		alert('项目负责人联系电话不能为空');
		return false;
	}
	if(f.lxren.value==""){
		alert('联系人不能为空');
		return false;
	}
	if(f.tel.value==""){
		alert('联系人电话不能为空');
		return false;
	}
	if(f.applyyear.value==""){
		alert('请选择申报年份');
		return false;
	}

}
</script>
</head>

<body>

 <form action="?action=save" method="post" enctype="multipart/form-data" name="form1"  onsubmit="return apply1();">
 <table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#AEDEF4">
    <tr>
      <td width="86" rowspan="2" align="center" bgcolor="#FFF9DF">申请经费</td>
      <td height="25" align="center" bgcolor="#FFF9DF">申请学校投入经费</td>
      <td height="25" align="center" bgcolor="#FFF9DF">项目匹配经费</td>
    </tr>
    <tr>
      <td height="25" align="center" bgcolor="#FFFFFF">金额
        <input name="jf_xuexiao" type="text" id="jf_xuexiao" value="" size="6" />
      （万）</td>
      <td height="25" align="center" bgcolor="#FFFFFF">项目编号
        <input name="jf_yid" type="text" id="jf_yid" value="" size="15" />
      </td>
    </tr>

    <tr>
      <td height="33" colspan="3" align="center" bgcolor="#FFF9DF"><div align="left">学校投入经费分配：</div></td>
    </tr>
    <tr>
      <td height="25" align="center" bgcolor="#FFF9DF">购置设备</td>
      <td height="12" colspan="2" align="left" bgcolor="#FFFFFF"  style="color:#999999; padding-left:5px;"><input name="shebei" type="text" id="shebei" size="10" />
（万）</td>
    </tr>
    <tr>
      <td height="25" align="center" bgcolor="#FFF9DF">购置家具</td>
      <td height="25" colspan="2" align="left" bgcolor="#FFFFFF"  style="color:#999999; padding-left:5px;"><div align="left">
          <input name="jiaju" type="text" id="jiaju" size="10" />
      （万）</div></td>
    </tr>
	    <tr>
      <td height="25" align="center" bgcolor="#FFF9DF">环境改造</td>
      <td height="25" colspan="2" align="left" bgcolor="#FFFFFF"  style="color:#999999; padding-left:5px;"><div align="left">
          <input name="huanjing" type="text" id="huanjing" size="10" />
        （万）</div></td>
    </tr>
    <tr>
      <td height="30" align="center" bgcolor="#FFF9DF">附件1</td>
      <td height="25" colspan="2" align="left" bgcolor="#FFFFFF"  style="color:#999999; padding-left:5px;">
        <div align="left">
          <input type="file" name="file" id="file">
        （<span class="STYLE1">申报材料ppt格式、word格式或rar压缩文件</span>）</div>
      <div align="left"></div></td>
    </tr>

    <tr>
      <td align="center" bgcolor="#FFF9DF">&nbsp;</td>
      <td height="25" colspan="2" align="left" bgcolor="#FFFFFF"  style="color:#999999; padding-left:20px;"><input type="submit" name="Submit" value="下一步" /></td>
    </tr>
</table>
</form>

</body>
</html>
