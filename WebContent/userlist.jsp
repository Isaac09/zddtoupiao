<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/zddcss.css">
<title>用户列表</title>
<script type="text/javascript">
function searchbyid(){
	var searchval = document.getElementById("searchval").value;
	window.location.href = "UserServlet?flag=search&searchval="+searchval+"&mark=id";
}
function searchbyname(){
	var searchval = document.getElementById("searchval").value;
	window.location.href = "UserServlet?flag=search&searchval="+searchval+"&mark=name";
}
</script>
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
	
<div id="vote" class="wrap">
<div class="search">
			<form method="post" action="UserServlet?flag=search&mark=name">
				<h2>
					用户列表 <span class="search-input"><input name="searchval"
						class="input-text" type="text"><input name="submit"
						class="input-button" value="搜索用户" type="submit"></span>
				</h2>
			</form>
		</div>
<c:if test="${requestScope.userlist.size()>0 }">
		<table>
			<tr>
				<td width="80"><b>序号</b></td>
				<td width="80"><b>用户ID</b></td>
				<td width="400"><b>用户名</b></td>
				<td width="130"><b>用户类型</b></td>
				<td width="130"><b>用户状态</b></td>
				<td width="100"><b>用户操作</b></td>
			</tr>
			<c:forEach items="${userlist }" var="user" varStatus="status">
				<tr class="odd">
					<td><b>${status.index+start+1 }</b></td>
					<td>${user.user_id }</td>
					<td>${user.user_name }</td>
					<td><c:if test="${user.user_type==0 }">
							<font color="#0000ff">用户</font>
						</c:if> <c:if test="${user.user_type==1 }">
							<font color="#ff00ff">管理员</font>
						</c:if></td>
					<td><c:if test="${user.user_status==0 }">
							<font color="#00ff00">正常</font>
						</c:if> <c:if test="${user.user_status==1 }">
							<font color="#ff0000">封号</font>
						</c:if></td>
					<td><a
						href="UserServlet?flag=edituser&userid=${user.user_id }&newpage=${requestScope.page }">修改</a>/<a
						href="UserServlet?flag=deluser&userid=${user.user_id}&userstatus=${user.user_status}&newpage=${requestScope.page }"><c:if test="${user.user_status==0}">封号</c:if><c:if
								test="${user.user_status==1}">解封</c:if>
					</a></td>

				</tr>


			</c:forEach>
		</table>
		
		<c:if test="${!empty requestScope.searchval}">
		<center>
		<table>
			<tr>
				<c:if test="${requestScope.page!=1 }">
					<td><a href="UserServlet?flag=search&searchval=${requestScope.searchval}&mark=name&newpage=1">首页</a></td>
					<td><a
						href="UserServlet?flag=search&searchval=${requestScope.searchval}&mark=name&newpage=${requestScope.page-1 }">上一页</a></td>
				</c:if>
				<c:if test="${requestScope.page==1 }">
					<td><font color="#808080">首页</font></td>
					<td><font color="#808080">上一页</font></td>
				</c:if>
				<c:if test="${requestScope.page!=requestScope.maxpage }">
					<td><a
						href="UserServlet?flag=search&searchval=${requestScope.searchval}&mark=name&newpage=${requestScope.page+1 }">下一页</a></td>
					<td><a
						href="UserServlet?flag=search&searchval=${requestScope.searchval}&mark=name&newpage=${requestScope.maxpage }">末页</a></td>
				</c:if>
				<c:if test="${requestScope.page==requestScope.maxpage }">
					<td><font color="#808080">下一页</font></td>
					<td><font color="#808080">末页</font></td>
				</c:if>
				<td>第<font color="#ff0000">${requestScope.page }</font>页/共<font color="#ff0000">${requestScope.maxpage }</font>页</td>
				<td><input class="input-text" name="cpage" id="cpage" value=""
					type="text"><a href="#"
					onclick="location.href='UserServlet?flag=search&searchval=${requestScope.searchval}&mark=name&newpage='+document.getElementById('cpage').value">GO</a></td>

			</tr>
		</table>
		</center>
</c:if>

<c:if test="${empty requestScope.searchval}">
<center>
		<table>
			<tr>
				<c:if test="${requestScope.page!=1 }">
					<td><a href="UserServlet?flag=userlist">首页</a></td>
					<td><a
						href="UserServlet?flag=userlist&newpage=${requestScope.page-1 }">上一页</a></td>
				</c:if>
				<c:if test="${requestScope.page==1 }">
					<td><font color="#808080">首页</font></td>
					<td><font color="#808080">上一页</font></td>
				</c:if>
				<c:if test="${requestScope.page!=requestScope.maxpage }">
					<td><a
						href="UserServlet?flag=userlist&newpage=${requestScope.page+1 }">下一页</a></td>
					<td><a
						href="UserServlet?flag=userlist&newpage=${requestScope.maxpage }">末页</a></td>
				</c:if>
				<c:if test="${requestScope.page==requestScope.maxpage }">
					<td><font color="#808080">下一页</font></td>
					<td><font color="#808080">末页</font></td>
				</c:if>
				<td>第<font color="#ff0000">${requestScope.page }</font>页/共<font color="#ff0000">${requestScope.maxpage }</font>页</td>
				<td><input  class="input-text" name="cpage" id="cpage" value=""
					type="text"><a href="#"
					onclick="location.href='UserServlet?flag=userlist&newpage='+document.getElementById('cpage').value">GO</a></td>

			</tr>
		</table>
		</center>
	
</c:if>
	</c:if>
	</div>
	<c:if test="${requestScope.userlist.size()==0 }">
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