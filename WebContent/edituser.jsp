<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	var upwd2 = document.getElementById("password2").value;
	if(upwd==null||upwd==""||upwd2==null||upwd2==""){
		alert("请输入密码");
		return false;
	}
	else if(upwd!=upwd2){
		alert("两次密码不一致");
		return false;
	}
	else{
		return true;
	}
}

</script>
<title>用户注册</title>
</head>

<body>
<div id="logo" class="wrap">
	<img src="images/logo.jpg">
</div>
<div id="daohang" class="wrap">
	<div class="profile">
			<c:if test="${sessionScope.usertype==1 }">管理员<a href="UserServlet?flag=exit">[退出]</a></c:if>
		<c:if test="${sessionScope.usertype==0 }">用户<a href="UserServlet?flag=exit">[退出]</a></c:if>
		<c:if test="${sessionScope.usertype==null }">游客<a href="login.jsp">[登陆]</a><a href="register.jsp">[注册]</a></c:if>
		<span class="return"><a href="InfoServlet?flag=infolist">投票列表</a></span>
		<span class="addnew"><a href="add.jsp">添加投票</a></span>
		<c:if test="${sessionScope.usertype==1 }">
		<span class="modify"><a href="InfoServlet?flag=infolist&mark=weihu">维护投票</a></span>
		<span class="user"><a href="UserServlet?flag=userlist">用户管理</a></span>
		</c:if>
	</div>
</div>

<div id="menu" class="wrap">
<div id="register" class="box">
	<h2>修改用户</h2>
	<div class="content">
	   <form method="post" action="UserServlet?flag=saveedituser&newpage=${requestScope.newpage }" onsubmit="return check()">
			<dl>
			    <dt>用户ID：</dt>
				<dd><input class="input-text" name="userid" id="userid" value="${requestScope.user.user_id}" type="text" readonly="readonly">
				</dd>
				<dt>用户名：</dt>
				<dd><input class="input-text" name="username" id="username" value="${requestScope.user.user_name}" type="text" readonly="readonly">
				</dd>
				<dt>密码：</dt>
				<dd><input class="input-text" name="password" id="password" value="${requestScope.user.user_password }" type="password"></dd>
				<dt>确认密码：</dt>
				<dd><input class="input-text" name="password2" id="password2" value="${requestScope.user.user_password }" type="password"></dd>
				<dt></dt>
				<dd><input class="input-button" name="submit" value="修改用户" type="submit"></dd>
			</dl>
		</form>
		<div class="error"></div>
		<div class="error"></div>
	</div>
</div>

</div>

<div id="footer" class="wrap">
	头戴三叉束发紫金冠体挂西川红棉百花袍身披兽面吞头连环铠腰系勒甲玲珑狮蛮带手持方天画戟座下嘶风赤兔马之赵小笛实训是也©
</div>
</body>
</html>