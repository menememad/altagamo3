package com.altagamo3.web.servlets;

import java.util.Map;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.altagamo3.helper.PropertyHelper;

/**
 * Servlet implementation class InitServlet
 */
@WebServlet(name = "InitServlet", urlPatterns = "/init", loadOnStartup = 1)
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		//Loading lookups into application scope...
		//LocationHelper locHelp = LocationHelper.getInstance();
		PropertyHelper prpHelp = PropertyHelper.getInstance();
		System.out.println("Initializing project...");
		System.out.println("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
		Map<Integer, String> propertyTypesMap = prpHelp.listPropertyTypes();
		System.out.println("propertyTypesMap.size() = "+propertyTypesMap.size());
		config.getServletContext().setAttribute("propertyTypes", propertyTypesMap);
		//locHelp.listActiveCountries()
	}

}
