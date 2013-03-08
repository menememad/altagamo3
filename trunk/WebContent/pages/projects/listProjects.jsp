<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<style>
.column { 
	width: 170px;
	float: left;
	padding-bottom: 100px;
	}
	
	.column div { 
	margin:5px;
	}
	
	.column div div .ui-icon { 
	float: right;
	}
.sortable {
border:1px solid #000;
height:20px;
margin:5px;
padding:10px;
text-align: center;
}
</style>
<script type="text/javascript">
$(function() {
    $(".column div div .ui-icon").click(function() {
        $(this).toggleClass("ui-icon-minusthick");
        $(this).parents(".column div").find(".portlet-content").toggle();
    });
});
$.subscribe('onupdate', function(event,data) {
    var result = $("#sortableresult").empty();
    result.append("You move "+$(event.originalEvent.ui.item).find('.ui-widget-header > .title').html());
    result.append(' from '+$(event.originalEvent.ui.sender).attr('id'));
    result.append(' to '+$(event.originalEvent.ui.item).parent().attr('id'));
});
</script>
 <s:form theme="simple"  id="ProjectListFormID" >
 <s:url id="preAddProjectURL" action="preAddProject"/>
<sj:a href="%{preAddProjectURL}" targets="bodyID" ><s:text name="title.project.addNew" /></sj:a>
 <br/>
   <sj:div id="column1"  cssClass="column" sortable="true" sortableConnectWith=".column" cssStyle="width:100%;" sortablePlaceholder="ui-state-highlight" sortableForcePlaceholderSize="true"
		                sortableHandle="div.ui-widget-header" sortableCursor="crosshair" sortableOnUpdateTopics="onupdate">
  
  <s:iterator value="arProjectList" status="arLst" >
   <div class="ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">
        <div class="ui-widget-header ui-corner-all"><span class="title"><s:property value="title"/></span><span class="ui-icon ui-icon-plusthick"></span></div>
        <div class="portlet-content">
                 <table style="width:100%" >
                        <tr>
                           <td width="20%" align="left">
                               <s:url action="preEditProject" id="editprojectURL">
                               <s:param name="projectID"><s:property value="id"/> </s:param>
                               </s:url>
                               <sj:a href="%{editprojectURL}" targets="bodyID" indicator="indicator" >
                                <s:if test="%{imageCount>0}"> 
							      <img border="0" class="watermark" src='/proj_img/<s:property value="id" />/1.jpg' width="80" height="80" align="center"/>
								</s:if>
								<s:else> 
							      <img border="0" class="watermark" src='/images/home.jpg' width="80" height="80"/>
						       </s:else>
						       </sj:a> 
                           </td>
                            <td width="60%" height="50" align="left" valign="top">
                              <s:property value="description" />
                            </td>
                             <td width="20%">
                                <a  href="javascript:;"  onclick="formatLink('<s:property value="videoLink" />');" > <s:property value="videoLink" /> </a>                                 
                            <!-- <s:url action="exportTOPDF" id="exportTOPDFURl"></s:url>
                             <sj:a href="%{exportTOPDFURl}" targets="bodyID" >Export</sj:a>
                              -->
                              <a  onclick="exportWindow('<s:property value="id"/>')" href="javascript:;" >Export</a>
                             </td>
                        </tr>                  
                 </table>
        </div>
    </div>
   </s:iterator>
    </sj:div> 
    <s:hidden name="projectID" id="projectIND"></s:hidden>
 </s:form>
    <script type="text/javascript">
   function formatLink(obj)
   {
	   window.location.href = obj ;
   }
   $(".portlet-content").toggle();

   function exportWindow(proID) {
	  // alert(proID);
	    //$('#projectIND').val(proID);
	    var  linkAction = 'exportTOPDF?projectID='+proID;
	    window.open(linkAction,'','toolbar=no,location=no,top=50,left=50,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width=900,height=500');
	} 
   </script>