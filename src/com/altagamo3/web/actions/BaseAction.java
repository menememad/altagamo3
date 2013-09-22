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
	protected static final String USER_SESSION_VAR = "userInfo"; 
	protected static final String IMAGE_PATH = "IMAGE_PATH"; 
	 public BaseAction()
	 {
			// Get current size of heap in bytes
			long heapSize = Runtime.getRuntime().totalMemory(); 
			// Get maximum size of heap in bytes. The heap cannot grow beyond this size.// Any attempt will result in an OutOfMemoryException.
			long heapMaxSize = Runtime.getRuntime().maxMemory();
			 // Get amount of free memory within the heap in bytes. This size will increase // after garbage collection and decrease as new objects are created.
			long heapFreeSize = Runtime.getRuntime().freeMemory();		
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
