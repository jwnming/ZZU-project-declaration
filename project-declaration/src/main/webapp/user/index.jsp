<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>郑州大学项目申报中心-首页</title>
<meta name="keywords" content="郑州大学毕设-蒋文明" />
<meta name="description" content="郑州大学毕设-蒋文明" />
<meta name="robots" content="All" />
<meta http-equiv="mobile-agent" content="format=html5;url=http://m.hnsrmyy.net/" />
<noscript><meta http-equiv="refresh" content="0; url=/noscript.htm" /></noscript>
<!--[if lt IE 7]><meta http-equiv="refresh" content="0; url=/YouLose.htm" /><![endif]-->
<meta name="Author" content="miraclevision technical team,kunyi" />
 
<link rel="icon" href="${pageContext.request.contextPath}/user/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/user/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/normalize.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/index.css" type="text/css" />
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/user/js/KunyiHTML5.min.js"></script>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/user/js/Kunyilibrary.js"></script>

    <%--在加载首页前，加载提前加载一下数据--%>
    <script>

        //1、加载展示用户
        $.ajax({
            url: "${pageContext.request.contextPath}/user/userExhibition.do",
            dataType: "json",
            success: function (obj) {
               if (obj == "ok") {
                   //2、加载展示项目
                   $.ajax({
                       url: "${pageContext.request.contextPath}/project/projectExhibition.do",
                       dataType: "json",
                       success: function (obj) {
                           3//加载轮播图
                           if(obj == "ok") {
                               $.ajax({
                                   url: "${pageContext.request.contextPath}/rotation/rotationExhibition.do",
                                   dataType: "json",
                                   success: function (obj) {
                                       //4、加载新闻词条
                                       if (obj=="ok") {
                                           $.ajax({
                                               url: "${pageContext.request.contextPath}/news/newsExhibition.do",
                                               dataType: "json",
                                               success: function (obj) {
                                                   //跳转到首页
                                                   window.location.href = "${pageContext.request.contextPath}/user/main_index.jsp";
                                               }
                                           })
                                       }
                                   }
                               });
                           }
                       }
                   });
                }
            }
        });

    </script>

</head>
<body>
    <p>正在跳转...</p>

</body>
</html>