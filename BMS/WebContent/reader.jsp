<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书信息管理系统--读者版</title>
<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style>
	.nav{display:block;height:100px;width: 70px;background-color:#FFFFFF;line-height:100px;float:left;
		 text-align:center;text-decoration:none;font-size:17px;font-family:微软雅黑;color:#822727;}
	#query-book{height:400px;width: 360px;margin-left:540px;margin-top:-417px;}
	select {
	   width:160px;
	   height:36px;
	   font-size: 15px;
	   padding: 2px;
	 
 	}
    
    .bar3 input, .bar3 button {
        background: transparent;
     }
     .bar3 button {
        top: 0;
        right: 0;
     }
     .bar3 button:before {
        content: "\f002";
        font-family: FontAwesome;
        font-size: 16px;
        color: #F9F0DA;
     }
        
     div.search {padding: 30px 0;}


      input, button {
         border: none;
         outline: none;
         vertical-align: middle;
      }

      input {
          width: 60%;
          height: 42px;
          padding-left: 13px;
       }

        button {
            height: 44px;
            width: 45px;
            cursor: pointer;
        }
        
        
        table.altrowstable {
		font-family: verdana,arial,sans-serif;
		font-size:14px;
		color:#333333;
		border-width: 1px;
		border-color: #a9c6c9;
		border-collapse: collapse;
		}
		table.altrowstable th {
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #a9c6c9;
		}
		table.altrowstable td {
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #a9c6c9;
		}
		.oddrowcolor{
		background-color:#E0E0E0;
		}
		.evenrowcolor{
		background-color:#ffffff;
		}
		
		.copyright {border-top:1px solid #e7e6e6;margin-top:30px;}
		.copyright p {font-size:14px;padding:20px 0;}
</style>
</head>
<body style="margin:0;padding:0;background-color:#E0E0E0;">
<div style="height:100px;width: 960px;margin:10px auto;background:url(title.png) 0 0 no-repeat;background-color:#FFFFFF;">
	<a href="index.jsp" class="nav" style="margin-left:520px;">首页</a>
	<a href="#search" class="nav">查询图书</a>
	<a href="#list" class="nav" style="margin-left:20px;">馆藏图书</a>
	<a href="#record" class="nav" style="margin-left:20px;">借阅记录</a>
	<a href="#info" class="nav" style="margin-left:20px;">修改信息</a>
</div>
<div id="content" style="width:960px;margin:10px auto;background-color:#FFFFFF;">
	
	<div style="width:960px;margin: 10px auto;">
		<img src="pic.jpg" style="margin:40px 40px;" />
		
		<div id="query-book">
			<a name="search"></a>
			<img src="search_icon.jpg" style="height:30px;width: 154px;" />
			<br /><br /><br /><br /><br />
			<div class="search bar3">
			<form action="find_book.jsp" method="get">
			选择搜索方式：
				<select name="queryMethod">
				  <option value ="book_name">书名</option>
				  <option value="author">作者</option>
				  <option value ="class_name">类别</option>
				  <option value="ISBN">ISBN</option>
				</select>
				<br />
				<br />
				<div>
			    <!-- <input type="text" name="queryContent" style="height:20px;font-size:15px;" /> -->
	            <input type="text" name="queryContent" placeholder="请输入您要搜索的内容..." style="background: #E0E0E0;">
	            <button type="submit" style="background: #BFBFBF;"></button>
	            </div>
			</form>
			</div>
			
			
		</div>
	</div>

	<div>
		<a name="list"></a>
		<img alt="" src="list_icon.jpg" style="margin-top:0px;" />&nbsp;&nbsp;&nbsp;
		<span style="font-size:16px;font-style: italic;color:#BFBFBF">展示前5本</span>
		<br /><br />
		<div>
			<!--数据库连接-->
			<%
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  //使用SQL Server的JDBC驱动程序
			String url="jdbc:sqlserver://localhost:1433;DatabaseName=BMS";
			
			String user="reader";
			String password="123456";
			
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
			ResultSet rs=stmt.executeQuery("select top 5 * from FindBook");%>
			
			<table class="altrowstable" id="alternatecolor" width="960px">
				<tr>
				<th>书名</th><th>作者</th><th>类别</th><th>馆藏数量</th>
				</tr>
				<% while(rs.next()){ %>
			    <tr>
			        <td><%=rs.getString(1)%></td>
			        <td><%=rs.getString(5)%></td>
			        <td><%=rs.getString(3)%></td>
			        <td align="center"><%=rs.getString(6)%></td>
			    </tr>
			<%}%> 
			</table>
		</div>
	</div>
	<br />
	<div>
		<a name="record"></a>
		<img alt="" src="record_icon.jpg" style="margin-top:0px;" />
		<br />
		<div class="search bar3">
			<form action="record.jsp" method="get">
				<div style="width:700px;margin-left:0;">
	            <input type="text" name="reader_no" placeholder="请输入您的读者号..." style="background: #A3D0C3;width:40%;">
	            <button type="submit" style="background: #A3D0C3;"></button>
	           	<span style="font-size:16px;font-style: italic;color:#BFBFBF">如20181101001，来查询您的借阅记录</span>
	            </div>
			</form>
		</div>
	</div>
	<div>
		<a name="info"></a>
		<img alt="" src="info_icon.jpg" style="margin-top:0px;" />
		<br />
		<div class="search bar3">
			<form action="info.jsp" method="get">
				<div style="width:700px;margin-left:0;">
	            <input type="text" name="reader_no" placeholder="请输入您的读者号..." style="background: #A3D0C3;width:40%;">
	            <button type="submit" style="background: #A3D0C3;"></button>
	           	<span style="font-size:16px;font-style: italic;color:#BFBFBF">如20181101001，来修改您的个人信息</span>
	            </div>
			</form>
		</div>
	</div>
	<div class="copyright">
<div class="wraper"  align="center">
<p><span>Copyright 2018 Construct&nbsp;&nbsp;|</span>&nbsp;&nbsp;版权所有:信息162许致立</p>
</div>
</div>
</div>
<script type="text/javascript">
function altRows(id){
	if(document.getElementsByTagName){  
		var table = document.getElementById(id);  
		var rows = table.getElementsByTagName("tr"); 
	 
		for(i = 0; i < rows.length; i++){          
			if(i % 2 == 0){
			rows[i].className = "evenrowcolor";
			}else{
			rows[i].className = "oddrowcolor";
			}      
		}
	}
}

window.onload=function(){
	altRows('alternatecolor');
}
</script>
</body>
</html>