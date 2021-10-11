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
    <div id="main" style="width: 500px;height:500px; margin: 20px 0px 0px 50px;float:left;"></div>
    <div id="main2" style="width: 500px;height:500px; margin: 20px 0px 0px 20px;float:left;"></div>
    
    <script type="text/javascript">
    //-------------------------------------- 图表二 ---------------------------
    //获得各个年级段的用户量
    	$.ajax({
    		url: "${pageContext.request.contextPath}/user/userLevelStatistics",
    		dataType: "json",
    		success: function(obj) {
    			console.log(obj);
    			 // 使用刚指定的配置项和数据显示图表。
       			 myChart2.setOption({
       			 	 series: [{
		                name: '注册量',
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
        var myChart2 = echarts.init(document.getElementById('main2'));
        // 指定图表的配置项和数据
        var option2 = {
            title: {
                text: '郑州大学各个年级用户量'
            },
            tooltip: {},
            legend: {
                data:['注册量']
            },
            xAxis: {
                data: ["2009级","2010级","2011级","2012级","2013级","2014级","2015级","2016级","2017级","2018级","2019级","未知"]
            },
            yAxis: {},
            
        };
 		myChart2.setOption(option2);
    
    
    //-------------------------------------- 图表一 ---------------------------
    	//申报中心用户注册的专业段统计
    	var a = [];
    	$.ajax({
    		url: "${pageContext.request.contextPath}/user/userDepartmentStatistics",
    		dataType: "json",
    		success: function(obj) {
    			 a = obj;
    			
    			 // 使用刚指定的配置项和数据显示图表。
       			 myChart.setOption({
       			 	 series: [{
		                name: '注册量',
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
        var myChart = echarts.init(document.getElementById('main'));
        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '郑州大学各个学院用户量'
            },
            tooltip: {},
            legend: {
                data:['注册量']
            },
            xAxis: {
                data: ["软件与应用科技学院","建筑学院","其他"]
            },
            yAxis: {},
            
        };
 		myChart.setOption(option);
 		
 		
 		//goeasy
	    /*var goEasy = new GoEasy({
	       appkey: "BS-022dd266c4fe493ea343aa0be0fe783f"
	    });

        goEasy.subscribe({
        	channel: "my_channel",
      	  	onMessage: function (message) {
      	  		 // 使用刚指定的配置项和数据显示图表。
       			 myChart.setOption({
       			 	 series: [{
		                name: '注册量',
		                type: 'bar',
		                data: JSON.parse(message.content),
		            }]
       			 });
      	  		 //alert("Channel:" + message.channel + " content:" + message.content);

			}
        }); */
        
        /* goEasy.publish({
			channel: "my_channel",
			onMessage: function (message) {
				alert(message);
				myChart.setOption({
					series: [{
		                name: '注册数量',
		                type: 'bar',
		                data:message
	           		 }]
				});
			}
		}); */
 		
 		 //-------------------------------------- 图表一 ---------------------------
	</script>
</body>
</html>