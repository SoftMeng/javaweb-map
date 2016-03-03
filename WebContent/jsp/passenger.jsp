<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>用户个人页面</title>
	<link rel="stylesheet" type="text/css" href="css/userstyle.css">
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/js/request.js"></script>
	<script language="javascript">
		if(<%=session.getAttribute("entername")%>==null){
		alert("非法访问！");
		top.location="main.jsp";
		}
	</script>
	<script type="text/javascript">
	var opinionRequest=false;
		
	function callbackFunc00(){
		if( opinionRequest.readyState==4 ){ 
     	 	if( opinionRequest.status == 200 ){
         			document.getElementById("mesform0").action="<%=request.getContextPath()%>/MesServlet?action=mesGet";
	         		opinionRequest=false;
	         		document.getElementById("mesform0").method="post";
	         		document.getElementById("mesform0").submit();	
         		}
			}
		}
	function mes0(){
			var name=document.getElementById("messend").value;
			var url= document.getElementById("path").value+"/UserServlet";	//服务器地址
			var param = "action=checkName&name="+name;						//请求参数
		    opinionRequest=httpRequest("post",url,true,callbackFunc00,param);
	}
	function callbackFunc01(){
		if( opinionRequest.readyState==4 ){ 
     	 	if( opinionRequest.status == 200 ){
         			document.getElementById("mesform1").action="<%=request.getContextPath()%>/MesServlet?action=mesGet";
	         		opinionRequest=false;
	         		document.getElementById("mesform1").method="post";
	         		document.getElementById("mesform1").submit();	
         		}
			}
		}
	function mes1(){
			var name=document.getElementById("messend").value;
			var url= document.getElementById("path").value+"/UserServlet";	//服务器地址
			var param = "action=checkName&name="+name;						//请求参数
		    opinionRequest=httpRequest("post",url,true,callbackFunc01,param);
	}
	function callbackFunc02(){
		if( opinionRequest.readyState==4 ){ 
     	 	if( opinionRequest.status == 200 ){
         			document.getElementById("mesform2").action="<%=request.getContextPath()%>/MesServlet?action=mesGet";
	         		opinionRequest=false;
	         		document.getElementById("mesform2").method="post";
	         		document.getElementById("mesform2").submit();	
         		}
			}
		}
	function mes2(){
			var name=document.getElementById("messend").value;
			var url= document.getElementById("path").value+"/UserServlet";	//服务器地址
			var param = "action=checkName&name="+name;						//请求参数
		    opinionRequest=httpRequest("post",url,true,callbackFunc02,param);
	}
	function callbackFunc03(){
		if( opinionRequest.readyState==4 ){ 
     	 	if( opinionRequest.status == 200 ){
         			document.getElementById("mesform3").action="<%=request.getContextPath()%>/MesServlet?action=mesGet";
	         		opinionRequest=false;
	         		document.getElementById("mesform3").method="post";
	         		document.getElementById("mesform3").submit();	
         		}
			}
		}
	function mes3(){
			var name=document.getElementById("messend").value;
			var url= document.getElementById("path").value+"/UserServlet";	//服务器地址
			var param = "action=checkName&name="+name;						//请求参数
		    opinionRequest=httpRequest("post",url,true,callbackFunc03,param);
	}

	
	function callbackFunc1(){
		if( opinionRequest.readyState==4 ){ 
     	 	if( opinionRequest.status == 200 ){
         			document.getElementById("inforform").action="<%=request.getContextPath()%>/MesServlet?action=infor";
	         		opinionRequest=false;
	         		document.getElementById("inforform").method="post";
	         		document.getElementById("inforform").submit();	
	         		console.log(document.getElementById("mesget").value);
         		}
			}
		}
	function infor(){
			var name=document.getElementById("messend").value;
			var url= document.getElementById("path").value+"/UserServlet";	//服务器地址
			var param = "action=checkName&name="+name;						//请求参数
		    opinionRequest=httpRequest("post",url,true,callbackFunc1,param);
	}
	
	function callbackFunc20(){
		if( opinionRequest.readyState==4 ){ 
     	 	if( opinionRequest.status == 200 ){
         			document.getElementById("delform0").action="<%=request.getContextPath()%>/FinServlet?action=del";
	         		opinionRequest=false;
	         		document.getElementById("delform0").method="post";
	         		document.getElementById("delform0").submit();	
	         		
         		}
			}
		}
	function del0(){
		
			var name=document.getElementById("messend").value;
			console.log(name+"name");
			var url= document.getElementById("path").value+"/UserServlet";	//服务器地址
			var param = "action=checkName&name="+name;						//请求参数
		    opinionRequest=httpRequest("post",url,true,callbackFunc20,param);
	}
	function callbackFunc21(){
		if( opinionRequest.readyState==4 ){ 
     	 	if( opinionRequest.status == 200 ){
         			document.getElementById("delform1").action="<%=request.getContextPath()%>/FinServlet?action=del";
	         		opinionRequest=false;
	         		document.getElementById("delform1").method="post";
	         		document.getElementById("delform1").submit();	
	         		
         		}
			}
		}
	function del1(){
		
			var name=document.getElementById("messend").value;
			console.log(name+"name");
			var url= document.getElementById("path").value+"/UserServlet";	//服务器地址
			var param = "action=checkName&name="+name;						//请求参数
		    opinionRequest=httpRequest("post",url,true,callbackFunc21,param);
	}
	function callbackFunc22(){
		if( opinionRequest.readyState==4 ){ 
     	 	if( opinionRequest.status == 200 ){
         			document.getElementById("delform2").action="<%=request.getContextPath()%>/FinServlet?action=del";
	         		opinionRequest=false;
	         		document.getElementById("delform2").method="post";
	         		document.getElementById("delform2").submit();	
	         		
         		}
			}
		}
	function del(){
		
			var name=document.getElementById("messend").value;
			console.log(name+"name");
			var url= document.getElementById("path").value+"/UserServlet";	//服务器地址
			var param = "action=checkName&name="+name;						//请求参数
		    opinionRequest=httpRequest("post",url,true,callbackFunc22,param);
	}
	function callbackFunc23(){
		if( opinionRequest.readyState==4 ){ 
     	 	if( opinionRequest.status == 200 ){
         			document.getElementById("delform3").action="<%=request.getContextPath()%>/FinServlet?action=del";
	         		opinionRequest=false;
	         		document.getElementById("delform3").method="post";
	         		document.getElementById("delform3").submit();	
         		}
			}
		}
	function del3(){
		
			var name=document.getElementById("messend").value;
			console.log(name+"name");
			var url= document.getElementById("path").value+"/UserServlet";	//服务器地址
			var param = "action=checkName&name="+name;						//请求参数
		    opinionRequest=httpRequest("post",url,true,callbackFunc23,param);
	}
	function callbackFuncf0(){
		if( opinionRequest.readyState==4 ){ 
     	 	if( opinionRequest.status == 200 ){
         			document.getElementById("finform0").action="<%=request.getContextPath()%>/FinServlet?action=finGet";
	         		opinionRequest=false;
	         		document.getElementById("finform0").method="post";
	         		document.getElementById("finform0").submit();	
         		}
			}
		}
	function fin0(){
			var name=document.getElementById("messend").value;
			var url= document.getElementById("path").value+"/UserServlet";	//服务器地址
			var param = "action=checkName&name="+name;						//请求参数
		    opinionRequest=httpRequest("post",url,true,callbackFuncf0,param);
	}
	function callbackFuncf1(){
		if( opinionRequest.readyState==4 ){ 
     	 	if( opinionRequest.status == 200 ){
         			document.getElementById("finform1").action="<%=request.getContextPath()%>/FinServlet?action=finGet";
	         		opinionRequest=false;
	         		document.getElementById("finform1").method="post";
	         		document.getElementById("finform1").submit();	
         		}
			}
		}
	function fin1(){
			var name=document.getElementById("messend").value;
			var url= document.getElementById("path").value+"/UserServlet";	//服务器地址
			var param = "action=checkName&name="+name;						//请求参数
		    opinionRequest=httpRequest("post",url,true,callbackFuncf1,param);
	}
	function callbackFuncf2(){
		if( opinionRequest.readyState==4 ){ 
     	 	if( opinionRequest.status == 200 ){
         			document.getElementById("finform2").action="<%=request.getContextPath()%>/FinServlet?action=finGet";
	         		opinionRequest=false;
	         		document.getElementById("finform2").method="post";
	         		document.getElementById("finform2").submit();	
         		}
			}
		}
	function fin2(){
			var name=document.getElementById("messend").value;
			var url= document.getElementById("path").value+"/UserServlet";	//服务器地址
			var param = "action=checkName&name="+name;						//请求参数
		    opinionRequest=httpRequest("post",url,true,callbackFuncf2,param);
	}
	function callbackFuncf3(){
		if( opinionRequest.readyState==4 ){ 
     	 	if( opinionRequest.status == 200 ){
         			document.getElementById("finform3").action="<%=request.getContextPath()%>/FinServlet?action=finGet";
	         		opinionRequest=false;
	         		document.getElementById("finform3").method="post";
	         		document.getElementById("finform3").submit();	
         		}
			}
		}
	function fin3(){
			var name=document.getElementById("messend").value;
			var url= document.getElementById("path").value+"/UserServlet";	//服务器地址
			var param = "action=checkName&name="+name;						//请求参数
		    opinionRequest=httpRequest("post",url,true,callbackFuncf3,param);
	}
		
	</script>
