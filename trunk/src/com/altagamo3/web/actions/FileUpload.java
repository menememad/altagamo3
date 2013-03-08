package com.altagamo3.web.actions;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.altagamo3.to.Image;


public class FileUpload extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6146023247693627632L;
	protected File attachedFile;
	protected String attachedFileContentType;
	protected String attachedFileFileName;  
	protected int index;
   
	//private Logger log = Logger.getLogger(FileUpload.class);
	
	public String openUploadAttachedFile(){
		if(session.get("attachedFiles")== null){	
			ArrayList<Image> files = new ArrayList<Image>(); 			
			session.put("attachedFiles", files);
		}
		System.out.println("PATH: "+context.getRealPath("/"));
		
		return SUCCESS;
	}
	
	
	public String uploadAttachedFile(){
		try{
			//log.info("STARTED");
			//log.debug("attachedFileFileName "+attachedFileFileName);
				
	  	     	//String types=settingsInfoPTO.getStAttachmentTypes();
//	  	     	ActionContext.getContext().setLocale(new Locale((String)session.get("preferredLanguageCode")));
	  	     	//StringTokenizer tokens=new StringTokenizer(types,",");
	  			//int k=0;
	  			//int NumOfTokens=tokens.countTokens();
//	  			log.debug("Num Of Tokens :: "+NumOfTokens);
//	  			while(tokens.hasMoreTokens()){
//	  				String token=tokens.nextToken();
//	  				if(!attachedFileFileName.endsWith(token.toLowerCase())){
//	  					k++;
//	  				}
//	  			}
//	  			
//	  			if(NumOfTokens==k)
//	  			{
//	  				
//					String message=getText("INVALID_FILE");
//	  				addFieldError("file",message);
//	  				return INPUT;
//	  			}
	  			
	  			/*if((attachedFile.length()/1024)> settingsInfoPTO.getNMaxAttachmentSize())
	  	     	{
	  	     		String []args={settingsInfoPTO.getNMaxAttachmentSize()+""};
					String message=getText("MAILBOX_ATTACHMENT_EXCEEDS",args);
	  				addFieldError("file",message);
	  				return INPUT;
	  	     		
	  	     		
	  	     	}*/
	  			double size=0;
	  			if(session.get("attachedFiles")!=null){
	  			ArrayList <Image> files =((ArrayList<Image>)session.get("attachedFiles"));
	  			if(files!=null){
		  			for (Image image : files) {
		  				size=size+image.getFileBytes().length;
					}
	  			}
//	  			if((size+attachedFile.length())/1024>settingsInfoPTO.getNMaxAttachmentSize())
//	  			{
//	  				String []args={settingsInfoPTO.getNMaxAttachmentSize()+""};
//					String message=getText("MAILBOX_ATTACHMENT_EXCEEDS",args);
//	  				addFieldError("file",message);
//	  				return INPUT;
//	  				
//	  			}
	  			}
			Image file = new Image();
			byte[] filedata = readInputStream(new FileInputStream(attachedFile));
			file.setFileBytes(filedata);
			//log.debug("attachedFileContentType :: "+attachedFileContentType);
			file.setContentType(attachedFileContentType);
			file.setFileName(attachedFileFileName);
			file.setFileSize(attachedFile.length());
			((ArrayList<Image>)session.get("attachedFiles")).add(file);			
			
			//log.info("FINISHED");

		}catch (Exception e) {
			e.printStackTrace();
			addFieldError("file",e.getMessage());
		}
		return SUCCESS;
		
	}
	public String deleteUploadFile(){
		try{
			//log.info("STARTED");
			((ArrayList<Image>)session.get("attachedFiles")).remove(index);			
			//log.info("FINISHED");
			
		}catch (Exception e) {
			e.printStackTrace();
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

	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public File getAttachedFile() {
		return attachedFile;
	}
	public void setAttachedFile(File attachedFile) {
		this.attachedFile = attachedFile;
	}
	public String getAttachedFileContentType() {
		return attachedFileContentType;
	}
	public void setAttachedFileContentType(String attachedFileContentType) {
		this.attachedFileContentType = attachedFileContentType;
	}
	public String getAttachedFileFileName() {
		return attachedFileFileName;
	}
	public void setAttachedFileFileName(String attachedFileFileName) {
		this.attachedFileFileName = attachedFileFileName;
	}	

}
