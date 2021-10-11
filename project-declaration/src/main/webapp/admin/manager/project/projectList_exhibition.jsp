<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>guanli</title>
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
	<table id="dgp_exhibition"></table>
	<!-- 表格按钮组 -->
	<div id="btns1p_exhibition">
		<a id="changeStatus1p_exhibition">修改首页展示状态</a>
		<span style="padding-left: 300px;color:red;"><b>请双击进行修改！！！</b></span>
	</div>
	
	<!--====================================对话框按钮组==============-->
	
	<!--====================================标签,form,dialog==============-->
	
	<!--===================================Forms==============-->	
	
	<script type="text/javascript">
		//按钮
		$("#changeStatus1p_exhibition").linkbutton({
			iconCls: "icon-edit",
			onClick: function() {
				alert("双击即可修改！！！")
			}
		});
		//----------------------------------------------表格----------------------------------
		//表格数据
		$('#dgp_exhibition').datagrid({
			height: "530",
			toolbar: "#btns1p_exhibition",
   			url: "${pageContext.request.contextPath}/project/getAll",
   			pagination: true,
   			pageSize: 8,
   			pageList: [8,10,12],
   			fitColumns: true,
   			remoteSort:false,
			singleSelect:true,
			nowrap:false,
			buttons: "#changeStatus1p_exhibition",
	   		columns:[[ 
		        {field:'id',title:'编号',width:80,align:'center'},    
		        {field:'title',title:'项目名',width:100,align:'center'},
		        {field:'declare_time',title:'申请时间',width:130,align:'center',sortable:true},
		        {field:'funds',title:'资金',width:100,align:'center',sortable:true,formatter: function(value,row,index){
						return value + " (万元)";
					}
				},
		        {field:'description',title:'简介',width:100,align:'center',sortable:true},
		        {field:'exhibition',title:'前台首页展示',width:180,align:'center',sortable:true,formatter: function(value,row,index){
						if (value == 1){
							<!-- 是否展示 -->
							return "<input class='show_switch_button' checked/>";
						} else {
							return "<input class='show_switch_button' />";
						}
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
   				var exhibitiontmp = 1;
   				if (row.exhibition == 1) {
   					exhibitiontmp = 0;
				} else {
   					exhibitiontmp = 1;
				}
				$.ajax({
					url: "${pageContext.request.contextPath}/project/changeExhibition/" + row.id +"/" + exhibitiontmp,
					dataType: "json",
					success: function(obj) {
						$('#dgp_exhibition').datagrid("reload");
						$.messager.show({
							title: "提醒",
							msg: "操作成功"
						})
					}
				});

			}
		});
	</script>
	
</body>
</html>