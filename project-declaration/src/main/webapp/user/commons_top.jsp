<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
 
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/normalize.css" type="text/css" />
<link rel="stylesheet" href="css/index.css" type="text/css" />
<!--[if lt IE 9]><script language="javascript" type="text/javascript" src="js/Kunyi.Respond.min.js" ></script><![endif]-->
<script language="javascript" type="text/javascript" src="js/KunyiHTML5.min.js"></script>
<script language="javascript" type="text/javascript" src="js/Kunyilibrary.js"></script>
    <script>
        function goindex() {
            window.location.href = "index.jsp";

        }
    </script>
</head>
<body style="background-color: #d7e8f1;">
<script language="javascript" type="text/javascript" src="js/Kunyi.Init.js"></script><header><div class="topHidden"></div>
<div class="toolBase" style="background-color: #C0E0FF;"><div class="BaseMark">
    <ul>
        <li class="first"><a href="http://www15.zzu.edu.cn/">郑州大学外网</a></li>
        <li><a href="https://doorgx.v.zzu.edu.cn/web/guest/index" target="_blank" >郑州大学内网</a></li>
        <li><a href="javascript:;" onClick="Kunyi.AddFavorite(window.location,document.title)">加入收藏</a></li>
        <li><a href="#" >联系电话：0394-1234567 &nbsp;&nbsp;&nbsp;0394-7654321</a></li>
        <li><a href="#" >发送邮箱：zzu@163.com</a></li>
    </ul>
 <div class="language">选择语言</div><div class="langBtn animated"><i class="flag"></i>中文<i class="downBtn"></i>
   <a href="javasript:;"><img src="images/ico_003.png" class="animated" width="13" height="13" />中文</a>
 </div></div></div>
<div class="BaseMark logoBase"><a href="${pageContext.request.contextPath}/user/index.jsp"><img src="images/logo1.png" class="load" width="399" height="70" /></a>
    <div class="searchBase" style="border: white; text-align: right;">

    <span class="head_toutext" id="logininfo" style="margin-top: 3px; font-size: 18px;">

		☀<b>您好，欢迎光临郑州大学项目申报中心</b><br />
            <c:if test="${sessionScope.user==null}">
                [&nbsp;<a href="${pageContext.request.contextPath}/login.jsp" class="b">登录</a>&nbsp;|&nbsp;<a href="${pageContext.request.contextPath}/user/toRegist.do" class="b">注册</a>&nbsp;]
            </c:if>
            <c:if test="${sessionScope.user!=null}">
                [&nbsp;<img src="${pageContext.request.contextPath}${sessionScope.user.picture}" alt="用户头像" style="width:40px;height:40px;margin-bottom:-16px;">
                    当前用户:&nbsp;<b><a href="${pageContext.request.contextPath}/user/main_shenbao.jsp" class="b" style="margin-bottom: 10px; margin-left:10px;">${sessionScope.user.name}</a></b>&nbsp;]
                [&nbsp;<a href="${pageContext.request.contextPath}/user/loginout" class="b"><font color="red">退出用户</font></a>&nbsp;]
            </c:if>

		</span>

    </div></div></header><nav>

<!--快捷菜单-左侧-jwnming-->
<div class="navBase">
    <div class="quickMenuBase" data-type="1">
    <div class="quickMenu01">快捷菜单>></div>
    <div class="quickMenu02 animated"></div>

</div>

