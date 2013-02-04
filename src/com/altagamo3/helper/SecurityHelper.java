package com.altagamo3.helper;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.altagamo3.to.Image;
import com.altagamo3.to.User;
import com.altagamo3.utils.DBConnection;

public class SecurityHelper {
	
	private static SecurityHelper secHelper;
	private SecurityHelper(){}
	public static SecurityHelper getInstance(){
		if(secHelper==null)
			secHelper = new SecurityHelper();
		return secHelper;
	}
	
	public int addUser(String username, String password, int roleID, String firstName, String lastName, String email, String mobile, String mobile2, String address, File photo, String photoContentType) throws FileNotFoundException{
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		int userID = 0;
		FileInputStream fis;
		try {
			pst = conn.prepareStatement("INSERT INTO users(username,password,firstname,lastname,mobile,mobile2,email," +
					"address,photo,photoContentType,role_id) VALUES(?,md5(?),?,?,?,?,?,?,?,?,?)");
			pst.setString(1, username);
			pst.setString(2, password);
			pst.setString(3, firstName);
			pst.setString(4, lastName);
			pst.setString(5, mobile);
			pst.setString(6, mobile2);
			pst.setString(7, email);
			if(address == null)
				pst.setNull(8, 2);
			else
				pst.setString(8, address);
			if(photo == null){
				pst.setNull(9, 2);
				pst.setNull(10, 2);
			}else{
				fis = new FileInputStream(photo);
				pst.setBlob(9, fis, (int)(photo.length()));
				pst.setString(10, photoContentType);
			}
			pst.setInt(11, roleID);
			pst.executeUpdate();
			// Get the newly generated property ID..
			String strSqlQuery = "SELECT LAST_INSERT_ID() FROM users;";
			pst = conn.prepareStatement(strSqlQuery);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				userID = rs.getInt(1);
			}
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
		return userID;
	}

