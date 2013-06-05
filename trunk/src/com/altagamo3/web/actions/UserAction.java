package com.altagamo3.web.actions;

import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.altagamo3.helper.SecurityHelper;
import com.altagamo3.to.User;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = 6409740570183572695L;
	
	private HttpServletRequest servletRequest; 
	
	private String username;
	private String password;
	private String newPassword;
	private String confirmPassword;
	private int roleID;
	private String firstname;
	private String lastname;
	private String mobile;
	private String mobile2;
	private String email;
	private String address;
	private File photo;
	private String photoContentType;
	private String photoFileName;
	
	private List<User> usersList;

	
	public String preLogin(){
		System.out.println("in preLogin() method");
		return SUCCESS;
	}
	public String preAddUser(){
		System.out.println("in preAddUser() method");
		return SUCCESS;
	}
	
	public String addUser(){
		if("".equals(getUsername())){
			addFieldError("username", getText("err.required",new String[]{getText("global.username")}));
			return INPUT;
		}
		if("".equals(getPassword())){
			addFieldError("password", getText("err.required",new String[]{getText("global.password")}));
			return INPUT;
		}
		SecurityHelper secHelp = SecurityHelper.getInstance();
		int userID = -1;
		try {
			userID = secHelp.addUser(username, newPassword,roleID,firstname,lastname,email,mobile,mobile2,address,photo,photoContentType);
			System.out.println("user: "+username+", password: "+newPassword);
			if(userID>0){
				addActionMessage(getText("msg.add.user",new String[]{""+userID}));
				return SUCCESS;
			}else
				return ERROR;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return INPUT;
		}
	}

	public String preEditUser(){
		System.out.println("in preEditUser() method");
		SecurityHelper secHelp = SecurityHelper.getInstance();
		try {
			String username = ((User)servletRequest.getSession().getAttribute("userInfo")).getUsername();
			User currentUser = secHelp.getUser(username);
			setUsername(currentUser.getUsername());
			setFirstname(currentUser.getFirstName());
			setLastname(currentUser.getLastName());
			setEmail(currentUser.getEmail());
			setMobile(currentUser.getMobile());
			setAddress(currentUser.getAddress());
			String filePath = servletRequest.getServletContext().getInitParameter(BaseAction.IMAGE_PATH)+"/user_img/";
			setPhotoFileName(filePath+getUsername()+".jpg");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return INPUT;
		}
	}
	
	public String editUser(){
		SecurityHelper secHelp = SecurityHelper.getInstance();
		int userID = -1;
		try {
			String filePath = servletRequest.getSession().getServletContext().getRealPath("/");
			System.out.println("Server path:" + filePath);
//			File fileToCreate = new File(filePath, this.photoFileName);               
//			FileUtils.copyFile(this.photo, fileToCreate); 
			userID = secHelp.editUser(username, firstname,lastname,email,mobile,mobile2,address,photo,photoContentType);
			System.out.println("user: "+username+", password: "+password);
			if(userID>0){
				addActionMessage(getText("msg.edit.user",new String[]{""+userID}));
				return SUCCESS;
			}else
				return INPUT;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return INPUT;
		}
	}
	public String preListUsers(){
		return SUCCESS;
	}
	public String listUsers(){
		SecurityHelper secHelp = SecurityHelper.getInstance();
		try {
			setUsersList(secHelp.listUsers());
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return INPUT;
		}
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public int getRoleID() {
		return roleID;
	}
	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public File getPhoto() {
		return photo;
	}
	public void setPhoto(File photo) {
		this.photo = photo;
	}
	public String getPhotoContentType() {
		return photoContentType;
	}
	public void setPhotoContentType(String photoContentType) {
		this.photoContentType = photoContentType;
	}
	public String getPhotoFileName() {
		return photoFileName;
	}
	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}
	public void setUsersList(List<User> usersList) {
		this.usersList = usersList;
	}
	public List<User> getUsersList() {
		return usersList;
	}
	public String getMobile2() {
		return mobile2;
	}
	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}
}