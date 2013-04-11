<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<div>
<s:form theme="simple" id="uploadFileFormID" method="post" action="uploadAttachedFile" enctype="multipart/form-data" >
<s:file name="attachedFile"  onchange="changed();" />				
				
				
				<sj:submit
				    
				    id="sumitFileId" 
					targets="uploadDivID"
					indicator="ajax-loaderID" 
					button="true"
					value="%{getText('submit.file')}"
					buttonIcon="ui-icon-refresh" cssStyle="display:none" formIds="uploadFileFormID">									
				</sj:submit>
				
				
</s:form>
</div>

<!-- <a href="#" onclick="test();">upload file</a>
<a href="#" onclick="changed();">changed</a> --> 
<img alt="" src="./images/ajax-loader.gif" id="ajax-loaderID" style="display:none">

<div id="uploadDivID">
	
<s:fielderror fieldName="file"></s:fielderror>
<table>
<s:iterator var="file" value="#session.attachedFiles" status="stat">
	<tr>
		<td><s:property value="fileName"/></td>
		<td><s:text name="attach.file.size"/>:&nbsp;<s:property value="%{fileSize/1000000}"/> &nbsp; <s:text name="MB"/></td>
		<td>
			<s:url action="deleteUploadFile" var="deleteUploadURL" encode="true">
				<s:param name="index"><s:property value="#stat.index" /></s:param>
			</s:url>
		<sj:a indicator="indicator" href="%{deleteUploadURL}" targets="uploadDivID"><s:text name="attach.file.remove"/></sj:a></td>
	</tr>	
		
</s:iterator>

</table>

</div>
<script>
function changed(){
	//alert('changed');
	$('#sumitFileId').focus();
	$('#sumitFileId').click();
//	$('#ajax-loaderID2').show();	
	//document.getElementById('uploadedfileID').value = "";
	//$('#uploadedfileID').value('');
	//alert('submited');
	
}
</script>

