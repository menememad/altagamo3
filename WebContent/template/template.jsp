<!DOCTYPE html>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<sj:head />
<html>
<head>
<meta name="description" content="AlTagamo3: All you need to know about properties in new cairo">
<meta name="keywords" content="properties, property, egypt, real estate,عقارات, للبيع, للإيجار, تمليك, شقه, التجمع, الخامس, القاهرة الجديدة">
<meta name="robots" content="index,follow">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- You can add more layouts if you want -->

<%--<script src="/scripts/watermark.jquery.js" type="text/javascript"></script>--%>
<script type="text/javascript">
  //<![CDATA[[
  $SA={s:12560,asynch:1};
  (function(){
      var sa = document.createElement("script"); sa.type = "text/javascript"; sa.async = true;
      sa.src = ("https:" == document.location.protocol ? "https://" + $SA.s + ".sa" : "http://" + $SA.s + ".a") + ".siteapps.com/" + $SA.s + ".js";
      var t = document.getElementsByTagName("script")[0]; t.parentNode.insertBefore(sa, t);
  })();
  //]]>
</script></head>
<%
String dir = "ltr";
String lang = request.getParameter("request_locale");
if("ar_EG".equals(lang)) 
	dir = "rtl";
%>


<body id="templateID" style="margin: 0 0 0 0;" dir='<%=dir%>'>
<table  height="100%">
    <tr>
         <td><a name="top"></a>
			 <div id="headerID"><tiles:insertAttribute name="header"/></div></td>
    </tr>
    <tr>
         <td> <img id="myDefaultIndicator" src="/images/indicator.gif" alt="Loading..." style="display:none;border: 0;"/>
				<div id="bodyID" dir='<%=dir%>'><tiles:insertAttribute name="body" /></div>
				<div id="detailsID"></div></td>
    <div id="menuID" dir='<%=dir%>'><tiles:insertAttribute name="menu"/></div> 
    </tr>
    <tr>
         <td><div id="footerID"><tiles:insertAttribute name="footer" /></div>
             <div class="footerLine">&nbsp;</div></td>
    </tr>
</table>
</body>
<script type="text/javascript">
 $(document).ready(function() {
	 $('.login-btn').click(function(e){
     e.preventDefault();
     $('.dropdown-login-form').toggle('fast',function(){$('#username').focus();}).css('display','inline-block');
     $(this).toggleClass("btn-login-on");return false;});
     $('#top-menu .login-btn').mousedown(function(){return false;});
     $(document).mousedown(function(e)
             {if($(e.target).parents('.dropdown-login-form').length==0)
                {$('.btn-login-on').removeClass('btn-login-on');
                  $('.dropdown-login-form').hide('fast');
                };
             });
     });        
</script>
</html>
