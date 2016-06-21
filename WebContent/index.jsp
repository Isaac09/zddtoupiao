<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/zddcss.css">
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<title>投票列表</title>
<script type="text/javascript">
function checkgopage(){
	var cpage = document.getElementById("cpage").value;
	var maxpage = document.getElementById("maxpage").value;
	var keyword = document.getElementById("keyword").value;
	if(cpage<0||cpage>maxpage){
		alert("输入1-"+maxpage+"之间的数");
	}
	else{
		window.location.href='InfoServlet?flag=infolist&keyword='+keyword+'&newpage='+capge;
	}
		
}

function testText(){
	$("ul li:even").css("background-color","#efffff");
}

</script>
</head>
<body onload="javascript:testText()">

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
			<form method="post" action="InfoServlet?flag=infolist">
				<h2>
					投票列表 <span class="search-input"><input name="keyword"
						class="input-text" type="text"><input name="submit"
						class="input-button" value="搜索投票" type="submit" ></span>
				</h2>
			</form>
		</div>
			<c:if test="${requestScope.infolist.size()>0 }">
		<ul class="list">
			<c:forEach items="${requestScope.infolist }" var="info"
				varStatus="status">
				<li>
					<h4>
						<a href="InfoServlet?flag=clicktitle&infoid=${info.info_id }">${info.info_title }</a>
					</h4>
					<div class="join">
						<a href="InfoServlet?flag=clickjoin&infoid=${info.info_id }">我要参与</a>
					</div>
					<p class="info">
						共有<font color="#79a4cf"> ${info.info_num } </font>个选项，已有<font
							color="#79a4cf"> ${info.info_pnum } </font>个网友参与了投票。
					</p>
				</li>
			</c:forEach>
		</ul>
		<center>
			<table class="page">
				<tr>
					<c:if test="${requestScope.page!=1 }">
						<td><a
							href="InfoServlet?flag=infolist&keyword=${requestScope.keyword}">首页</a></td>
						<td><a
							href="InfoServlet?flag=infolist&newpage=${requestScope.page-1 }&keyword=${requestScope.keyword}">上一页</a></td>
					</c:if>
					<c:if test="${requestScope.page==1 }">
						<td><font color="#808080">首页</font></td>
						<td><font color="#808080">上一页</font></td>
					</c:if>
					<c:if test="${requestScope.page!=requestScope.maxpage }">
						<td><a
							href="InfoServlet?flag=infolist&newpage=${requestScope.page+1 }&keyword=${requestScope.keyword}">下一页</a></td>
						<td><a
							href="InfoServlet?flag=infolist&newpage=${requestScope.maxpage }&keyword=${requestScope.keyword}">末页</a></td>
					</c:if>
					<c:if test="${requestScope.page==requestScope.maxpage }">
						<td><font color="#808080">下一页</font></td>
						<td><font color="#808080">末页</font></td>
					</c:if>
					<td class="gopage">第<font color="#ff0000">${requestScope.page }</font>页/共<font
						color="#ff0000">${requestScope.maxpage }</font>页 <input
						class="input-text" name="cpage" id="cpage" value="" type="text">
						<input type="hidden" name="maxpage" id="maxpage" value="${requestScope.maxpage }">
						<input type="hidden" name="keyword" id="keyword" value="${requestScope.keyword }">
						<a
						href="#"
						onclick="location.href='InfoServlet?flag=infolist&keyword=${requestScope.keyword}&newpage='+document.getElementById('cpage').value">GO</a></td>
				</tr>
			</table>
		</center>
		</c:if>
	</div>

<c:if test="${requestScope.infolist.size()==0 }">
<div id="none" class="wrap">

没有结果

</div>
</c:if>


</div>

<div id="footer" class="wrap">
	头戴三叉束发紫金冠体挂西川红棉百花袍身披兽面吞头连环铠腰系勒甲玲珑狮蛮带手持方天画戟座下嘶风赤兔马之赵小笛实训是也©
</div>
</body>
</html>