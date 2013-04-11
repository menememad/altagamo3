<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<sj:head />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/scripts/noty/jquery.noty.js"></script>
<script type="text/javascript" src="/scripts/noty/layouts/top.js"></script>
<script type="text/javascript" src="/scripts/noty/layouts/topLeft.js"></script>
<script type="text/javascript" src="/scripts/noty/layouts/topRight.js"></script>
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
<a name="top"></a>
<div id="headerID"><tiles:insertAttribute name="header"/></div>
<div id="menuID" dir='<%=dir%>'><tiles:insertAttribute name="menu"/></div>
<img id="myDefaultIndicator" src="/images/indicator.gif" alt="Loading..." style="display:none;border: 0;"/>
<div id="bodyID" dir='<%=dir%>'><tiles:insertAttribute name="body" /></div>
<div id="detailsID"></div>
<div id="footerID"><tiles:insertAttribute name="footer" /></div>
</body>
<%--
<script>wmark.init();</script><!-- Initialize watermark -->

<script>$(document).watermark();</script><!-- Apply watermark -->
 --%>
</html>