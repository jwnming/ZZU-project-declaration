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
	<table id="dgp_projectConfirm"></table>
	<!-- 表格按钮组 -->
	<div id="btns1p_projectConfirm">
		<span style="padding-left: 300px;color:red;"><b>请双击进行通过完成验证！！！</b></span>
	</div>
	
	<!--====================================对话框按钮组==============-->
	
	<!--====================================标签,form,dialog==============-->
	
	<!--===================================Forms==============-->	
	
	<script type="text/javascript">

		//----------------------------------------------表格----------------------------------
		//表格数据
		$('#dgp_projectConfirm').datagrid({
			height: "530",
			toolbar: "#btns1p_projectConfirm",
   			url: "${pageContext.request.contextPath}/project/getAllConfirm",
   			pagination: true,
   			pageSize: 8,
   			pageList: [8,10,12],
   			fitColumns: true,
   			remoteSort:false,
			singleSelect:true,
			nowrap:false,
			buttons: "#changeStatus1p_projectConfirm",
	   		columns:[[ 
		        {field:'id',title:'编号',width:80,align:'center'},    
		        {field:'title',title:'项目名',width:100,align:'center'},
		        {field:'declare_time',title:'申请时间',width:130,align:'center',sortable:true},
		        {field:'funds',title:'资金',width:100,align:'center',sortable:true,formatter: function(value,row,index){
						return value + " (万元)";
					}
				},
		        {field:'description',title:'简介',width:100,align:'center',sortable:true},
		        {field:'finished',title:'验收操作',width:180,align:'center',sortable:true,formatter: function(value,row,index){
						return "<span style='color:white;'>双击完成验收</span>";

					}
				},
	     	]],    
	     
			onLoadSuccess: function() {
				$(".show_switch_button").switchbutton({ 
		      		width:100,
		      		height: "20",
		      		onText: "展示",
		      		offText: "不展示",
		      		disabled: true
		    	}) 
			},
			onDblClickRow: function (index, row) {
   				var projectConfirmtmp = 1;
   				if (row.projectConfirm == 1) {
   					projectConfirmtmp = 0;
				} else {
   					projectConfirmtmp = 1;
				}
				$.ajax({
					url: "${pageContext.request.contextPath}/project/projectConfirm/" + row.id +"/1",
					dataType: "json",
					success: function(obj) {
						$('#dgp_projectConfirm').datagrid("reload");
						$.messager.show({
							title: "提醒",
							msg: "操作成功"
						})
					}
				});
				$('#dgp_projectConfirm').datagrid("reload");
				$.messager.show({
					title: "提醒",
					msg: "操作成功"
				})

			}
		});
	</script>
	
</body>
</html>