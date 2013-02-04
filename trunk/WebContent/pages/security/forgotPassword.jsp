<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<title>Forgot Password - AlTagamo3.com</title>
<center><img ismap id="indicatorImage" style="display: none;" src="<%=request.getContextPath()%>/images/indicator.gif"></center>
<s:form action="resetPassword" method="POST">	
	<s:textfield name="username" key="security.username"  javascriptTooltip="Type the username" />
	<sj:submit targets="bodyID" indicator="indicatorImage"/>
</s:form>
<font color="red"><b>NOTE:</b> A new password will be generated and sent to your account E-mail address.</font>
<br />
