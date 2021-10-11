<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>郑州大学项目申报管理中心</title>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/themes/IconExtension.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/themes/black/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/themes/IconExtension.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/datagrid-detailview.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/echarts.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/china.js"></script>
		<script src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
<script type="text/javascript">
	<!--菜单处理-->
	$(function() {

		//加载类别
		$.ajax({
			url: "${pageContext.request.contextPath}/menu/getAll",
			type: "get",
			dataType: "json",
			success: function(list) {
				for(var i = 0; i < list.length; i++) {
					//拼接二级分类子类的content(tree)
					var children = ""
					for(var j = 0; j < list[i].children.length; j++) {
						children = children + "<p style=\"text-align:center;\"><a class=\"easyui-linkbutton\" data-options=\"width:130,iconCls:'"+list[i].children[j].icon+"'\" "+
						"onclick=\"addTabs('"+list[i].children[j].id+"','"+list[i].children[j].title+"','"+list[i].children[j].href+"','"+list[i].children[j].icon+"')\">"+list[i].children[j].title+"</a></p>";
					}

					//添加一级分类
					if (i == 0) {
						$('#aa').accordion('add', {
							title: list[i].title,
							iconCls: list[i].icon,
							content: children,
							selected: true
						});
					} else {
						$('#aa').accordion('add', {
							title: list[i].title,
							iconCls: list[i].icon,
							content: children,
							selected: false
						});
					}

				}
			}
		});
	});
	//点击类别创建tabs
	function addTabs(id, title, href, icon) {
		var tabIsExist = $('#tt').tabs('exists',title);   
		if (tabIsExist) {
			$('#tt').tabs('select',title);
		} else {
			$('#tt').tabs('add', {  
				href: '${pageContext.request.contextPath}' + href,
			    title: title,
				fit: true,
				iconCls: icon,
			    closable: true
			});
		}	
	}
	
</script>

</head>
<body class="easyui-layout">
    <div data-options="region:'north',unsplit:true" style="height:60px;background-color:#5b5b5b;">
    	<div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" ><img src="${pageContext.request.contextPath}/admin/img/zzu_logo_new.png" style="height: 43px;margin-bottom: -13px;margin-right: 20px;" alt="zzu—logo">郑州大学项目申报管理中心</div>
    	<div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">注意：亲爱的管理员，请认真核对每一个细节！！！</div>
    </div>   
    <div data-options="region:'south',unsplit:true" style="height: 40px;background: #5b5b5b;">
    	<div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;郑州大学 蒋文明 jwnmingjava@qq.com</div>
    </div>   
       
    <div data-options="region:'west',title:'导航菜单',unsplit:true" style="width:150px;">
    	<div id="aa" class="easyui-accordion" data-options="fit:true">
    		<!-- 分级 -->
    	</div>
    </div>
	<div data-options="region:'east',title:'辅助栏',unsplit:true" style="width:130px;">
		<div id="mm" class="easyui-accordion" data-options="fit:true" style="padding-left:10px;">
			<br /><br />
			<b>管理员：</b><span style="color: greenyellow"><b>${sessionScope.admin.name}</b></span><br /><br /><br /><br />

			辅助操作：<br /><br />
			<a href="${pageContext.request.contextPath }/admin/loginout.do" style="width:110px;" class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出管理系统</a><br /><br />
			<a href="${pageContext.request.contextPath }/admin/main/main.jsp" style="width:110px;" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412111'">系统刷新</a>&nbsp;&nbsp;<br /><br />
			<a href="${pageContext.request.contextPath }/admin/main/main.jsp" style="width:110px;" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭选项卡</a>&nbsp;&nbsp;<br /><br /><br /><br />
			链接：<br /><br />
			<a href="${pageContext.request.contextPath }/user/index.jsp" style="width:110px;" class="easyui-linkbutton" data-options="iconCls:'icon-attach'">申报中心首页</a>&nbsp;&nbsp;<br /><br />
			<a href="http://www15.zzu.edu.cn/ "style="width:110px;" class="easyui-linkbutton" data-options="iconCls:'icon-attach'">郑州大学官网</a>&nbsp;&nbsp;<br /><br />
			<a href="http://news.zzu.edu.cn/ "style="width:110px;" class="easyui-linkbutton" data-options="iconCls:'icon-attach'">郑大新闻网</a>&nbsp;&nbsp;<br /><br />



		</div>
	</div>

	<div data-options="region:'center'">
    	<div id="tt" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">   
		    <div title="申报中心主页(默认)" data-options="iconCls:'icon-neighbourhood'" style="background-image:url(image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
		</div>
    </div>
</body> 
</html>