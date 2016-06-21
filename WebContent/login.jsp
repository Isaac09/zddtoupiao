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
<script type="text/javascript">
function check(){
	var uname = document.getElementById("username").value;
	var upwd = document.getElementById("password").value;
	if((uname==null||uname=="")&&(upwd==null||upwd=="")){
		alert("请输入用户名和密码");
		return false;
	}
	else if(uname==null||uname==""){
		alert("请输入用户名");
		return false;
	}
	else if(upwd==null||upwd==""){
		alert("请输入密码");
		return false;
	}
else if(uname.length>16||uname.length<6){
	alert("请输入6-16位的用户名");
	return false;
}
else if(upwd.length>16||upwd.length<6){
	alert("请输入6-16位的密码");
	return false;
}
	else{
		return true;
	}
}
function checkusername(){
	var uname = document.getElementById("username").value;
	var e = document.getElementById("error1");
	if(uname==null||uname==""){
		e.innerHTML="请输入用户名";
		return false;
	}else if(uname.length>16||uname.length<6){
		e.innerHTML="请输入6-16位的用户名";
		return false;
	}
	else{
		e.innerHTML="";
	}
}
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
		e.innerHTML="";
	}
}

</script>
<title>欢迎登陆</title>
</head>

<body>
	<%
		//取得cookie显示在登陆文本框里
		String name = "";
		String pwd = "";
		Cookie cookie[] = request.getCookies();
		if(cookie!=null){
		for (int i = 0; i < cookie.length; i++) {
			Cookie c = cookie[i];
			if (c.getName().equals("username")) {
				name = URLDecoder.decode(c.getValue(), "UTF-8");
			}
			if (c.getName().equals("password")) {
				pwd = c.getValue();
			}
		}
		}
	%>

<div id="login" class="wrap">
<div class="blank">
</div>
	<div class="main">
		<div class="corner">欢迎登陆赵笛的投票系统</div>
		<div class="login">
			<h2>用户登录</h2>
			<form method="post" action="UserServlet?flag=login" onsubmit="return check()">
				<div class="luser">用户名：</div>
					<input class="input-text" name="username" id="username" value="<%=name%>" type="text" onblur="checkusername()">
					<div  id="error1" class="lerror"></div>
					<div class="luser">用户密码：</div>
					<input class="input-text" name="password" id="password" value="<%=pwd%>" type="password" onblur="checkpassword()">
		            <div  id="error2" class="lerror"></div>
					<div class="luser">&nbsp;</div>
					<input class="input-button" name="submit" value="登录系统" type="submit"> <a href="register.jsp"><input class="input-button" type="button" value="账号注册"></a>
				    
				    <c:if test="${requestScope.loginstatus==0}">
				    <dd><font color="#ff0000">账号或密码错误</font></dd>
				    </c:if>
			</form>
		</div>
	</div>
</div>

<div id="footer" class="wrap">
	头戴三叉束发紫金冠体挂西川红棉百花袍身披兽面吞头连环铠腰系勒甲玲珑狮蛮带手持方天画戟座下嘶风赤兔马之赵小笛实训是也©
</div>


</body>
</html>