<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="java.sql.*,java.io.*,java.lang.Math.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% String reader_no=request.getParameter("reader_no"); %>
<% String lib_no=request.getParameter("lib_no"); %>
<% String isbn=request.getParameter("isbn"); %>
<!DOCTYPE html>
<jsp:useBean id="reader" class="com.bms.Reader" scope="page"/>
<jsp:useBean id="admin" class="com.bms.Admin" scope="page"/>

<%
//获取请求url中的page参数
String start=request.getParameter("page");
if(start==null){
start="0";
}

ResultSet rst;
int result = admin.ACKreturn(reader_no, lib_no, isbn);
System.out.print(result);
//将string类型转为int类型
int initpage=Integer.parseInt(start);
//设定每页显示的记录数
int onepage=10;
/*获取数据库中的总记录数，并初始化总页数  */
rst=admin.getNotBackNum(reader_no);

rst.next();	            
int count=rst.getInt(1);	     
rst.close();


int flag = 1;
rst=reader.getReader(reader_no);
String name=null;
if(rst.next()){
	name = rst.getString(2);	     
	rst.close();
}
else{
	flag = 0;
}
  

int totlepage=0;//计算总页数
//totlepage=(count + onepage-1)/onepage;
totlepage=count/onepage+(count%onepage>0?1:0);
	//获取查询图书结果集合
	rst=admin.getNotBack(reader_no);
	
	int j;
	//计算前面页面的记录数，目的是获取当前页面的记录在rst中的位置
	int location=(initpage)*10;
	
	for(j=0;j<location;j++){
		rst.next();
	}
%>

<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>读者归还图书</title>
<style type="text/css">

a{
font-size:16px;
text-decoration:none;
font-family:微软雅黑;
color:#822727;
cursor: pointer;
}
/* copyright */
.copyright {border-top:1px solid #e7e6e6;margin-top:30px;}
.copyright p {font-size:14px;padding:20px 0;}
.nav{display:block;height:100px;width: 100px;background-color:#FFFFFF;line-height:100px;float:left;
		 text-align:center;text-decoration:none;font-size:18px;font-family:微软雅黑;color:#822727;}
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


</style>
</head>

<body style="margin:0;padding:0;background-color:#E0E0E0;">	
<div style="height:100px;width: 960px;margin:10px auto;background:url(title.png) 0 0 no-repeat;background-color:#FFFFFF;">
	<a href="index.jsp" class="nav" style="margin-left:580px;">回到登录页</a>
	<a href="admin.jsp" class="nav" style="margin-left:50px;">回到管理页</a>
</div>		  
<div id="content" style="width:960px;margin:10px auto;background-color:#FFFFFF;">
<div class="container">  
<div class="row">			  
<div class="col-xs-12">	
<br />
<span id="sen" style="font-size:18px;font-family:微软雅黑;color:#822727;">
&nbsp;&nbsp;&nbsp;读者<%if(name!=null){ %><%=name %>，未归还图书<%=count %>本。<%} %>
</span>
<br /><br />
 <table  align="center" cellspacing="0px" width="960px" class="altrowstable" id="alternatecolor">
 <tr height="20px"><th>书名</th><th>编号</th><th>作者</th><th>借书日期</th><th>操作</th></tr>				
<%
int i=0;
while(i<onepage&&rst.next()){ %>
<tr height="30">
<td><%=rst.getString(2) %></td>
<td><%=rst.getString(3) %></td>
<td><%=rst.getString(5) %></td>
<td align="center"><%=rst.getString(6) %></td>
<td align="center"><a href="<%=basePath%>ACKreturn.jsp?reader_no=<%=reader_no %>&lib_no=<%=rst.getString(3)%>%isbn=<%=rst.getString(8)%>">归还</a> </td>
</tr><% i++;} %>
</table>
</div>
<div align="center">
 	<br />
    <a><%=initpage+1 %>/<%=totlepage %></a>		
    <a href="<%=basePath%>record.jsp?reader_no=<%=reader_no %>&page=<%=0%>">首页 </a>
    <% if(initpage+1 > 1){%>
	<a href="<%=basePath%>record.jsp?reader_no=<%=reader_no %>&page=<%=initpage-1 %>">上一页</a><%} %>
	<% if(initpage+1< totlepage){%>
	<a href="<%=basePath%>record.jsp?reader_no=<%=reader_no %>&page=<%=initpage +1 %>">下一页</a><%} %>
	<a href="<%=basePath%>record.jsp?reader_no=<%=reader_no %>&page=<%=totlepage-1 %>">尾页</a>
</div>
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

if(<%=flag%>==0){
	alert("请输入正确的读者号，或该读者不存在。");
	window.history.back(-1); 
}
alert("归还成功！");
</script>
</body>
</html>
<%rst.close(); %>