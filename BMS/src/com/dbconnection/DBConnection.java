package com.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	 // ��������  
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";  
    // ����·��  
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=BMS";  
    // �û���
    private String USERNAME;  
    // ����  
    private String PASSWORD;    
    public DBConnection(String username,String pw){
    	USERNAME = username;
    	PASSWORD = pw;
    }
    //��̬���� 
    static {  
        try {  
            // ��������  
            Class.forName(DRIVER);  
        } catch (ClassNotFoundException e) {  
            e.printStackTrace();  
        }  
    }    
    /* 
     * ��ȡ���ݿ�����
     */  
    public Connection getConnection() {  
        Connection conn = null;  
        System.out.println("�������ݿ�ɹ�");  
        try{  
            conn=DriverManager.getConnection(URL, USERNAME, PASSWORD);  
        }catch(SQLException e){  
            e.printStackTrace();  
            System.out.println("���ݿ�����ʧ�ܣ�");  
        }  
        System.out.println("");  
        return conn;  
    }    
    /* 
     * �ر����ݿ����ӣ�ע��رյ�˳��
     */  
    public void close(ResultSet rs,Statement stat, Connection conn) {  
       if(rs!=null){  
            try{  
                rs.close();  
                rs=null;  
            }catch(SQLException e){  
                e.printStackTrace();  
                System.out.println("�ر�ResultSetʧ��");  
            }  
        }  
        if(stat!=null){  
            try{  
            	stat.close();  
            	stat=null;  
            }catch(SQLException e){  
                e.printStackTrace();  
                System.out.println("�ر�PreparedStatementʧ��");  
            }  
        }  
        if(conn!=null){  
            try{  
                conn.close();  
                conn=null;  
            }catch(SQLException e){  
                e.printStackTrace();  
                System.out.println("�ر�Connectionʧ��");  
            }  
        }  
    }  
}
