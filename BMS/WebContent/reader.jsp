<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书信息管理系统--读者版</title>
<style>
	.nav{display:block;height:100px;width: 100px;background-color:#FFFFFF;line-height:100px;float:left;
		 text-align:center;text-decoration:none;font-size:18px;font-family:微软雅黑;color:#822727;}
</style>
</head>
<body style="margin:0;padding:0;background-color:#E0E0E0;">
<div style="height:100px;width: 960px;margin:10px auto;background:url(title.png) 0 0 no-repeat;background-color:#FFFFFF;">
	<a href="index.jsp" class="nav" style="margin-left:560px;">回到首页</a>
	<a href="#list" class="nav">馆藏图书</a>
	<a href="#record" class="nav" style="width: 140px;">借阅记录</a>
</div>
<div id="content" style="height:500px;width:960px;margin:10px auto;background-color:#FFFFFF;">
</div>

<!--数据库连接-->
<%

//PreparedStatement ps = null;
//Connection ct = null;
//ResultSet rs = null;


Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  //使用SQL Server的JDBC驱动程序
String url="jdbc:sqlserver://localhost:1433;DatabaseName=CRM";

String user="sa";
String password="7878966";
Connection conn=DriverManager.getConnection(url,user,password);

/*try {
    //1.加载驱动
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    System.out.println("加载驱动成功！");
}catch(Exception e) {
    e.printStackTrace();
    System.out.println("加载驱动失败！");
}
try {  
    //2.连接
    ct=DriverManager.getConnection( url,user,password);
    System.out.println("连接数据库成功！");
}catch(Exception e) {
    e.printStackTrace();
    System.out.println("连接数据库失败！");
}*/



//out.println("select * from Member"+"<br>"); 
/*尝试查询数据库*/
/*try{
	Statement stmt = ct.createStatement();
	String sql = "select * from Member";
	// 执行数据库查询语句
    rs = stmt.executeQuery(sql);
    while (rs.next()) {
        String id = rs.getString("eno");
        String name = rs.getString("ename");
        String age = rs.getString("sex");
        
        out.println("eno:" + id +"\t"+ "ename:" + name +"\t"+"sex:" + age+"<br>");
    }
    if (rs != null) {
        rs.close();
        rs = null;
    }
    if (stmt != null) {
        stmt.close();
        stmt = null;
    }
    if (ct != null) {
        ct.close();
        ct = null;
    }
}
catch (SQLException e) {
    e.printStackTrace();
    System.out.println("数据库连接失败");
}*/

out.println(conn.toString());

Statement stmt = conn.createStatement();
ResultSet rs=stmt.executeQuery("select * from Member");%>
<%= rs %>

<table bgcolor="#ffffdd"border="1"width="300px">
<% while(rs.next()){ %>
    <tr>
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
    </tr>
<%}%>

 
</table>
</body>
</html>