<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html>
<sj:head jqueryui="true" jquerytheme="sunny"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/themes/th1.css" />
<title>Image Upload Test</title>
</head>
<body>
	<s:form id="addPropertyForm" action="test!testUploadImage" method="POST" theme="simple">
	<fieldset>
		<legend><s:text name="property.upload.image"/></legend>
		<table class="propertyForm">
			<tr class="odd">
				<td colspan="6">
					<sj:a indicator="indicator" href="openUploadAttachedFile" targets="openUploadAttachedFileID" >
						<img border="0" src='<s:url includeContext="false" value="/res/tgm3/images/attachement.jpg" />' width="16" height="16" />
						<s:text name="attach.file.title" />
					</sj:a>	
					<sj:div id="openUploadAttachedFileID" ></sj:div>	
				</td>
			</tr>
			<tr class="even">
				<td><s:text name="videolink"/></td>
				<td colspan="3" width="30%">http://www.youtube.com/watch?v=<s:textfield name="property.videoLink" maxlength="30"/></td>
				<td colspan="2"><span class="hint"><s:text name="hint.videolink"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
		</table>
	</fieldset>
	<p class="submit"><sj:submit indicator="indicator" targets="bodyID" button="true" label="Submit"/></p>
	</s:form>
</body>
</html>