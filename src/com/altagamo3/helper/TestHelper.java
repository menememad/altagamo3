package com.altagamo3.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TestHelper {
	static Connection conn = null;

	public static Connection getConnection(){
		String url = "jdbc:mysql://localhost:3306/allamco1_altagamo3";
		String user = "root";
		String pw = "password";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection( url, user, pw );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static boolean changeAllPasswords(){
		
		PreparedStatement pst = null;
		boolean isChanged = false;
		try {
			conn = getConnection();
			pst = conn.prepareStatement("UPDATE users SET password=md5('password')");
			int result = pst.executeUpdate();
			if(result==1)	isChanged = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isChanged;
	}

	public static void main(String[] args) {
		changeAllPasswords();
	}
}
