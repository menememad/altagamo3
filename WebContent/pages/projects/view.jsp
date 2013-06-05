<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<title><s:property value="project.title" /></title>
<%String dir = request.getLocale().getLanguage().equals("en")?"ltr":"rtl"; %>

<script src="/scripts/jquery.slides.min.js"></script> 
<div id="container" dir='<%=dir%>'> 
	<s:form id="ViewProjectForm"  theme="simple"> 
		
<fieldset >
	<center ><legend><h1><s:property value="project.title" /></h1></legend></center>
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
<a onclick="exportWindow('<s:property value="project.id"/>')" href="javascript:;"  style="width:75px" ><img alt="" src="/static/images/export/pdf.jpg"/>  </a>
               </p>
               </td>
			</tr>	
		</table>
</fieldset> 
<s:if test="%{project.imageCount>0}">
<fieldset style="margin:20px 140px 150px 140px;">		
<div id="slides">
		        <s:iterator var="index" begin="1" end="project.imageCount"> 
		         <img  border="0" class="slidesjs-slide" src='/proj_img/<s:property value="project.id" />/${index}.jpg' /> 
		        </s:iterator> 
</div>  
</fieldset>
</s:if>
<%-- 
<s:else>
<fieldset style="margin:10px 140px 30px 140px;">
<div id="slides">
	<img border="0" class="slidesjs-slide" src='/static/images/home.jpg' />
</div> 
</fieldset>
</s:else> 
--%>
</s:form>
	
</div>
<script type="text/javascript">
   function exportWindow(proID) {
   //alert(proID);
	    var  linkAction = 'exportTOPDF?projectID='+proID; 
	    window.open(linkAction,'','toolbar=no,location=no,top=50,left=50,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,width=900,height=500');
	} 
	 $(function(){
      $("#slides").slidesjs({
        width: 940, 
        height: 528
      });
    });
</script>            
 