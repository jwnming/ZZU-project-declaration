<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>郑州大学项目申报后台管理中心</title>
	<meta charset="utf-8"/>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="icon" href="admin/img/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/common.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/login.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/themes/black/easyui.css" type="text/css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript">
    	$(function() {
    		//验证码输入框
    		$("#enCode").on("blur", function() {
    			var code = $("#enCode").val();
    			$.ajax({
    				url : "${pageContext.request.contextPath}/captcha/checkCaptcha/" + code,  
   				  	type : "post",
   					dataType : "json",//自动将结果转化为js对象
   					success : function(map) {
   						if (map.code == 200) {
   							if ($("#loginForm").form("validate")) {
   								//可以提交
   								$("#lodin").linkbutton({
    								disabled : false,
    							});
   							}
   						} else {
   							$("#messspan").text(map.msg);
   							//禁止提交
   							$("#lodin").linkbutton({
    							disabled : true,
    						});
   						}
   					}
    			});
    		});
    		//提交按钮
    		$("#lodin").linkbutton({
    			disabled : true,
    			onClick : function() {
    				var username = $("#username").val();
    				var password = $("#password").val();
    				var type = $("#selector option:checked").val();
    				//判断登录身份
    				if(type == 1) {
						$.ajax({
							url : "${pageContext.request.contextPath}/admin/login/" + username + "/" + password,
							type : "post",
							dataType : "json",//自动将结果转化为js对象
							success : function(map) {
								console.log(map.msg);
								if (map.code == 200) {
									location.href = "${pageContext.request.contextPath}/admin/main/main.jsp";
								} else {
									$("#messspan").text(map.msg);
								}
							}
						});
					} else if(type == 2) {
						$.ajax({
							url : "${pageContext.request.contextPath}/user/login/" + username + "/" + password,
							type : "post",
							dataType : "json",//自动将结果转化为js对象
							success : function(map) {
								console.log(map.msg);
								if (map.code == 200) {
									location.href = "${pageContext.request.contextPath}/user/main_shenbao.jsp";
								} else {
									$("#messspan").text(map.msg);
								}
							}
						});
					} else {
						alert("目前只能是学生和管理员身份，请确认");
					}

    			}
    		});

    	});
    	//更换验证码
    	function changeCaptcha() {
    		$("#captchaImage").prop("src", "${pageContext.request.contextPath}/captcha/getCaptcha?d=" + new Date().getTime());
    	}
	</script>
</head>
<body style="background-color: #C0E0FF;">
	<div class="login">
		<form id="loginForm" method="post" >
			<table>
				<tbody>
					<tr >
						<td width="190" rowspan="2" align="center" valign="bottom">
							<img src="${pageContext.request.contextPath }/admin/img/zzu_logo.png" style="width:140px;"/>
						</td>
						<th>用户名:</th>
						<td><input class="easyui-validatebox" type="text" name="username" id="username" data-options="required:true" /></td>
				  	</tr>
				  	<tr>
						<th>密&nbsp;&nbsp;&nbsp;码:</th>
						<td><input class="easyui-validatebox" type="password" maxlength="6" name="password" id="password"  data-options="required:true,validType:'maxLength[6]'"/></td>
				  	</tr>
					<tr>
						<td>&nbsp;</td>
						<th>身&nbsp;&nbsp;&nbsp;份:</th>
						<td><select name="type" id="selector" style="width:154px;">
							<option value="0">请选择...</option>
							<option value="1">管理员</option>
							<option value="2">学生</option>
							<option value="3">其他</option>

						</select></td>
					</tr>

					<tr>
						<td>&nbsp;</td>	<th>验证码:</th>
						<td>
							<input type="text" id="enCode" name="enCode" class="easyui-validatebox" size="8px" data-options="required:true,validType:'maxLength[6]'"/>
							<img id="captchaImage" class="captchaImage" src="${pageContext.request.contextPath}/captcha/getCaptcha" title="点击更换验证码" onclick="changeCaptcha()"/>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<th><span id="messspan" style="color: red;font-size:11px;"></span></th>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<th>&nbsp;</th>
						<td>
							<input type="button" class="homeButton"><input id="lodin" type="button" class="loginButton" value="登录"/>
						</td>
					</tr>
			    </tbody></table>
			<div class="powered">COPYRIGHT ©jwnming 郑州大学 2019-2019.</div>
			<div class="link">
				<a href="http:localhost:8080/zzu_user/index.jsp/">郑州大学项目申报中心首页</a> |
				<a href="${pageContext.request.contextPath}/user/toRegist.do">学生用户注册</a> |
				<a href="${pageContext.request.contextPath}/regist.jsp">其他用户注册</a> |

			</div>
		</form>
	</div>
</body>
</html>