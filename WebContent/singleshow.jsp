<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/zddcss.css">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
function fun1(){
	for(var i=1;i<=20;i++){
    $("#"+i).animate({width:$("."+i).width()});	
	}
}
</script>
</head>
<body onload="javascript:fun1()">
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
		<div class="search">
	
	</div>
	<ul class="list">
		<li>
			<h4>${requestScope.info.info_title }</h4>
			<p class="info">共有 <font color="#79a4cf">${requestScope.info.info_num }</font> 个选项，已有 <font color="#79a4cf">${requestScope.info.info_pnum }</font> 个网友参与了投票。</p>
				<ol>
				   <c:forEach items="${requestScope.infolist }" var="info" varStatus="status">
					<li>${info.xuanxiang_content}
					<c:if test="${info.xuanxiang_maxnum>0 }">
						<div class="rate">
							<div class="ratebg"><div id="${status.index+1 }" class="percent" style="width:0%"></div>
							<div class="${status.index+1 }"  style="height:0px;width:${info.xuanxiang_num/info.xuanxiang_maxnum*100}%"></div>
							</div>
							<p><font color="#5599ff">${info.xuanxiang_num}</font>票<span>
							(<fmt:formatNumber value="${info.xuanxiang_num/info.xuanxiang_maxnum*100}" pattern="#0.00"/> %)
							</span></p>
						</div>
						</c:if>
											<c:if test="${info.xuanxiang_maxnum==0 }">
						<div class="rate">
							<div class="ratebg"><div class="percent" style="width:0%"></div>
							</div>
							<p><font color="#5599ff">${info.xuanxiang_num}</font>票<span>
							(0.00 %)
							</span></p>
						</div>
						</c:if>
					</li>
				   </c:forEach>
					
				  	
				</ol>
				<div class="goback"><a href="InfoServlet?flag=infolist">返回投票列表</a></div>
				<div class="goback"><a href="InfoServlet?flag=clickjoin&infoid=${requestScope.info.info_id}">我要参与</a></div>
		</li>
	</ul>
</div>



</div>


<div id="footer" class="wrap">
	头戴三叉束发紫金冠体挂西川红棉百花袍身披兽面吞头连环铠腰系勒甲玲珑狮蛮带手持方天画戟座下嘶风赤兔马之赵小笛实训是也©
</div>

</body>
</html>