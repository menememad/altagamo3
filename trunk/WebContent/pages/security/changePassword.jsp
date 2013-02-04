<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:form action="changePassword" method="POST">
	<s:password name="password" key="security.currentPassword"  javascriptTooltip="Type the current password here" />
	<s:password name="newPassword" key="security.newPassword"  javascriptTooltip="Type the new password here" />
	<s:password name="confirmPassword" key="security.confirmNewPassword"  javascriptTooltip="Confirm the new password here" />
	<sj:submit targets="bodyID"/>
</s:form>