<!--框架菜单-导航栏-jwnming-->
<div class="nav Inav">
    <ul><li class="PMenu"><a href="index.jsp" class="PAMenu" >申报中心首页</a></li>

        <li class="PMenu"><img src="images/ico_014.png" class="animated" width="15" height="8" /><a id="Nav_AMenu1" class="PAMenu" title="学校简介">学校简介</a>
            <div class="navboxBase">
                <div class="navboxBg">
                    <div class="navbox BaseMark">
                        <div class="navMenus">
                            <ul>
                                <li><a>学校概况</a></li>
                            </ul>
                        </div>
                        <div class="navSub5">
                            <img src="pictures/banner1.jpg" width="299" height="97"/>
                            <p class="first">双一流中的佼佼者，未来有你</p><p><br/></p>
                            <p>郑州大学（简称郑大，英文简称：ZZU）由河南省人民政府兴办，法定住所地为河南省郑州市科学大道100号。郑州大学是国家“211工程”重点建设高校、一流大学建设高校和“部省合建”高校。站在新的历史起点上，学校确立了综合性研究型的办学定位，提出了一流大学建设“三步走”发展战略，力争到本世纪中叶建成世界一流综合性研究型大学。</p>

                        </div>
                        <div class="navSub6">
                            <img src="pictures/banner2.jpg" width="192" height="92" />
                            <ul>
                                <li><span>1956</span><em>新中国创办的第一所综合性大学</em></li>
                                <li><span>1996</span><em>国家“211工程”重点建设高校</em></li>
                                <li><span>1996</span><em>国家“211工程”重点建设高校</em></li>
                                <li><span>1996</span><em>国家“211工程”重点建设高校</em></li>
                                <li><span>2018</span><em>“双一流”</em></li>
                            </ul>

                        </div>
                        <div class="navSub7">
                            <h3>学校标题文化</h3>
                            <ul>
                                <li><a href="#" title="《史家绝唱，无韵离骚——品读＜史记＞》学术报告">《史家绝唱，无韵离骚——品读＜史记＞》学术报告</a></li>
                                <li><a href="#" title="《小额速裁与多元化民事纠纷解决机制》学术报告">《小额速裁与多元化民事纠纷解决机制》学术报告</a></li>
                                <li><a href="#" title="“运动控制重建与疼痛康复研究进展报告”研讨会">“运动控制重建与疼痛康复研究进展报告”研讨会</a></li>
                                <li><a href="#" title="《基于价值的健康服务整合》学术报告">《基于价值的健康服务整合》学术报告</a></li>
                                <li><a href="#" title="《新时代中国旅游三维价值解构与重构》学术报告">《新时代中国旅游三维价值解构与重构》学术报告</a></li>
                                <li><a href="#" title="《复杂外部环境下的中国经济发展》学术报告">《复杂外部环境下的中国经济发展》学术报告</a></li>
                                <li><a href="#" title="“十大考古活动进校园——郑州大学站”系列报告会">“十大考古活动进校园——郑州大学站”系列报告会</a></li>
                                <li><a href="#" title="郑州大学获批3项国家级虚拟仿真实验教学项目">郑州大学获批3项国家级虚拟仿真实验教学项目</a></li>
                                <li><a href="#" title="郑州大学开展2019年“4.15”全民国家安全教育活动">郑州大学开展2019年“4.15”全民国家安全教育活动</a></li>
                            </ul>
                            <div>

                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </li>

        <li class="PMenu"><a href="${pageContext.request.contextPath}/login.jsp" id="Nav_AMenu2" class="PAMenu">进入后台管理中心</a></li>

        <li class="PMenu"><img src="images/ico_014.png" class="animated" width="15" height="8" /><a id="Nav_AMenu4" class="PAMenu" title="新闻动态">申报中心新闻动态</a>
            <div class="navboxBase">
                <div class="navboxBg">
                    <div class="navbox BaseMark">
                        <div class="navMenus">
                            <ul>
                                <li><a title="新闻动态查看">新闻动态查看</a></li>
                            </ul>
                        </div>
                        <div class="navSub2 nav_Menu02 noPic HealthSub">
                            <dl class="Img01">
                                <dt class="title01">最新新闻条例</dt>
                                <dd class="pic"><img alt="新闻" src="${pageContext.request.contextPath}/user/images/ico_025.jpg" width="90" height="90" /></dd>
                                <c:forEach items="${sessionScope.newsExhibition}" var="newsExhibition">
                                    <dd>
                                        <em><fmt:formatDate value="${newsExhibition.upload_time}" pattern="yyyy年MM月dd日"></fmt:formatDate></em>
                                        <a href="${pageContext.request.contextPath}/news/getNewsByIdExhibition/${newsExhibition.id}" title="${newsExhibition.title}">${newsExhibition.title}</a>
                                    </dd>
                                </c:forEach>
                                <%--<dd><em>2016-08-04</em><a href="NewsDetail-8016.html" title="团队的重要性">团队的重要性</a></dd>--%>

                            </dl>
                            <div class="BottomHidden"></div>
                            <dl>

                            </dl>
                        </div>

                    </div>
                </div>
            </div>
        </li>
        <li class="PMenu"><img src="images/ico_014.png" class="animated" width="15" height="8" />
            <a id="Nav_AMenu0" class="PAMenu" title="申报指南">申报人须知</a>
            <div class="navboxBase">
                <div class="navboxBg">
                    <div class="navbox BaseMark">
                        <div class="navMenus">
                            <ul>
                                <li><a>申报人须知</a></li>
                            </ul>
                        </div>
                        <div class="navSub2 nav_Menu01">
                            <dl>
                                <dt>尊敬的申报人：</dt>
                                <dd class="pic"><img src="pictures/banner1.jpg" width="126" height="77"></dd>
                                <dd class="text">欢迎你于郑州大学项目管理中心进行项目申报！你需对项目的类别、经费、计划安排等完成一份申报材料，提交申请后会对此进行审核。</dd>
                                <dd class="info"><em>我校工作时间为：</em>
                                    <p>每周一至周五：下午 3：00 - 19：00</p><p>周六：上午 9：00 - 12：00</p><p>下午 3：00 -  19：00</p></dd>
                            </dl>
                            <div class="BottomHidden"></div>
                            <dl>
                                <dt>郑州大学项目申报中心</dt>
                                <dd class="pic"><img src="pictures/banner2.jpg" width="126" height="77"></dd>
                                <dd class="text"><p>这里是郑州大学项目申报中心的简介，例如时间、作用、成就等。</p><p>申报中心详细地址位与郑大主校区x号办公楼x层xxx室</p></dd>
                                <dd class="info"><em>联系电话 ： </em>
                                    <span>12452374</span></dd>
                            </dl>
                        </div>
                        <div class="navSub3 nav_Route">
                            <dl><dt>乘车路线</dt>
                                <dd><em>公交全部路线</em><p>
                                    101路、109路东线、80路、2路、2路快线、82路、65路、98路、47路、158路 </p></dd>
                                <dd><em>长途汽车客运中心站</em>
                                    <p>101路、109东线、2路 </p></dd>
                                <dd class="text"><p><em>长途汽车客运北站</em> </p>
                                    <p><span>77路、47路</span><span>158路</span></p>
                                </dd>
                                <dd><em>汽车客运站</em>
                                    <p>40路</p></dd>
                            </dl>
                            <a href="http://map.baidu.com/" target="_blank">电子地图</a>
                        </div><div class="clear"></div>
                    </div>
                </div>
            </div>
        </li>
        <li class="PMenu"><img src="images/ico_014.png" class="animated" width="15" height="8" /><a id="Nav_AMenu5" class="PAMenu" title="材料下载">申报材料下载中心</a>
            <div class="navboxBase">
                <div class="navboxBg">
                    <div class="navbox BaseMark">

                        <div class="navSub2 nav_Menu02 noPic NewsSub">
                            <dl class="Img02">
                                <dt class="title01">最新申报材料下载</dt>
                                <dd class="pic"><img alt="最新公告" src="pic/ico_010.jpg" width="126" height="77" /></dd>
                                <dd class="Lurl">
                                    在右方下载
                                </dd>

                            </dl>
                            <div class="BottomHidden"></div>

                        </div>
                        <div class="navSub4 nav_Menu02 noPic">
                            <dl>
                                <dt class="title02">下载链接</dt><br />
                                <dd class="url"><span><b>《申报人须知.pdf》</b></span><a href="${pageContext.request.contextPath}/download/download1.do">下载链接</a></dd><br />
                                <dd class="url"><span><b>《申报材料准备说明.pdf》</b></span><a href="${pageContext.request.contextPath}/download/download2.do">下载链接</a></dd><br />
                                <dd class="url"><span><b>《经费采购说明.pdf》</b></span><a href="${pageContext.request.contextPath}/download/download3.do">下载链接</a></dd><br />
                                <dd class="url"><span><b>《项目验收说明.pdf》</b></span><a href="${pageContext.request.contextPath}/download/download4.do">下载链接</a></dd><br />
                            </dl>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </li>
        <li class="PMenu"><a href="${pageContext.request.contextPath}/user/main_shenbao.jsp" id="Nav_AMenu9" class="PAMenu">申报系统</a></li>
    </ul>
</div>
</div>
</nav>

<div id="Footer_CodeDiv"><script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F4a1d36386e8734a5fd29acec9114818d' type='text/javascript'%3E%3C/script%3E"));
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fafd2ae44e23648da4e8a81a7b1349be4' type='text/javascript'%3E%3C/script%3E"));
</script></div><script language="javascript" type="text/javascript" src="js/Kunyi.Common.js"></script>
<script language="javascript" type="text/javascript" src="js/Kunyi.Index.js"></script>


</body>
</html>