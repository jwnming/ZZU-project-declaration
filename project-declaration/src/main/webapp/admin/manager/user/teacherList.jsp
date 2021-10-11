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
	<table id="dg_teacher"></table>
	<!-- 表格按钮组 -->
	<div id="btns_teacher">
		<a id="addteacher">添加指导老师信息</a>
		<a id="removeTeacher">删除指导老师信息</a>

	</div>
	<!-- 添加对话框按钮组 -->
	<div id="dialogBtns_teacher">
		<a href="#" id="addConfirm" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认添加</a>
		<a href="#" id="cancel">取消</a>
	</div>
    <!-- 添加对话框 -->
    <div id="addDialog_teacher">
        <form id="addteacherFm" method="post">
            <fieldset> <legend>添加指导老师</legend>
                <table style="width: 300px;text-align: center;">
                    <tr><td>名字</td>
                        <td><input type="text" name="name" id="name"/></td>
                    </tr>
                    <tr><td>职称</td>
                        <td><input type="text" name="job" id="job"/></td>
                    </tr>

                    <tr><td>手机</td>
                        <td><input type="text" name="mobile" id="mobile"/></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>



	<script type="text/javascript">
		//-----------------------------------------------按钮---------------------------------
		$("#addteacher").linkbutton({ //添加按钮
			iconCls: 'icon-add',
			onClick: function() {
				$("#addDialog_teacher").dialog({closed:false});
			}
		});

		$("#removeTeacher").linkbutton({	//删除
			iconCls: 'icon-cancel',
			onClick: function() {
				var row = $("#dg_teacher").datagrid('getChecked');
				if (row.length > 0) {
					$.messager.confirm('确认对话框', '您确定删除该指导老师吗？', function(r){
						if (r){
							for(var i = 0; i < row.length;i++) {
								$.ajax({
									url: '${pageContext.request.contextPath}/teacher/deleteTeacher/' + row[i].id,
									dateType: "json",
									type: "post",
									success: function(map) {
										$("#dg_teacher").datagrid("reload");
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
				$("#addteacherFm").form("submit");
			}
		});
		$("#cancel").linkbutton({		//取消按钮
			iconCls: 'icon-cancel',
			onClick: function() {
				$("#addDialog_teacher").dialog("close");
				$("#addteacherFm").form("clear");
			}
		});
		

		//---------------------------------------------对话框-----------------------------------
		//添加的dialog
		$("#addDialog_teacher").dialog({
			title: "添加用户信息",
			modal: true,
			closed: true,	
			buttons: "#dialogBtns_teacher"
		});

		//----------------------------------------------form----------------------------------
		//表单-添加
		$("#addteacherFm").form({
			url: "${pageContext.request.contextPath}/teacher/addTeacher.do",
			onSubmit: function() {
				return true;
			},
			success: function(json) {
				var obj = JSON.parse(json);
				if(obj.code == 200) {
					$("#addDialog_teacher").dialog({closed:true});
					$("#addteacherFm").form("clear");
					$('#dg_teacher').datagrid("reload");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				} else {
					$("#addDialog_teacher").dialog({closed:true});
					$("#addteacherFm").form("clear");
					$.messager.show({
						title: "提醒",
						msg: obj.msg
					});
				}
			}
			
		});

		
		//文本框设置==添加
		$("#name").textbox({
			width:190,
            required: true,
		});
		$("#job").textbox({
			width: 190,
            required: true,
		});
        $("#mobile").textbox({
            width: 190,
            required: true,
        });


		//----------------------------------------------表格----------------------------------
		//表格数据
		$('#dg_teacher').datagrid({
			height: "530",
			toolbar: "#btns_teacher",
   			url: "/zzu/teacher/getAll",
   			pagination: true,
   			pageSize: 10,
   			pageList: [10,13,15,18,20],
   			fitColumns: true,
   			remoteSort:false,
			singleSelect:false,
			checkOnSelect: true,
			nowrap:false,
	   		columns:[[
				{field:'id',title:'编号',width:80,align:'center',sortable:true},
				{field:'name',title:'用户名',width:100,align:'center'},
				{field:'job',title:'职位',width:130,align:'center'},
				{field:'mobile',title:'联系手机',width:100,align:'center'},
	     	]],
			singleSelect: true,
		});
	</script>
</body>
</html>