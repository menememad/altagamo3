package com.altagamo3.web.actions;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;


public class BaseAction extends ActionSupport implements ServletRequestAware,SessionAware,ServletContextAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected HttpServletRequest request;
	protected Map<String, Object> session;
	protected ServletContext context; 	
	
	 public BaseAction()
	 {
		// PropertyConfigurator.configure("c:\\log4j.properties");

		 
	 }
	
	 
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;		
	}

	public void setSession(Map<String, Object> arg0) {
		session = arg0;
		
	}
	
	public void setServletContext(ServletContext context) {
		this.context = context;
	}
	
	
	
	
}
