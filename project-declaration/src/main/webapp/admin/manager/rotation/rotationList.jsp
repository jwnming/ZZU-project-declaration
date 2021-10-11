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
	<script type="text/javascript">
		
		<!-- 对话框添加 -->
		function addImage() {
			
		}
		<!-- 对话框修改 -->
		function chageImage() {
			
		}
		<!-- 对话框删除 -->	
		function deleteImage() {
			
		}
	</script>
</head>
<body>
	<!-- 数据表格 -->
	<table id="dg"></table>
	<!-- 表格按钮组 -->
	<div id="btns">
		<a id="addRotation">添加</a>
		<a id="changeRotation">修改</a>
		<a id="removeRotation">删除</a>
	</div>
	<!-- 添加对话框按钮组 -->
	<div id="dialogBtns">
		<a href="#" id="addConfirm" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认添加</a>
		<a href="#" id="cancel">取消</a>
	</div>
	<!-- 修改对话框按钮组 -->
	<div id="dialogBtns1">
		<a href="javascript:void(0)" id="changeConfirm" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认修改</a>
		<a href="javascript:void(0)" id="changeCancel">取消</a>
	</div>
	
	<!-- 添加对话框 -->
	<div id="addDialog">
		<form id="addFm" method="post" enctype="multipart/form-data">
			<fieldset> <legend>添加轮播图图片</legend>
				<table style="width: 300px;text-align: center;">
					<tr><td>图片标题</td>
						<td><input type="text" name="title" id="title"/></td>
					</tr>
					<tr><td>上传图片</td>
						<td><input type="text" name="file" id="imagePath"/></td>
					</tr>
					<tr><td>描述</td>
						<td><input type="text" name="description" id="description"/></td>
					</tr>
					<tr><td>权重</td>
						<td>
							<select id="proportion" name="proportion"> 
								<option value="5">在第一张展示</option>    
							    <option value="1">最后一张展示</option>   
							    <option value="2">在第四张展示</option>   
							    <option value="3">在第三张展示</option>   
							    <option value="4">在第二张展示</option>   
							</select>  
						</td>
					</tr>
					<tr><td>展示状态</td>
						<td>
							<select id="status" name="status"> 
								<option value="1">展示</option>    
							    <option value="0">不展示</option>   
							</select>
						</td>
					</tr>
				
				</table>
			</fieldset>
		</form>
	</div>
	<!-- 修改对话框 -->
	<div id="changeDialog">
		<form id="changeFm">
			<fieldset> <legend>修改轮播图信息</legend>
			<table style="width: 300px;text-align: center;">
					<tr>
						<td><input type="hidden" name="id"/></td>
					</tr>
					<tr><td>图片标题</td>
						<td><input type="text" name="title" id="y" /></td>
					</tr>
					<tr><td>图片路径</td>
						<td><input type="text" name="file" id="cimagePath" /></td>
					</tr>
					<tr><td>描述</td>
						<td><input type="text" name="description" id="cdescription"/></td>
					</tr>
					<tr><td>权重</td>
						<td>
							<select id="cproportion" name="proportion"> 
								<option value="5">在第一张展示</option>    
							    <option value="1">最后一张展示</option>   
							    <option value="2">在第四张展示</option>   
							    <option value="3">在第三张展示</option>   
							    <option value="4">在第二张展示</option>   
							</select>  
						</td>
					</tr>
					<tr><td>展示状态</td>
						<td>
							<select id="cstatus" name="status"> 
								<option value="1">展示</option>    
							    <option value="0">不展示</option>   
							</select>
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	
	<script type="text/javascript">
		//-----------------------------------------------按钮---------------------------------
		$("#addRotation").linkbutton({ //添加按钮
			iconCls: 'icon-add',
			onClick: function() {
				$("#addDialog").dialog({closed:false});
			}
		});
		$("#changeRotation").linkbutton({	//修改按钮
			iconCls: 'icon-reload',
			onClick: function() {
				var row = $("#dg").datagrid('getSelected');
				if (row != null) {
					$('#changeFm').form('load','${pageContext.request.contextPath}/rotation/getById/' + row.id);
					$("#changeDialog").dialog({closed:false});
				} else {
					$.messager.show({
						title: "提醒",
						msg: "请选中一行"
					});
				}
			}
		});
		$("#removeRotation").linkbutton({	//删除
			iconCls: 'icon-cancel',
			onClick: function() {
				var row = $("#dg").datagrid('getChecked');
				if (row.length > 0) {
					$.messager.confirm('确认对话框', '您确定删除选择的展示图吗？', function(r){
						if (r){
						    for(var i = 0; i < row.length;i++) {
						    	$.ajax({
								url: '${pageContext.request.contextPath}/rotation/deleteRotation/' + row[i].id,
								dateType: "json",
								type: "post",
								success: function(map) {
									$("#dg").datagrid("reload");
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
				$("#addFm").form("submit");
			}
		});
		$("#cancel").linkbutton({		//取消按钮
			iconCls: 'icon-cancel',
			onClick: function() {
				$("#addDialog").dialog("close");
				$("#addFm").form("clear");
			}
		});
		
		$("#changeConfirm").linkbutton({  //提交修改
			iconCls: 'icon-check_error',
			onClick: function() {
				$("#changeFm").form("submit");
			}
		});
		$("#changeCancel").linkbutton({		//取消修改
			iconCls: 'icon-cancel',
			onClick: function() {
				$("#changeDialog").dialog("close");
				$("#changeFm").form("clear");
			}
		});
		
		
		
		//---------------------------------------------对话框-----------------------------------
		//添加的dialog
		$("#addDialog").dialog({
			title: "添加",
			modal: true,
			closed: true,	
			buttons: "#dialogBtns"
		});
		//修改的dialog
		$("#changeDialog").dialog({
			title: "修改",
			modal: true,
			closed: true,
			buttons: "#dialogBtns1"
		});
		
		//----------------------------------------------form----------------------------------
		//表单-添加
		$("#addFm").form({
			url: "${pageContext.request.contextPath}/rotation/add.do",
			onSubmit: function() {
				return true;
			},
			success: function(json) {
				var obj = JSON.parse(json);
				if(obj.code == 200) {
					$("#addDialog").dialog({closed:true});
					$("#addFm").form("clear");
					$('#dg').datagrid("reload");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				} else {
					$("#addDialog").dialog({closed:true});
					$("#addFm").form("clear");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				}
			}
			
		});
		
		//表单-修改
		$("#changeFm").form({
			url: "${pageContext.request.contextPath}/rotation/changeRotation.do",
			onSubmit: function() {
				return true;
			},
			success: function(json) {
				var obj = JSON.parse(json);
				if(obj.code == 200) {
					$("#changeDialog").dialog({closed:true});
					$("#changeFm").form("clear");
					$('#dg').datagrid("reload");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				} 
			}
		});
		
		//文本框设置
		$("#title").textbox({
			width:190,
			required: true,

		});

		$("#imagePath").filebox({
			width: 190,
			buttonText: "选择图片",
			required: true,
		}); 
		$("#description").textbox({
			width:190,
			required: true,

		});
		$("#status").combobox({	//下拉框
			width:190,
			required: true,
		});
		$("#proportion").combobox({ //下拉框
			width:190,
			required: true,
		});
		
		//文本框设置==修改
		$("#cid").textbox({
			width:190,
			required: true,
			disabled: true
		});
		$("#y").textbox({
			width:190,
			required: true,
		});
		$("#cimagePath").textbox({
			width: 190,
			required: true,
			disabled: true
		}); 
		$("#cdescription").textbox({
			width:190,
			required: true,
		});
		$("#cstatus").combobox({	//下拉框
			width:190,
			required: true,
		});
		$("#cproportion").combobox({ //下拉框
			width:190,
			required: true,
		});
		//----------------------------------------------表格----------------------------------
		//表格数据
		$('#dg').datagrid({   
			height: "530",
			toolbar: "#btns",
   			url: "/zzu/rotation/getAll",
   			pagination: true,
   			pageSize: 5,
   			pageList: [5,7,10,15],
   			fitColumns: true,
   			remoteSort:false,
			singleSelect:false,
			checkOnSelect: true,
			nowrap:false,

	   		columns:[[ 
		        {field:'id',title:'编号',checkbox:true,width:100,align:'center'},    
		        {field:'title',title:'标题',width:100,align:'center'},    
		        {field:'file',title:'图片路径',width:100,align:'center'},
		        {field:'uploadDate',title:'上传时间',width:100,align:'center',sortable:true},
		        {field:'description',title:'描述',width:100,align:'center'},
		        {field:'proportion',title:'权重',width:100,align:'center',sortable:true},
		        {field:'status',title:'展示状态',width:100,align:'center',formatter: function(value,row,index){
						if (value == 1){
							<!-- 是否展示 -->
							return "<input class='show_switch_button' checked/>";
						} else {
							return "<input class='show_switch_button'/>";
						}
					}
				},
	     	]],    
	     	view: detailview,
			detailFormatter: function(rowIndex, rowData){
				return '<table><tr>' +
					'<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}' + rowData.file + '" style="height:50px;"></td>' +
					'<td style="border:0">' +
					'<p>描述: ' + rowData.description + '</p>' +
					'<p>状态: ' + rowData.status + '</p>' +
					'</td>' +
					'</tr></table>';
			},
			onLoadSuccess: function() {
				$(".show_switch_button").switchbutton({ 
		      		width:150,
					disabled: true,
		      		height: "20",
		      		onText: "正在展示",
		      		offText: "禁止",
		      		onChange: function(checked){ 
		        		console.log(checked); 
		      		} 
		    	}) 
			} 
		});
		
		
		
	</script>
</body>
</html>