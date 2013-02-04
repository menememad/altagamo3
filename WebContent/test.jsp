<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.io.IOException"%>
<%
java.io.File file = new java.io.File("testFile");
out.println(file.getAbsolutePath());
out.println(file.getCanonicalPath());
 			try {
				//String filePath = context.getRealPath("/")+"prop_img/"+propertyID+"/";
				//String filePath = "/public_html/prop_img/"+propertyID+"/";
				//String filePath = "C:\\prop_img\\"+propertyID+"\\";
	            //System.out.println("Server path:" + filePath);
	            java.io.File fileToCreate = new java.io.File("test.jpg");
					FileUtils.writeByteArrayToFile(fileToCreate,new byte []{});
					out.println("done");
			} catch (IOException e) {
				out.println(e.getMessage());
			}
 %>