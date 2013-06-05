<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<script src="/galleria/galleria-1.2.7.min.js"></script>
<%String dir = request.getLocale().getLanguage().equals("en")?"ltr":"rtl"; %>
<div id="container" dir='<%=dir%>'> 
	<h2><s:text name="title.project.edit" /></h2>
	<s:form id="editProjectForm"  theme="simple"> 
		<s:if test="hasFieldErrors()">
		 	<img src="/static/images/signs/error.gif" /><h3 style="color: red"><s:text name="err.message" /></h3>
		   	<s:fielderror />
		</s:if>
		<s:elseif test="hasActionErrors()">
			<img src="/static/images/signs/error.gif" /> <h3 style="color: red"><s:text name="err.message" /></h3>
		   	<s:actionerror />
		</s:elseif>
		<s:elseif test="hasActionMessages()">
		   <img src="/static/images/signs/success.gif" /><h3 style="color: green"><s:actionmessage /></h3>
		</s:elseif> 
	<fieldset>
		<legend><s:text name="section.project.info" /></legend>
		<table class="formTables">
			<tr class="odd">
				<td width="20%"><s:text name="project.title"/> <s:text name="required.flag" /></td>
				<td width="70%"><sj:textfield id="title" name="project.title" maxlength="100"/><s:fielderror fieldName="project.title"></s:fielderror> </td>
			</tr>
			<tr class="even">
				<td width="30%"><s:text name="project.description"/> <s:text name="required.flag" /></td>
				<td width="70%"><s:textarea id="description" name="project.description" resizable="true" rows="5" cols="50" /><s:fielderror fieldName="project.description"/></td>
			</tr>
		 	<tr class="odd">
				<td width="20%"><s:text name="project.order"/> <s:text name="required.flag" /></td>
				<td width="70%"><sj:spinner name="project.order" id="spinner" mouseWheel="true" max="50" size="21" min="0" readonly="true" ></sj:spinner>
				</td>
			</tr>
			<tr class="even">
				<td width="20%"><s:text name="project.status"/> <s:text name="required.flag" /></td>
				<td width="70%">
			 	     <s:radio name="active"  list="#{'1':'Active','0':'Inactive'}"  />
				</td>
			</tr>
			<tr class="odd">
				<td><s:text name="videolink"/></td>
				<td colspan="3" width="30%">http://www.youtube.com/watch?v=<s:textfield name="project.videoLink" maxlength="30"/></td>
			</tr>	
		</table> 
	</fieldset>
	<fieldset  >
		<legend><s:text name="project.upload.image"/></legend>
	<table class="formTables">
		<tr class="even">
				<td colspan="2">
					<sj:a indicator="indicator" href="openUploadAttachedFile" targets="openUploadAttachedFileID" >
						<img border="0" src="static/images/attachement.jpg" width="16" height="16" />
						<s:text name="attach.file.title" />
					</sj:a>	
					<sj:div id="openUploadAttachedFileID" ></sj:div>	
				</td>
		</tr>
		</table>
	</fieldset> 
	<div align="right">
	<sj:submit  href="editProject" indicator="indicator" targets="bodyID" formIds="editProjectForm" button="true" ></sj:submit>

       </div>
<s:hidden name="projectID"></s:hidden>
</s:form>	
</div>
