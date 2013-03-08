<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 //EN">
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<title><s:text name="itemNo" /> <s:property value="property.id" /> - <s:property value="property.description" /></title>
        <script src="/galleria/galleria-1.2.7.min.js"></script>
        <script src="/scripts/watermark.jquery.js"></script>
    	<h2><s:text name="property.details" /></h2>
	<fieldset>
		<legend><s:text name="property.upload.image"/></legend>
		<s:if test="%{property.imageCount>0}">
			<center>
			<div class="content">
		        <div id="galleria" style="width: 500px;">
		        <s:iterator var="index" begin="1" end="property.imageCount">
		            <img class="watermark" border="0" name="myImage" src='/prop_img/<s:property value="property.id" />/${index}.jpg' />
		        </s:iterator>    
		        </div>
			</div>  
			</center>      
		</s:if>
		<s:if test="%{property.videoLink!=null && property.videoLink.length>0}">
			<center>
				<iframe id="player" width="640" height="390" src='http://www.youtube.com/embed/<s:property value="property.videoLink" />?enablejsapi=1&origin=http://www.altagamo3.com' frameborder="0" ></iframe>
		  	</center>
	  	</s:if>
	</fieldset>
	<fieldset>
		<legend><s:text name="section.property.info" /></legend>
		<table class="propertyForm">
			<tr class="odd">
				<th><s:text name="propertyType"/></th>
				<td><s:property value="property.propertyType.fullName" /></td>
				<th><s:text name="propertyFor" /></th>
				<td><s:property value="getText('propertyfor.'+property.propertyFor)" /></td>
			</tr>
			<s:if test="%{property.propertyType.id==1}">
			<tr class="even">	
				<th><s:text name="subtype"/></th>
				<td colspan="3"><s:property value="getText('aprt.subtype.'+property.subtype)" /></td>
			</tr>
			</s:if>
			<s:elseif test="%{property.propertyType.id==2}">
			<tr class="even">	
				<th><s:text name="subtype"/></th>
				<td colspan="3"><s:property value="getText('villa.subtype.'+property.subtype)" /></td>
			</tr>
			</s:elseif>
			<tr class="odd">	
				<th><s:text name="desciption" /></th>
				<td><s:property value="property.description" /></td>
				<th><s:text name="area" /></th>
				<td><s:property value="property.area" /></td>
			</tr>
			<tr class="even">
				<th><s:text name="floorNo" /></th>
				<td><s:property value="property.floorNo" /></td>
				<th><s:text name="bedrooms.No" /></th>
				<td><s:property value="property.noOfBedRooms" /></td>
			</tr>
			<tr class="odd">
				<th><s:text name="hallrooms.No" /></th>
				<td><s:property value="property.noOfHallRooms" /></td>
				<th><s:text name="bathrooms.No" /></th>
				<td><s:property value="property.noOfBathRooms" /></td>
			</tr>
			<tr class="even">
				<th><s:text name="furn.sts"/></th>
				<td><s:property value="getText('aprt.furn.sts.'+property.furnitureStatus)" /></td>
				<th><s:text name="finish.sts"/></th>
				<td><s:property value="getText('finish.sts.'+property.finishingStatus)" /></td>
			</tr>
		</table>
	</fieldset>
	<fieldset>
		<legend><s:text name="section.location.info" /></legend>
		<table class="propertyForm">
			<tr class="odd">
				<th><s:text name="location.country" /></th>
				<td><s:property value="property.country.englishName" /></td>
				<th><s:text name="location.state" /></th>
				<td><s:property value="property.state.englishName" /></td>
			</tr>
			<tr class="even">	
				<th><s:text name="location.city" /></th>
				<td><s:property value="property.city.englishName" /></td>	
				<th><s:text name="location.compound" /></th>
				<td><s:property value="property.compound.englishName" /></td>
			</tr>
			<tr class="odd">	
				<th><s:text name="location.district" /></th>
				<td><s:property value="property.district.englishName" /></td>
				<th><s:text name="location.zone" /></th>
				<td><s:property value="property.zone.englishName" /></td>
			</tr>
			<tr class="even">	
				<th><s:text name="location.subarea" /></th>
				<td colspan="3"><s:property value="property.subarea.englishName" /></td>
			</tr>
		</table>
	</fieldset>
	<fieldset>
		<legend><s:text name="section.contract.info"/></legend>
		<table class="propertyForm">
			<tr class="odd">
				<th><s:text name="price"/></th>
				<td colspan="3"><s:property value="property.price"/> <s:text name="price.unit" /></td>
			</tr>
			<tr class="even">	
				<th><s:text name="payment.type"/></th>
				<td><s:property value="getText('payment.type.'+property.paymentType)" /></td>	
				<th><s:text name="rental.period"/></th>
				<td><s:property value="getText('rental.period.'+property.rentalPeriod)" /></td>
			</tr>
			<tr class="odd">	
				<th><s:text name="pay.advance"/></th>
				<td><s:property value="property.paymentInAdvance" /> <s:text name="price.unit" /></td>
				<th><s:text name="total.installment.duration"/></th>
				<td><s:property value="property.installmentTotalDuration" /> <s:text name="duration.unit" /></td>
			</tr>
		</table>
	</fieldset>
	<s:if test="%{#session.userInfo!=null&&#session.userInfo.roleID==1}" >
	<fieldset>
		<legend><s:text name="section.owner.info"/></legend>
		<table class="propertyForm">
			<tr class="odd">
				<th><s:text name="owner.name"/></th>
				<td><s:property value="property.client.username" /></td>
				<th><s:text name="owner.mobile"/></th>
				<td><s:property value="property.client.mobile" /></td>
			</tr>
			<tr class="even">	
				<th><s:text name="owner.email"/></th>
				<td><s:property value="property.client.email" /></td>
				<th><s:text name="owner.address"/></th>
				<td><s:property value="property.client.address" /></td>
			</tr>
		</table>
	</fieldset>
	</s:if>
	
	<s:if test="%{property.imageCount>0}">
        <script>
            Galleria.loadTheme('/galleria/themes/classic/galleria.classic.min.js');
            Galleria.run('#galleria');
        </script>
    </s:if>    