<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Our Project - مشروعاتنا</title>
<style>
<!--
 li.MsoNormal
	{mso-style-parent:"";
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	margin-left:0in; margin-right:0in; margin-top:0in}
h2
	{margin-top:0in;
	margin-right:.75in;
	margin-bottom:0in;
	margin-left:.75in;
	margin-bottom:.0001pt;
	text-align:justify;
	text-indent:-.5in;
	page-break-after:avoid;
	tab-stops:list .75in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif"}
h4
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.75in;
	margin-bottom:.0001pt;
	text-align:center;
	page-break-after:avoid;
	font-size:18.0pt;
	font-family:"Times New Roman","serif";
	text-decoration:underline;
	text-underline:single}
-->
</style>
</head>
<body>
<s:form theme="simple">
<s:url id="preAddProjectURL" action="preAddProject"/>
<sj:a href="%{preAddProjectURL}" targets="bodyID" >Add Project </sj:a>
</s:form>
<s:if test="%{#session.userInfo!=null && #session.userInfo.roleID==1}">
<s:url var="listProjects" action="listProjects"/>
<sj:a href="%{listProjects}" targets="bodyID" button="true">Project Management</sj:a>
</s:if>				
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td height="37" bgcolor="#99DDE0">&nbsp;</td>
		<td width="1008" bgcolor="#99DDE0" height="37">
		<span style="font-size: 16pt"><font color="#0D4559">&nbsp;&nbsp; </font>
		<b><font face="Verdana" color="#0D4559">Projects</font></b></span></td>
		<td height="37" bgcolor="#99DDE0">&nbsp;</td>
	</tr>
	<tr>
		<td height="488" bgcolor="#99DDE0">&nbsp;</td>
		<td width="1008" height="488" valign="top">
		<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%">
			<tr>
				<td width="103%" height="109" bgcolor="#FFFFFF" valign="top">
				<table border="0" width="100%" cellspacing="7" cellpadding="0">
					<tr>
						<td align="left" valign="top">
						<font size="2" color="#666666">
						<span style="font-family: Tahoma,sans-serif">Al Montazah 
						Royal Plaza</span></font><p>
						<img border="0" src="/images/projects/000_0029.jpg" width="800" height="600"><font size="2" color="#666666"><span style="font-family: Tahoma,sans-serif"><br>
						<br>
						Al Montazah Royal Plaza in Alexandria is the source of 
						pride of Al Halawani for Real Estate. The Project is 
						located in a magnificent spot in Alexandria overlooking 
						Al Montazah palace parks.<br>
						<br>
						<br>
						Montazah Royal Plaza: Best Choice<br>
						Al Montazah Royal Plaza is not only a giant project but 
						it is designed to be the best within its likes in every 
						aspect.<br>
						<br>
						Montazah Royal Plaza: Best Location<br>
						Located on the intersection between the most important 
						routes in Alexandria overlooking the marvelous Montazah 
						palace parks. The sea and Montazah palace parks view are 
						available for all units within the project.<br>
						<br>
						Montazah Royal Plaza: Complete Planning <br>
						The project is designed to provide a harmony between the 
						residential and commercial areas which results in a 
						magic world of luxury and privacy that only residents of 
						this marvelous project are privileged to enjoy.<br>
						<br>
						Montazah Royal Plaza: Perfection in Construction<br>
						On 30 thousand meters square, this project is built with 
						all our experiences and capabilities to be an 
						architectural monument and an example of the use of 
						technology to ensure luxury.</span></font></p>
						<table border="0" width="100%" cellspacing="0" cellpadding="0">
							<tr>
								<td height="46" align="center">
								<font size="2" color="#666666">
								<span style="font-family: Tahoma,sans-serif; font-weight: 700">
								The Place</span></font></td>
								<td height="46" align="center">
								<font size="2" color="#666666">
								<span style="font-family: Tahoma,sans-serif; font-weight: 700">
								Vertical Projection</span></font></td>
								<td height="46" align="center">
								<font size="2" color="#666666">
								<span style="font-family: Tahoma,sans-serif; font-weight: 700">
								Building Front</span></font></td>
							</tr>
							<tr>
								<td align="center">
								<a target="_blank" href="/images/projects/TXT_10.jpg">
								<img border="0" src="/images/projects/TXT_10.jpg" width="210" height="215"></a></td>
								<td align="center">
								<a target="_blank" href="/images/projects/U_1_01.jpg">
								<img border="0" src="/images/projects/TXT_12.jpg" width="210" height="215"></a></td>
								<td align="center">
								<a target="_blank" href="/images/projects/photo20_02.jpg">
								<img border="0" src="/images/projects/Untitled-3_01.jpg" width="250" height="230"></a></td>
							</tr>
						</table>
						<p>&nbsp;</p>
						<p class="MsoNormal">
						&nbsp;</p></td>
					</tr>
				</table>
				</td>
			</tr>
			</table>
		</td>
		<td height="488" bgcolor="#99DDE0">&nbsp;</td>
	</tr>
</table>
</body>
</html>