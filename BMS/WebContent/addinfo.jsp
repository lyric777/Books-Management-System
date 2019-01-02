<%@page import="com.bms.Reader"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="java.sql.*,java.io.*,java.lang.Math.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% String reader_no=request.getParameter("reader_no"); %>
<% String reader_name=request.getParameter("reader_name"); %>
<% String tel=request.getParameter("telephone"); %>
<% String email=request.getParameter("email"); %>
<!DOCTYPE html>
<jsp:useBean id="admin" class="com.bms.Admin" scope="page"/>
<%
int result = admin.addInfo(reader_no,reader_name,tel,email);
%>

<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>添加读者</title>
<style type="text/css">

a{
font-size:16px;
text-decoration:none;
font-family:微软雅黑;
color:#822727;
}
/* copyright */
.copyright {border-top:1px solid #e7e6e6;margin-top:100px;}
.copyright p {font-size:14px;padding:20px 0;}
.nav{display:block;height:100px;width: 100px;background-color:#FFFFFF;line-height:100px;float:left;
		 text-align:center;text-decoration:none;font-size:18px;font-family:微软雅黑;color:#822727;}


</style>
</head>

<body style="margin:0;padding:0;background-color:#E0E0E0;">	
<div style="height:100px;width: 960px;margin:10px auto;background:url(title.png) 0 0 no-repeat;background-color:#FFFFFF;">
	<a href="index.jsp" class="nav" style="margin-left:580px;">回到登录页</a>
	<a href="admin.jsp" class="nav" style="margin-left:50px;">回到管理页</a>
</div>		  
<div id="content" style="width:960px;margin:10px auto;background-color:#FFFFFF;">
<div class="container" align="center" style="font-size:17px;">  
<form>
	<br /><br />
 	<p>读者号：&nbsp;&nbsp;&nbsp;<input type="text" disabled="disabled" style="font-size:16px;height:25px;" value=<%=reader_no %>></p>
 	<p>读者姓名：<input type="text" disabled="disabled" style="font-size:16px;height:25px;" value=<%=reader_name %>></p>
 	<p>电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" disabled="disabled" style="font-size:16px;height:25px;" value=<%=tel %>></p>
 	<p>邮箱：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" disabled="disabled" style="font-size:16px;height:25px;" value=<%=email %>></p>
</form>	


</div>			
<div class="copyright">
<div class="wraper"  align="center">
<p><span>Copyright 2018 Construct&nbsp;&nbsp;|</span>&nbsp;&nbsp;版权所有:信息162许致立</p>
</div>
</div>
</div>

</body>
<script>
if (<%=result%> === 0){
	alert("添加失败！");
	window.history.back(-1); 
}
else{
	alert("添加成功！");
}
</script>
</html>