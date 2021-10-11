<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>管理</title>
	<meta charset="utf-8"/>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
	
	
</head>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main3" style="width: 900px;height:500px; margin: 20px 0px 0px 20px;float:left;"></div>
    
    <script type="text/javascript">
    //-------------------------------------- 图表3 ---------------------------
    //获得最近十二个月，每月的用户注册量
    	$.ajax({
    		url: "${pageContext.request.contextPath}/project/categoryStatistics",
    		dataType: "json",
    		success: function(obj) {
    			console.log(obj);
    			 // 使用刚指定的配置项和数据显示图表。
       			 myChart3.setOption({
       			 	 series: [{
		                name: '申报量',
		                type: 'bar',
		                data: obj,
						 itemStyle: {
							 normal: {
								 // 随机显示
								 color:function(d){return "#"+Math.floor(Math.random()*(256*256*256-1)).toString(16);}

								 // 定制显示（按顺序）
								 /*color: function(params) {
									 var colorList = ['#C33531','#EFE42A','#64BD3D','#EE9201','#29AAE3', '#B74AE5','#0AAF9F','#E89589','#16A085','#4A235A','#C39BD3 ','#F9E79F','#BA4A00','#ECF0F1','#616A6B','#EAF2F8','#4A235A','#3498DB' ];
									 return colorList[params.dataIndex]
								 }*/
							 },
						 },
		            }]
       			 });
    		}
    	});
   
        // 基于准备好的dom，初始化echarts实例
        var myChart3 = echarts.init(document.getElementById('main3'));
        // 指定图表的配置项和数据
        var option3 = {
            title: {
                text: '郑州大学各类型项目申报量(包含未审核及未通过)'
            },
            tooltip: {},
            legend: {
                data:['申报量']
            },
            xAxis: {
                data: ["非实验室创新项目", "实验室软件项目", "教学实验项目", "其他类型"]
            },
            yAxis: {},
            
        };
 		myChart3.setOption(option3);
    

	</script>
</body>
</html>