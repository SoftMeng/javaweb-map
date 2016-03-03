<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注册</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/js/request.js"></script>
<script type="text/javascript">
	var opinionRequest=false;
	
	function checkInput(){
		checktype();
		checkname();
		checkpw();
		confirmpw();
		checksex();
		checkage();
		checkcard();
		if (checktype() && checkname() && checkpw() && confirmpw() && checksex() && checkage()&&checkcard()) {
			return true;
		} else {
			return false;
		}
	}

	function checktype() {
	var judge1 = document.getElementById("judge1"),
		passenger = document.getElementById("passenger"),
		owner = document.getElementById("owner");
	if (!passenger.checked && !owner.checked) {
		// alert("请选择类别！");
		judge1.innerHTML = "请选择类别！";
		return false;
	} else {
		judge1.innerHTML = "";
		return true;
	}
}

function checkname() {
	var judge2 = document.getElementById("judge2"),
		name = document.getElementById("username").value;
	if (name == null || name == "") {
		// alert("请输入用户名！");
		judge2.innerHTML = "请输入用户名！";
		// document.getElementById("username").focus();
		return false;
	} else {
		judge2.innerHTML = "";
		return true;
	}

}

function checkpw() {
	var judge3 = document.getElementById("judge3"),
		pwd = document.getElementById("userpwd").value;
	if (pwd == null || pwd == "") {
		// alert("请输入密码！");
		judge3.innerHTML = "请输入密码！";
		// document.getElementById("userpwd").focus();
		return false;
	} else {
		if (pwd.length < 6 || pwd.length > 16) {
			judge3.innerHTML = "密码格式为6-16位！";
			// alert("密码格式为6-16位！");
			return false;
		} else {
			judge3.innerHTML = "";
			return true;
		}
	}

}

function confirmpw() {
	var judge4 = document.getElementById("judge4"),
		pwd = document.getElementById("userpwd").value,
		pwd1 = document.getElementById("userpwd1").value;
	if (pwd1 == null || pwd1 == "") {
		// alert("请输入确认密码！");
		judge4.innerHTML = "请输入确认密码！";
		// document.getElementById("userpwd1").focus();
		return false;
	} else {
		if (pwd != pwd1) {
			judge4.innerHTML = "确认密码输入有误！";
			// alert("确认密码输入有误！");
			// document.getElementById("userpwd1").focus();
			return false;
		} else {
			judge4.innerHTML = "";
			return true;
		}
	}
}

function checksex() {
	var judge5 = document.getElementById("judge5"),
		man = document.getElementById("man"),
		woman = document.getElementById("woman");
	if (!man.checked && !woman.checked) {
		judge5.innerHTML = "请选择性别！";
		// alert("请选择性别！");
		return false;
	} else {
		judge5.innerHTML = "";
		return true;
	}

}

function checkage() {
	var judge6 = document.getElementById("judge6"),
		age = document.getElementById("age").value;
	if (age != "") {
		if (age > 150 || age <= 0) {
			judge6.innerHTML = "年龄在1-150之间！";
			// alert("年龄在1-150之间！");
			// document.getElementById("age").focus();
			return false;
		}
		if (isNaN(age)) {
			judge6.innerHTML = "年龄应为数字！";
			// alert("年龄应为数字！");
			// document.getElementById("age").focus();
			return false;
		}
		if (age > 0 && age <= 150) {
			judge6.innerHTML = "";
			return true;
		}
	} else {
		judge6.innerHTML = "请输入年龄！";
	}
}

