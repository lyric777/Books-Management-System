<%@page import="com.bms.Reader"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="java.sql.*,java.io.*,java.lang.Math.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% String reader_no=request.getParameter("reader_no"); %>
<!DOCTYPE html>
<jsp:useBean id="reader" class="com.bms.Reader" scope="page"/>
<%
ResultSet rst;
rst = reader.getReader(reader_no);
int flag = 1;
if(rst.next()){
	flag = 0;
}
else{
	flag = 1;
}
%>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>修改个人信息</title>
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
	<a href="reader.jsp" class="nav" style="margin-left:50px;">回到读者页</a>
</div>		  
<div id="content" style="width:960px;margin:10px auto;background-color:#FFFFFF;">
<div class="container" align="center" style="font-size:17px;">  
<%if(flag==0){%>
<form action="<%=basePath%>updateinfo.jsp" method="get">
	<br /><br />
 	<p>读者号：&nbsp;&nbsp;&nbsp;<input type="text" name="reader_no" readonly="readonly" style="font-size:16px;height:27px;background-color:#ececec;border: none;" value=<%=rst.getString(1) %>></p>
 	<p>读者姓名：<input type="text" name="reader_name" style="font-size:16px;height:25px;" value=<%=rst.getString(2) %>></p>
 	<p>电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="telephone" style="font-size:16px;height:25px;" value=<%=rst.getString(3) %>></p>
 	<p>邮箱：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="email" style="font-size:16px;height:25px;" value=<%=rst.getString(4) %>></p>
 	<input type="submit" onclick="updateInfo()" style="width:80px;height:40px; font-size: 17px;color:#ffffff;font-family:微软雅黑;background-color:#822727;border: none;outline: none;" value="提交" />
</form>	
<%}%>

</div>			
<div class="copyright">
<div class="wraper"  align="center">
<p><span>Copyright 2018 Construct&nbsp;&nbsp;|</span>&nbsp;&nbsp;版权所有:信息162许致立</p>
</div>
</div>
</div>

</body>
<script>
if(<%=flag%>==1){
	alert("请输入正确的读者号，或该读者不存在。");
	window.history.back(-1); 
}
</script>
</html>
<%rst.close(); %>