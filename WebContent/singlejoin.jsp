<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/zddcss.css">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function check(){
	var xuanxiang=document.getElementsByName("options");
	var userid=document.getElementById("userid").value;
	if(userid==null||userid==""){
		alert("您还未登录，登陆后即可投票");
		return false;
	}
	var f = false;
	for(var i=0;i<xuanxiang.length;i++){
		if(xuanxiang[i].checked){
			f=true;
			break;
		}
	}
	if(f){
		return true;	
	}
	else{
		alert("请至少选择一个选项");
		return false;
	}
}
</script>
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
		<div id="vote" class="wrap">
			<h2>参与投票</h2>
			<ul class="list">
				<li>
					<h4>${requestScope.info.info_title }</h4>
					<p class="info">
						共有 <font color="#79a4cf">${requestScope.info.info_num }</font>
						个选项，已有 <font color="#79a4cf">${requestScope.info.info_pnum }</font>
						个网友参与了投票。
					</p>
					<input id="userid" value="${sessionScope.userid}" type="hidden">
					<form method="post" action="InfoServlet?flag=join">
						<ol>

							<c:forEach items="${infolist }" var="info" varStatus="status">
								<input name="infoid" value="${info.info_id}" type="hidden">
								<c:if test="${info.info_danshuang==0}">
									<li><input name="options" value="${status.index }"
										type="radio"> ${info.xuanxiang_content }</li>
								</c:if>
								<c:if test="${info.info_danshuang==1}">
									<li><input name="options" value="${status.index }"
										type="checkbox"> ${info.xuanxiang_content }</li>
								</c:if>
							</c:forEach>
						</ol>
						<p class="voteView">
							<input class="input-button" value="参加投票" type="submit" onclick="return check()"><a
								href="InfoServlet?flag=clicktitle&infoid=${requestScope.info.info_id }">
								<input class="input-button" type="button" value="查看结果">
							</a>
						</p>
					</form>
				</li>
			</ul>
		</div>



	</div>


	<div id="footer" class="wrap">
		头戴三叉束发紫金冠体挂西川红棉百花袍身披兽面吞头连环铠腰系勒甲玲珑狮蛮带手持方天画戟座下嘶风赤兔马之赵小笛实训是也©</div>
</body>
</html>