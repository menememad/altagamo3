<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>

<script type="text/javascript" src="/static/easypaginate/js/easypaginate.min.js"></script>
<script type="text/javascript">
jQuery(function($){
	$('div#items').easyPaginate({
		step:10
	});
});    
</script>

<style>
/* content */
	ol#pagination{overflow:hidden;}
	ol#pagination li{
		float:left;
		list-style:none;
		cursor:pointer;
		margin:0 0 0 .5em;
		}
	ol#pagination li.current{color:#f00;font-weight:bold;}
	
/* // content */
th{
	background-image: linear-gradient(rgb(20,20,20),rgb(255,20,20));
	color: white;
}
.more-div{display: none;}
</style>

 <s:iterator value="properties">
<table >
	<s:url var="approveProperty" action="approveProperty" method="approveProperty">
		<s:param name="propertyID" value="%{id}" />
	</s:url>
	<s:url var="activateProperty" action="changePropertyStatus" escapeAmp="false">
		<s:param name="propertyID" value="%{id}" />
		<s:param name="newStatus" value="1" />
	</s:url>
	<s:url var="sellProperty" action="changePropertyStatus" escapeAmp="false">
		<s:param name="propertyID" value="%{id}" />
		<s:param name="newStatus" value="3" />
	</s:url>
	<s:url var="rentProperty" action="changePropertyStatus" escapeAmp="false">
		<s:param name="propertyID" value="%{id}" />
		<s:param name="newStatus" value="4" />
	</s:url>
	<s:url var="deactivateProperty" action="changePropertyStatus" escapeAmp="false">
		<s:param name="propertyID" value="%{id}" />
		<s:param name="newStatus" value="5" />
	</s:url>
	<s:url var="preEditProperty" action="preEditProperty">
		<s:param name="propertyID" value="%{id}" />
	</s:url>
	<s:url var="getPropertyDetails" action="getPropertyDetails" method="getPropertyDetails">
		<s:param name="propertyID" value="%{id}" />
	</s:url>
	<s:url var="deleteProperty" action="deleteProperty">
		<s:param name="propertyID" value="%{id}" />
	</s:url>
	<tr>
		<th colspan="2"><s:text name="itemNo" /> <s:property value="id" /></th>
		<th colspan="2"><s:property value="propertyType.englishName" /> - <s:property value="title" /></th><th><s:text name="propertyFor" /> <s:property value="getText('propertyfor.'+propertyFor)" /></th>
	</tr>
	<tr>
		<td rowspan="4" width="160">
			<sj:a href="%{getPropertyDetails}" indicator="indicator" targets="bodyID">
		<%-- <img border="0" class="watermark" src='displayPropertyImage!displayPropertyImage?prpID=<s:property value="id" />&imgNo=1' width="160" height="160" align="right"/> --%>
				<s:if test="%{imageCount>0}">
					<img border="0" class="watermark" src='/static/prop_img/<s:property value="id" />/1.jpg' width="160" height="160" align="right"/>
				</s:if>
				<s:else>
					<img border="0" src='/static/images/home.jpg' width="160" height="160" align="right"/>
				</s:else>
			</sj:a>
		</td>
		<td rowspan="4" style="padding: 5 5 5 5;width: 400px;" > <div style="overflow: hidden;max-height:160px;max-width:370px;"> <s:property value="description" /> </div> </td>
		<td><s:text name="area" />: <s:property value="area" /> <s:text name="area.unit" /></td>
		<td><s:text name="price" />: <s:property value="price" /> <s:text name="price.unit" /></td>
	</tr>
	<tr>
		<td><s:text name="createdBy.fullName" />: <s:property value="createdBy.fullName" /></td><td><s:text name="createdBy.mobile" />: <s:property value="createdBy.mobile" /></td>
	</tr>
	<tr>
		<td colspan="2"><s:text name="createdBy.email" />: <a href='mailto:<s:property value="createdBy.email" />'><s:property value="createdBy.email" /></a></td>
	</tr>
	<tr>
		<td colspan="2">
			<sj:a href="%{getPropertyDetails}" indicator="indicator" targets="bodyID"></sj:a>
		</td>
	</tr>	
</table>
 </s:iterator>

