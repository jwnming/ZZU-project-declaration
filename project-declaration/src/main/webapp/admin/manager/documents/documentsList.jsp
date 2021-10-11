<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>文档</title>
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
	<div id="btns1p_documents">
	</div>
	
	<script type="text/javascript">
		//----------------------------------------------表格----------------------------------
		//表格数据
		$('#btns1p_documents').datagrid({
			height: "530",
			toolbar: "#btns1p_status",
   			url: "${pageContext.request.contextPath}/documents/getAll",
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
		        {field:'name',title:'文档名',width:100,align:'center'},
		        {field:'href',title:'实际存储路径+存储名',width:240,align:'center',sortable:true},
		        {field:'project_id',title:'所属项目',width:150,align:'center',formatter: function(value,row,index){
						return "<span style='color: lawngreen;'><b>已绑定项目，可在项目管理窗口中下载</b></span>";
					}
				},
		        {field:'user_id',title:'所属用户ID',width:100,align:'center',sortable:true},

	     	]],
		});
	</script>
</body>
</html>