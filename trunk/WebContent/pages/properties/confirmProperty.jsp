<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<s:if test="hasActionMessages()">
	<h3 style="color: green"><img src="/images/signs/success.gif" /><s:actionmessage /></h3>
</s:if>