</head>
<body>
	<div class="nav">
		<ul class="name">
			<li><a href="<%=request.getContextPath()%>/UserServlet?action=logout">注销</a></li>
			<li><a href="main.jsp">回到首页</a></li>
			<li><a onclick="infor()">我的消息</a></li>
			<li>尊敬的<%=session.getAttribute("entername")%>，欢迎登陆</li>
		</ul>
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
			<ul>
				<li id="pin0"><%=session.getAttribute("locationName0")%> <%=session.getAttribute("location0")%>  与您同路，可以拼车！<input type="button" value="拼车" id="accept" onclick="mes0()"></li>
				<li id="pin1"><%=session.getAttribute("locationName1")%> <%=session.getAttribute("location1")%>  与您同路，可以拼车！<input type="button" value="拼车" id="accept" onclick="mes1()"></li>
				<li id="pin2"><%=session.getAttribute("locationName2")%> <%=session.getAttribute("location2")%>  与您同路，可以拼车！<input type="button" value="拼车" id="accept" onclick="mes2()"></li>
				<li id="pin3"><%=session.getAttribute("locationName3")%> <%=session.getAttribute("location3")%>  与您同路，可以拼车！<input type="button" value="拼车" id="accept" onclick="mes3()"></li>
			</ul>
			<ul>
				<li id="getinfor0"><%=session.getAttribute("messend0")%>邀请您一起拼车！<input type="button" value="接受邀请" id="accept" onclick="fin0()"></li>
				<li id="getinfor1"><%=session.getAttribute("messend1")%>邀请您一起拼车！<input type="button" value="接受邀请" id="accept" onclick="fin1()"></li>
				<li id="getinfor2"><%=session.getAttribute("messend2")%>邀请您一起拼车！<input type="button" value="接受邀请" id="accept" onclick="fin2()"></li>
				<li id="getinfor3"><%=session.getAttribute("messend3")%>邀请您一起拼车！<input type="button" value="接受邀请" id="accept" onclick="fin3()"></li>
			</ul>
			<ul>
				<li id="sure0"><%=session.getAttribute("finname0")%>同意与您一起拼车！<input type="button" value="确定" id="sure" onclick="del0()"></li>
				<li id="sure1"><%=session.getAttribute("finname1")%>同意与您一起拼车！<input type="button" value="确定" id="sure" onclick="del1()"></li>
				<li id="sure2"><%=session.getAttribute("finname2")%>同意与您一起拼车！<input type="button" value="确定" id="sure" onclick="del2()"></li>
				<li id="sure3"><%=session.getAttribute("finname3")%>同意与您一起拼车！<input type="button" value="确定" id="sure" onclick="del3()"></li>
			</ul>
			<form id="mesform0">
			<input type="hidden" name="userid" id="userid" />
			<input type="hidden" name="path" id="path" value=<%=request.getContextPath() %> />
			<table>
				<tr style="opacity:0;"><td>发信人：</td><td><input type="text" name="messend" id="messend" readonly="readonly" value="<%=session.getAttribute("name")%>"/></td></tr>
				<tr style="opacity:0;"><td>收信人：</td><td><input type="text" name="mesget" id="mesget" readonly="readonly" value="<%=session.getAttribute("locationName0")%>"/></td></tr>
			</table>
			</form>
			<form id="mesform1">
			<input type="hidden" name="userid" id="userid" />
			<input type="hidden" name="path" id="path" value=<%=request.getContextPath() %> />
			<table>
				<tr style="opacity:0;"><td>发信人：</td><td><input type="text" name="messend" id="messend" readonly="readonly" value="<%=session.getAttribute("name")%>"/></td></tr>
				<tr style="opacity:0;"><td>收信人：</td><td><input type="text" name="mesget" id="mesget" readonly="readonly" value="<%=session.getAttribute("locationName1")%>"/></td></tr>
			</table>
			</form>
			<form id="mesform2">
			<input type="hidden" name="userid" id="userid" />
			<input type="hidden" name="path" id="path" value=<%=request.getContextPath() %> />
			<table>
				<tr style="opacity:0;"><td>发信人：</td><td><input type="text" name="messend" id="messend" readonly="readonly" value="<%=session.getAttribute("name")%>"/></td></tr>
				<tr style="opacity:0;"><td>收信人：</td><td><input type="text" name="mesget" id="mesget" readonly="readonly" value="<%=session.getAttribute("locationName2")%>"/></td></tr>
			</table>
			</form>
			<form id="mesform3">
			<input type="hidden" name="userid" id="userid" />
			<input type="hidden" name="path" id="path" value=<%=request.getContextPath() %> />
			<table>
				<tr style="opacity:0;"><td>发信人：</td><td><input type="text" name="messend" id="messend" readonly="readonly" value="<%=session.getAttribute("name")%>"/></td></tr>
				<tr style="opacity:0;"><td>收信人：</td><td><input type="text" name="mesget" id="mesget" readonly="readonly" value="<%=session.getAttribute("locationName3")%>"/></td></tr>
			</table>
			</form>
			
			
		</div>
		<div class="order">
			<p>我的订单：</p>
		</div>
		<div class="mail">
			<p>我的消息：</p>
			<form id="inforform">
			<table>
				<tr>
					<td><input type="text" id="mesget" name="mesget" value="<%=session.getAttribute("name")%>"/></td>
				</tr>
			</table>
			</form>
			<form id="finform0">
			<table>
				<tr>
					<td><input type="text" id="mesget" name="mesget" value="<%=session.getAttribute("name")%>"/></td>
					<td><input type="text" id="messend" name="messend" value="<%=session.getAttribute("messend0")%>"/></td>
				</tr>
			</table>
			</form>
			<form id="finform1">
			<table>
				<tr>
					<td><input type="text" id="mesget" name="mesget" value="<%=session.getAttribute("name")%>"/></td>
					<td><input type="text" id="messend" name="messend" value="<%=session.getAttribute("messend1")%>"/></td>
				</tr>
			</table>
			</form>
			<form id="finform2">
			<table>
				<tr>
					<td><input type="text" id="mesget" name="mesget" value="<%=session.getAttribute("name")%>"/></td>
					<td><input type="text" id="messend" name="messend" value="<%=session.getAttribute("messend2")%>"/></td>
				</tr>
			</table>
			</form>
			<form id="finform3">
			<table>
				<tr>
					<td><input type="text" id="mesget" name="mesget" value="<%=session.getAttribute("name")%>"/></td>
					<td><input type="text" id="messend" name="messend" value="<%=session.getAttribute("messend3")%>"/></td>
				</tr>
			</table>
			</form>
			<form id="delform0">
			<table>
				<tr>
					<td><input type="text" id="finsend" name="finsend" value="<%=session.getAttribute("name")%>"/></td>
					<td><input type="text" id="finget" name="finget" value="<%=session.getAttribute("finname0")%>"/></td>
				</tr>
			</table>
			</form>
			<form id="delform1">
			<table>
				<tr>
					<td><input type="text" id="finsend" name="finsend" value="<%=session.getAttribute("name")%>"/></td>
					<td><input type="text" id="finget" name="finget" value="<%=session.getAttribute("finname1")%>"/></td>
				</tr>
			</table>
			</form>
			<form id="delform2">
			<table>
				<tr>
					<td><input type="text" id="finsend" name="finsend" value="<%=session.getAttribute("name")%>"/></td>
					<td><input type="text" id="finget" name="finget" value="<%=session.getAttribute("finname2")%>"/></td>
				</tr>
			</table>
			</form>
			<form id="delform3">
			<table>
				<tr>
					<td><input type="text" id="finsend" name="finsend" value="<%=session.getAttribute("name")%>"/></td>
					<td><input type="text" id="finget" name="finget" value="<%=session.getAttribute("finname3")%>"/></td>
				</tr>
			</table>
			</form>
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
		</div>
	</div>
		

	<script type="text/javascript" src="js/userjs.js"></script>
