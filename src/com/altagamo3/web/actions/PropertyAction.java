package com.altagamo3.web.actions;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.altagamo3.helper.PropertyHelper;
import com.altagamo3.to.Image;
import com.altagamo3.to.Property;
import com.altagamo3.to.User;
import com.altagamo3.utils.Constants;
import com.altagamo3.utils.Utils;
import com.opensymphony.xwork2.ActionContext;

public class PropertyAction extends BaseAction{

	private static final long serialVersionUID = -736270398790301333L;
	private Property property;
	private int aprtSubtype;
	private int villaSubtype; 
	private String actionValue;
	private List<Property> properties ;
	public String preListFavorites()
	{
		try {
			User loggedInUser = (User)session.get("userInfo");
			PropertyHelper prpHelp = PropertyHelper.getInstance();
			properties = prpHelp.listMyFavourites(loggedInUser);
		} catch (Exception e) {
			e.printStackTrace();
			return SUCCESS;
		}
		return SUCCESS;
	}
	
	public String batchEdit(){
		try {
			User loggedInUser = (User)session.get("userInfo");
			HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
			String[] propertyIDs = request.getParameterValues("propertyID");
			if(propertyIDs.length>0){
				int action =  Integer.parseInt(actionValue);
				System.out.println("Action: "+action);
				PropertyHelper prpHelp = PropertyHelper.getInstance();
				if(action==-1){
					prpHelp.addToFavorites(loggedInUser.getId(),propertyIDs);
					addActionMessage(getText("msg.add.favorite.property"));
				}else{
					prpHelp.changePropertyStatus(propertyIDs, action, loggedInUser.getId());
				String PropertyIDsStr = "";
				for (String s : propertyIDs) {
					PropertyIDsStr+=s+",";
				}
				PropertyIDsStr = PropertyIDsStr.substring(0, PropertyIDsStr.length()-1);
				addActionMessage(getText("msg.edit.property",new String[]{PropertyIDsStr}));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}
	public String getPropertyDetails(){
		PropertyHelper prpHelp = PropertyHelper.getInstance();
		try {
			System.out.println("GetDetails: Property ID: "+request.getParameter("propertyID"));
			int propertyID = Integer.parseInt(request.getParameter("propertyID"));
			property = prpHelp.getProperty(propertyID);
			//property.setImageCount(prpHelp.getPropertyImagesCount(propertyID));
			System.out.println("Property type: "+property.getPropertyType().getId());
			
			aprtSubtype = property.getSubtype();
			villaSubtype = property.getSubtype();
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return INPUT;
		}
	}

	public String preAddProperty(){
		File file = new File("testFile");
		System.out.println("FILE PATH ********************* "+file.getAbsolutePath());
		return SUCCESS;
	}
	
	public String addProperty(){
		property.setStatus(Constants.PROPERTY_STATUS_NEW);
		User loggedInUser = (User)session.get("userInfo");
		property.setCreatedBy(loggedInUser);
		if(property.getPropertyType().getId()==Constants.PROPERTY_TYPE_APARTMENT)
			property.setSubtype(aprtSubtype);
		else if(property.getPropertyType().getId()==Constants.PROPERTY_TYPE_VILLA)
			property.setSubtype(villaSubtype);
		PropertyHelper prpHelp = PropertyHelper.getInstance();
		int propertyID = prpHelp.addProperty(property);
		if(!(propertyID>0))
			return INPUT;
		@SuppressWarnings("unchecked")
		List<Image> attachedFiles = (List<Image>)session.get("attachedFiles");
		if(attachedFiles!=null && attachedFiles.size()>0){
			int imageCount = 0;
			try {
				//String filePath = context.getRealPath("/")+"prop_img/"+propertyID+"/";
				//String filePath = "/public_html/prop_img/"+propertyID+"/";
				//String filePath = "/home/allamco1/public_html/prop_img/"+propertyID+"/";
				String filePath = request.getServletContext().getInitParameter(BaseAction.IMAGE_PATH)+"/prop_img/"+propertyID+"/";
				//System.out.println("Server path:" + filePath);
	            for (Image image : attachedFiles) {
	            	imageCount++;
					File fileToCreate = new File(filePath,imageCount+".jpg");
					FileUtils.writeByteArrayToFile(fileToCreate,image.getFileBytes());
				}
			} catch (IOException e) {
				return INPUT;
			}
			session.remove("attachedFiles");
			prpHelp.updatePropertyImagesCount(propertyID, imageCount);
		}
		addActionMessage(getText("msg.add.property",new String[]{""+propertyID}));
		return SUCCESS;
	}

	public String editProperty(){
		User loggedInUser = (User)session.get("userInfo");
		if(loggedInUser.getRoleID()==1){
			PropertyHelper prpHelp = PropertyHelper.getInstance();
			if(request.getParameter("propertyID")!=null){
				property = new Property();
				property.setId(Integer.parseInt(request.getParameter("propertyID")));
				if((Constants.PROPERTY_STATUS_AVAILABLE+"").equals(request.getParameter("status")))
					property.setStatus(Constants.PROPERTY_STATUS_AVAILABLE);
				prpHelp.approveProperty(property);
			}else{
				if(property.getPropertyType().getId()==Constants.PROPERTY_TYPE_APARTMENT)
					property.setSubtype(aprtSubtype);
				else if(property.getPropertyType().getId()==Constants.PROPERTY_TYPE_VILLA)
					property.setSubtype(villaSubtype);
				prpHelp.editProperty(property);
			}
			@SuppressWarnings("unchecked")
			List<Image> attachedFiles = (List<Image>)session.get("attachedFiles");
			if(attachedFiles!=null && attachedFiles.size()>0){
				int imageCount = 0;
				try {
					int propertyID = property.getId();
					//String filePath = context.getRealPath("/")+"prop_img/"+propertyID+"/";
					//String filePath = "/home/allamco1/public_html/prop_img/"+propertyID+"/";
					String filePath = request.getServletContext().getInitParameter(BaseAction.IMAGE_PATH)+"/prop_img/"+propertyID+"/";
					FileUtils.deleteQuietly(new File(filePath));
		             
					System.out.println("Server path:" + filePath);
		            for (Image image : attachedFiles) {
		            	imageCount++;
						File fileToCreate = new File(filePath, imageCount+".jpg");
						System.out.println("Image File: "+image.getFile());
						FileUtils.writeByteArrayToFile(fileToCreate,image.getFileBytes());
					}
				} catch (IOException ioe) {
					addActionError(getText(ioe.getMessage()));
					return INPUT;
				}
				session.remove("attachedFiles");
				prpHelp.updatePropertyImagesCount(property.getId(), imageCount);
			}
			addActionMessage(getText("msg.edit.property",new String[]{""+property.getId()}));
			return SUCCESS;
		}else{
			return ERROR;
		}
	}

	public String approveProperty(){
		User loggedInUser = (User)session.get("userInfo");
		if(loggedInUser.getRoleID()==1){
			PropertyHelper prpHelp = PropertyHelper.getInstance();
			if(request.getParameter("propertyID")!=null){
				int propertyID = Integer.parseInt(request.getParameter("propertyID"));
				property = new Property();
				System.out.println("propertyID: "+propertyID);
				property.setId(propertyID);
				property.setApprovedBy(loggedInUser);
				propertyID = prpHelp.approveProperty(property);
				if(propertyID<=0)	return INPUT;
				addActionMessage(getText("msg.edit.property",new String[]{""+propertyID}));
			}
			return SUCCESS;
		}else{
			return INPUT;
		}
	}

	public String changePropertyStatus(){
		System.out.println("PropertyAction : changePropertyStatus() : Started");
		User loggedInUser = (User)session.get("userInfo");
		System.out.println("PropertyAction : changePropertyStatus() : loggedInUser.getRoleID(): "+loggedInUser.getRoleID());
		if(loggedInUser.getRoleID()==1){
			PropertyHelper prpHelp = PropertyHelper.getInstance();
			System.out.println("PropertyAction : changePropertyStatus() : servletRequest.getParameter(\"propertyID\"): "+request.getParameter("propertyID"));
			System.out.println("PropertyAction : changePropertyStatus() : servletRequest.getParameter(\"newStatus\"): "+request.getParameter("newStatus"));
				if(request.getParameter("propertyID")!=null){
				int propertyID = Integer.parseInt(request.getParameter("propertyID"));
				int newStatus = Integer.parseInt(request.getParameter("newStatus"));
				property = new Property();
				System.out.println("propertyID: "+propertyID);
				property.setId(propertyID);
				property.setStatus(newStatus);
				property.setApprovedBy(loggedInUser);
				int result = prpHelp.changePropertyStatus(property);
				if(result<=0)	return INPUT;
				addActionMessage(getText("msg.edit.property",new String[]{""+propertyID}));
			}
			return SUCCESS;
		}else{
			return INPUT;
		}
	}

	public String defineRentalPeriod(){
		System.out.println("PropertyAction : defineRentalPeriod() : Started");
		User loggedInUser = (User)session.get("userInfo");
		System.out.println("PropertyAction : defineRentalPeriod() : loggedInUser.getRoleID(): "+loggedInUser.getRoleID());
		if(loggedInUser.getRoleID()==1){
			PropertyHelper prpHelp = PropertyHelper.getInstance();
			System.out.println("PropertyAction : defineRentalPeriod() : servletRequest.getParameter(\"rentStart\"): "+request.getParameter("rentStart"));
			System.out.println("PropertyAction : defineRentalPeriod() : servletRequest.getParameter(\"rentStop\"): "+request.getParameter("rentEnd"));
			if(request.getParameter("propertyID")!=null){
				int propertyID = Integer.parseInt(request.getParameter("propertyID"));
				int newStatus = Integer.parseInt(request.getParameter("newStatus"));
				String rentStart = request.getParameter("rentStart");
				String rentEnd = request.getParameter("rentEnd");
				property = new Property();
				System.out.println("propertyID: "+propertyID);
				property.setId(propertyID);
				property.setStatus(newStatus);
				property.setApprovedBy(loggedInUser);
				property.setRentStartDate(Utils.convertToSQLDate(rentStart));
				property.setRentEndDate(Utils.convertToSQLDate(rentEnd));
				int result = prpHelp.rentProperty(property);
				if(result<=0)	return INPUT;
				addActionMessage(getText("msg.edit.property",new String[]{""+propertyID}));
			}
			return SUCCESS;
		}else{
			return INPUT;
		}
	}

	public String deleteProperty(){
		User loggedInUser = (User)session.get("userInfo");
		if(loggedInUser.getRoleID()==1){
			PropertyHelper prpHelp = PropertyHelper.getInstance();
			int propertyID = Integer.parseInt(request.getParameter("propertyID"));
			if(request.getParameter("propertyID")!=null){
				int result = prpHelp.deleteProperty(propertyID);
				if(result>0){
					//String filePath = context.getRealPath("/")+"prop_img/"+propertyID+"/";
					String filePath = "/public_html/prop_img/"+propertyID+"/";
		            if(!FileUtils.deleteQuietly(new File(filePath)))
		            	addActionError("Cannot delete old files/directory");
					System.out.println("Server path:" + filePath);
				}else{
					addActionMessage(getText("msg.delete.property",new String[]{""+propertyID}));
				}
			}
			return SUCCESS;
		}else{
			return ERROR;
		}
	}

	public Property getProperty() {
		return property;
	}

	public void setProperty(Property property) {
		this.property = property;
	}

//	public List<File> getImage() {
//		return images;
//	}
//
//	public void setImage(List<File> images) {
//		this.images = images;
//	}
//
//	public List<String> getImageContentType() {
//		return imageContentTypes;
//	}
//
//	public void setImageContentType(List<String> imageContentTypes) {
//		this.imageContentTypes = imageContentTypes;
//	}
//
//	public List<String> getImageFileName() {
//		return imageFileNames;
//	}
//
//	public void setImageFileName(List<String> imageFileNames) {
//		this.imageFileNames = imageFileNames;
//	}
//
	public int getAprtSubtype() {
		return aprtSubtype;
	}
	public void setAprtSubtype(int aprtSubtype) {
		this.aprtSubtype = aprtSubtype;
	}
	public int getVillaSubtype() {
		return villaSubtype;
	}
	public void setVillaSubtype(int villaSubtype) {
		this.villaSubtype = villaSubtype;
	}
	public void setActionValue(String actionValue) {
		this.actionValue = actionValue;
	}
	public String getActionValue() {
		return actionValue;
	}
	public List<Property> getProperties() {
		return properties;
	}
	public void setProperties(List<Property> properties) {
		this.properties = properties;
	}
}