function checkcard(){
	var judge7 = document.getElementById("judge7"),
	card = document.getElementById("card").value;
	if (card == null || card == "") {
		judge7.innerHTML = "请输入卡号";
		return false;
	}
else{
	return true;
}
}

	//提交表单
	
	function login(){
		if(checkInput()){
			var name=document.getElementById("username").value;
			var url= document.getElementById("path").value+"/UserServlet";	//服务器地址
			var param = "action=checkName&name="+name;						//请求参数
		    opinionRequest=httpRequest("post",url,true,callbackFunc,param);
		}
	}
	//响应的回调函数 
	
	function callbackFunc(){
		if( opinionRequest.readyState==4 ){ 
     	 	if( opinionRequest.status == 200 ){
         		var checkName=opinionRequest.responseXML.getElementsByTagName("checkName");
         		var iteranceName=opinionRequest.responseXML.getElementsByTagName("iteranceUserName");
         		if(typeof(checkName)!="undefined"&& checkName.length>0){   
         			
         			document.getElementById("loginform").action="<%=request.getContextPath()%>"+"/UserServlet?action=login";
	         		opinionRequest=false;
	         		document.getElementById("loginform").method="post";
	         		document.getElementById("loginform").submit();	
         		}
         		if(typeof(iteranceName)!="undefined"&& iteranceName.length>0){
	         		alert("用户名已存在，请重新输入！");
	         		document.getElementById("username").focus();
	         		opinionRequest=false;
	         		return false;
         		}
			}
		}
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
	width: 40%;
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
.mention{
	font-size:14px;
	color: red;
}
#sign-up{
	width: 55%;
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
<body bgcolor="#FFFFFF">
	<img src="images/background.jpg" width="100%" height="100%" style="z-index:-100;position:absolute;left:0;top:0">
	<a href="main.jsp"><img src="images/home.png" style="width:30px;height:30px;position:fixed;top:20px;left:20px;color:black;z-index:1000;"></a>
	<div class="logo"></div>
	<h4 class="title">
		<span>
			<a href="login.jsp">登录</a>
			<b>·</b>
			<a class="checked">注册</a>
		</span>
	</h4>
	<form name="loginform" id="loginform" method="post">
		<input type="hidden" name="userid" id="userid" />
		<input type="hidden" name="path" id="path" value=<%=request.getContextPath() %> />
		<!-- <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" id="__01"> -->
		
			<!-- <tr> -->
				<!-- <td width="12" height="372" align="left" valign="top">&nbsp;</td> -->
		    	<!-- <td width="596" height="372" align="center" valign="top"> -->
		    	<div class="content">
		    		<table border="0" cellspacing="0">
		    			<tr>
	            			<td>类&nbsp;别：</td>
				            <td><input  name="usertype" id="passenger" value="passenger" type="radio" class="danxuananniu" /></td>
				            <td>乘客</td>
				            <td><input name="usertype"  id="owner" value="owner" type="radio" class="danxuananniu" /></td>
				            <td>车主</td>
				            <td id="judge1" class="mention"></td>
				        </tr>
				          <tr>
				            <td class="td">用户名：</td>
				            <td colspan="4" align="left"><input name="username" id="username" placeholder="请输入用户名"  type="text" class="01input" /></td>
				            <td id="judge2" class="mention"></td>
				            <!-- <td width="205" align="left" class="hongxing">*</td> -->
				          </tr>
				          <tr>
				            <td class="td">密&nbsp;码：</td>
				            <td colspan="4" align="left"><input name="userpwd" id="userpwd" placeholder="请输入密码" type="password" class="01input" /></td>
				            <td id="judge3" class="mention"></td>
				            <!-- <td align="left"><span class="hongxing">*</span></td> -->
				          </tr>
				          <tr>
				            <td class="td">确认密码：</td>
				            <td colspan="4" align="left"><input name="userpwd1" id="userpwd1" placeholder="再次输入密码" type="password" class="01input" /></td>
				            <td id="judge4" class="mention"></td>
				            <!-- <td align="left"><span class="hongxing">*</span></td> -->
				          </tr>
				          <tr>
				            <td class="td">性&nbsp;别：</td>
				            <td width="25" align="left"><input  name="sex" id="man" value="m" type="radio" class="danxuananniu" /></td>
				            <td width="69" align="left">男</td>
				            <td width="25"><input name="sex"  id="woman" value="f" type="radio" class="danxuananniu" /></td>
				            <td width="83" align="left">女</td>
				            <td id="judge5" class="mention"></td>
				            <!-- <td align="left"> -->
				          </tr>
				          <tr>
				            <td class="td">年&nbsp;龄：</td>
				            <td colspan="4" align="left"><input name="age" id="age" placeholder="请输入年龄" type="text" class="01input" /></td>
				            <td id="judge6" class="mention"></td>
				            <!-- <td align="left"> -->
				          </tr>
				          <tr>
				            <td class="td">卡&nbsp;号：</td>
				            <td colspan="4" align="left"><input name="usercard" id="usercard" placeholder="请输入卡号" type="text" class="01input" /></td>
				            <td id="judge7" class="mention"></td>
				            <!-- <td align="left"> -->
				          </tr>
				          
	          			<!-- <tr>
	            			<td>&nbsp;</td>
	            			<td height="40" colspan="3" align="left"><img style="cursor:pointer" src="images/tijiao.gif" width="75" height="29" border="0" onclick="login()"/></td>
	            			<td align="left"><img style="cursor:pointer" src="images/guanbi.gif" width="75" height="29" border="0" onclick="window.close()"/></td>
	          			</tr> -->
	          		</table>
	          		<input type="button" id="sign-up" value="注册" onclick="login()">
	          		</div>
	        		<!-- </table> -->
	        	<!-- </td> -->
		    
	<!-- </table> -->
</form>
</body>
</html>