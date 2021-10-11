<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>资金采购</title>
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

   <table id="tg_device"></table>
	<!--====================================数据树的按钮组==============-->
	<div id="toolbtns_device">
		<a href="javascript:void(0)" id="managerdevice">采购验证</a>
		<a href="javascript:void(0)" id="removedevice">删除</a>
	</div>
	
	<script>
		//----------------------------------------------esayUI--tool按钮--------------------------------------------------------------------------
		//按钮
		$("#managerdevice").linkbutton({
			iconCls: "icon-edit",
			onClick: function() {
				var row = $('#tg_device').treegrid("getSelected");
				if(row == null) {
					$.messager.show({
						title: "提示",
						msg: "请选中一个行"
					});
				} else if(row._parentId == undefined) {
					$.messager.show({
						title: "提示",
						msg: "不能是项目，请选中一行设备"
					});
				} else if(row.device_status == 1) {
					$.messager.show({
						title: "提示",
						msg: "已验证"
					});
				} else {
					$.messager.confirm("正在审核","您需要实地考察采购物情况。“确定”为验证通过；“取消”为验证不通过", function(result) {
                        if(result) {
                            $.ajax({
                                url: "${pageContext.request.contextPath}/purchase/changeDeviceStatus/" + row.id +"/1",
									dataType: "json",
									success: function(obj) {
										$.messager.show({
											title: "提示",
											msg: obj.msg
										});
										$('#tg_device').treegrid("reload");
									}
								});
							}
						});
				}

			}
		});
		$("#removedevice").linkbutton({
			iconCls: "icon-cancel",
			onClick: function() {
				var row = $('#tg_device').treegrid("getSelected");
				if(row == null) {
					$.messager.show({
						title: "提示",
						msg: "请选中一个行"
					});
				} else if(row._parentId == undefined) {
					$.messager.show({
						title: "提示",
						msg: "不能是项目，请选中一行设备"
					});
				} else {
					$.messager.confirm("正在删除","请确认？", function(result) {
						if(result) {
							$.ajax({
								url: "${pageContext.request.contextPath}/purchase/deleteDeviceById/" + row.id,
								dataType: "json",
								success: function(obj) {
									$.messager.show({
										title: "提示",
										msg: obj.msg
									});
									$('#tg_device').treegrid("reload");
								}
							});
						}
					});

				}

			}
		});
		
		//tree数据---------------------------------------------------------------------------
		$('#tg_device').treegrid({
			toolbar: "#toolbtns_device",
			height: "530",
		    url:'${pageContext.request.contextPath}/purchase/getAll.do',
			fitColumns: true, 
		    idField:'id',    
		    treeField:'title',    
		    columns:[[
		        {field:'title',title:'名称',width:160},
		        {field:'model',title:'型号',width:100},
		        {field:'count',title:'数量',width:100},
		        {field:'source',title:'来源',width:100},
		        {field:'plan_expenditure',title:'计划支出(万元)',width:100},
		        {field:'total_payment',title:'实际支出(万元)',width:100},
		        {field:'arrival_time',title:'验收时间',width:100},
		        {field:'device_status',title:'管理员对采购物验收',width:100,formatter:function(value,row,index) {
                        if(value == 1) {
                            return "<span style='color: greenyellow'>已验证交付</span>";
                        } else if(value == 0) {
                            return "<span style='color: white;'>待验证</span>";
                        } else {
                            return "";
                        }
                    }},
		        //{field:'device_id',title:'设备编号',width:200},
		        /*{field:'audioSize',title:'大小',width:80,formatter:function(value,row,index) {
		        	if(value!=NaN && value!=undefined) {
		        		return value;
		        	} else {
		        		return "";
		        	}
		        }}, 
		        {field:'duration',title:'时长',width:80,formatter:function(value,row,index) {
		        	if(value!=NaN && value!=undefined) {
		        		return value;
		        	} else {
		        		return "";
		        	}
		        }},*/
		       	{title:'项目&对应设备编号',field:'id',width:80},
		    ]]

		});  
		
	</script>
</body>
</html>