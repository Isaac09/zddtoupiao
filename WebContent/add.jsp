<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/zddcss.css">
<title>添加投票</title>
<script type="text/javascript">
var isIE = !!document.all;
function AddOption()
{
	var voteoptions = document.getElementById("voteoptions");
	var _p = document.createElement("p");
	var _input = document.createElement("input");
	_input.type = "text";
	_input.className = "input-text";
	_input.setAttribute("name", "options");
	_p.appendChild(_input);
	var _a = document.createElement("a");
	_a.className = "del";
	_a.setAttribute("href", "javascript:;");
	if(isIE) {
		_a.attachEvent("onclick", DelOption);
	} else {
		_a.addEventListener("click", DelOption, false);
	}
	_a.appendChild(document.createTextNode("关闭"));
	_p.appendChild(_a);
	voteoptions.appendChild(_p);
}
function DelOption(e)
{
	if(!e) e = window.event;
	var a = e.srcElement || e.target;
	var obj = a.parentNode;
	obj.parentNode.removeChild(obj);
}

	function check(){
		var title = document.getElementById("title").value;
		if(title==""||title==null){
			alert("请填写标题");
			return false;
		}
		var xx = document.getElementsByName("options");
		for(var i =0; i<xx.length;i++){
			if(xx[i].value==null||xx[i].value==""){
				alert("请将选项填写完整");
				return false;
			}
			for(var j=i+1;j<xx.length;j++){
				if(xx[i].value==xx[j].value){
					alert("请不要填写重复的选项");
					return false;
				}
			}
		}
		if(xx.length>20){
			alert("选项不能大于20个");
			return false;
		}
		
	}
function checkname(){
	var title = document.getElementById("title");
	var q=  document.getElementById("error");
	if(title.value==""||title.value==null){
		q.innerHTML="请填写投票标题↑";
	}
	else if(title.value.length>30){
		q.innerHTML="标题不能超过30字↑";
	}
	else{
		q.innerHTML="";
	}
}

function bshow() {
	var q =  document.getElementById("mydiv");
	q.innerHTML="<font color='#5599ff'>确定发布吗？发布后，您的投票信息将生效</font>";
	q.style.display = "block";
}
function bhide() {
	var q =  document.getElementById("mydiv");
	q.style.display = "none";
}
function zshow() {
	var q =  document.getElementById("mydiv");
	q.innerHTML="<font color='#5599ff'>将增加一个新的选项</font>";
	q.style.display = "block";
}
function zhide() {
	var q =  document.getElementById("mydiv");
	q.style.display = "none";
}
function qshow() {
	var q =  document.getElementById("mydiv");
	q.innerHTML="<font color='#5599ff'>将放弃发布并返回投票列表页面</font>";
	q.style.display = "block";
}
function qhide() {
	var q =  document.getElementById("mydiv");
	q.style.display = "none";
}
/* function checkxx(){
	var xx = document.getElementsByName("options");
	alert(xx.length);
	for(var i =0; i<xx.length;i++){
		alert(i);

	}
} */
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
<div id="voteManage" class="box">
	<h2>添加新投票</h2>
	<div class="content">
	<form method="post" action="InfoServlet?flag=addinfo" onsubmit="return check()">
			<dl>
				<dt>投票内容：</dt>
				<dd>
				   <input name="entityId" value="" type="hidden">
				   
				   <input class="input-text" name="infotitle" id="title" type="text" onblur="checkname()">
				   <div class="error" id="error"></div>
				</dd>
				<dt>投票类型：</dt>
				<dd>
		  		   <input name="danshuang" checked="checked" value="0" type="radio">单选
				   <input name="danshuang" value="1" type="radio">多选
				</dd>
				<dt>投票选项：</dt>
				
				<dd id="voteoptions">
					<p><input class="input-text" name="options" type="text" id="xx" onblur="checkxx()"></p>
					<p><input class="input-text" name="options" type="text" id="xx" onblur="checkxx()"></p>
				</dd>
				
				
				<dt></dt>
				<dd class="button">
					<input class="input-button" src="" type="submit" onmousemove="bshow()" onmouseout="bhide()" value="添加投票">
					<a href="javascript:;" onclick="AddOption()"><input class="input-button" type="button" onmousemove="zshow()" onmouseout="zhide()"  value="增加选项"></a>
					<a href="javascript:window.history.back(-1)"><input class="input-button" type="button" onmousemove="qshow()" onmouseout="qhide()"  value="取消操作"></a>
				</dd>
			</dl>
			<div id="mydiv"></div>
		</form>
	</div>
</div>


</div>

<div id="footer" class="wrap">
	头戴三叉束发紫金冠体挂西川红棉百花袍身披兽面吞头连环铠腰系勒甲玲珑狮蛮带手持方天画戟座下嘶风赤兔马之赵小笛实训是也©
</div>
</body>
</html>