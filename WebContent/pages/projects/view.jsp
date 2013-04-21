<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<%String dir = request.getLocale().getLanguage().equals("en")?"ltr":"rtl"; %>

<link href="/assets/css/style.css" rel="stylesheet" /> 
<link href="/assets/css/animate.css" rel="stylesheet" /> 
<script src="/assets/js/script.js"></script> 

<div id="container" dir='<%=dir%>'> 
	<s:form id="ViewProjectForm"  theme="simple"> 
		
<fieldset >
	<center ><legend ><h2><s:property value="project.title" /></h2></legend></center>
		<s:if test="%{project.imageCount>0}">
			<center>
			<!--<div class="content">
		        <div id="galleria" style="width: 500px;">-->
		       <ul id="photos">
		        <s:iterator var="index" begin="1" end="project.imageCount">
		           <li> <img  border="0" name="myImage" src='/proj_img/<s:property value="project.id" />/${index}.jpg' /> </li>
		        </s:iterator>
		        </ul>   
		       <!-- </div> 
			</div>  --> 
			
  <a href="#" class="arrow previous"></a>  
  <a href="#" class="arrow next"></a> 
			
			</center>      
		</s:if>
		<s:else>
			<ul id="photos">
			<li>
							  <img border="0"  src='/images/home.jpg' />
	          </li></ul> 
			  <a href="#" class="arrow previous"></a>  
           <a href="#" class="arrow next"></a> 
			</s:else>
		<s:if test="%{project.videoLink!=null && project.videoLink.length>0}">
			<center>
				<iframe id="player" width="640" height="390" src='http://www.youtube.com/embed/<s:property value="project.videoLink" />?enablejsapi=1&origin=http://www.altagamo3.com' frameborder="0" ></iframe>
		  	</center>
	  	</s:if>
</fieldset>
	<fieldset>
		<legend><s:text name="section.project.info" /></legend>
<sj:div id="pulsatingdiv" delay="3000" href="javascript:;"  indicator="indicatorpuls" effect="highlight"  effectDuration="3000"  cssClass="result ui-widget-content ui-corner-all"
> <center><s:property value="project.description"/></center>  </sj:div>		
		<table class="formTables" width="100%">
			<tr>
				<td width="30%"><s:text name="videolink"/></td>
				<td width="70%"><p class="price"><a href="<s:property value="project.videoLink" />" target="_blank"><s:property value="project.videoLink" /></a> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
<a onclick="exportWindow('<s:property value="project.id"/>')" href="javascript:;" class="ui-button ui-widget ui-state-default ui-corner-all" style="width:75px" ><s:text name="EXPORT"></s:text> </a>
               </p>
               </td>
			</tr>	
		</table> 
	</fieldset>
</s:form>
	
</div>
<script type="text/javascript">
   function exportWindow(proID) {
   alert(proID);
	    var  linkAction = 'exportTOPDF?projectID='+proID;
	    window.open(linkAction,'','toolbar=no,location=no,top=50,left=50,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width=900,height=500');
	} 
</script>            
 