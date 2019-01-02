package com.bms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.dbconnection.DBConnection;

public class Reader {	
	private String reader_no;  //读者号
	private String reader_name;  //读者号
	private String telephone;  
	private String email; 
	public String getReader_no() {
		return reader_no;
	}
	public void setReader_no(String rno) {
		this.reader_no = rno;
	}
	public String getSn() {
		return reader_name;
	}
	public void setReader_name(String rn) {
		this.reader_name = rn;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String tel) {
		this.telephone = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String e) {
		this.email = e;
	}
	
	public ResultSet getContact(String queryMethod,String queryContent){
		
		DBConnection bd= new DBConnection("reader","123456");
		Connection conn=bd.getConnection();
		Statement stmt=null;
		ResultSet rs=null;		
		try{
			stmt=conn.createStatement();
			String s = "select * from FindBook where "+queryMethod+" like  '%"+queryContent+"%'";
			rs= stmt.executeQuery(s);		
			return rs;			
		}catch(Exception e){
		}
		finally{
			
		//	bd.close(rs,stmt, conn);
		}
		
		return null;
	}
	
	
	public ResultSet getPage(String queryMethod,String queryContent){
		DBConnection bd= new DBConnection("reader","123456");
		Connection conn=bd.getConnection();
		Statement stmt=null;
		ResultSet rs=null;			
		try {
			 stmt=conn.createStatement();
			 String s = "select count(*) from FindBook where "+queryMethod+" like  '%"+queryContent+"%'";
			 rs=stmt.executeQuery(s);
			 return rs;
		} catch (Exception e) {	
		}finally{
		//	bd.close(rs, stmt, conn);
		}
		return null;
	}
	
	//借阅记录的总记录数
	public ResultSet getRecordPage(String reader_no){
		DBConnection bd= new DBConnection("reader","123456");
		Connection conn=bd.getConnection();
		Statement stmt=null;
		ResultSet rs=null;			
		try {
			 stmt=conn.createStatement();
			 String s = "select count(*) from ReadBook where reader_no = '"+reader_no+"'";
			 rs=stmt.executeQuery(s);
			 return rs;
		} catch (Exception e) {	
		}finally{
		//	bd.close(rs, stmt, conn);
		}
		return null;
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
	
	//获取借阅记录
	public ResultSet getRecord(String reader_no){
		DBConnection bd= new DBConnection("reader","123456");
		Connection conn=bd.getConnection();
		Statement stmt=null;
		ResultSet rs=null;			
		try {
				stmt=conn.createStatement();
				String s = "exec sp_readbook '"+reader_no+"'";
				rs=stmt.executeQuery(s);
				return rs;
		} catch (Exception e) {	
		}finally{
			//	bd.close(rs, stmt, conn);
		}
		return null;
	}

	//更新读者信息
	public int updateinfo(Reader r) {
		DBConnection bd= new DBConnection("reader","123456");
		Connection conn=bd.getConnection();
		Statement stmt=null;
		ResultSet rs=null;		
		try{		    	    
			PreparedStatement pstmt = conn.prepareStatement("update Reader set reader_name=?,telephone=?,email=? where reader_no=?");
			pstmt.setString(1, r.reader_name);
			pstmt.setString(2, r.telephone);
			pstmt.setString(3, r.email);
			pstmt.setString(4, r.reader_no);
			int flag=pstmt.executeUpdate();
			return flag;
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return 0;
	}
}

