package com.bms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dbconnection.DBConnection;

public class Admin {
	private String ISBN;  
	private String book_name;  
	private String class_no;  
	private String class_name; 
	private String press; 
	private String author;
	private String lib_no; 
	private String storage_time;
	private int status; 
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String i) {
		this.ISBN = i;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String n) {
		this.book_name = n;
	}
	public String getClass_no() {
		return class_no;
	}
	public void setClass_no(String n) {
		this.class_no = n;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String n) {
		this.class_name = n;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String e) {
		this.press = e;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String e) {
		this.author = e;
	}
	public String getLib_no() {
		return lib_no;
	}
	public void setLib_no(String e) {
		this.lib_no = e;
	}
	public String getStorage_time() {
		return storage_time;
	}
	public void setStorage_time(String e) {
		this.storage_time = e;
	}
	public int getStatus() {
		return status;
	}
	public void setSatus(int e) {
		this.status = e;
	}
	
	public int ACKreturn(String reader_no,String lib_no, String ISBN){
		
		DBConnection bd= new DBConnection("sa","7878966");
		Connection conn=bd.getConnection();
		Statement stmt=null;
		ResultSet rs=null;		
		try{
			stmt=conn.createStatement();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String d = df.format(new Date());
			System.out.println(d);
			String s = "update ReadBook set end_time = '"+d+"' where reader_no = '"+reader_no+"' and lib_no = '"+lib_no+"';"
					+ "update Inventory set status = 1 where lib_no = '"+lib_no+"';";
			System.out.println(s);
			int flag= stmt.executeUpdate(s);		
			return flag;			
		}catch(Exception e){
		}
		finally{
			
		//	bd.close(rs,stmt, conn);
		}
		
		return 0;
	}
	
	
	
	
	//获取读者信息
	public ResultSet getReader(String reader_no){
		DBConnection bd= new DBConnection("reader","123456");
		Connection conn=bd.getConnection();
		Statement stmt=null;
		ResultSet rs=null;			
		try {
			 stmt=conn.createStatement();
			 String s = "select * from Reader where reader_no = '"+reader_no+"'";
			 //System.out.print(s);
			 rs=stmt.executeQuery(s);
			 //System.out.print(rs);
			 return rs;
		} catch (Exception e) {	
		}finally{
		//	bd.close(rs, stmt, conn);
		}
		return null;
	}
	//获取未还图书
	public ResultSet getNotBack(String reader_no){
		DBConnection bd= new DBConnection("sa","7878966");
		Connection conn=bd.getConnection();
		Statement stmt=null;
		ResultSet rs=null;			
		try {
				stmt=conn.createStatement();
				String s = "exec sp_return '"+reader_no+"'";
				rs=stmt.executeQuery(s);
				return rs;
		} catch (Exception e) {	
		}finally{
			//	bd.close(rs, stmt, conn);
		}
		return null;
	}
	
	//获取未还图书数量
	public ResultSet getNotBackNum(String reader_no){
		DBConnection bd= new DBConnection("sa","7878966");
		Connection conn=bd.getConnection();
		Statement stmt=null;
		ResultSet rs=null;			
		try {
				stmt=conn.createStatement();
				String s = "select count(*) from ReadBook where reader_no = '"+reader_no+"' and end_time is null";
				rs=stmt.executeQuery(s);
				return rs;
		} catch (Exception e) {	
		}finally{
			//	bd.close(rs, stmt, conn);
		}
		return null;
	}

	public int addInfo(String r,String rn,String t,String e) 
	{  	
		DBConnection bd= new DBConnection("sa","7878966");
		Connection conn=bd.getConnection();
		Statement stmt=null;
		ResultSet rs=null;		
		try{
				PreparedStatement pstmt = conn.prepareStatement("insert into Reader values(?,?,?,?)");
				pstmt.setString(1, r);
				pstmt.setString(2, rn);
				pstmt.setString(3, t);
				pstmt.setString(4, e);
				int flag=pstmt.executeUpdate();
				return flag;
			} catch(Exception ee){
	            ee.printStackTrace();	
			}
		  return 0;
	   }
	
	//删除记录
	public int deleteInfo(String rno) {
		DBConnection bd= new DBConnection("sa","7878966");
		Connection conn=bd.getConnection();
		Statement stmt=null;
		ResultSet rs=null;		
		try{			
			String s= "delete from ReadBook where reader_no = '"+rno+"';"
					+"delete from Reader where reader_no = '"+rno+"'";
			PreparedStatement pstmt = conn.prepareStatement(s);
			//System.out.println(s);
			int flag=pstmt.executeUpdate();
			return flag;
		} catch(Exception e){
		}
		return 0;
	}
	public int borrow(String rn,String ln) {
		DBConnection bd= new DBConnection("sa","7878966");
		Connection conn=bd.getConnection();
		Statement stmt=null;
		ResultSet rs=null;			
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String d = df.format(new Date());
		try {
			PreparedStatement pstmt = conn.prepareStatement("insert into Reader values(?,?,?,?)");
			pstmt.setString(1, rn);
			pstmt.setString(2, ln);
			pstmt.setString(3, d);
			pstmt.setString(4, null);
			int flag=pstmt.executeUpdate();
			return flag;
		} catch (Exception e) {	
		}finally{
			bd.close(rs, stmt, conn);
		}
		return 0;
	}


}

