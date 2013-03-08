<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<div>
<s:form theme="simple" id="uploadFileFormID" method="post" action="readyToUpload" enctype="multipart/form-data" >
<s:file name="userImage"  onchange="changed();" />								
				<sj:submit
				    id="sumitFileId" 
					targets="uploadDivID"
					indicator="ajax-loaderID"  
					button="true"
					value="%{getText('submit.file')}"
					buttonIcon="ui-icon-refresh" cssStyle="display:none" formIds="uploadFileFormID">									
				</sj:submit>
	<input id="resetID"  style="display:none;" type="reset"/>
</s:form>
</div>
<img alt="" src="./images/ajax-loader.gif" id="ajax-loaderID" style="display:none">
<div id="uploadDivID">
<s:fielderror fieldName="file"></s:fielderror>
</div>
<script>
function changed(){
	$('#sumitFileId').focus();
	$('#sumitFileId').click();
}
</script>

