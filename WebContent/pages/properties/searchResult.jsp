<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>

<script type="text/javascript" src="/easypaginate/js/easypaginate.min.js"></script>
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
<s:url var="preSearch" action="preSearchProperty" method="preSearchProperty"/>
<sj:a id="advSearchTop"  indicator="indicator" href="%{preSearch}" targets="bodyID" button="true"><s:text name="welcome.advancedsearch" /></sj:a>
<hr>
<s:if test="hasActionMessages()">
   <h3 style="color: green"><s:actionmessage /></h3>
</s:if>
<s:form id="resultForm" action="batchEdit" method="POST" theme="simple">
<input type="hidden" name="action" />
<s:if test="%{getPropertiesList().size()==0}">
<table><tr><td><s:text name="err.search.empty" /></td></tr></table>
</s:if>
<s:else>
<s:if test="%{#session.userInfo!=null && #session.userInfo.roleID==1}">
<span style="width:100%">
<sj:submit id="addToFavTop" indicator="indicator" value="%{getText('action.addToFavorites')}" targets="bodyID" onclick="changeStatus(-1)"/>
<sj:submit id="activateTop" indicator="indicator" value="%{getText('action.activate')}" targets="bodyID" onclick="changeStatus(1)"/>
<sj:submit id="approveTop" indicator="indicator" value="%{getText('action.approve')}" targets="bodyID" onclick="changeStatus(2)" />
<sj:submit id="sellTop"  indicator="indicator" value="%{getText('action.sell')}" targets="bodyID" onclick="changeStatus(3)"/>
<sj:submit id="rentTop"  indicator="indicator" value="%{getText('action.rent')}" targets="bodyID" onclick="changeStatus(4)"/>
<sj:submit id="deactivateTop" indicator="indicator" value="%{getText('action.deactivate')}" targets="bodyID" onclick="changeStatus(5)"/>
</span>
</s:if>
<hr />
<div id="items">
<s:iterator value="propertiesList">
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
		<td rowspan="4">
		<s:if test="%{#session.userInfo!=null && #session.userInfo.roleID==1}" >
			<input type="checkbox" name="propertyID" value='<s:property value="%{id}" />' /><br/>
			<sj:a href="%{preEditProperty}" targets="bodyID" indicator="indicator"><s:text name="action.edit" /></sj:a><br/>
			<s:if test="%{status==1}">
				<sj:a href="%{approveProperty}" indicator="indicator" targets="bodyID"><s:text name="action.approve" /></sj:a><br/>
			</s:if>
			<s:if test="%{status==2}">
				<sj:a href="%{sellProperty}" indicator="indicator" targets="bodyID"><s:text name="action.sell" /></sj:a><br/>
				<sj:a href="%{rentProperty}" indicator="indicator" openDialog="rental" targets="bodyID"><s:text name="action.rent" /></sj:a><br/>
			</s:if>
			<s:if test="%{status==5}">
				<sj:a href="%{activateProperty}" indicator="indicator" targets="bodyID"><s:text name="action.activate" /></sj:a><br/>
				<sj:a href="%{deleteProperty}" indicator="indicator"  targets="bodyID" onclick="return confirmDelete();"><s:text name="action.delete" /></sj:a><br/>
			</s:if>
			<s:if test="%{status!=5}">
				<sj:a href="%{deactivateProperty}" indicator="indicator" targets="bodyID"><s:text name="action.deactivate" /></sj:a>
			</s:if>
		</s:if>
		</td>
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
			<b id="moreID_<s:property value="id" />" onclick="showHideDetails(this)"><s:text name="property.moreInfo" /></b>
			
		</td>
	</tr>	
</table>
<div>
<div class="more-div ui-widget-content ui-corner-all" id="div_moreID_<s:property value="id" />"  >
		<table>
			<tr >
				<th><s:text name="propertyType"/></th>
				<td><s:property value="propertyType.fullName" /></td>
				<th><s:text name="propertyFor" /></th>
				<td><s:property value="getText('propertyfor.'+propertyFor)" /></td>
			</tr>
			<s:if test="%{propertyType.id==1}">
			<tr >	
				<th><s:text name="subtype"/></th>
				<td colspan="3"><s:property value="getText('aprt.subtype.'+subtype)" /></td>
			</tr>
			</s:if>
			<s:elseif test="%{propertyType.id==2}">
			<tr >	
				<th><s:text name="subtype"/></th>
				<td colspan="3"><s:property value="getText('villa.subtype.'+subtype)" /></td>
			</tr>
			</s:elseif>
			<tr >	
				<th><s:text name="desciption" /></th>
				<td rowspan="4" style="padding: 5 5 5 5;width: 400px;" > <div style="overflow: visible;max-height:160px;max-width:370px;"> <s:property value="description" /> </div> </td>
				<th><s:text name="area" /></th>
				<td rowspan="4"><s:property value="area" /></td>
			</tr>
			<tr><td></td></tr>
			<tr><td></td></tr>
			<tr><td></td></tr>
			<tr >
				<th><s:text name="floorNo" /></th>
				<td><s:property value="floorNo" /></td>
				<th><s:text name="bedrooms.No" /></th>
				<td><s:property value="noOfBedRooms" /></td>
			</tr>
			<tr >
				<th><s:text name="hallrooms.No" /></th>
				<td><s:property value="noOfHallRooms" /></td>
				<th><s:text name="bathrooms.No" /></th>
				<td><s:property value="noOfBathRooms" /></td>
			</tr>
			<tr >
				<th><s:text name="furn.sts"/></th>
				<td><s:property value="getText('aprt.furn.sts.'+furnitureStatus)" /></td>
				<th><s:text name="finish.sts"/></th>
				<td><s:property value="getText('finish.sts.'+finishingStatus)" /></td>
			</tr>
			<tr >
				<th><s:text name="price"/></th>
				<td colspan="3"><s:property value="price"/> <s:text name="price.unit" /></td>
			</tr>
		</table>
</div>
</div>
</s:iterator> 
</div><br />   		
<hr />
<s:if test="%{#session.userInfo!=null && #session.userInfo.roleID==1}" >
<span style="width:100%">
<sj:submit id="addToFavBtm" value="%{getText('action.addToFavorites')}" targets="bodyID" onclick="changeStatus(-1)"/>
<sj:submit id="activateBtm" value="%{getText('action.activate')}" targets="bodyID" onclick="changeStatus(1)"/>
<sj:submit id="approveBtm" value="%{getText('action.approve')}" targets="bodyID" onclick="changeStatus(2)" />
<sj:submit id="sellBtm" value="%{getText('action.sell')}" targets="bodyID" onclick="changeStatus(3)"/>
<sj:submit id="rentBtm" value="%{getText('action.rent')}" targets="bodyID" onclick="changeStatus(4)"/>
<sj:submit id="deactivateBtm" value="%{getText('action.deactivate')}" targets="bodyID" onclick="changeStatus(5)"/>
</span>
</s:if>
</s:else>
</s:form>
<hr>

<script>
function confirmDelete(){
	return confirm('You are about to delete this item forever!');
}
function changeStatus(newStatus){
	document.getElementById('action').value=newStatus;
}
 
    function showHideDetails(S_H_obj)
    {
    //alert(S_H_obj.id);
     $('#div_'+S_H_obj.id).toggle('fast',function(){});
     $(this).toggleClass('#'+S_H_obj);return false;
    } 
</script>  