</body>
<script>
    	var a0 = "<%=session.getAttribute("messend0")%>";
    	var getinfor0=document.getElementById("getinfor0");
    	if(a0=="null"){
    		getinfor0.style.display="none";
    	}
    	var a1 = "<%=session.getAttribute("messend1")%>";
    	var getinfor1=document.getElementById("getinfor1");
    	if(a1=="null"){
    		getinfor1.style.display="none";
    	}
    	var a2 = "<%=session.getAttribute("messend2")%>";
    	var getinfor2=document.getElementById("getinfor2");
    	if(a2=="null"){
    		getinfor2.style.display="none";
    	}
    	var a3 = "<%=session.getAttribute("messend3")%>";
    	var getinfor3=document.getElementById("getinfor3");
    	if(a3=="null"){
    		getinfor3.style.display="none";
    	}
    	var b0 = "<%=session.getAttribute("locationName0")%>";
    	var pin0=document.getElementById("pin0");
    	if(b0=="null"){
    		pin0.style.display="none";
    	}
    	var b1 = "<%=session.getAttribute("locationName1")%>";
    	var pin1=document.getElementById("pin1");
    	if(b1=="null"){
    		pin1.style.display="none";
    	}
    	var b2 = "<%=session.getAttribute("locationName2")%>";
    	var pin2=document.getElementById("pin2");
    	if(b2=="null"){
    		pin2.style.display="none";
    	}
    	var b3 = "<%=session.getAttribute("locationName3")%>";
    	var pin3=document.getElementById("pin3");
    	if(b3=="null"){
    		pin3.style.display="none";
    	}

       	var c0 = "<%=session.getAttribute("finname0")%>";
    	var sure0=document.getElementById("sure0");
    	if(c0=="null"){
    		sure0.style.display="none";
    	}
    	var c1 = "<%=session.getAttribute("finname1")%>";
    	var sure1=document.getElementById("sure1");
    	if(c1=="null"){
    		sure1.style.display="none";
    	}
    	var c2 = "<%=session.getAttribute("finname2")%>";
    	var sure2=document.getElementById("sure2");
    	if(c2=="null"){
    		sure2.style.display="none";
    	}
    	var c3 = "<%=session.getAttribute("finname3")%>";
    	var sure3=document.getElementById("sure3");
    	if(c3=="null"){
    		sure3.style.display="none";
    	}
</script>
</html>
