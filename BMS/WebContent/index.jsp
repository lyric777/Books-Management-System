<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书信息管理系统</title>
<style>
	.nav{display:block;height:100px;width: 100px;background-color:#FFFFFF;line-height:100px;float:left;
		 text-align:center;text-decoration:none;font-size:18px;font-family:微软雅黑;color:#822727;}
	#login{height:400px;width: 300px;margin-left:540px;margin-top:-350px;}
	.button{background-color:#822727;border: none;color: white;padding: 15px 32px;text-align: center;
		    width:160px;font-family:微软雅黑;text-decoration: none;font-size: 20px;}
</style>
</head>
<body style="margin:0;padding:0;background-color:#E0E0E0;">
<div style="height:100px;width: 960px;margin:10px auto;background:url(title.png) 0 0 no-repeat;background-color:#FFFFFF;">
	<a href="" class="nav" style="margin-left:560px;">首页</a>
	<a href="reader.jsp" class="nav">读者入口</a>
	<a href="admin.jsp" class="nav" style="width: 140px;">管理员入口</a>
</div>
<div id="content" style="height:500px;width:960px;margin:10px auto;background-color:#FFFFFF;">
	<img src="pic2.jpg" style="margin:90px 30px;" />
	<div id="login">
		<div>
			<form action="reader.jsp" method="post"><!-- 用什么方法在考虑考虑 -->
				<span style="margin-top:50px;font-size:20px;font-family:微软雅黑;color:#822727;">读者入口：</span>
				<input type="submit" value="读者登录" class="button" style="margin-left:20px;" />
			</form>
		</div>
		<div style="margin-top:40px;">
			<form action="admin.jsp" method="post">
				<span style="margin-top:70px;font-size:20px;font-family:微软雅黑;color:#822727;">管理员入口：</span>
				<input type="submit" value="管理员登录" class="button" />
			</form>
		</div>
	</div>
	<div style="margin-top:-100px;margin-left:300px;font-family:微软雅黑;color:#822727;">
		<p>当前系统时间: <%= (new java.util.Date()).toLocaleString()%></p>
	</div>

</div>

</body>
</html>