<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/js/request.js"></script>
<script type="text/javascript">
	var opinionRequest=false; 
	//判断用户名是否重复
	 
	function callbackFunc(){
		if( opinionRequest.readyState==4 ){		 //判断响应是否完成
			console.log("响应完成");
     	 	if( opinionRequest.status == 200 ){  //判断响应是否成功
     	 		console.log("响应成功");  
         		var hasUser=opinionRequest.responseXML.getElementsByTagName("hasUser");  
         		var noUser=opinionRequest.responseXML.getElementsByTagName("noUser");
    	 		console.log("xxxa"+hasUser.length+"xxxx"+typeof(hasUser)); 
         		if(typeof(hasUser)!="undefined"&& hasUser.length>0){
         			console.log("判定成功");
         			document.getElementById("enterform").action="<%=request.getContextPath()%>"+"/UserServlet?action=enter";
	         		opinionRequest=false;
	         		document.getElementById("enterform").method="post";
	         		document.getElementById("enterform").submit();	
         		}
         		if(typeof(noUser)!="undefined"&& noUser.length>0){
	         		alert("用户名或密码错误！");
	         		document.getElementById("username").focus();
	         		opinionRequest=false;
	         		return false;
         		}
			}
		}
	}
	/**
	*登陆
	*/
	
	function enter(){
		if(checkInsert()){
			var name=document.getElementById("username").value;				//用户名
			var pwd = document.getElementById("userpwd").value;				//密码
			var url="<%=request.getContextPath()%>"+"/UserServlet";			//服务器地址
			var param ="action=checkEnter&name="+name+"&pwd="+pwd;			//请求参数
			opinionRequest=httpRequest("post",url,true,callbackFunc,param);	//调用请求方法 
		}
	}
	function checkInsert(){
		var name = document.getElementById("username").value;
		var pwd = document.getElementById("userpwd").value;
		if(name==null||name==""){
			alert("请输入您的账号！");
			document.getElementById("username").focus();
			return false;
		}
		if(pwd==null||pwd==""){
			alert("请输入您的密码！");
			document.getElementById("userpwd").focus();
			return false;
		}
		if(pwd!=null&&pwd!=""){
			if(pwd.length<6||pwd.length>16){
				alert("输入有误，密码长度为6-16位！");
				document.getElementById("userpwd").focus();
				return false;
			}
		}
		return true;
	}
	/**
	*注册
	*/
	function login(){
		window.location.href="register.jsp";
	}
</script>
<style type="text/css">
	body{
	font-family: Arial,Helvetica,"Microsoft YaHei",sans-serif;
}

.title{
	margin-top:6%;
	margin-left: 45%;
}

a{
	text-decoration: none;
	color: #8E8E8E;
}
.checked{
	color: black;
}
a:hover{
	text-decoration: none;
	color: black;
}

h4{
	font-size:18px;
	line-height: 40px;
}

b{
	font-weight: bold;
	margin: 0 30px;
}
.content{
	margin-top: 70px;
	width: 30%;
	margin-left: 40%;
}
table{
	padding: 10px;
	line-height: 40px;
}

table tr input{
	line-height: 25px;
	margin-left: 10px;
}
#sign-up{
	width: 75%;
	height: 50px;
	/*margin-left: 70px;*/
	margin-top: 20px;
	font-size: 20px;
	background-color: #49be38;
	border:1px solid #49be38;
	border-radius: 5px;
	cursor:pointer;
}
</style>
</head>
<body>
	<img src="images/background.jpg" width="100%" height="100%" style="z-index:-100;position:absolute;left:0;top:0">
	<a href="main.jsp"><img src="images/home.png" style="width:30px;height:30px;position:fixed;top:20px;left:20px;color:black;z-index:1000;"></a>
	<div class="logo"></div>
	<h4 class="title">
		<span>
			<a class="checked">登录</a>
			<b>·</b>
			<a href="register.jsp">注册</a>
		</span>
	</h4>
	<div class="content">
		<form id="enterform">
			<!-- 登陆<hr> -->
			<table>
				<tr>
					<td>用户名：</td>
					<td><input type="text" name="username" id="username" placeholder="请输入用户名"></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" name="userpwd" id="userpwd" placeholder="请输入密码"></td>
				</tr>
				<!-- <tr>
					<td><input type="submit" value="登陆" onclick="enter()" ></td>
					<td><input type="button" value="注册" onclick="login()"></td>
				</tr> -->
			</table>
			<input type="button" id="sign-up" value="登录" onclick="enter()">
		</form>
	</div>
</body>
</html>