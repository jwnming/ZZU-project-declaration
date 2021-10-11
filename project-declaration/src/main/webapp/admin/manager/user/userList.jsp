<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>list</title>
	<meta charset="utf-8"/>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/themes/black/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/themes/IconExtension.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/datagrid-detailview.js"></script>

</head>
<body>
	<!-- 数据表格 -->
	<table id="dg_user"></table>
	<!-- 表格按钮组 -->
	<div id="btns_user">
		<a id="adduser">添加用户信息</a>
		<a id="downloaduser" style="margin-right: 30px;">打印/下载用户信息</a>
		<a id="showteacher">查看指导老师信息</a>
		<a id="changeuser" style="margin-left: 30px;">修改用户信息</a>
		<a id="changeuserstatus">修改用户的状态</a>
		<a id="removeuser" style="margin-left: 30px;">删除用户</a>

	</div>
	<!-- 添加对话框按钮组 -->
	<div id="dialogBtns_user">
		<a href="#" id="addConfirm" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认添加</a>
		<a href="#" id="cancel">取消</a>
	</div>
	<!-- 修改对话框按钮组 -->
	<div id="dialogBtns1_user">
		<a href="javascript:void(0)" id="changeConfirm" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认修改</a>
		<a href="javascript:void(0)" id="changeCancel">取消</a>
	</div>
	
	<!-- 添加对话框 -->
	<div id="addDialog_user">
		<form id="adduserFm" method="post">
			<fieldset> <legend>添加用户</legend>
				<table style="width: 300px;text-align: center;">
					<tr><td>名字</td>
						<td><input type="text" name="name" id="name1"/></td>
					</tr>
					<tr><td>默认密码</td>
						<td>zzu123<input type="hidden" name="password" value="zzu123"/></td>
					</tr>
					<tr><td>性别</td>
						<td><select name="sex" id="sex1">
							<option value="1">男</option>
							<option value="0">女</option>
						</select>
					</tr>
					<tr><td>年龄</td>
						<td><input type="text" name="age"  id="age1"/></td>
					</tr>
					<tr><td>年级</td>
						<td><select name="level" id="level1">
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
					</tr>
					<tr><td>所属学院</td>
						<td><input type="text" name="department" id="department1"/></td>
					</tr>
					<tr><td>专业</td>
						<td><input type="text" name="major" id="major1"/></td>
					</tr>
					<tr><td>班级</td>
						<td><input type="text" name="clazz" id="clazz1"/></td>
					</tr>
					<tr><td>实验室</td>
						<td><input type="text" name="laboratory" id="laboratory1"/></td>
					</tr>
					<tr><td>手机</td>
					<td><input type="text" name="mobile" id="mobile1"/></td>
					</tr>
					<tr><td>邮箱</td>
						<td><input type="text" name="email" id="email1"/></td>
					</tr>

				</table>
			</fieldset>
		</form>
	</div>
	<!-- 修改对话框 -->
	<div id="changeuserDialog">
		<form id="changeuserFm">
			<fieldset> <legend>修改用户</legend>
			<table style="width: 300px;text-align: center;">
				<tr>
					<td><input type="hidden" name="id"/></td>
				</tr>
				<tr><td>名字</td>
					<td><input type="text" name="name" id="name2"/></td>
				</tr>
				<tr><td>性别</td>
					<td><select name="sex" id="sex2">
						<option value="1">男</option>
						<option value="0">女</option>
					</select>
				</tr>
				<tr><td>年龄</td>
					<td><input type="text" name="age" id="age2"/></td>
				</tr>
				<tr><td>年级</td>
					<td><select name="level" id="level2">
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
				</tr>
				<tr><td>所属学院</td>
					<td><input type="text" name="department" id="department2"/></td>
				</tr>
				<tr><td>专业</td>
					<td><input type="text" name="major" id="major2"/></td>
				</tr>
				<tr><td>班级</td>
					<td><input type="text" name="clazz" id="clazz2"/></td>
				</tr>
				<tr><td>实验室</td>
					<td><input type="text" name="laboratory" id="laboratory2"/></td>
				</tr>
				<tr><td>手机</td>
					<td><input type="text" name="mobile" id="mobile2" /></td>
				</tr>
				<tr><td>邮箱</td>
					<td><input type="text" name="email" id="email2"/></td>
				</tr>
				</table>
			</fieldset>
		</form>
	</div>
	
	<script type="text/javascript">
		//-----------------------------------------------按钮---------------------------------
		$("#adduser").linkbutton({ //添加按钮
			iconCls: 'icon-add',
			onClick: function() {

				$("#addDialog_user").dialog({closed:false});
			}
		});

		$("#downloaduser").linkbutton({	//下载
			iconCls: 'icon-20130406125519344_easyicon_net_16',
			onClick: function() {
				//下载
				window.location.href = "${pageContext.request.contextPath}/excel/excelUser.do";
			}
		});

		$("#changeuser").linkbutton({	//修改按钮
			iconCls: 'icon-reload',
			onClick: function() {
				var row = $("#dg_user").datagrid('getSelected');
				if (row != null) {
					$('#changeuserFm').form('load','${pageContext.request.contextPath}/user/getById/' + row.id);
					$("#changeuserDialog").dialog({closed:false});
				} else {
					$.messager.show({
						title: "提醒",
						msg: "请选中一行"
					});
				}
			}
		});


		$("#showteacher").linkbutton({ //查看指导老师信息
			iconCls: 'icon-user_mature',
			onClick: function() {
				if ($("#dg_user").datagrid('getSelected') == null) {
					$.messager.show({
						title: "提醒",
						msg: "请选中一行"
					});
				} else {
					var row = $("#dg_user").datagrid('getSelected');
					alert("指导老师编号：" + row.teacher.id + "\n" +
							"指导老师名字：" + row.teacher.name + "\n" +
							"指导老师职位：" + row.teacher.job + "\n" +
							"指导老师手机号：" + row.teacher.mobile
					);
				}
			}
		})

		$("#changeuserstatus").linkbutton({	//修改用户的状态
			iconCls: 'icon-anchor',
			onClick: function() {
				var row = $("#dg_user").datagrid('getChecked');
				if (row.length > 0) {
					$.messager.confirm('确认对话框', '您确定修改用户状态吗？', function(r){
						if (r){
							for(var i = 0; i < row.length;i++) {
								var tmpstatus = 1;
								if(row[i].status == 1) {
									tmpstatus = 0;
								} else  {
									tmpstatus = 1;
								}
								$.ajax({
									url: "${pageContext.request.contextPath}/user/changeUserStatus/" + row[i].id + "/" + tmpstatus,
									dateType: "json",
									type: "post",
									success: function(map) {
										$("#dg_user").datagrid("reload");
										$.messager.show({
											title: "提醒",
											msg: map.msg
										});
									}
								});
							}
						}
					});

				} else {
					$.messager.show({
						title: "提醒",
						msg: "请选中一行"
					});
				}
			}
		});

		$("#removeuser").linkbutton({	//删除
			iconCls: 'icon-cancel',
			onClick: function() {
				var row = $("#dg_user").datagrid('getChecked');
				if (row.length > 0) {
					$.messager.confirm('确认对话框', '您确定删除该用户吗？', function(r){
						if (r){
						    for(var i = 0; i < row.length;i++) {
						    	$.ajax({
								url: '${pageContext.request.contextPath}/user/deleteUser/' + row[i].id,
								dateType: "json",
								type: "post",
								success: function(map) {
									$("#dg_user").datagrid("reload");
									$.messager.show({
										title: "提醒",
										msg: map.msg
									});
								}
							});
						    }
						}
					});
					
				} else {
					$.messager.show({
						title: "提醒",
						msg: "请选中一行"
					});
				}
			}
		});




		$("#addConfirm").linkbutton({  //提交添加
			iconCls: 'icon-check_error',
			onClick: function() {
				$("#adduserFm").form("submit");
			}
		});
		$("#cancel").linkbutton({		//取消按钮
			iconCls: 'icon-cancel',
			onClick: function() {
				$("#addDialog_user").dialog("close");
				$("#adduserFm").form("clear");
			}
		});
		
		$("#changeConfirm").linkbutton({  //提交修改
			iconCls: 'icon-check_error',
			onClick: function() {
				$("#changeuserFm").form("submit");
			}
		});
		$("#changeCancel").linkbutton({		//取消修改
			iconCls: 'icon-cancel',
			onClick: function() {
				$("#changeuserDialog").dialog("close");
				$("#changeuserFm").form("clear");
			}
		});

		//---------------------------------------------对话框-----------------------------------
		//添加的dialog
		$("#addDialog_user").dialog({
			title: "添加用户信息",
			modal: true,
			closed: true,	
			buttons: "#dialogBtns_user"
		});
		//修改的dialog
		$("#changeuserDialog").dialog({
			title: "修改用户信息",
			modal: true,
			closed: true,
			buttons: "#dialogBtns1_user"
		});
		
		//----------------------------------------------form----------------------------------
		//表单-添加
		$("#adduserFm").form({
			url: "${pageContext.request.contextPath}/user/add.do",
			onSubmit: function() {
				return true;
			},
			success: function(json) {
				var obj = JSON.parse(json);
				if(obj.code == 200) {
					$("#addDialog_user").dialog({closed:true});
					$("#adduserFm").form("clear");
					$('#dg_user').datagrid("reload");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				} else {
					$("#addDialog_user").dialog({closed:true});
					$("#adduserFm").form("clear");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				}
			}
			
		});
		
		//表单-修改
		$("#changeuserFm").form({
			url: "${pageContext.request.contextPath}/user/changeUser.do",
			onSubmit: function() {
				return true;
			},
			success: function(json) {
				var obj = JSON.parse(json);
				if(obj.code == 200) {
					$("#changeuserDialog").dialog({closed:true});
					$("#changeuserFm").form("clear");
					$('#dg_user').datagrid("reload");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				} 
			}
		});
		
		//文本框设置==添加
		$("#name1").textbox({
			width:190,
			required: true,
		});
		$("#sex1").textbox({
			width:190,
			required: true,
		});
		$("#age1").textbox({
			width:190,
			required: true,
		});
		$("#level1").combobox({
			width:190,
			required: true,
		});
		$("#department1").textbox({
			width:190,
			required: true,
		});
		$("#major1").textbox({
			width:190,
			required: true,
		});
		$("#clazz1").textbox({
			width:190,
			required: true,
		});
		$("#laboratory1").textbox({
			width:190,
			required: true,
		});
		$("#mobile1").textbox({
			width: 190,
			required: true,
		});
		$("#email1").textbox({
			width: 190,
			required: true,
		});
		$("#sex1").combobox({	//下拉框
			width:190,
			required: true,
		});


		
		//文本框设置==修改
		$("#name2").textbox({
			width:190,
			required: true,
		});
		$("#sex2").textbox({
			width:190,
			required: true,

		});
		$("#age2").textbox({
			width:190,
			required: true,
		});
		$("#level2").combobox({
			width:190,
			required: true,
		});
		$("#department2").textbox({
			width:190,
			required: true,
		});
		$("#major2").textbox({
			width:190,
			required: true,
		});
		$("#clazz2").textbox({
			width:190,
			required: true,
		});
		$("#laboratory2").textbox({
			width:190,
			required: true,
		});
		$("#mobile2").textbox({
			width: 190,
			required: true,
		});
		$("#email2").textbox({
			width: 190,
			required: true,
		});
		$("#sex2").combobox({	//下拉框
			width:190,
			required: true,
		});

		//----------------------------------------------表格----------------------------------
		//表格数据
		$('#dg_user').datagrid({
			height: "530",
			toolbar: "#btns_user",
   			url: "/zzu/user/getAll",
   			pagination: true,
   			pageSize: 13,
   			pageList: [10,13,15,18,20],
   			fitColumns: true,
   			remoteSort:false,
			singleSelect:false,
			checkOnSelect: true,
			nowrap:false,
	   		columns:[[
				{field:'id',title:'编号',width:80,align:'center',sortable:true},
				{field:'name',title:'用户名',width:100,align:'center'},
				{field:'department',title:'学院',width:130,align:'center'},
				{field:'age',title:'年龄',width:100,align:'center',sortable:true},
				{field:'level',title:'年级',width:100,align:'center',sortable:true},
				{field:'sex',title:'性别',width:100,align:'center',formatter:function(value, row, index) {
						if(value==1){
							return "男";
						}else {
							return "女";
						}
					}},
				{field:'major',title:'专业',width:120,align:'center'},
				{field:'clazz',title:'班级',width:100,align:'center'},
				{field:'email',title:'邮件',width:100,align:'center'},
				{field:'mobile',title:'手机号',width:100,align:'center',sortable:true},
				{field:'picture',title:'用户头像',width:100,align:'center',formatter: function(value,row,index){
						return "<img src='${pageContext.request.contextPath}"+value+"' height='30' />"
					}
				},
				{field:'laboratory',title:'所在实验室',width:130,align:'center'},
				{field:'teacher_name',title:'指导老师',width:130,align:'center'},

				{field:'status',title:'用户状态',width:100,align:'center',formatter: function(value,row,index){
						if (value == 1){
							<!-- 是否展示 -->
							return "<input class='show_switch_button' checked/>";
						} else {
							return "<input class='show_switch_button' />";
						}
					}
				},
	     	]],
			singleSelect: true,
			onLoadSuccess: function() {
				$(".show_switch_button").switchbutton({
		      		width:70,
		      		height: "20",
		      		onText: "正常",
		      		offText: "冻结",
					disabled: true,
		      		onChange: function(checked){

		        		console.log(checked); 
		      		}

		    	}) 
			} 
		});
	</script>
</body>
</html>