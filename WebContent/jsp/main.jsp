<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="css/mainstyle.css">
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/mainjs.js"></script>
	    <link rel="shortcut icon" href="favicon.ico" />
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.5/leaflet.css' />
    <script src='https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.5/leaflet.js'></script>
    <link rel="stylesheet" href="css/fonts.css" />
    <link href='css/site.css' rel='stylesheet' />
    
</head>
<body>
	<!--导航栏-->
	<div class="nav-group">
		<h1>拼车</h1>
		<ul class="nav">
		   <li  id="logname" style="margin-top:3px;margin-right:10px;"><%=session.getAttribute("entername")%></li>
		   <li><a id="log" href="login.jsp">登录/注册</a></li>
		   <li><a href="#">导航1</a></li>
		   <li><a href="#">导航2</a></li>
		   <li><a href="#">导航3</a></li>
		   <li><a href="#">导航4</a></li>
		 </ul>
	</div>
	<!--输入区域-->
	<div class="choose">
		<!--选择方式-->
		<ul class="tabs" id="tabs">
			<li>
				<a id="bus" class="busicon focus change">公交</a>
			</li>
			<li>
				<a id="metro" class="metroicon">地铁</a>
			</li>
			<li>
				<a id="walk" class="walkicon">步行</a>
			</li>
			<li>
				<a id="bicycle" class="bicycleicon">骑行</a>
			</li>
		</ul>
		<div class="search-group">
			<div class="exchange-group">
				<a data-icon="" id="exchange" class="exchangeicon"></a>
			</div>
			<form>
				<p class="start"><label>起：</label><input type="text" id="positionstart" placeholder="请输入公交起点" style="border-width: 0;height:30px;"></p>
				<p class="end"><label>终：</label><input type="text" id="positionend" placeholder="请输入公交终点" style="border-style: solid; border-width: 0;height:30px;"></p>
				<input type="submit" value="搜索" class="search">
			</form>
		</div>
		<div class="showcontent">
			<p>地图信息反馈处</p>
		</div>
	</div>
	<!--地图区域-->
	<div class="mapposition">
		<iframe src="index.html" width="100%" height="100%" scrolling="no" frameborder="0"> </iframe>
	</div>


</body>
<script>
    	var x = "<%=session.getAttribute("entername")%>";
    	console.log(x);
    	var logname=document.getElementById("logname");
    	var log=document.getElementById("log");
    	if(x=="null"){
    		logname.style.display="none";
    		log.style.display="block";
    	}else{
    		logname.style.display="block";
    		log.style.display="none";
    	}
    </script>
</html>