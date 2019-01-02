<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书信息管理系统--管理员版</title>
<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style>
	.nav{display:block;height:100px;width: 70px;background-color:#FFFFFF;line-height:100px;float:left;
		 text-align:center;text-decoration:none;font-size:17px;font-family:微软雅黑;color:#822727;}
	#query-book{height:200px;width: 760px;margin-left:10px;}
	select {
	   width:60px;
	   height:36px;
	   font-size: 15px;
	   padding: 2px;
	   vertical-align: middle;
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
          width: 240px;
          height: 36px;
          padding-left: 13px;
       }

        button {
            height: 38px;
            width: 45px;
            cursor: pointer;
        }
        
        

		
		.copyright {border-top:1px solid #e7e6e6;margin-top:30px;}
		.copyright p {font-size:14px;padding:20px 0;}
</style>
</head>
<body style="margin:0;padding:0;background-color:#E0E0E0;">
<div style="height:100px;width: 960px;margin:10px auto;background:url(title.png) 0 0 no-repeat;background-color:#FFFFFF;">
	<a href="index.jsp" class="nav" style="margin-left:520px;">首页</a>
	<a href="#borrow" class="nav">借书业务</a>
	<a href="#return" class="nav" style="margin-left:20px;">还书业务</a>
	<a href="#newbook" class="nav" style="margin-left:20px;">新书入库</a>
	<a href="#reader" class="nav" style="margin-left:20px;">读者管理</a>
</div>
<div id="content" style="width:960px;margin:10px auto;background-color:#FFFFFF;">
	
	<div style="width:960px;margin: 10px auto;">		
		<a name="borrow"></a>
		<img src="borrow_icon.jpg" style="height:30px;width: 154px;" />
		<div id="query-book">
			<div class="search bar3">
			<form action="borrow.jsp" method="get">
			<p>输入要借书的读者编号：
			<input type="text" name="reader_no" placeholder="请输入读者号..." style="background: #A3D0C3;width: 288px;"></p>
			<div>
			<p>选择图书：&nbsp;&nbsp;&nbsp;
				<select name="queryMethod">
				  <option value ="book_name">书名</option>
				  <option value="author">作者</option>
				  <option value ="class_name">类别</option>
				  <option value="ISBN">ISBN</option>
				</select>
			    &nbsp;&nbsp;
	            <input type="text" name="queryContent" placeholder="请输入图书信息..." style="background: #E0E0E0;">
	            <button type="submit" style="background: #BFBFBF;"></button>
	            
	        </p>
	        </div>
			</form>
			</div>
			
			
		</div>
	</div>

	<div>
		<a name="return"></a>
		<img alt="" src="return_icon.jpg" style="margin-top:0px;" />&nbsp;&nbsp;&nbsp;
			<div class="search bar3">
			<form action="return.jsp" method="get">
				<div style="width:700px;margin-left:10px;">
				输入要还书的读者编号：
	            <input type="text" name="reader_no" placeholder="请输入您的读者号..." style="background: #A3D0C3;width:240px;">
	            <button type="submit" style="background: #A3D0C3;"></button>
	            </div>
			</form>
			</div>
		</div>
	<br />
	<div>
		<a name="newbook"></a>
		<img alt="" src="newbook_icon.jpg" style="margin-top:0px;" />
		<br /><br />
		<div style="margin-left:180px;">
			<form action="totallynew.jsp" method="get" style="float:left;">
				<button type="submit" style="height:50px;background: #A3D0C3;width:100px;font-size:17px;color:#822727;">全新入库</button>
			</form>
			<div style="margin-left:180px;">
			<form action="newbook.jsp" method="get" style="margin-left:50px;">
				<button type="submit" style="height:50px;background: #A3D0C3;width:100px;font-size:17px;color:#822727;">库存补充</button>
			</form>		
			</div>
		</div>
		<br />
		
	</div>
	<div>
		<a name="reader"></a>
		<img alt="" src="reader_icon.jpg" style="margin-top:0px;" />
		<br /><br />
		<div style="margin-left:180px;">
			<form action="add.jsp" method="get" style="float:left;">
				<button type="submit" style="height:50px;background: #A3D0C3;width:100px;font-size:17px;color:#822727;">添加读者</button>
			</form>
			<div style="margin-left:180px;">
			<form action="delete.jsp" method="get" style="margin-left:50px;">
				<button type="submit" style="height:50px;background: #A3D0C3;width:100px;font-size:17px;color:#822727;">删除读者</button>
			</form>		
			</div>
		</div>
		<br />
		
	</div>
	<div class="copyright">
<div class="wraper"  align="center">
<p><span>Copyright 2018 Construct&nbsp;&nbsp;|</span>&nbsp;&nbsp;版权所有:信息162许致立</p>
</div>
</div>
</div>

</body>
</html>