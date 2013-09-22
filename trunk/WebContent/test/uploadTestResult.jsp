<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 //EN">
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<head>
<title>Image Upload Test Result</title>
        <script src="/static/galleria/galleria-1.2.7.min.js"></script>
        <script src="/static/scripts/watermark.jquery.js"></script>
</head>
<body>        
    	<h2><s:text name="property.details" /></h2>
	<fieldset>
		<legend><s:text name="property.upload.image"/></legend>
			<center>
			<div class="content">
		        <div id="galleria" style="width: 500px;">
		        <s:iterator var="index" value="attachedFiles">
		            <img class="watermark" border="0" name="myImage" src='/static/prop_img/<s:property value="property.id" />/${index}.jpg' />
		        </s:iterator>    
		        </div>
			</div>  
			</center>      
	</fieldset>

	<s:if test="%{property.imageCount>0}">
        <script>
            Galleria.loadTheme('/galleria/themes/classic/galleria.classic.min.js');
            Galleria.run('#galleria');
        </script>
    </s:if> 
</body>       