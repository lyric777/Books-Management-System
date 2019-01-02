package com.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	 // 连接驱动  
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";  
    // 连接路径  
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=BMS";  
    // 用户名
    private String USERNAME;  
    // 密码  
    private String PASSWORD;    
    public DBConnection(String username,String pw){
    	USERNAME = username;
    	PASSWORD = pw;
    }
    //静态代码 
    static {  
        try {  
            // 加载驱动  
            Class.forName(DRIVER);  
        } catch (ClassNotFoundException e) {  
            e.printStackTrace();  
        }  
    }    
    /* 
     * 获取数据库连接
     */  
    public Connection getConnection() {  
        Connection conn = null;  
        System.out.println("连接数据库成功");  
        try{  
            conn=DriverManager.getConnection(URL, USERNAME, PASSWORD);  
        }catch(SQLException e){  
            e.printStackTrace();  
            System.out.println("数据库连接失败！");  
        }  
        System.out.println("");  
        return conn;  
    }    
    /* 
     * 关闭数据库连接，注意关闭的顺序
     */  
    public void close(ResultSet rs,Statement stat, Connection conn) {  
       if(rs!=null){  
            try{  
                rs.close();  
                rs=null;  
            }catch(SQLException e){  
                e.printStackTrace();  
                System.out.println("关闭ResultSet失败");  
            }  
        }  
        if(stat!=null){  
            try{  
            	stat.close();  
            	stat=null;  
            }catch(SQLException e){  
                e.printStackTrace();  
                System.out.println("关闭PreparedStatement失败");  
            }  
        }  
        if(conn!=null){  
            try{  
                conn.close();  
                conn=null;  
            }catch(SQLException e){  
                e.printStackTrace();  
                System.out.println("关闭Connection失败");  
            }  
        }  
    }  
}
