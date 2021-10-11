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
	<table id="dg_project"></table>
	<!-- 表格按钮组 -->
	<div id="btns_project">

		<a id="changeProjectLogobtn">项目logo设置</a>
		<a id="downloadproject" style="margin-left: 30px;">打印/下载项目信息</a>
		<a id="downloaddocument" style="margin-right: 30px;">打印/下载项目申报文件</a>
		<a id="changeproject">修改项目信息</a>
		<a id="removeproject" style="margin-left: 30px;">删除项目信息</a>
	</div>

	<!-- 修改对话框按钮组 -->
	<div id="dialogBtns1_project">
		<a href="javascript:void(0)" id="changeConfirm" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认修改</a>
		<a href="javascript:void(0)" id="changeCancel">取消</a>
	</div>
	<!-- 修改logo对话框按钮组 -->
	<div id="dialogBtns1_projectLogos">
		<a href="javascript:void(0)" id="changeLogoConfirm" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认修改</a>
		<a href="javascript:void(0)" id="changeLogoCancel">取消</a>
	</div>

	<!-- 修改logo对话框 -->
	<div id="changeProjectLogoDialog">
		<form id="changeProjectLogoFm" method="post" enctype="multipart/form-data">
			<fieldset> <legend>项目logo设置</legend>
				<table style="width: 300px;text-align: center;">
					<tr><td></td>
						<td><input type="hidden" name="id"/></td>
					</tr>
					<tr><td>项目名</td>
						<td><input type="text" name="title" id="logotitle" disabled="disabled"/></td>
					</tr>
					<tr><td>本地上传logo图片</td>
						<td><input type="text" name="logofile" id="uploadlogo" /></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>

	<!-- 修改对话框 -->
	<div id="changeprojectDialog">
		<form id="changeprojectFm">
			<fieldset> <legend>修改项目信息</legend>
			<table style="width: 300px;text-align: center;">
					<tr>
						<td><input type="hidden" name="id"/></td>
					</tr>
					<tr><td>项目名</td>
						<td><input type="text" name="title" id="pname" /></td>
					</tr>
					<tr><td>资金</td>
						<td><input type="text" name="funds" id="pfunds" /></td>
					</tr>
					<tr><td>描述</td>
						<td><input type="text" name="description" id="pdescription" /></td>
					</tr>
					<tr><td>进度</td>
						<td>
							<select id="pfinished" name="finished">
								<option value="1">已完成</option>
							    <option value="0">实施中</option>
							</select>
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	
	<script type="text/javascript">
		//-----------------------------------------------按钮---------------------------------


		$("#changeProjectLogobtn").linkbutton({             //修改logo设置------------
			iconCls: 'icon-cup_add',
			onClick: function() {
				var row = $("#dg_project").datagrid('getSelected');
				if (row != null && row.status == 1) {
					$('#changeProjectLogoFm').form('load','${pageContext.request.contextPath}/project/getById/' + row.id);
					$("#changeProjectLogoDialog").dialog({closed:false});
				} else {
					$.messager.show({
						title: "提醒",
						msg: "请选中已经审核通过的项目进行修改"
					});
				}
			}
		});

		$("#downloadproject").linkbutton({
			iconCls: 'icon-20130406125519344_easyicon_net_16',	//下载项目信息
			onClick: function() {
				//下载项目信息
				window.location.href = "${pageContext.request.contextPath}/excel/excelProject.do";
			}
		});
		$("#downloaddocument").linkbutton({
			iconCls: 'icon-20130406125519344_easyicon_net_16',	//下载项目申报文件
			onClick: function() {
				//下载文件
				var row = $("#dg_project").datagrid('getSelected');
				if (row != null) {
					window.location.href = "${pageContext.request.contextPath}/documents/downloadDocument/" + row.documents_id;
				} else {
					$.messager.show({
						title: "提醒",
						msg: "请选中一行"
					});
				}
			}
		});


		$("#changeproject").linkbutton({	//修改按钮
			iconCls: 'icon-reload',
			onClick: function() {
				var row = $("#dg_project").datagrid('getSelected');
				if (row != null && row.status == 1) {
					$('#changeprojectFm').form('load','${pageContext.request.contextPath}/project/getById/' + row.id);
					$("#changeprojectDialog").dialog({closed:false});
				} else {
					$.messager.show({
						title: "提醒",
						msg: "请选中已经审核通过的项目进行修改"
					});
				}
			}
		});

		$("#removeproject").linkbutton({	//删除
			iconCls: 'icon-cancel',
			onClick: function() {
				var row = $("#dg_project").datagrid('getChecked');
				if (row.length > 0) {
					$.messager.confirm('确认对话框', '您确定删除该项目吗？', function(r){
						if (r){
						    for(var i = 0; i < row.length;i++) {
						    	$.ajax({
								url: '${pageContext.request.contextPath}/project/deleteProject/' + row[i].id,
								dateType: "json",
								type: "post",
								success: function(map) {
									$("#dg_project").datagrid("reload");
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
				$("#addprojectFm").form("submit");
			}
		});
		$("#cancel").linkbutton({		//取消按钮
			iconCls: 'icon-cancel',
			onClick: function() {
				$("#addDialog_project").dialog("close");
				$("#addprojectFm").form("clear");
			}
		});
		
		$("#changeConfirm").linkbutton({  //提交修改
			iconCls: 'icon-check_error',
			onClick: function() {
				$("#changeprojectFm").form("submit");
			}
		});
		$("#changeCancel").linkbutton({		//取消修改
			iconCls: 'icon-cancel',
			onClick: function() {
				$("#changeprojectDialog").dialog("close");
				$("#changeprojectFm").form("clear");
			}
		});

		$("#changeLogoConfirm").linkbutton({  //提交修改logo
			iconCls: 'icon-check_error',
			onClick: function() {
				$("#changeProjectLogoFm").form("submit");
			}
		});
		$("#changeLogoCancel").linkbutton({		//取消修改logo
			iconCls: 'icon-cancel',
			onClick: function() {
				$("#changeProjectLogoDialog").dialog("close");
				$("#changeProjectLogoFm").form("clear");
			}
		});
		
		
		//---------------------------------------------对话框-----------------------------------
		//添加的dialog
		$("#addDialog_project").dialog({
			title: "添加项目信息",
			modal: true,
			closed: true,	
			buttons: "#dialogBtns_project"
		});
		//修改的dialog
		$("#changeprojectDialog").dialog({
			title: "修改项目信息",
			modal: true,
			closed: true,
			buttons: "#dialogBtns1_project"
		});

		//修改logo的dialog
		$("#changeProjectLogoDialog").dialog({
			title: "设置项目logo",
			modal: true,
			closed: true,
			buttons: "#dialogBtns1_projectLogos"
		});
		
		//----------------------------------------------form----------------------------------
		//表单-添加
		$("#addprojectFm").form({
			url: "${pageContext.request.contextPath}/project/add.do",
			onSubmit: function() {
				return true;
			},
			success: function(json) {
				var obj = JSON.parse(json);
				if(obj.code == 200) {
					$("#addDialog_project").dialog({closed:true});
					$("#addprojectFm").form("clear");
					$('#dg_project').datagrid("reload");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				} else {
					$("#addDialog_project").dialog({closed:true});
					$("#addprojectFm").form("clear");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				}
			}
			
		});
		
		//表单-修改
		$("#changeprojectFm").form({
			url: "${pageContext.request.contextPath}/project/changeProjectInfo.do",
			onSubmit: function() {
				return true;
			},
			success: function(json) {
				var obj = JSON.parse(json);
				if(obj.code == 200) {
					$("#changeprojectDialog").dialog({closed:true});
					$("#changeprojectFm").form("clear");
					$('#dg_project').datagrid("reload");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				} 
			}
		});

		//表单-修改logo
		$("#changeProjectLogoFm").form({
			url: "${pageContext.request.contextPath}/project/changeProjectLogo.do",
			onSubmit: function() {
				return true;
			},
			success: function(json) {
				var obj = JSON.parse(json);
				if(obj.code == 200) {
					$("#changeProjectLogoDialog").dialog({closed:true});
					$("#changeProjectLogoFm").form("clear");
					$('#dg_project').datagrid("reload");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				}
			}
		});

		//文本框设置==修改
		$("#pid").textbox({
			width:190,
			disabled: true
		});
		$("#pname").textbox({
			width:190,
			disabled: true
		});
		$("#pfunds").textbox({
			width:190,
			required: true,
		});
		$("#pdescription").textbox({
			width: 190,
			required: true,
		});
		$("#pfinished").combobox({	//下拉框
			width:190,
			required: true,
		});

		//文本框设置==修改logo
		$("#uploadlogo").filebox({
			buttonText: "选择图片",
			width:190,
			required: true,
		});
		$("#logotitle").textbox({
			disabled: true,
			width:190,
		});


		//----------------------------------------------表格----------------------------------
		//表格数据
		$('#dg_project').datagrid({
			height: "530",
			toolbar: "#btns_project",
   			url: "/zzu/project/getAll",
   			pagination: true,
   			pageSize: 7,
   			pageList: [7,10,13,15,18,20],
   			fitColumns: true,
   			remoteSort:false,
			singleSelect:false,
			checkOnSelect: true,
			nowrap:false,
			singleSelect: true,
	   		columns:[[
				{field:'id',title:'编号',width:80,align:'center',sortable:true},
				{field:'title',title:'项目名',width:150,align:'center'},
				{field:'logo',title:'项目logo',width:80,align:'center',formatter: function(value,row,index){
						return "<img src='${pageContext.request.contextPath}"+value+"' style='width:50px'/>";
					}
				},
				{field:'declare_time',title:'申请时间',width:130,align:'center',sortable:true},
				{field:'funds',title:'资金',width:100,align:'center',sortable:true,formatter: function(value,row,index){
						return value + " (万元)";
					}
				},
				{field:'description',title:'简介',width:380,align:'center',sortable:true},
				{field:'category',title:'项目类型',width:130,align:'center'},
				{field:'user_name',title:'负责人',width:100,align:'center'},
				{field:'documents_id',title:'申报文件编号',width:100,align:'center'},
				{field:'exhibition',title:'前台首页展示',width:180,align:'center',sortable:true,formatter: function(value,row,index){
						if (value == 1) {
							return "<span style='color: greenyellow;'><b>已在前台显示</b></span>";
						} else {
							return "<span style='color: lawngreen;'><b>未在前台显示</b></span>";
						}
					}
				},

				{field:'status',title:'状态',width:150,align:'center',sortable:true,formatter: function(value,row,index) {
						if (value == 1) {
							return "<span style='color: greenyellow;'><b>通过审核</b></span>";
						} else {
							return "<span style='color: red;'><b>未通过审核</b></span>";
						}
					}
				},
				{field:'finished',title:'进度',width:140,align:'center',sortable:true,formatter: function(value,row,index){
						if(value == 1) {
							return "<span style='color: greenyellow;'><b>已完成</b></span>";
						} else {
							return "<span style='color: red;'><b>未完成</b></span>";
						}

					}
				},
	     	]],

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