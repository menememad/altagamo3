package com.altagamo3.utils;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class DBConnection {
	
	public Connection getConnection(){
		Connection conn = null;
		try{
			Context envCtx = (Context) new InitialContext().lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/altagamo3"); 
			conn = ds.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}  
}
