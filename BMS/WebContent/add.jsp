<%@page import="com.bms.Reader"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="java.sql.*,java.io.*,java.lang.Math.*, java.text.SimpleDateFormat,java.util.Date,javax.servlet.http.*,javax.servlet.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

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

			<%
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  //使用SQL Server的JDBC驱动程序
			String url="jdbc:sqlserver://localhost:1433;DatabaseName=BMS";
			
			String user="sa";
			String password="7878966";
			
			try {
			    //1.加载驱动
			    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			    System.out.println("加载驱动成功！");
			}catch(Exception e) {
			    e.printStackTrace();
			    System.out.println("加载驱动失败！");
			}
			try {  
			    //2.连接
			    Connection ct=DriverManager.getConnection( url,user,password);
			    System.out.println("连接数据库成功！");
			}catch(Exception e) {
			    e.printStackTrace();
			    System.out.println("连接数据库失败！");
			}
			
			Connection conn = DriverManager.getConnection(url,user,password);
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery("select top 1 * from Reader order by reader_no desc;");
			rs.next();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
			String d = df.format(new Date());
			String reader_no=null;
			if(rs.getString(1).contains(d)){
				int a = Integer.parseInt(rs.getString(1).substring(8))+1;
				String b = String.valueOf(a);
				int len = b.length();
				while (len < 3) {
					   StringBuffer sb = new StringBuffer();
			           sb.append("0").append(b);// 左补0
			           b = sb.toString();
			           len = b.length();
			     }
				System.out.print(b);
				reader_no=d+b;
			}
			else{
				reader_no = d+"001";
			}
			%>
			

<form action="<%=basePath%>addinfo.jsp" method="get">
	<br /><br />
 	<p>读者号：&nbsp;&nbsp;&nbsp;<input type="text" name="reader_no" readonly="readonly" style="font-size:16px;height:27px;background-color:#ececec;border: none;" value="<%=reader_no%>"></p>
 	<p>读者姓名：<input type="text" name="reader_name" style="font-size:16px;height:25px;"></p>
 	<p>电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="telephone" style="font-size:16px;height:25px;"></p>
 	<p>邮箱：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="email" style="font-size:16px;height:25px;"></p>
 	<input type="submit" onclick="updateInfo()" style="width:80px;height:40px; font-size: 17px;color:#ffffff;font-family:微软雅黑;background-color:#822727;border: none;outline: none;" value="提交" />
</form>	


</div>			
<div class="copyright">
<div class="wraper"  align="center">
<p><span>Copyright 2018 Construct&nbsp;&nbsp;|</span>&nbsp;&nbsp;版权所有:信息162许致立</p>
</div>
</div>
</div>

</body>

</html>