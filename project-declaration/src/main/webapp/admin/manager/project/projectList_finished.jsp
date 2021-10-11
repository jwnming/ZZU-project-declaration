<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>已完成</title>
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
	<!--====================================数据表格==============-->
	<table id="dgp_finished"></table>
	
	<script type="text/javascript">

		//----------------------------------------------表格----------------------------------
		//表格数据
		$('#dgp_finished').datagrid({
			height: "530",
			toolbar: "#btns1p_finished",
   			url: "${pageContext.request.contextPath}/project/getAllFinished",
   			pagination: true,
   			pageSize: 8,
   			pageList: [8,10,12],
   			fitColumns: true,
   			remoteSort:false,
			singleSelect:true,
			nowrap:false,
			buttons: "#changefinished1p_finished",
	   		columns:[[ 
		        {field:'id',title:'编号',width:80,align:'center'},    
		        {field:'title',title:'项目名',width:100,align:'center'},
		        {field:'declare_time',title:'申请时间',width:130,align:'center',sortable:true},
		        {field:'funds',title:'资金',width:100,align:'center',sortable:true,formatter: function(value,row,index){
						return value + " (万元)";
					}
				},
		        {field:'description',title:'简介',width:100,align:'center',sortable:true},
		        {field:'category',title:'项目类型',width:100,align:'center'},
		        {field:'user_name',title:'负责人',width:100,align:'center'},
		        {field:'finished',title:'进度',width:180,align:'center',formatter: function(value,row,index){
						return "<span style='color: greenyellow;'><b>已完成</b></span>";
					}
				},
	     	]],

		});
	</script>
	
</body>
</html>