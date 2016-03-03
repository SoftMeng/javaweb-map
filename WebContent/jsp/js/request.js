/**
 * 构建XMLHttpRequest对象并请求服务器
 * @param reqType：请求类型（GET或POST）
 * @param url：服务器地址
 * @param async：是否异步请求
 * @param resFun：响应的回调函数
 * @param parameter :请求参数
 * @return
 */

function httpRequest(reqType,url,async,resFun,parameter){
	
	var request = null;
	if( window.XMLHttpRequest ){		//非IE浏览器
		
		request = new XMLHttpRequest();
	}else if( window.ActiveXObject ){	//IE浏览器
		
		var arrSignatures = new Array("Msxml2.XMLHTTP", "Microsoft.XMLHTTP", "Microsoft.XMLHTTP", "MSXML2.XMLHTTP.5.0", "MSXML2.XMLHTTP.4.0", "MSXML2.XMLHTTP.3.0", "MSXML2.XMLHTTP");		
		
		for( var i = 0; i < arrSignatures.length; i++ ){
			request = new ActiveXObject( arrSignatures[i] );
			if( request || typeof( request ) == "object" )
				break;
		}
	}
	if( request || typeof( request ) == "object" ){
		request.open(reqType, url, true);	//打开服务器连接
		//设置请求头
		request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		console.log(resFun);
		request.onreadystatechange = resFun;//设置处理响应的回调函数
		parameter = encodeURI(parameter);	//将参数字符串进行编码
		request.send(parameter);			//发送请求

		console.log("1");
		
	}
	else{
		alert( "浏览器不支持！" );
	}	
	return request;
}