<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>管理</title>
	<meta charset="utf-8"/>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/black/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/IconExtension.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/datagrid-detailview.js"></script>
	<script type="text/javascript">

	</script>
</head>
<body>
	<!--====================================数据树的按钮组==============-->
	<table id="dgp_status"></table>
	<!-- 表格按钮组 -->
	<div id="btns1p_status">
		<a id="changeProejctStatus">点击进行项目审核</a>
		<a id="removeprojectStatus">点击删除未审核通过的项目</a>
		<%--<span style="padding-left: 300px;color:red;"><b>请双击进行修改！！！</b></span>--%>
	</div>

	
	<script type="text/javascript">
		//按钮
		$("#changeProejctStatus").linkbutton({
			iconCls: "icon-edit",
			onClick: function() {
				var row = $('#dgp_status').datagrid("getSelected");
				if(row == null) {
					$.messager.show({
						title: "提醒",
						msg: "请选中后再操作"
					});
				} else {
					$.messager.confirm("正在审核","您需要认真查看项目负责人信息、申报信息等。“确定”为审核通过；“取消”为审核不通过", function(result) {
						if(result) {
							$.ajax({
								url: "${pageContext.request.contextPath}/project/changeStatus/" + row.id +"/1",
								dataType: "json",
								success: function(obj) {
									console.log(obj)
									$('#dgp_status').datagrid("reload");
								}
							});
						} else {
							$.ajax({
								url: "${pageContext.request.contextPath}/project/changeStatus/" + row.id +"/2",
								dataType: "json",
								success: function(obj) {
									console.log(obj)
									$('#dgp_status').datagrid("reload");
								}
							});
						}
					});
				}
			}
		});

		$("#removeprojectStatus").linkbutton({	//删除
			iconCls: 'icon-cancel',
			onClick: function() {
				var row = $("#dgp_status").datagrid('getChecked');
				if (row.length > 0) {
					$.messager.confirm('确认对话框', '您确定删除该项目吗？', function(r){
						if (r){
							for(var i = 0; i < row.length;i++) {
								$.ajax({
									url: '${pageContext.request.contextPath}/project/deleteProject/' + row[i].id,
									dateType: "json",
									type: "post",
									success: function(map) {
										$("#dgp_status").datagrid("reload");
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

		//----------------------------------------------表格----------------------------------
		//表格数据
		$('#dgp_status').datagrid({
			height: "530",
			toolbar: "#btns1p_status",
   			url: "${pageContext.request.contextPath}/project/getAllStatus",
   			pagination: true,
   			pageSize: 8,
   			pageList: [8,10,12],
   			fitColumns: true,
   			remoteSort:false,
			singleSelect:true,
			nowrap:false,
			buttons: "#changeStatus1p_status",
	   		columns:[[ 
		        {field:'id',title:'编号',width:80,align:'center'},    
		        {field:'title',title:'项目名',width:100,align:'center'},
		        {field:'declare_time',title:'申请时间',width:130,align:'center',sortable:true},
		        {field:'funds',title:'资金',width:100,align:'center',sortable:true,formatter: function(value,row,index){
						return value + " (万元)";
					}
				},
		        {field:'description',title:'简介',width:100,align:'center', formatter: function(value,row,index){
						return "<a class='jianjie' style='color: greenyellow;'>点击查看<a>";
					}
				},
		        {field:'category',title:'项目类型',width:100,align:'center'},
		        {field:'user_name',title:'负责人',width:100,align:'center'},
		        {field:'status',title:'审核状态',width:180,align:'center',formatter: function(value,row,index){
						if (value == 0) {
							return "<span style='color: red;'><b>未&nbsp;审&nbsp;核</b></span>";
						} else if(value == 2) {
							return "<span style='color: red;'><b>未&nbsp;通&nbsp;过&nbsp;审&nbsp;核(可再次审核)</b></span>";
						}

					}
				},
	     	]],
			onLoadSuccess: function () {

				$(".jianjie").linkbutton({
					width: 100,
					onClick: function () {
						var row = $('#dgp_status').datagrid("getSelected");
						alert("简介：" + row.description)
					}
				})
			}


		});
	</script>
	
</body>
</html>