<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<s:fielderror fieldName="file"></s:fielderror>
<table>
<s:iterator var="file" value="arProjImages" status="stat">
	<tr>
		<td> <s:property value="userImageFileName"/></td>
		<td><s:text name="attach.file.size"/>:&nbsp;<s:property value="userImage.length()"/> &nbsp; <s:text name="B"/></td>	
</s:iterator>
</table>
<script> 
$('#resetID').click();
</script>