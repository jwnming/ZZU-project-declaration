<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/echarts.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
  	<script src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
  	<script type="text/javascript">
  		$(function(){
  			//获得最近三周，每周的用户注册量
	    	var a = [];
	    	$.ajax({
	    		url: "${pageContext.request.contextPath}/admin/user/weekStatistics",
	    		dataType: "json",
	    		success: function(obj) {
	    			a = obj;
	    			console.log(a);
	    			
	    			 // 使用刚指定的配置项和数据显示图表。
	       			 myChart.setOption({
	       			 	 series: [{
			                name: '注册量',
			                type: 'bar',
			                data: a,
			            }]
	       			 });
	    		}
	    	});
	   
	        // 基于准备好的dom，初始化echarts实例
	        var myChart = echarts.init(document.getElementById('main'));
	
	        // 指定图表的配置项和数据
	        var option = {
	            title: {
	                text: '申报系统最近三周'
	            },
	            tooltip: {},
	            legend: {
	                data:['注册量']
	            },
	            xAxis: {
	                data: ["当周","最近第1周","最近第2周"]
	            },
	            yAxis: {},
	            
	        };
	 		myChart.setOption(option);
 		
  		
  		
  		
  			var goEasy = new GoEasy({
		       appkey: "BS-022dd266c4fe493ea343aa0be0fe783f" 
		    });         
	 	
	        goEasy.subscribe({            
	        	channel: "my_channel",            
	      	  	onMessage: function (message) {
					 alert("Channel:" + message.channel + " content:" + message.content); 
					/* myChart.setOption({
						series: [{
			                name: '注册数量',
			                type: 'bar',
			                data:message
		           		 }]
					}); */
				}     
	        });
  		})
  	</script>
  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
