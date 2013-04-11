<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:if test="%{#session.userInfo!=null && #session.userInfo.roleID==1}" ><!-- Admins only -->
 <s:url id="preAddProjectURL" action="preAddProject"/>
 <sj:a href="%{preAddProjectURL}" indicator="indicator" targets="bodyID" ><s:text name="title.project.addNew" /></sj:a>
 </s:if>
<fieldset style="margin:10px 15px 10px 15px;">
<legend><s:text name="LIST_PROJECTS"></s:text> </legend>									
	<ul class="projects"> 
 <s:iterator value="arProjectList" >
<s:url action="preEditProject" var="editprojectURL" >
 <s:param name="projectID"><s:property value="id"/> </s:param>
</s:url>	
<s:url action="viewProjectDetails" var="viewprojectURL">
 <s:param name="projectID"><s:property value="id"/> </s:param>
</s:url>

		<li>
				<div class="box-shadow">
                     <sj:a href="%{viewprojectURL}" targets="bodyID" indicator="indicator" >
                        <s:if test="%{imageCount>0}"> 
							 <img border="0" class="photo" src='/proj_img/<s:property value="id" />/1.jpg' />
						</s:if><s:else> 
							  <img border="0" class="photo" src='/images/home.jpg' />
						</s:else>
					 </sj:a>
				  <div class="clear"></div>
				</div>
				<div style="margin: 0px 10px;">
			<h4 class="compound-name" ><sj:a href="%{editprojectURL}" targets="bodyID" indicator="indicator" ><s:property  value="title"/></sj:a> </h4>
			<p class="price"> <s:property value="description" /></p>
			<p ><a href="<s:property value="videoLink" />" target="_blank"><s:property value="videoLink" /></a> </p>									</div>
			<div class="clear"></div>
		</li>
</s:iterator>			
	</ul><!-- end .projects -->
    <div class="clear"></div>
</fieldset>

    <script type="text/javascript">
   function formatLink(obj)  
   {
	   window.location.href = obj ;
   }

   </script>