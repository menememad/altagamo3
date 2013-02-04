<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<%String dir = request.getLocale().getLanguage().equals("en")?"ltr":"rtl"; %>
<div id="container" dir='<%=dir%>'> 
	<h2><s:text name="title.property.addNew" /></h2>
	<s:form id="addProjectForm" action="addProject" method="POST" theme="simple">
		<s:if test="hasFieldErrors()">
		 	<img src="/images/signs/error.gif" /><h3 style="color: red"><s:text name="err.message" /></h3>
		   	<s:fielderror />
		</s:if>
		<s:elseif test="hasActionErrors()">
			<img src="/images/signs/error.gif" /> <h3 style="color: red"><s:text name="err.message" /></h3>
		   	<s:actionerror />
		</s:elseif>
		<s:elseif test="hasActionMessages()">
		   <img src="/images/signs/success.gif" /><h3 style="color: green"><s:actionmessage /></h3>
		</s:elseif>
	<fieldset>
		<legend><s:text name="section.property.info" /></legend>
		<table class="propertyForm">
			<tr class="odd">
				<td width="20%"><s:text name="title"/> <s:text name="required.flag" /></td>
				<td width="70%"><sj:textfield id="title" name="project.title" maxlength="100"/></td>
				<td width="10%"><span class="hint"><s:text name="hint.title"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="even">
				<td width="20%"><s:text name="order"/> <s:text name="required.flag" /></td>
				<td width="70%"><sj:textfield id="order" name="project.order" maxlength="100"/></td>
				<td width="10%"><span class="hint"><s:text name="hint.order"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="odd">
				<td width="30%"><s:text name="description"/> <s:text name="required.flag" /></td>
				<td width="70%"><s:textarea id="description" name="project.description" resizable="true" rows="5" cols="50" /></td>
			</tr>
		</table>
	</fieldset>
	<fieldset>
		<legend><s:text name="property.upload.image"/></legend>
		<table class="propertyForm">
			<tr class="odd">
				<td colspan="6">
					<sj:a href="openUploadAttachedFile" targets="openUploadAttachedFileID" >
						<img border="0" src="images/attachement.jpg" width="16" height="16" />
						<s:text name="attach.file.title" />
					</sj:a>	
					<sj:div id="openUploadAttachedFileID" ></sj:div>	
				</td>
			</tr>
			<tr class="even">
				<td><s:text name="videolink"/></td>
				<td colspan="3" width="30%">http://www.youtube.com/watch?v=<s:textfield name="project.videoLink" maxlength="30"/></td>
				<td colspan="2"><span class="hint"><s:text name="hint.videolink"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
		</table>
	</fieldset>
	<p class="submit"><sj:submit targets="bodyID" button="true" key="Submit" onclick="window.location.href='#top';"/></p>
</s:form>	
</div>
<script>
function prepareInputsForHints() {
	var inputs = document.getElementsByTagName("input");
	for (var i=0; i<inputs.length; i++){
		// test to see if the hint span exists first
		if (inputs[i].parentNode.getElementsByTagName("span")[0]) {
			// the span exists!  on focus, show the hint
			//alert("this.parentNode");
			inputs[i].onfocus = function () {
				this.parentNode.getElementsByTagName("span")[0].style.display = "inline";
				//alert("hi2");
			}
			// when the cursor moves away from the field, hide the hint
			inputs[i].onblur = function () {
				this.parentNode.getElementsByTagName("span")[0].style.display = "none";
				//alert("hi3");
			}
		}
	}
}
prepareInputsForHints();
</script>