<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
 <style>
    .toggler { width: 500px; height: 200px; position: relative; }
    #button { padding: .5em 1em; text-decoration: none; }
    #effect { width: 240px; height: 135px; padding: 0.4em; position: relative; }
    #effect h3 { margin: 0; padding: 0.4em; text-align: center; }
    .ui-effects-transfer { border: 2px dotted gray; } 
  </style>
<script>
$(function() {
    var counter = 0;
    $('.bounce-class').hover(function() {
        
       if (counter == 0) {
    	 //  alert('test');
    	   $( this ).effect( 'bounce', {times:0}, 500 );
    	  // alert('test2');
       }
       counter = 1;
    }, function () {
       counter = 0;
    });
    $('.shake-class').hover(function() {
        if (counter == 0) {
     	 //  alert('test');
     	   $( this ).effect( 'shake', {times:0}, 500 );
     	  // alert('test2');
        }
        counter = 1;
     }, function () {
        counter = 0;
     });
 });



</script>
<img id="indicator" src="<%=request.getContextPath()%>/images/loading.gif" align="middle"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/themes/th1.css" />
<table dir="ltr" style="height: 104;text-align: center;">
	<tr height="100" valign="top">
		<td width="260">
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="/welcome.action?src=logo"><img class="bounce-class" src="<%=request.getContextPath()%>/images/header/logo.jpg" align="middle" width="220" border="0"/></a>
		</td>
		<td width="800" align="center" valign="top" height="100">
			<div style="background-color: #FFFFFF;height: 98;">
				<sj:a href="/pages/about/AboutUs.htm" indicator="indicator" targets="bodyID">
				<img  class="bounce-class" border="0" src="<%=request.getContextPath()%>/images/header/menu-aboutus.jpg" width="113" height="89"></sj:a>&nbsp;
				<s:url var="searchRent" action="searchPropertyFor" method="searchPropertyFor">
					<s:param name="propertyFor" value="2" />
				</s:url>
				<sj:a href="%{searchRent}" indicator="indicator" targets="bodyID">
				<img class="bounce-class" border="0" src="<%=request.getContextPath()%>/images/header/menu-rent.jpg" width="113" height="89"></sj:a>&nbsp;
				<s:url var="searchSale" action="searchPropertyFor" method="searchPropertyFor">
					<s:param name="propertyFor" value="1" />
				</s:url>
				<sj:a href="%{searchSale}" indicator="indicator" targets="bodyID">
				<img class="bounce-class" border="0" src="<%=request.getContextPath()%>/images/header/menu-sale.jpg" width="113" height="89"></sj:a>&nbsp;
				    <s:url action="listProjects" id="listProjectsURL"></s:url>
				<!-- /pages/about/Projects.jsp -->
				<sj:a href="%{listProjectsURL}"  indicator="indicator" targets="bodyID">
				<img class="bounce-class" border="0" src="<%=request.getContextPath()%>/images/header/menu-projects.jpg" width="113" height="89"></sj:a>
			&nbsp;<sj:a href="/pages/about/Consultant.htm" targets="bodyID">
			<img class="bounce-class" border="0" src="<%=request.getContextPath()%>/images/header/menu-consultant.jpg" width="113" height="89"></sj:a>
			</div>
		</td>
		<td width="5">&nbsp;</td>
		<td align="center" width="150" valign="top">
			<div style="background-color: #FFFFFF;text-align: center;font: 9pt;color: #05598F;font-family: Arial;height: 18;">
				<sj:a href="/pages/about/ContactUs.htm" indicator="indicator" targets="bodyID">Contact Us</sj:a>
				&nbsp;&nbsp; |&nbsp;&nbsp;
				<a href="?request_locale=ar_EG" ><s:text name="locale.arabic" /></a>
				<a href="?request_locale=en" ><s:text name="locale.english"/></a>	
			</div>
			<div style="background-color: #FFFFFF;height: 5;">&nbsp;</div>
			<div style="background-color: #FFFFFF;vertical-align: bottom;height: 42;">
				<a target="_blank" href="https://www.facebook.com/altagamo3">
					<img class="bounce-class" border="0" src="<%=request.getContextPath()%>/images/social/facebook.jpg" width="32" height="32"></a>
				<a target="_blank" href="https://plus.google.com/u/0/b/114002517545550561732/114002517545550561732/">
					<img class="bounce-class" border="0" src="<%=request.getContextPath()%>/images/social/googleplus.jpg" width="32" height="32"></a>
				<a target="_blank" href="https://twitter.com/AlTagamo3">
					<img class="bounce-class" border="0" src="<%=request.getContextPath()%>/images/social/twitter.jpg" width="32" height="32"></a>
			</div>
			<s:if test="%{#session.userInfo!=null}" >
			<div style="background-color: #FFFFFF;vertical-align: top;height: 5;"><a href='<s:url action="logout" method="logout" />' id="logoutLink">Logout</a></div>
			</s:if>
			<s:else> 
			<div style="background-color: #FFFFFF;height: 5;vertical-align: top;"><a href="javascript:;" class="login-btn" id="loginLink">Login</a>
			
			&nbsp;&nbsp;|&nbsp;&nbsp;<sj:a href="preAddUser" targets="bodyID" id="registerLink">Sign Up</sj:a>
			<div class="dropdown-login-form"  style="display: none;position: relative;outline-style: ridge;">
					<fieldset   style="background-color: #FFB00F;">
						<s:form action="login" method="POST" theme="simple" focusElement="username">
								<table  id="box1" cellpadding="7" height="100%" bgcolor="#FFB00F" class="ui-corner-all">
									<tr>
										<td style="font-family: Tahoma;font-size: 15pt;color: #AD7400;font-weight: bold;text-align: center;">
										<s:text name="welcome.membersarea" /></td>
									</tr>
									<tr>
										<td align="center">
										<font face="Arial" color="#FFFFFF" ><s:text name="global.username" /></font></td>
									</tr>
									<tr>
										<td align="center">
										<s:textfield id="username" name="username" size="29"/></td>
									</tr>
									<tr>
										<td align="center" height="32">
										<font face="Arial" color="#FFFFFF"><s:text name="global.password" /></font></td>
									</tr>
									<tr>
										<td align="center">
										<s:password name="password" size="29"/></td>
									</tr>
									<tr>
										<td align="center">
										<font face="Arial" color="#FFFFFF"><s:checkbox name="remember" /><s:text name="global.rememberMe" /></font>
										<font face="Arial" style="font-size: 10pt; font-weight: 700" color="red"><s:fielderror /></font>
										</td>
									</tr>
									<tr>
										<td>
										<p align="center">
										<sj:submit indicator="indicator" type="image" src="/images/buttons/btn_login.jpg"/></td>
									</tr>
									<tr>
										<td align="center">
										<font face="Arial" color="#FFFFFF" size="2">
										<sj:a indicator="indicator" href="/pages/security/forgotPassword.jsp" targets="bodyID"><s:text name="global.forgotpassword" /></sj:a> | <sj:a href="preAddUser" targets="bodyID"><s:text name="global.registernow" /></sj:a></font></td>
									</tr>
								</table>	
						</s:form> 
						</fieldset>
			</div>
			</div>
			</s:else>
		</td>
		<td width="5"></td>
	</tr>
</table>
