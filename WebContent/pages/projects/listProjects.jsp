<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
  <script src="/static/scripts/jquery.slides.min.js"></script>
   
<script type="text/javascript">
   $(function(){
      $("#slides").slidesjs({
        width: 940,
        height: 528
      });
    });
</script>
<s:if test="%{#session.userInfo!=null && #session.userInfo.roleID==1}" ><!-- Admins only -->
 <s:url includeContext="false" id="preAddProjectURL" action="preAddProject"/>
 <sj:a href="%{preAddProjectURL}" indicator="indicator" targets="bodyID" ><s:text name="title.project.addNew" /></sj:a>
 </s:if>
<fieldset style="margin:20px 140px 150px 140px;">
<div id="slides">  
 <s:iterator value="arProjectList" >
<s:url includeContext="false" action="preEditProject" var="editprojectURL" >
 <s:param name="projectID"><s:property value="id"/> </s:param>
</s:url>	
<s:url includeContext="false" action="viewProjectDetails" var="viewprojectURL">
 <s:param name="projectID"><s:property value="id"/> </s:param>
</s:url>
<div>
<s:if test="%{#session.userInfo.roleID==1}" >
          <sj:a href="%{editprojectURL}" targets="bodyID" indicator="indicator" >
                <h1 align="center" style="color:#F87217;"><s:property  value="title"/></h1>
             </sj:a> 
</s:if><s:else>
                <h1 align="center" style="color:#F87217; "><s:property  value="title"/></h1>
</s:else>             
 <br>
<sj:a href="%{viewprojectURL}" targets="bodyID" indicator="indicator" >
     <s:if test="%{imageCount>0}"> 
			<img border="0" class="slidesjs-slide"  align="middle" src='/static/proj_img/<s:property value="id" />/1.jpg' />
	</s:if><s:else> 
			<img border="0" class="slidesjs-slide"  align="middle" src='static/tgm3/images//home.jpg' />
	</s:else>
</sj:a>
</div>
</s:iterator>	
</div>		
</fieldset>
		


    <script type="text/javascript">
  
   function formatLink(obj)  
   {
	   window.location.href = obj ;
   }

   </script>