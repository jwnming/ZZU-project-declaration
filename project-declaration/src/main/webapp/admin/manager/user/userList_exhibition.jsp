<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>甘露妙宝管理</title>
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
	<table id="dg1_exhibition"></table>
	<!-- 表格按钮组 -->
	<div id="btns1_exhibition">
		<a id="changeStatus1_exhibition">修改首页的展示状态</a>
		<span style="padding-left: 300px;color:red;"><b>请双击进行修改！！！</b></span>
	</div>
	
	<!--====================================对话框按钮组==============-->
	
	<!--====================================标签,form,dialog==============-->
	
	<!--===================================Forms==============-->	
	
	<script type="text/javascript">
		//按钮
		$("#changeStatus1_exhibition").linkbutton({
			iconCls: "icon-edit",
			onClick: function() {
				alert("请双击进行修改！！")
			}
		});
		//----------------------------------------------表格----------------------------------
		//表格数据
		$('#dg1_exhibition').datagrid({
			height: "530",
			toolbar: "#btns1_exhibition",
   			url: "${pageContext.request.contextPath}/user/getAll",
   			pagination: true,
   			pageSize: 12,
   			pageList: [12,15,17,20],
   			fitColumns: true,
   			remoteSort:false,
			singleSelect:true,
			nowrap:false,
			buttons: "#changeStatus1_exhibition",
	   		columns:[[ 
		        {field:'id',title:'编号',width:80,align:'center'},    
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
		        {field:'mobile',title:'手机号',width:100,align:'center',sortable:true},
		        {field:'laboratory',title:'所在实验室',width:130,align:'center'},
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
		      		width:50,
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
					url: "${pageContext.request.contextPath}/user/changeExhibition/" + row.id +"/" + exhibitiontmp,
					dataType: "json",
					success: function(obj) {
						$('#dg1_exhibition').datagrid("reload");
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