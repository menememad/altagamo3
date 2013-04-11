package com.altagamo3.web.actions;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.altagamo3.helper.SecurityHelper;
import com.altagamo3.to.User;
import com.altagamo3.utils.Constants;
import com.altagamo3.utils.Utils;
//import com.googlecode.scopeplugin.ScopeType;
//import com.googlecode.scopeplugin.annotations.In;
//import com.googlecode.scopeplugin.annotations.Out;
import com.opensymphony.xwork2.ActionSupport;

public class SecurityAction extends ActionSupport implements ServletRequestAware, SessionAware{

	private static final long serialVersionUID = 3404259753512079371L;

	private HttpServletRequest servletRequest; 
	private Map<String, Object> session;
	
	private static String VISITOR = "visitor";
	private static String SELLER = "seller";
	private static String ADMIN = "admin";
	

	private String username;
	private String password;
	private String newPassword;
	private String confirmPassword;
		
	private String savedUserName;
	private String savedPassword;
	private boolean remember;
	private boolean forget;

	public String welcome(){
		User currentUser = (User)servletRequest.getSession().getAttribute("userInfo");
		String param = servletRequest.getParameter("src");
		if(currentUser==null || (param!=null && param.length()>0))
			return SUCCESS;
		else
			if(currentUser.getRoleID()==Constants.ROLE_ADMIN)
				return ADMIN;
			else if(currentUser.getRoleID()==Constants.ROLE_SELLER)
				return SELLER;
			else if(currentUser.getRoleID()==Constants.ROLE_VISITOR)
				return VISITOR;
			else
				return SUCCESS;
	}
	
	public String preLogin(){
		return SUCCESS;
	}
	
	public String login(){
        if (username == null) {
            username = savedUserName;
         }

         if (password == null) {
            password= savedPassword;
         }
         // Perform login logic...
         if (remember) {
            savedUserName = username;
            savedPassword = password;
         } else if (forget) {
            savedUserName = "";
            savedPassword = "";
         }
		if("".equals(getUsername())){
			addFieldError("username", getText("err.required",new String[]{getText("global.username")}));
			return INPUT;
		}
		if("".equals(getPassword())){
			addFieldError("password", getText("err.required",new String[]{getText("global.password")}));
			return INPUT;
		}
		SecurityHelper secHelp = SecurityHelper.getInstance();
		boolean isUserAuthenticated = secHelp.isUserAuthenticated(username, password);
		System.out.println("User "+username+" authenticated? "+isUserAuthenticated);
		System.out.println("User "+savedUserName+" authenticated? "+isUserAuthenticated);
		if(!isUserAuthenticated){
			addFieldError("password", getText("err.invalid.credintials"));
			return INPUT;
		}else{
			User u = secHelp.getUser(username);
			session.put("userInfo", u);
			if(u.getRoleID()==1)//Administrator
				return ADMIN;
			else if(u.getRoleID()==2)//Seller
				return SELLER;
			else if(u.getRoleID()==3)//Visitor
				return VISITOR;
		}
		return INPUT;
	}

	public String logout(){
		System.out.println("Logging out user");
		servletRequest.getSession().removeAttribute("userInfo");
		servletRequest.getSession().invalidate();
		System.out.println("User logged out successfully");
		return SUCCESS;
	}
	
	public String changePassword(){
		SecurityHelper secHelp = SecurityHelper.getInstance();
		try {
			String username = ((User)servletRequest.getSession().getAttribute("userInfo")).getUsername();
			User currentUser = secHelp.getUser(username);
			setUsername(currentUser.getUsername());
			boolean isChanged = secHelp.changePassword(username, password,newPassword);
			System.out.println("Result: "+isChanged);
			if(isChanged){
				Utils.sendInternalMail(currentUser.getEmail(), getText("mail.passwordChanged.subject"), getText("mail.passwordChanged.body"));
				return SUCCESS;
			}else
				return INPUT;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return INPUT;
		}
	}
	public String generateKey(){
		SecurityHelper secHelp = SecurityHelper.getInstance();
		User currentUser = secHelp.getUser(username);
		String key = Utils.generatePassword(8);
		servletRequest.getSession().setAttribute("genkey", key);
		try {
			Utils.sendInternalMail(currentUser.getEmail(), getText("mail.tempkey.subject"), getText("mail.tempkey.body",new String[]{key}));
			return NONE;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return ERROR;
		}
	}
	public String resetPassword(){
		System.out.println("Reset password for user: "+username);
		SecurityHelper secHelp = SecurityHelper.getInstance();
		User currentUser = secHelp.getUser(username);
		String password = Utils.generatePassword(8);
		boolean isReset = secHelp.resetPassword(currentUser.getUsername(), password);
		if(isReset){
			try {
				Utils.sendInternalMail(currentUser.getEmail(), getText("mail.passwordReset.subject"), getText("mail.passwordReset.body",new String[]{password}));
				return SUCCESS;
			} catch (Exception e) {
				e.printStackTrace();
				addActionError(e.getMessage());
				return ERROR;
			}
		}else
			return ERROR;
	}
	
	public void setSession(Map<String, Object> session) {
		this.session = session;
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

	//@In(scope=ScopeType.COOKIE)
	public void setSavedUserName(String savedUserName) {
		this.savedUserName = savedUserName;
	}

	//@In(scope=ScopeType.COOKIE)
	public void setSavedPassword(String savedPassword) {
		this.savedPassword = savedPassword;
	}

	//@Out(scope=ScopeType.COOKIE)
	public String getSavedUserName() {
		return this.savedUserName;
	}

	//@Out(scope=ScopeType.COOKIE)
	public String getSavedPassword() {
		return this.savedPassword;
	}
	public void setRemember(boolean remember) {
		this.remember = remember;
	}

	public void setForget(boolean forget) {
		this.forget = forget;
	}

	@Override
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}
}