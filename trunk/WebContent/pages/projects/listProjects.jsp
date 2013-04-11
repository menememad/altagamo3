<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<style> 
.projects-locations-container{margin-top:10px;position:relative}.tabs-container{border-bottom:1px solid #0077ba;height:25px;position:relative}.tabs-container .locations-tabs{list-style:none;height:23px;padding:0 15px;position:absolute;right:0;top:2px}.ltr .tabs-container .locations-tabs{right:auto;left:0}.tabs-container .locations-tabs li{display:inline;float:right;margin-right:5px;-webkit-border-radius:2px 2px 0px 0px;border-radius:2px 2px 0px 0px}.ltr .tabs-container .locations-tabs li{float:left}.tabs-container .locations-tabs li a{display:inline-block;background-color:#0077BA;color:#fff;padding:3px 10px;font-weight:bold;-webkit-border-radius:2px 2px 0px 0px;border-radius:2px 2px 0px 0px}.tabs-container .locations-tabs li a:hover{background-color:#EE7501}.tabs-container .locations-tabs li.active{border:1px solid #0077ba;border-bottom:none}.tabs-container .locations-tabs li.active a{color:#0077BA;background:#fff;padding-bottom:2px}.projects-container{border:1px solid #0077ba;border-top:none;min-height:100px}.projects{}.projects li{float:right;width:265px;min-height:260px;font-size:8pt;}.ltr .projects li{float:left}.projects .project-name{font-size:16px;color:#666464;margin-top:10px}.projects .photo{float:right;overflow:hidden;width:100%;height:140px;text-align:center}.ltr .projects .photo{float:left}.projects li p{margin:0;text-align:inherit}.add-project{background-color:#ee7501;-webkit-border-radius:2px 2px 0px 0px;border-radius:2px 2px 0px 0px;color:#FFFFFF;padding:4px 10px;font-weight:bold}.rtl .add-project{float:left;margin-left:15px}.ltr .add-project{float:right;margin-right:15px}.price{color:#ee7501}
</style>
 <s:url id="preAddProjectURL" action="preAddProject"/>
<sj:a href="%{preAddProjectURL}" indicator="indicator" targets="bodyID" ><s:text name="title.project.addNew" /></sj:a>
<div class="projects-container">
<fieldset style="margin:10px 15px 10px 15px;">
<legend><s:text name="LIST_PROJECTS"></s:text> </legend>									
	<ul class="projects"  style="padding:20px 50px;"> 
 <s:iterator value="arProjectList" >
<s:url action="preEditProject" var="editprojectURL" >
 <s:param name="projectID"><s:property value="id"/> </s:param>
</s:url>	
<s:url action="viewProjectDetails" var="viewprojectURL">
 <s:param name="projectID"><s:property value="id"/> </s:param>
</s:url>

		<li >
				<div class="box-shadow">
                     <sj:a href="%{viewprojectURL}" targets="bodyID" indicator="indicator" >
                        <s:if test="%{imageCount>0}"> 
							 <img border="0" class="photo" src='/proj_img/<s:property value="id" />/1.jpg' />
						</s:if><s:else> 
							  <img border="0" class="photo" src='/images/home.jpg' />
						</s:else>
					 </sj:a>
				  <div class="clear"></div>
				</div>									<div style="margin: 0px 10px;">
			<h4 class="compound-name" ><sj:a href="%{editprojectURL}" targets="bodyID" indicator="indicator" ><s:property  value="title"/></sj:a> </h4>
			<p class="price"> <s:property value="description" /></p>
			<p ><a href="<s:property value="videoLink" />" target="_blank"><s:property value="videoLink" /></a> </p>									</div>
			<div class="clear"></div>
		</li>
</s:iterator>			
	</ul><!-- end .projects -->
    <div class="clear"></div>
</fieldset>
</div>
    <script type="text/javascript">
   function formatLink(obj)  
   {
	   window.location.href = obj ;
   }

   </script>