<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>车主个人页面</title>
	<link rel="stylesheet" type="text/css" href="css/ownerstyle.css">
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script language="javascript">
		if(<%=session.getAttribute("entername")%>==null){
		alert("非法访问！");
		top.location="main.jsp";
		}
	</script>
</head>
<body>
	<div class="nav">
		<ul class="name">
			<li><a href="<%=request.getContextPath()%>/UserServlet?action=logout">注销</a></li>
			<li><a href="main.jsp">回到首页</a></li>
			<li>尊敬的<%=session.getAttribute("entername")%>，欢迎登陆</li>
		</ul>
		<!-- <div class=""></div> -->
		<!-- <div class="name">尊敬的车主<span id="owner"></span>，欢迎登陆&nbsp;&nbsp;&nbsp;<a href="">注销</a></div> -->
	</div>	
	<div class="information">
		<ul class="personal">
			<li><a id="homepage">我的主页</a></li>
			<li><a id="myorder">我的订单</a></li>
			<li><a id="mymessage">个人信息</a></li>
			<li><a id="mypassword">修改密码</a></li>
			<li><a href=""></a></li>
			<li><a href=""></a></li>
			<li><a href=""></a></li>
		</ul>
	</div>
	<div class="content">
		<div class="advertise">
			<p>今日推荐：</p>
		</div>
		<div class="order">
			<p>我的订单：</p>
		</div>
		<div class="message">
			<table>
				<tr>
					<td>姓名：</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>所在地：</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>车牌号：</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>生日：</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>感情状况：</td>
					<td>
						<select>
							<option value =""></option>
						    <option value ="">单身</option>
						    <option value="">恋爱</option>
						    <option value="">已婚</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>QQ：</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>邮箱：</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>学历：</td>
					<td>
						<select>
							<option value =""></option>
						    <option value ="">本科</option>
						    <option value="">硕士</option>
						    <option value="">博士</option>
						    <option value="">大专</option>
						    <option value="">高中</option>
						    <option value="">初中</option>
						    <option value="">小学</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="button" value="保存" onclick=""></td>
				</tr>
			</table>
<!-- 			<p>姓名：</p>
			<p>性别：</p>
			<p>生日：</p>
			<p>简介：</p> -->
		</div>
		<div class="password">
			<table>
				<tr>
					<td>原密码：</td>
					<td><input type="password" id="password1"></td>
				</tr>
				<tr>
					<td>新密码：</td>
					<td><input type="password" id="password2"></td>
				</tr>
				<tr>
					<td>再次输入新密码：</td>
					<td><input type="password" id="password3"></td>
				</tr>
				<tr>
					<td><input type="button" value="保存" onclick=""></td>
				</tr>
			</table>
<!-- 			<p>原密码：<input type="password" id="password1"></p>
			<p>新密码：<input type="password" id="password2"></p>
			<p>再次输入新密码：<input type="password" id="password3"></p> -->
		</div>
	</div>
		

	<script type="text/javascript" src="js/ownerjs.js"></script>
</body>
</html>