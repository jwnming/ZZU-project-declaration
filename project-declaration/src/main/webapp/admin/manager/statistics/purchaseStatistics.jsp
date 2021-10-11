<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>统计</title>
	<meta charset="utf-8"/>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
	
	
</head>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main4" style="width: 700px;height:500px; margin: 20px 0px 0px 50px;float:left;"></div>
    <div id="main5" style="width: 300px;height:500px; margin: 20px 0px 0px 20px;float:left;"></div>
    
    <script type="text/javascript">
    //-------------------------------------- 图表5 ---------------------------
    //总资金
    	$.ajax({
    		url: "${pageContext.request.contextPath}/purchase/allPurchaseStatistics",
    		dataType: "json",
    		success: function(obj) {
    			console.log(obj);
    			 // 使用刚指定的配置项和数据显示图表。
       			 myChart5.setOption({
       			 	 series: [{
		                name: '项目总资金',
		                type: 'bar',
		                data: obj,
						 itemStyle: {
							 normal: {
								 // 随机显示
								 color: 'white',

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
        var myChart5 = echarts.init(document.getElementById('main5'));
        // 指定图表的配置项和数据
        var option5 = {
            title: {
                text: '项目总资金统计'
            },
            tooltip: {},
            legend: {
                data:['注册量']
            },
            xAxis: {
                data: ["总资金(万)"]
            },
            yAxis: {},
            
        };
 		myChart5.setOption(option5);
    
    
    //-------------------------------------- 图表一 ---------------------------
    	//各类型项目资金统计
    	var a = [];
    	$.ajax({
    		url: "${pageContext.request.contextPath}/purchase/perPurchaseStatistics",
    		dataType: "json",
    		success: function(obj) {
    			 a = obj;
    			
    			 // 使用刚指定的配置项和数据显示图表。
       			 myChart4.setOption({
       			 	 series: [{
		                name: '资金',
		                type: 'bar',
		                data: a,
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
        var myChart4 = echarts.init(document.getElementById('main4'));
        // 指定图表的配置项和数据
        var option4 = {
            title: {
                text: '各个项目类型下的总资金(万)'
            },
            tooltip: {},
            legend: {
                data:['资金']
            },
            xAxis: {
                data: ["非实验创新项目","实验室软件项目","教学实验项目", "其他"]
            },
            yAxis: {},
            
        };
 		myChart4.setOption(option4);

	</script>
</body>
</html>