	public int editUser(String username, String firstName, String lastName, String email, String mobile, String mobile2, String address, File photo, String photoContentType) throws FileNotFoundException{
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		int result = 0;
		FileInputStream fis;
		try {
			pst = conn.prepareStatement("UPDATE users " +
					"SET firstname=?, lastname=?, mobile=?, mobile2=?, email=?, address=?, photo=?, photoContentType=? " +
					"WHERE USERNAME=?");
			pst.setString(1, firstName);
			pst.setString(2, lastName);
			pst.setString(3, mobile);
			pst.setString(4, mobile2);	
			pst.setString(5, email);
			pst.setString(6, address);
			if(photo == null){
				pst.setNull(7, 2);
				pst.setNull(8, 2);
			}else{
				fis = new FileInputStream(photo);
				pst.setBlob(7, fis, (int)(photo.length()));
				pst.setString(8, photoContentType);
			}
			pst.setString(9, username);
			result = pst.executeUpdate();
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
		return result;
	}

	public boolean changePassword(String username, String oldPassword, String newPassword){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		boolean isChanged = false;
		try {
			pst = conn.prepareStatement("UPDATE users " +
					"SET password=md5(?) WHERE username=? AND password = md5(?)");
			pst.setString(1, newPassword);
			pst.setString(2, username);
			pst.setString(3, oldPassword);
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

	public boolean resetPassword(String username, String newPassword){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		boolean isChanged = false;
		try {
			pst = conn.prepareStatement("UPDATE users " +
					"SET password=md5(?) WHERE username=?");
			pst.setString(1, newPassword);
			pst.setString(2, username);
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

	public boolean isUserAuthenticated(String username, String password){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		boolean isUserAuthenticated = false;
		try {
			pst = conn.prepareStatement("select count(*) as users_count from users where username = ? and password = md5(?)");
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if(rs.next() && rs.getInt(1)>0){
				isUserAuthenticated = true;
			}else{
				isUserAuthenticated = false;//Invalid Username and/or password
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs !=null && !rs.isClosed())	rs.close();
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isUserAuthenticated;
	}

	public User getUser(String username){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		User u = null;
		try {
			pst = conn.prepareStatement("select * from users where username = ?");
			pst.setString(1, username);
			rs = pst.executeQuery();
			if(rs.next()){
				u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setFirstName(rs.getString("firstname"));
				u.setLastName(rs.getString("lastname"));
				u.setMobile(rs.getString("mobile"));
				u.setEmail(rs.getString("email"));
				u.setAddress(rs.getString("address"));
				u.setRoleID(rs.getInt("role_id"));
			}
			if(rs !=null)	rs.close();
			if(pst !=null)	pst.close();
			if(conn !=null)	conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs !=null && !rs.isClosed())	rs.close();
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return u;
	}

	/**
	 * get the user image from the database as byte[] with the content type
	 * @param username
	 * @return
	 */
	public Image getUserImage(String username){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		Image image = null;
		try {
			pst = conn.prepareStatement("select photo, photoContentType from users where username = ?");
			pst.setString(1, username);
			rs = pst.executeQuery();
			if(rs.next()){
				image = new Image();
				image.setContentType(rs.getString("photoContentType"));
				Blob blob = rs.getBlob("photo");
				if(blob!=null){
					image.setFileBytes(blob.getBytes(1, (int)blob.length()));
				}else{
					image.setFileBytes(null);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs !=null && !rs.isClosed())	rs.close();
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return image;
	}
	public ArrayList<User> listUsers(int roleID){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<User> ual = new ArrayList<User>();
		try {
			if(roleID==0)
				pst = conn.prepareStatement("select * from users");
			else{
				pst = conn.prepareStatement("select * from users where role_id = ?");
				pst.setInt(1, roleID);
			}
			rs = pst.executeQuery();
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setFirstName(rs.getString("firstname"));
				u.setLastName(rs.getString("lastname"));
				u.setMobile(rs.getString("mobile"));
				u.setEmail(rs.getString("email"));
				u.setAddress(rs.getString("address"));
				u.setRoleID(rs.getInt("role_id"));
				
				ual.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs !=null && !rs.isClosed())	rs.close();
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ual;
	}
	
	public ArrayList<User> listUsers(){
		return listUsers(0);
	}

	public User findById(List<User> usersList, int id) {
		for (User u : usersList) {
			if(u.getId()==id){
				return u;
			}
		}
		return null;
	}

	public List<User> findNotById(List<User> usersList, int id, int from, int to) {
		List<User> filteredUsersList = new ArrayList<User>(); 
		for (int i = from; i<= Math.min(usersList.size(), to); i++ ) {
			User u = usersList.get(i);
			if(u.getId()!=id){
				filteredUsersList.add(u);
			}
		}
		return filteredUsersList;
	}

	public List<User> findByRange(List<User> usersList, int from, int to) {
		List<User> filteredUsersList = new ArrayList<User>(); 
		for (int i = from; i<= Math.min(usersList.size(), to); i++ ) {
			User u = usersList.get(i);
			filteredUsersList.add(u);
		}
		return filteredUsersList;
	}

	public List<User> findLesserAsId(List<User> usersList, int id, int from, int to) {
		List<User> filteredUsersList = new ArrayList<User>(); 
		for (int i = from; i<= Math.min(usersList.size(), to); i++ ) {
			User u = usersList.get(i);
			if(u.getId()<id){
				filteredUsersList.add(u);
			}
		}
		return filteredUsersList;
	}

	public List<User> findGreaterAsId(List<User> usersList, int id, int from, int to) {
		List<User> filteredUsersList = new ArrayList<User>(); 
		for (int i = from; i<= Math.min(usersList.size(), to); i++ ) {
			User u = usersList.get(i);
			if(u.getId()>id){
				filteredUsersList.add(u);
			}
		}
		return filteredUsersList;
	}
//	public static void main(String[] args) {
//		System.out.println("result: "+findByRange(myCustomers, from, to).);
//	}
}
