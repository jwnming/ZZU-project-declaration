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
	<table id="dg_category"></table>
	<!-- 表格按钮组 -->
	<div id="btns_category">
		<a id="addcategory">添加项目分类</a>
		<a id="removecategory" style="margin-left: 2px;">删除项目分类信息</a>

	</div>
	<!-- 添加对话框按钮组 -->
	<div id="dialogBtns_category">
		<a href="#" id="addConfirm" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认添加</a>
		<a href="#" id="cancel">取消</a>
	</div>

	<!-- 添加对话框 -->
	<div id="addDialog_category">
		<form id="addcategoryFm" method="post">
			<fieldset> <legend>添加分类</legend>
				<table style="width: 300px;text-align: center;">
					<tr><td>项目分类名字</td>
						<td><input type="text" name="name" id="namec"/></td>
					</tr>
					<tr><td>档案识别码后缀</td>
						<td><input type="text" name="distinguish" id="distinguish"/></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>

	<script type="text/javascript">
		//-----------------------------------------------按钮---------------------------------
		$("#addcategory").linkbutton({ //添加按钮
			iconCls: 'icon-add',
			onClick: function() {
				$("#addDialog_category").dialog({closed:false});
			}
		});

		$("#removecategory").linkbutton({	//删除
			iconCls: 'icon-cancel',
			onClick: function() {
				var row = $("#dg_category").datagrid('getChecked');
				if (row.length > 0) {
					$.messager.confirm('确认对话框', '您确定删除该分类信息吗？', function(r){
						if (r){
						    for(var i = 0; i < row.length;i++) {
						    	$.ajax({
								url: '${pageContext.request.contextPath}/category/deleteCategory/' + row[i].id,
								dateType: "json",
								type: "post",
								success: function(map) {
									$("#dg_category").datagrid("reload");
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
				$("#addcategoryFm").form("submit");
			}
		});

		$("#cancel").linkbutton({		//取消按钮
			iconCls: 'icon-cancel',
			onClick: function() {
				$("#addDialog_category").dialog("close");
				$("#addcategoryFm").form("clear");
			}
		});

		
		//---------------------------------------------对话框-----------------------------------
		//添加的dialog
		$("#addDialog_category").dialog({
			title: "添加项目分类信息",
			modal: true,
			closed: true,	
			buttons: "#dialogBtns_category"
		});
		//----------------------------------------------form----------------------------------
		//表单-添加
		$("#addcategoryFm").form({
			url: "${pageContext.request.contextPath}/category/addCategory.do",
			onSubmit: function() {
				return true;
			},
			success: function(json) {
				var obj = JSON.parse(json);
				if(obj.code == 200) {
					$("#addDialog_category").dialog({closed:true});
					$("#addcategoryFm").form("clear");
					$('#dg_category').datagrid("reload");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				} else {
					$("#addDialog_category").dialog({closed:true});
					$("#addcategoryFm").form("clear");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				}
			}
		});

		//文本框设置==添加
		$("#namec").textbox({
			width:190,
			required: true,
		});
		$("#distinguish").textbox({
			width: 190,
			required: true,
		});

		//----------------------------------------------表格----------------------------------
		//表格数据
		$('#dg_category').datagrid({
			height: "530",
			toolbar: "#btns_category",
   			url: "/zzu/category/getAll",
   			/*pagination: true,
   			pageSize: 10,
   			pageList: [10,13,15,18,20],*/
   			fitColumns: true,
   			remoteSort:false,
			singleSelect:false,
			checkOnSelect: true,
			nowrap:false,
			singleSelect: true,
	   		columns:[[
				{field:'id',title:'类型编号',width:80,align:'center',sortable:true},
				{field:'name',title:'类型名称',width:100,align:'center'},
				{field:'distinguish',title:'档案识别码',width:180,align:'center',sortable:true,formatter: function(value,row,index){
					if (value == "") {
						return "<span style='color: greenyellow;'><b>zzu_2019_xxx_default</b></span>";
					}
						return "<span style='color: greenyellow;'><b>zzu_2019_xxx_" + value + "</b></span>";
					}
				},
	     	]],
		});
	</script>
</body>
</html>