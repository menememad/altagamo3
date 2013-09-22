package com.altagamo3.web.actions;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;

import net.coobird.thumbnailator.Thumbnails;

import org.apache.commons.io.FileUtils;

import com.altagamo3.helper.PropertyHelper;
import com.altagamo3.helper.SecurityHelper;
import com.altagamo3.to.Image;
import com.altagamo3.to.Property;
import com.altagamo3.to.User;
import com.altagamo3.utils.Constants;


public class TestAction extends BaseAction {

	private static final long serialVersionUID = -5667367008661421841L;
	private void prepare(){
		SecurityHelper secHelp = SecurityHelper.getInstance();
		String username = "rmounir";
		String password = "password";
		boolean isUserAuthenticated = secHelp.isUserAuthenticated(username, password);
		System.out.println("User "+username+" authenticated? "+isUserAuthenticated);
		if(!isUserAuthenticated){
			System.err.println("Invalid userame and/or password");
		}else{
			User u = secHelp.getUser(username);
			session.put("userInfo", u);
		}
	}
	public String testUploadImage(){
		System.out.println("Starting upload action...");
		int propertyID = 2;//TEST
		List<Image> attachedFiles = (List<Image>)session.get("attachedFiles");
		if(attachedFiles!=null && attachedFiles.size()>0){
			int imageCount = 0;
			try {
				String imagePath = request.getServletContext().getInitParameter(BaseAction.IMAGE_PATH)+"/prop_img/"+propertyID+"/";
				BufferedImage watermarkImage = ImageIO.read(new File(request.getServletContext().getInitParameter(BaseAction.IMAGE_PATH)+"/scripts/watermark.png"));
				//System.out.println("Server path:" + filePath);
	            for (Image image : attachedFiles) {
	            	imageCount++;
					File fileToCreate = new File(imagePath,imageCount+".jpg");
					FileUtils.writeByteArrayToFile(fileToCreate,image.getFileBytes());
					//Thumbnails.of(fileToCreate).watermark(Positions.CENTER, ImageIO.read(watermarkImage), 0.5f).toFile(fileToCreate);
					File fileThumb  = new File(imagePath,"thumb_"+imageCount+".jpg");
					Thumbnails.of(image.getFile())
			        .size(160, 160)
			        .toFile(fileThumb);
	            }
			} catch (IOException e) {
				return SUCCESS;
			}
			session.remove("attachedFiles");
		}
		addActionMessage(getText("msg.add.property",new String[]{""+propertyID}));
		return SUCCESS;
	}
}
