<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<s:fielderror fieldName="file"></s:fielderror>
<table>
<s:iterator var="file" value="#session.attachedFiles" status="stat">
	<tr>
		<td><s:property value="fileName"/></td>
		<td><s:text name="attach.file.size"/>:&nbsp;<s:property value="getText('{0,number,#,##0.00}',{fileSize/1000000})"/> &nbsp; <s:text name="MB"/></td>
		<td>																													
			<s:url action="deleteUploadFile" var="deleteUploadURL" encode="true">
				<s:param name="index"><s:property value="#stat.index" /></s:param>
			</s:url>
		<sj:a href="%{deleteUploadURL}" indicator="indicator" targets="uploadDivID"><s:text name="attach.file.remove"/></sj:a></td>
	</tr>	
</s:iterator>
</table>
<script type="text/javascript">
$('#resetID').click();
</script>