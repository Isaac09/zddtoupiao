<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/zddcss.css">
<title>投票列表</title>
</head>
<body>

	<div id="vote" class="wrap">
		<div class="search">
			<form method="post" action="InfoServlet?flag=infolist">
				<h2>
					投票列表 <span class="search-input"><input name="keyword"
						class="input-text" type="text"><input name="submit"
						class="input-button" value="搜索投票" type="submit"></span>
				</h2>
			</form>
		</div>
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
						class="input-text" name="cpage" id="cpage" value="" type="text"><a
						href="#"
						onclick="location.href='InfoServlet?flag=infolist&keyword=${requestScope.keyword}&newpage='+document.getElementById('cpage').value">GO</a></td>
				</tr>
			</table>
		</center>
	</div>




</body>
</html>