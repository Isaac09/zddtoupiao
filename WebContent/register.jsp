<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/zddcss.css">
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
var t=0;
function check(){
	var uname = document.getElementById("username").value;
	var upwd = document.getElementById("password").value;
	var upwd2 = document.getElementById("password2").value;
	if((uname==null||uname=="")&&(upwd==null||upwd==""||upwd2==null||upwd2=="")){
		alert("请输入用户名和密码");
		return false;
	}
	else if(uname==null||uname==""){
		alert("请输入用户名");
		return false;
	}
	else if(upwd==null||upwd==""||upwd2==null||upwd2==""){
		alert("请输入密码");
		return false;
	}
	else if(upwd!=upwd2){
		alert("两次密码不一致");
		return false;
	}else if(uname.length>16||uname.length<6){
		alert("请输入6-16位的用户名");
		return false;
	}
	else if(upwd.length>16||upwd.length<6){
		alert("请输入6-16位的密码");
		return false;
	}
	else if(t==1){
		alert("用户名已被注册");
			return false;
	}else{
		return true;
	}
}

// function checkusername(){
// 	var username= document.getElementById("username");
// 	var e = document.getElementById("error1");
// 	if(username.value==""||username.value==null){
// 		e.innerHTML="用户名不能为空";
// 		return false;
// 	}
// 	else if(username.value.length>16||username.value.length<6){
// 		e.innerHTML="请输入6-16位的用户名";
// 		return false;
// 	}
// 	createXMLHttpRequest();
// 	if(xmlhttp!=null){
// 		var url ="UserServlet?flag=checkusername&username="+username.value; 
// 		xmlhttp.open("POST",url,true);
// 		xmlhttp.setRequestHeader("Content-Type",
// 			"application/x-www-form-urlencoded;");
// 		xmlhttp.onreadystatechange=processRequest;
// 		xmlhttp.send(null);
// 	}else{
// 		alert("不能创建XMLHttpRequest对象实例");
// 	}
// }
// var xmlhttp;
// function createXMLHttpRequest(url) {
// 	try {
// 	xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
// 	} catch (q) {
// 		try {
// 		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
// 		} catch (q) {
// 			try {
// 			xmlhttp = new XMLHttpRequest();
// 				if (xmlhttp.overrideMimeType) {
// 					xmlhttp.overrideMimeType("text/xml");
// 				}
// 			} catch (q) {			}
// 		}
// 	}
// }
// function processRequest() {
// 	var e = document.getElementById("error1");
// 	if (xmlhttp.readyState == 4){
// 		if (xmlhttp.status == 200) {
// 			//responseText表示请求完成后，返回的字符串信息				
// 			if (xmlhttp.responseText == "false"){
// 				e.innerHTML = "该用户名已经被注册"; 
// 				t=1;
// 			}
// 		else {
// 				e.innerHTML = "<font color='green' >可以使用的用户名</font>";
// 				t=0;
// 			} 
// 	}	
// 		else {
// 			alert("请求处理返回的数据有错误");				
// 		}
// }
// }
function checkpassword(){
	var password= document.getElementById("password");
	var e = document.getElementById("error2");
	if(password.value==""||password.value==null){
		e.innerHTML="请输入密码";	
	}
	else if(password.value.length>16||password.value.length<6){
		e.innerHTML="请输入6-16位的密码";
	}
	else{
		e.innerHTML="<font color='green' >密码格式正确</font>";
	}
}
function checkpassword2(){
	var password= document.getElementById("password").value;
	var password2= document.getElementById("password2").value;
	var e = document.getElementById("error3");
	if(password!=password2){
		e.innerHTML="两次密码不一致";
	}
	else{
		e.innerHTML="<font color='green' >密码格式正确</font>";
	}
}

$(function(){
	$("#username").blur(function(){
		var username=$(this).val();
	 	var e = $("#error1");
	 	if(username==""||username==null){
	 		e.html("用户名不能为空");
	 		return false;
	 	}
	 	else if(username.length>16||username.length<6){
	 		e.html("请输入6-16位的用户名");
	 		return false;
	 	}
		
		$.ajax({  
            url : "UserServlet",
            data:{
            	username:username,
            	flag:"checkusername"
            },
            dataType: "text",//设置数据类型
            async: true,
            type : "POST", 
            success : function(result) {
                if (result=="false") {  
                	$("#error1").html("该用户名已经被注册"); 
                } else {  
                	$("#error1").html("<font color='green' >可以使用的用户名</font>"); 
                }  
            }  
        });
	});
});
</script>
<title>用户注册</title>
</head>
<body>

<div id="login" class="wrap">
<div class="blank">
</div>
	<div class="main">
		<div class="corner">欢迎注册赵笛的投票系统</div>
		<div class="login">
			<h2>用户注册</h2>
			<form method="post" action="UserServlet?flag=register" onsubmit="return check()">
				    
					<div class="luser">用户名：</div>
					<input class="input-text" name="username" id="username" value="" type="text" >
					<div  id="error1" class="error"></div>
					<div class="luser">用户密码：</div>
					<input class="input-text" name="password" id="password" value="" type="password" onblur="checkpassword()">
		            <div  id="error2" class="error"></div>
					<div class="luser">确认密码：</div>
					<input class="input-text" name="password2" id="password2" value="" type="password" onblur="checkpassword2()">
					<div  id="error3" class="error"></div>
					<div class="luser">&nbsp;</div>
					<input class="input-button" name="submit" value="注册账号" type="submit"> <a href="login.jsp"><input class="input-button" type="button" value="返回登录页"></a>
				
			</form>
		</div>
	</div>
</div>

<div id="footer" class="wrap">
	头戴三叉束发紫金冠体挂西川红棉百花袍身披兽面吞头连环铠腰系勒甲玲珑狮蛮带手持方天画戟座下嘶风赤兔马之赵小笛实训是也©
</div>


</body>
</html>