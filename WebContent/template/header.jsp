<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href='<s:url includeContext="false" value="/res/tgm3/themes/th1.css" />' />
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
<img id="indicator" style="display: none;" src='<s:url includeContext="false" value="/res/tgm3/images/loading.gif" />' align="middle"/>

<table dir="ltr" style="height: 104;text-align: center;">
	<tr height="100" valign="top">
		<td width="260">
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="/welcome.action?src=logo"><img class="bounce-class" src='<s:url includeContext="false" value="/res/tgm3/images/header/logo.jpg" />' align="middle" width="220" border="0"/></a>
		</td>
		<td width="800" align="center" valign="top" height="100">
			<div style="background-color: #FFFFFF;height: 98;">
				<a href="?request_locale=ar_EG" ><s:text name="locale.arabic" /></a>
				<a href="?request_locale=en" ><s:text name="locale.english"/></a>	
				&nbsp;&nbsp;
				<sj:a href="/pages/about/AboutUs.htm" indicator="indicator" targets="bodyID">
				<img  class="bounce-class" border="0" src='<s:url includeContext="false" value="/res/tgm3/images/header/menu-aboutus.jpg" />' width="113" height="89"></sj:a>&nbsp;
				<s:url includeContext="false" var="searchRent" action="searchPropertyFor" method="searchPropertyFor">
					<s:param name="propertyFor" value="2" />
				</s:url>
				<sj:a href="%{searchRent}" indicator="indicator" targets="bodyID">
				<img class="bounce-class" border="0" src='<s:url includeContext="false" value="/res/tgm3/images/header/menu-rent.jpg" />' width="113" height="89"></sj:a>&nbsp;
				<s:url includeContext="false" var="searchSale" action="searchPropertyFor" method="searchPropertyFor">
					<s:param name="propertyFor" value="1" />
				</s:url>
				<sj:a href="%{searchSale}" indicator="indicator" targets="bodyID">
				<img class="bounce-class" border="0" src='<s:url includeContext="false" value="/res/tgm3/images/header/menu-sale.jpg" />' width="113" height="89"></sj:a>&nbsp;
				<!-- /pages/about/Projects.jsp -->
				<sj:a href="listProjects"  indicator="indicator" targets="bodyID">
				<img class="bounce-class" border="0" src='<s:url includeContext="false" value="/res/tgm3/images/header/menu-projects.jpg" />' width="113" height="89"></sj:a>
			&nbsp;<sj:a href="/pages/about/consultant.html" targets="bodyID">
			<img class="bounce-class" border="0" src='<s:url includeContext="false" value="/res/tgm3/images/header/menu-consultant.jpg" />' width="113" height="89"></sj:a>
			</div>
		</td>
		<td width="5">&nbsp;</td>
		<td align="center" width="150" valign="top">
			<div style="background-color: #FFFFFF;height: 30px;">&nbsp;</div>
			<div style="background-color: #FFFFFF;vertical-align: bottom;height: 42;">
				<a target="_blank" href="https://www.facebook.com/altagamo3">
					<img class="bounce-class" border="0" src='<s:url includeContext="false" value="/res/tgm3/images/social/facebook.jpg" />' width="32" height="32"></a>
				<a target="_blank" href="https://plus.google.com/u/0/b/114002517545550561732/114002517545550561732/">
					<img class="bounce-class" border="0" src='<s:url includeContext="false" value="/res/tgm3/images/social/googleplus.jpg" />' width="32" height="32"></a>
				<a target="_blank" href="https://twitter.com/AlTagamo3">
					<img class="bounce-class" border="0" src='<s:url includeContext="false" value="/res/tgm3/images/social/twitter.jpg" />' width="32" height="32"></a>
			</div>
			<s:if test="%{#session.userInfo!=null}" >
				<div style="background-color: #FFFFFF;vertical-align: top;height: 5;">
				<s:form action="logout" method="POST" theme="simple">
				<!--  <a href="/logout.action"  id="logoutLink"  >Logout </a>--> 
				<sj:submit indicator="indicator"   button="true" value="%{getText('menu.security.logout')}"/> 
				</s:form>
			</div>	
			</s:if>
			<s:else> 
			<div style="background-color: #FFFFFF;height: 5;vertical-align: top;">
		<!-- <a href="javascript:;" class="login-btn" id="loginLink">Login</a> -->	
			<sj:a openDialog="loginDialog" href="javascript:;"  button="true" ><s:text name="global.login"></s:text> </sj:a>
			</div><s:fielderror />
			</s:else>
		</td>
		<td width="5"></td>
	</tr>
</table>