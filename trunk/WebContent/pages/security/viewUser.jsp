<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
	<fieldset>
		<legend>User Profile</legend>
		
		<table>
			<tr><td rowspan="6"><img src='<s:url includeContext="false" action="displayUserImage" method="displayUserImage"/>' width="160" height="160" align="right" alt="User Image" /></td></tr>
			<tr><td><s:text name="security.username" />: </td><td><s:property value="username" /></td></tr>
			<tr><td><s:text name="security.fullname" />: </td><td><s:property value="firstname" /> <s:property value="lastname" /></td></tr>
			<tr><td><s:text name="security.mobile" />: </td><td><s:property value="mobile" /></td></tr>
			<tr><td><s:text name="security.mobile2" />: </td><td><s:property value="mobile2" /></td></tr>
			<tr><td><s:text name="security.email" />: </td><td><s:property value="email" /></td></tr>
			<tr><td><s:text name="security.address" />: </td><td><s:property value="address" /></td></tr>
			<tr><td></td></tr>
		</table>
	</fieldset>
