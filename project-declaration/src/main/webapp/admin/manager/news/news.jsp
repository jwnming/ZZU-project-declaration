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
	<table id="dg_news"></table>
	<!-- 表格按钮组 -->
	<div id="btns_news">
		<a id="addNews">添加</a>
		<a id="changeNews">修改</a>
		<a id="removeNews">删除</a>
	</div>
	<!-- 添加对话框按钮组 -->
	<div id="dialogBtns_news">
		<a href="#" id="addConfirm" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认添加</a>
		<a href="#" id="cancel">取消</a>
	</div>
	<!-- 修改对话框按钮组 -->
	<div id="dialogBtns1_news">
		<a href="javascript:void(0)" id="changeConfirm" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认修改</a>
		<a href="javascript:void(0)" id="changeCancel">取消</a>
	</div>
	
	<!-- 添加对话框 -->
	<div id="addDialog_news">
		<form id="addNewsFm" method="post">
			<fieldset> <legend>添加新闻</legend>
				<table style="width: 300px;text-align: center;">
					<tr><td>标题</td>
						<td><input type="text" name="title" id="newstitle"/></td>
					</tr>
					<tr><td>内容</td>
						<td><input type="text" name="content" id="newscontent"/></td>
					</tr>
					<tr><td>展示状态</td>
						<td>
							<select id="newsstatus" name="status">
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
	<div id="changeNewsDialog">
		<form id="changeNewsFm">
			<fieldset> <legend>修改新闻</legend>
			<table style="width: 300px;text-align: center;">
					<tr>
						<td><input type="hidden" name="id"/></td>
					</tr>
					<tr><td>新闻标题</td>
						<td><input type="text" name="title" id="newsy" /></td>
					</tr>
					<tr><td>内容</td>
						<td><input type="text" name="content" id="newscontent1" /></td>
					</tr>
					<tr><td>上传时间</td>
						<td><input type="text" name="upload_time" id="newsupload_time" /></td>
					</tr>

					<tr><td>展示状态</td>
						<td>
							<select id="newscstatus" name="status">
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
		$("#addNews").linkbutton({ //添加按钮
			iconCls: 'icon-add',
			onClick: function() {
				$("#addDialog_news").dialog({closed:false});
			}
		});
		$("#changeNews").linkbutton({	//修改按钮
			iconCls: 'icon-reload',
			onClick: function() {
				var row = $("#dg_news").datagrid('getSelected');
				if (row != null) {
					$('#changeNewsFm').form('load','${pageContext.request.contextPath}/news/getById/' + row.id);
					$("#changeNewsDialog").dialog({closed:false});
				} else {
					$.messager.show({
						title: "提醒",
						msg: "请选中一行"
					});
				}
			}
		});
		$("#removeNews").linkbutton({	//删除
			iconCls: 'icon-cancel',
			onClick: function() {
				var row = $("#dg_news").datagrid('getChecked');
				if (row.length > 0) {
					$.messager.confirm('确认对话框', '您确定删除该条新闻吗？', function(r){
						if (r){
						    for(var i = 0; i < row.length;i++) {
						    	$.ajax({
								url: '${pageContext.request.contextPath}/news/deleteNews/' + row[i].id,
								dateType: "json",
								type: "post",
								success: function(map) {
									$("#dg_news").datagrid("reload");
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
				$("#addNewsFm").form("submit");
			}
		});
		$("#cancel").linkbutton({		//取消按钮
			iconCls: 'icon-cancel',
			onClick: function() {
				$("#addDialog_news").dialog("close");
				$("#addNewsFm").form("clear");
			}
		});
		
		$("#changeConfirm").linkbutton({  //提交修改
			iconCls: 'icon-check_error',
			onClick: function() {
				$("#changeNewsFm").form("submit");
			}
		});
		$("#changeCancel").linkbutton({		//取消修改
			iconCls: 'icon-cancel',
			onClick: function() {
				$("#changeNewsDialog").dialog("close");
				$("#changeNewsFm").form("clear");
			}
		});
		
		
		
		//---------------------------------------------对话框-----------------------------------
		//添加的dialog
		$("#addDialog_news").dialog({
			title: "添加",
			modal: true,
			closed: true,	
			buttons: "#dialogBtns_news"
		});
		//修改的dialog
		$("#changeNewsDialog").dialog({
			title: "修改",
			modal: true,
			closed: true,
			buttons: "#dialogBtns1_news"
		});
		
		//----------------------------------------------form----------------------------------
		//表单-添加
		$("#addNewsFm").form({
			url: "${pageContext.request.contextPath}/news/add.do",
			onSubmit: function() {
				return true;
			},
			success: function(json) {
				var obj = JSON.parse(json);
				if(obj.code == 200) {
					$("#addDialog_news").dialog({closed:true});
					$("#addNewsFm").form("clear");
					$('#dg_news').datagrid("reload");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				} else {
					$("#addDialog_news").dialog({closed:true});
					$("#addNewsFm").form("clear");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				}
			}
			
		});
		
		//表单-修改
		$("#changeNewsFm").form({
			url: "${pageContext.request.contextPath}/news/changeNews.do",
			onSubmit: function() {
				return true;
			},
			success: function(json) {
				var obj = JSON.parse(json);
				if(obj.code == 200) {
					$("#changeNewsDialog").dialog({closed:true});
					$("#changeNewsFm").form("clear");
					$('#dg_news').datagrid("reload");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				} 
			}
		});
		
		//文本框设置==添加
		$("#newstitle").textbox({
			width:190,
			required: true,
		});
		$("#newscontent").textbox({
			width: 190,
			required: true,
		}); 

		$("#newsstatus").combobox({	//下拉框
			width:190,
			required: true,
		});

		
		//文本框设置==修改
		$("#newscid").textbox({
			width:190,
			disabled: true
		});
		$("#newsy").textbox({
			width:190,
			required: true,
		});
		$("#newscontent1").textbox({
			width: 190,
			required: true,
		});
		$("#newsupload_time").textbox({
			width: 190,
			disabled: true
		});

		$("#newscstatus").combobox({	//下拉框
			width:190,
			required: true,
		});

		//----------------------------------------------表格----------------------------------
		//表格数据
		$('#dg_news').datagrid({
			height: "530",
			toolbar: "#btns_news",
   			url: "/zzu/news/getAll",
   			pagination: true,
   			pageSize: 5,
   			pageList: [5,6,7],
   			fitColumns: true,
   			remoteSort:false,
			singleSelect:false,
			checkOnSelect: true,
			nowrap:false,

	   		columns:[[ 
		        {field:'id',title:'编号',checkbox:true,width:100,align:'center'},    
		        {field:'title',title:'标题',width:100,align:'center'},
		        {field:'upload_time',title:'上传时间',width:100,align:'center',sortable:true},
		        {field:'content',title:'内容',width:200,align:'center',formatter: function(value,row,index){
						return "展开显示新闻详情";
					}
				},
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
						'<td style="border:0">内容详情:</td></tr>' +
						'<tr><td style="border:0">' +
						'<textarea disabled="disabled" style="border:1px dimgrey solid;width:1000px;height:80px;background-color: dimgrey;color:white;padding-left: 30px;padding-right: 30px;">' + rowData.content + '</textarea>' +
						'</td>' +
						'</tr></table>';
			},

			onLoadSuccess: function() {
				$(".show_switch_button").switchbutton({ 
		      		width:150,
		      		height: "20",
		      		onText: "正在展示",
		      		offText: "禁止",
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