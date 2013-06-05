package com.altagamo3.web.actions;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.altagamo3.helper.PropertyHelper;
import com.altagamo3.helper.SecurityHelper;
import com.altagamo3.to.Image;
import com.altagamo3.to.User;
import com.opensymphony.xwork2.ActionSupport;

public class ImageDisplayerAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = 1481420178287018005L;
	private HttpServletRequest servletRequest;
	
	private String fileContentType;
	private String filename;
	private byte[] fileBytes;
	
	public String displayUserImage(){
		SecurityHelper secHelp = SecurityHelper.getInstance();
		try {
			String username = ((User)servletRequest.getSession().getAttribute("userInfo")).getUsername();
			Image userImage = secHelp.getUserImage(username);
			if(userImage!=null && userImage.getFileBytes()!=null){
				fileContentType = userImage.getContentType();
				filename = username+getFileExtension();
				fileBytes = userImage.getFileBytes();
				return SUCCESS;
			}else
				return ERROR;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return ERROR;
		}
	}

	public String displayPropertyImage(){
		PropertyHelper prpHelp = PropertyHelper.getInstance();
		try {
			int propertyID = Integer.parseInt(servletRequest.getParameter("prpID"));
			int imageNo = Integer.parseInt(servletRequest.getParameter("imgNo"));
			Image prpImage = prpHelp.getPropertyImage(propertyID,imageNo);
			if(prpImage!=null && prpImage.getFileBytes()!=null){
				fileContentType = prpImage.getContentType();
				filename = prpImage+getFileExtension();
				fileBytes = prpImage.getFileBytes();
				return SUCCESS;
			}else
				return ERROR;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return ERROR;
		}
	}
	
	
	

	public String getFileContentType() {
		return fileContentType;
	}
	public File getFile() {
		String filePath = servletRequest.getSession().getServletContext().getRealPath("/");
		File file = new File(filePath + "/static/static/images/users/", "user"+getFileExtension());
		System.out.println(file.toString());
		return file;
	}
	public String getFilename() {
		return filename;
	}
	@Override
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}
	public String getFileExtension(){
		if(fileContentType.equalsIgnoreCase("image/png"))
			return ".png";
		else if(fileContentType.equalsIgnoreCase("image/gif"))
			return ".gif";
		else if(fileContentType.equalsIgnoreCase("image/jpeg"))
			return ".jpeg";
		else if(fileContentType.equalsIgnoreCase("image/pjpeg"))
			return ".jpg";
		else 
			return ".bmp";
	}
	public InputStream getInputStream () { 
		return new ByteArrayInputStream(fileBytes); 
	}
	
	private InputStream stream;

	public InputStream getStream() {
		return stream;
	}

	public void setStream(InputStream stream) {
		this.stream = stream;
	}

}
