package com.altagamo3.web.actions;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;

import com.altagamo3.helper.ProjectHelper;
import com.altagamo3.helper.PropertyHelper;
import com.altagamo3.to.Image;
import com.altagamo3.to.Project;
import com.altagamo3.to.User;

public class ProjectAction extends BaseAction{

	private static final long serialVersionUID = -736270398790301333L;
	private Project project;
	private ArrayList<Project> projectList;
	public String list(){
		User loggedInUser = (User)session.get("userInfo");
		if(loggedInUser.getRoleID()==1){
			ProjectHelper prjHelp = ProjectHelper.getInstance();
			try {
				projectList = prjHelp.listProjects();
				//session.put("projectsList", projectList);
				System.out.println("Projects count: "+projectList.size());
				return SUCCESS;
			} catch (Exception e) {
				e.printStackTrace();
				addActionError(e.getMessage());
				return NONE;
			}
		}else{
			return NONE;
		}
	}

/*	public String getPropertyDetails(){
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
*/
	public String preAdd(){
		File file = new File("testFile");
		System.out.println("FILE PATH ********************* "+file.getAbsolutePath());
		return SUCCESS;
	}
	
	public String add(){
		System.out.println("ProjectAction :: addProject() :: Start");
		User loggedInUser = (User)session.get("userInfo");
		ProjectHelper projHelp = ProjectHelper.getInstance();
		project.setCreatedAt(new Date(System.currentTimeMillis()));
		int projectID = projHelp.add(project);
		if(!(projectID>0))
			return INPUT;
		@SuppressWarnings("unchecked")
		List<Image> attachedFiles = (List<Image>)session.get("attachedFiles");
		if(attachedFiles!=null && attachedFiles.size()>0){
			int imageCount = 0;
			try {
				//String filePath = context.getRealPath("/")+"prop_img/"+propertyID+"/";
				//String filePath = "/public_html/prop_img/"+propertyID+"/";
				String filePath = "/home/allamco1/public_html/proj_img/"+projectID+"/";
	            System.out.println("Server path:" + filePath);
	            for (Image image : attachedFiles) {
	            	imageCount++;
					File fileToCreate = new File(filePath+imageCount+".jpg");
					FileUtils.writeByteArrayToFile(fileToCreate,image.getFileBytes());
				}
			} catch (IOException e) {
				return INPUT;
			}
			session.remove("attachedFiles");
			projHelp.updateProjectImagesCount(projectID, imageCount);
		}
		addActionMessage(getText("msg.add.property",new String[]{""+projectID}));
		return SUCCESS;
	}
/*
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
					String filePath = "/public_html/prop_img/"+propertyID+"/";
		            if(!FileUtils.deleteQuietly(new File(filePath)))
		            	throw new IOException("Cannot delete old files/directory");
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
*/	
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

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public ArrayList<Project> getProjectList() {
		return projectList;
	}

	public void setProjectList(ArrayList<Project> projectList) {
		this.projectList = projectList;
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

}