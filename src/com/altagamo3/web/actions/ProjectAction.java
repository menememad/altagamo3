package com.altagamo3.web.actions;

import java.io.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.print.attribute.standard.Compression;
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
import com.itextpdf.text.pdf.PdfWriter;
import com.opensymphony.xwork2.ActionContext;

public class ProjectAction extends BaseAction{

	private static final long serialVersionUID = -736270398790301333L;
	private Project project;
	private String projectID ;
	private char active ;
    private File userImage;
    private ArrayList<File> arProjImages  = new ArrayList<File>();
    private ArrayList<String> arNameImages  = new ArrayList<String>();
	private String userImageContentType;
	private String userImageFileName;
	private ArrayList<Project> arProjectList;
	
	
	public String exportTOPDF()
	{
		System.out.println("ProjectAction :: exportTOPDF :: Started");
		System.out.println("ProjectAction :: exportTOPDF :projectID:"+projectID);
			try{
				project = new Project();
				ProjectHelper  projHelp = ProjectHelper.getInstance();
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
				document.add(new Paragraph(project.getTitle()));
				// in deployment on server
				System.out.println("ProjectAction :"+project.getImageCount());
				if (project.getImageCount()> 0){
				String filePath = request.getServletContext().getInitParameter(BaseAction.IMAGE_PATH)+"proj_img/"+project.getId()+"/1.jpg"; 
					com.itextpdf.text.Image image = com.itextpdf.text.Image.getInstance(filePath);
					image.scaleToFit(300f, 300f);
					image.scaleAbsoluteWidth(300f);
					image.scaleAbsoluteHeight(300f);
					image.scaleAbsolute(300f,300f);
					System.out.println("ffffffffffffffff");
					document.add(image);
					}
//				else { 
//					//the path of Image
//					//com.itextpdf.text.Image image = com.itextpdf.text.Image.getInstance(request.getServletContext().getInitParameter(BaseAction.IMAGE_PATH)+"/images/home.jpg");
//					//com.itextpdf.text.Image image = com.itextpdf.text.Image.getInstance(parentPath+"/images/home.jpg");
//					com.itextpdf.text.Image image = com.itextpdf.text.Image.getInstance("C://Users/Public/Pictures/Sample Pictures/Desert.jpg");
//					image.scaleToFit(300f, 300f);
//				//	image.scaleAbsoluteWidth(300f);
//					
//				//	image.scaleAbsoluteHeight(300f);
//					image.scaleAbsolute(300f,300f);
//				//	image.setWidthPercentage(200F);
//					
//					document.add(image);	
//				}	
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
		   
			session.remove("attachedFiles");
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		System.out.println("ProjectAction :: preEdit :: Fininshed");
		System.out.println("ProjectAction :: preEdit :: "+project.getDescription());
		return SUCCESS ;
	}
	public String editProject(){
		System.out.println("ProjectAction :: preEdit :: "+project.getVideoLink());
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
			   if (project.getVideoLink()!= null && !project.getVideoLink().trim().equals("".trim())) {
				project.setVideoLink("http://www.youtube.com/watch?v="+project.getVideoLink());
			}
			   projID =projHelp.editProject(project);	

			   @SuppressWarnings("unchecked")
			List<Image> attachedFiles = (List<Image>)session.get("attachedFiles");
				if(attachedFiles!=null && attachedFiles.size()>0){
					int imageCount = 0;
					try {
						//String filePath = context.getRealPath("/")+"proj_img/"+propertyID+"/";
						//String filePath = "/public_html/proj_img/"+propertyID+"/";
						//String filePath = "/home/allamco1/public_html/proj_img/"+projID+"/";
						String filePath = request.getServletContext().getInitParameter(BaseAction.IMAGE_PATH)+"proj_img/"+projID;
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
					projHelp.updateProjectImagesCount(projID, imageCount);
				}
		} catch (Exception e) {
	           e.printStackTrace();
	           return ERROR ;
		     }
		addActionMessage(getText("msg.add.property",new String[]{""+projectID}));
		return SUCCESS;
	}
	public String openUploadAttachedImage()
	{
		System.out.println("ProjectAction :openUploadAttachedImage:: ");
		arProjImages = new ArrayList<File>();
		return SUCCESS;
	}
	public String uploadProjectImages()
	{ 
		System.out.println("ProjectAction :uploadProjectImages:: ");
		try {
			System.out.println("ProjectAction :uploadProjectImages:: "+userImageContentType);
			System.out.println("ProjectAction :uploadProjectImages:: "+userImage.getCanonicalPath());
			String path = "C:\\img\\ ";
			try{
				File destDir = new File(path+(arProjImages.size()+1)+".jpg");
				FileUtils.copyFile(userImage, destDir);	
				arProjImages.add(destDir); 								
				}catch(IOException e){
					e.printStackTrace();
				return ERROR ;
				}
		} catch (Exception e) {
		e.printStackTrace();
		return ERROR ;
		}
		return SUCCESS;
	}
	public static byte[] readInputStream(InputStream inputStream) throws
	 IOException {
	         int bufSize = 1024 * 1024;
	         byte[] content;
	
	         List<byte[]> parts = new LinkedList();
	         InputStream in = new BufferedInputStream(inputStream);
	
	         byte[] readBuffer = new byte[bufSize];
	         byte[] part = null;
	         int bytesRead = 0;
	
	         // read everyting into a list of byte arrays
	         while ((bytesRead = in.read(readBuffer, 0, bufSize)) != -1) {
	             part = new byte[bytesRead];
	             System.arraycopy(readBuffer, 0, part, 0, bytesRead);
	             parts.add(part);
	         }
	
	         // calculate the total size
	         int totalSize = 0;
	         for (byte[] partBuffer : parts) {
	             totalSize += partBuffer.length;
	         }
	
	         // allocate the array
	         content = new byte[totalSize];
	         int offset = 0;
	         for (byte[] partBuffer : parts) {
	             System.arraycopy(partBuffer, 0, content, offset,partBuffer.length);
	             offset += partBuffer.length;
	         }
	
	         return content;
	     }

	public String preAdd(){
		System.out.println("ProjectAction :: preAdd() :: Start");
		session.remove("attachedFiles");
		File file = new File("testFile");
		active = '1' ;
		LOG.debug("FILE PATH ********************* "+file.getAbsolutePath());
		System.out.println("ProjectAction :: preAdd() :: Finished");
		return SUCCESS;
	}
	
	public String add(){
		System.out.println("ProjectAction :: add() :: Start");
		User loggedInUser = (User)session.get("userInfo");
		int projID =0 ;
		try {
			   ProjectHelper projHelp = ProjectHelper.getInstance();
			   if(active == '1')
			      project.setActive(true);
			   else
				   project.setActive(false); 
			   project.setCreatedAt(new Date(System.currentTimeMillis()));
			   if (project.getVideoLink()!= null && !project.getVideoLink().trim().equals("".trim())) {
					project.setVideoLink("http://www.youtube.com/watch?v="+project.getVideoLink());
				}
			   projID = projHelp.add(project);	
			if(!(projID>0))
				return INPUT;
//			if (arNameImages != null && arNameImages.size() > 0) {
//				//String filePath = context.getRealPath("/")+"proj_img/"+projectID+"/";
//				String filePath = "/home/allamco1/public_html/proj_img/"+projID+"/";   
//				//String filePath = "c:\\home\\allamco1\\public_html\\proj_img\\"+projectID+"\\";
//					
//				int imageCount = 0;
//					 for (int i = 0 ;i<arNameImages.size() ; i++ ) { 
//						imageCount ++ ;	
//						 File fileToCreate = new File(filePath+imageCount+".jpg");
//						 File fileToCopy =  new File("/home/allamco1/public_html/"+"projImgTemp/"+arNameImages.get(i));
//						 FileUtils.copyFile(fileToCopy,fileToCreate);
//					 }
//					 FileUtils.deleteDirectory(new File("/home/allamco1/public_html/"+"projImgTemp/"));
//					 projHelp.updateProjectImagesCount(projID, imageCount);
//			}
			@SuppressWarnings("unchecked")
			List<Image> attachedFiles = (List<Image>)session.get("attachedFiles");
			if(attachedFiles!=null && attachedFiles.size()>0){
				int imageCount = 0;
				try {
					//String filePath = context.getRealPath("/")+"proj_img/"+propertyID+"/";
					//String filePath = "/public_html/proj_img/"+propertyID+"/";
					//String filePath = "/home/allamco1/public_html/proj_img/"+projID+"/";
					String filePath = request.getServletContext().getInitParameter(BaseAction.IMAGE_PATH)+"proj_img/"+projID;
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
				projHelp.updateProjectImagesCount(projID, imageCount);
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

	public void setUserImage(File userImage) {
		this.userImage = userImage;
	}

	public File getUserImage() {
		return userImage;
	}

	public void setUserImageContentType(String userImageContentType) {
		this.userImageContentType = userImageContentType;
	}

	public String getUserImageContentType() {
		return userImageContentType;
	}

	public void setUserImageFileName(String userImageFileName) {
		this.userImageFileName = userImageFileName;
	}

	public String getUserImageFileName() {
		return userImageFileName;
	}

	public ArrayList<File> getArProjImages() {
		return arProjImages;
	}

	public void setArProjImages(ArrayList<File> arProjImages) {
		this.arProjImages = arProjImages;
	}
	public void setArNameImages(ArrayList<String> arNameImages) {
		this.arNameImages = arNameImages;
	}
	public ArrayList<String> getArNameImages() {
		return arNameImages;
	}

}