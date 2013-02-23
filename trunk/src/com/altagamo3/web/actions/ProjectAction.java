package com.altagamo3.web.actions;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.altagamo3.helper.ProjectHelper;
import com.altagamo3.helper.PropertyHelper;
import com.altagamo3.to.Image;
import com.altagamo3.to.Project;
import com.altagamo3.to.User;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.opensymphony.xwork2.ActionContext;

public class ProjectAction extends BaseAction{

	private static final long serialVersionUID = -736270398790301333L;
	private Project project;
	private String projectID ;
	private char active ;
	private ArrayList<Project> arProjectList;
	
	public String exportTOPDF()
	{
		System.out.println("ProjectAction :: exportTOPDF :: Started");
		System.out.println("ProjectAction :: exportTOPDF :projectID:"+projectID);
			try{
				project = new Project();
				ProjectHelper projHelp = ProjectHelper.getInstance();
				project = projHelp.getProjectDetails(Integer.parseInt(projectID));
			   if(project.isActive())
				   active = '1';
			   else
				   active = '0';
				HttpServletResponse response =  (HttpServletResponse) ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
				response.setContentType("application/pdf"); // Code 1
				Document document = new Document();

				PdfWriter.getInstance(document, response.getOutputStream()); // Code 2
				document.open();
				document.add(new Paragraph("Simple Image"));
				if (false) {
					String path ="/proj_img/"+project.getId()+"/1.jpg"; 
					com.itextpdf.text.Image image = com.itextpdf.text.Image.getInstance(path);
					document.add(image);
				}else {
					//the path of Image
					String parentPath = "D:/altagamo3workspace/altagamo3/WebContent";
					com.itextpdf.text.Image image = com.itextpdf.text.Image.getInstance(parentPath+"/images/home.jpg");
					document.add(image);	
				}	
				document.add(new Paragraph("\n"+project.getDescription()));
				document.add(new Paragraph("\n"));
				document.add(new Paragraph("\n"+project.getVideoLink()));			
				document.close(); 
		
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		System.out.println("ProjectAction :: exportTOPDF :: Finished");
		return SUCCESS;
	}
	
	public String list(){
//		User loggedInUser = (User)session.get("userInfo");
//		if(loggedInUser.getRoleID()==1){
//			ProjectHelper prjHelp = ProjectHelper.getInstance();
//			try {
//				projectList = prjHelp.listProjects();
//				//session.put("projectsList", projectList);
//				System.out.println("Projects count: "+projectList.size());
//				return SUCCESS;
//			} catch (Exception e) {
//				e.printStackTrace();
//				addActionError(e.getMessage());
//				return NONE;
//			}
//		}else{
//			return NONE;
//		}
		System.out.println("ProjectAction :: list() :: Start");
		try {
			ProjectHelper prjHelp = ProjectHelper.getInstance();
			arProjectList = prjHelp.listProjects();
			System.out.println("ProjectAction :: list() ::"+arProjectList.size());
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR ;
		}
		System.out.println("ProjectAction :: list() :: Fininshed");
		return SUCCESS ;
	}
	public String preEdit()
	{
		System.out.println("ProjectAction :: preEdit :: Started");
		System.out.println("ProjectAction :: preEdit: projectID:"+projectID);
		try {
			ProjectHelper projHelp = ProjectHelper.getInstance();
			project = projHelp.getProjectDetails(Integer.parseInt(projectID));
		   if(project.isActive())
			   active = '1';
		   else
			   active = '0';
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		System.out.println("ProjectAction :: preEdit :: Fininshed");
		System.out.println("ProjectAction :: preEdit :: "+project.getDescription());
		return SUCCESS ;
	}
	public String editProject(){
		User s = (User)session.get("userInfo");
		int projID =0 ;
		try {
			   ProjectHelper projHelp = ProjectHelper.getInstance();
			   if(active == '1')
			      project.setActive(true);
			   else
				   project.setActive(false); 
			   System.out.println("AAAAAAAAA"+projectID);
			   project.setId(Integer.parseInt(projectID));
			   project.setCreatedAt(new Date(System.currentTimeMillis()));
			   projID =projHelp.editProject(project);	
			
			@SuppressWarnings("unchecked")
			List<Image> attachedFiles = (List<Image>)session.get("attachedFiles");
			if(attachedFiles!=null && attachedFiles.size()>0){
				int imageCount = 0;
				try {
					String filePath = context.getRealPath("/")+"proj_img/"+projectID+"/";
					//String filePath = "/public_html/proj_img/"+projectID+"/";
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
				projHelp.updateProjectImagesCount(projID, imageCount);
			}
		} catch (Exception e) {
	           e.printStackTrace();
	           return ERROR ;
		     }
		addActionMessage(getText("msg.add.property",new String[]{""+projectID}));
		return SUCCESS;
	}
	public String preAdd(){
		System.out.println("ProjectAction :: preAdd() :: Start");
		File file = new File("testFile");
		active = '1' ;
		LOG.debug("FILE PATH ********************* "+file.getAbsolutePath());
		System.out.println("ProjectAction :: preAdd() :: Finished");
		return SUCCESS;
	}
	
	public String add(){
		System.out.println("ProjectAction :: add() :: Start");
		User loggedInUser = (User)session.get("userInfo");
		int projectID =0 ;
		try {
			   ProjectHelper projHelp = ProjectHelper.getInstance();
			   if(active == '1')
			      project.setActive(true);
			   else
				   project.setActive(false); 
			   project.setCreatedAt(new Date(System.currentTimeMillis()));
				projectID = projHelp.add(project);	
			if(!(projectID>0))
				return INPUT;
			@SuppressWarnings("unchecked")
			List<Image> attachedFiles = (List<Image>)session.get("attachedFiles");
			if(attachedFiles!=null && attachedFiles.size()>0){
				int imageCount = 0;
				try {
					String filePath = context.getRealPath("/")+"proj_img/"+projectID+"/";
					//String filePath = "/public_html/proj_img/"+projectID+"/";
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
		} catch (Exception e) {
	           e.printStackTrace();
	           return ERROR ;
		     }
		addActionMessage(getText("msg.add.property",new String[]{""+projectID}));
		return SUCCESS;
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

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public ArrayList<Project> getArProjectList() {
		return arProjectList;
	}

	public void setArProjectList(ArrayList<Project> arProjectList) {
		this.arProjectList = arProjectList;
	}
	public char getActive() {
		return active;
	}
	public void setActive(char active) {
		this.active = active;
	}
	public String getProjectID() {
		return projectID;
	}
	public void setProjectID(String projectID) {
		this.projectID = projectID;
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