<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<style>
table.search tr th,td{
font-family: Tahoma;
font-size: 10pt;
text-align: left;
}
table.search tr th{
width: 200px;
}
</style>
<h2><s:text name="welcome.advancedsearch" /></h2>
<s:if test="hasFieldErrors()">
   <h3 style="color: red"><s:text name="err.message" /></h3>
</s:if>
<s:elseif test="hasActionErrors()">
   <h3 style="color: red"><s:text name="err.message" /></h3>
   <s:actionerror />
</s:elseif>
<s:elseif test="hasActionMessages()">
   <h3 style="color: green"><s:actionmessage /></h3>
</s:elseif>
	<s:form id="searchPropertyForm" action="searchProperty" method="POST" theme="simple">
	<s:url id="listPropertiesData" action="listPropertyTypes" method="listPropertyTypes"/>
	<fieldset style="patding: 0 10 0 10;margin: 10 10 10 10;">
		<legend><s:text name="section.property.info" /></legend>
		<table class="search">
		<tr>
			<th><s:text name="propertyType"/></th>
			<td colspan="3">
				<sj:select href="%{listPropertiesData}" id="propertyType" name="propertyTypeID" list="propertyTypesMap" emptyOption="false" headerKey="-1" required="true" requiredposition="right" onChangeTopics="propertyTypeChanged" />
			</td>
		</tr>
		<tr>	
			<th><s:text name="propertyFor" /></th>
			<td colspan="3">
				<sj:radio id="propertyFor" name="propertyFor" list="#{1:getText('propertyfor.'+1),2:getText('propertyfor.'+2),3:getText('propertyfor.'+3)}" value="1" onChangeTopics="showRentSaleItems"/>
			</td>
		</tr>
		<tr class="subtype" id="subtype1">
			<th><s:text name="subtype"/></th>
			<td colspan="3">
				<s:checkboxlist name="subtype" list="#{1:getText('aprt.subtype.'+1),2:getText('aprt.subtype.'+2),3:getText('aprt.subtype.'+3),4:getText('aprt.subtype.'+4),5:getText('aprt.subtype.'+5),6:getText('aprt.subtype.'+6)}" />
			</td>
		</tr>
		<tr class="subtype" id="subtype2">
			<th><s:text name="subtype"/></th>
			<td colspan="3">
				<s:checkboxlist name="subtype" list="#{1:getText('villa.subtype.'+1),2:getText('villa.subtype.'+2),3:getText('villa.subtype.'+3)}" />
			</td>
		</tr>
		<tr>	
			<th><s:text name="desciption" /></th>
			<td colspan="3">
				<sj:textarea id="description" name="description" resizable="true" rows="5" cols="50"/>
			</td>
		</tr>
		<tr>
			<th><s:text name="area" /></th>
			<td>
				<s:text name="range.from" />
				<sj:textfield id="minArea" name="minArea" maxlength="7" size="10"/><s:text name="area.unit" />
			</td>
			<td>
				<s:text name="range.to" />
				<sj:textfield id="maxArea" name="maxArea" maxlength="7" size="10"/><s:text name="area.unit" />
			</td>
			<td>
				<s:fielderror fieldName="minArea" />&nbsp;<s:fielderror fieldName="maxArea" />
			</td>
		</tr>
		<tr class="floorNo">	
			<th><s:text name="floorNo" /></th>
			<td>
				<s:text name="range.from" />
				<sj:textfield id="minFloorNo" name="minFloorNo" maxlength="3" size="5"/>
			</td>
			<td>
				<s:text name="range.to" />
				<sj:textfield id="maxFloorNo" name="maxFloorNo" maxlength="3" size="5"/>
			</td>
			<td>
				<s:fielderror fieldName="minFloorNo" />&nbsp;<s:fielderror fieldName="maxFloorNo" />
			</td>
		</tr>
		<tr class="rooms">	
			<th><s:text name="bedrooms.No" /></th>
			<td>
				<s:text name="range.from" />
				<sj:textfield name="minNoOfBedRooms" maxlength="3" size="5"/>
			</td>
			<td>
				<s:text name="range.to" />
				<sj:textfield name="maxNoOfBedRooms" maxlength="3" size="5"/>
			</td>
			<td>
				<s:fielderror fieldName="minNoOfBedRooms" />&nbsp;<s:fielderror fieldName="maxNoOfBedRooms" />
			</td>
		</tr>
		<tr class="rooms">	
			<th><s:text name="hallrooms.No" /></th>
			<td>
				<s:text name="range.from" />
				<sj:textfield name="minNoOfHallRooms" maxlength="3" size="5"/>
			</td>
			<td>
				<s:text name="range.to" />
				<sj:textfield name="maxNoOfHallRooms" maxlength="3" size="5"/>
			</td>
			<td>
				<s:fielderror fieldName="minNoOfHallRooms" />&nbsp;<s:fielderror fieldName="maxNoOfHallRooms" />
			</td>
		</tr>
		<tr class="rooms">	
			<th><s:text name="bathrooms.No" /></th>
			<td>
				<s:text name="range.from" />
				<sj:textfield name="minNoOfBathRooms" maxlength="3" size="5"/>
			</td>
			<td>
				<s:text name="range.to" />
				<sj:textfield name="maxNoOfBathRooms" maxlength="3" size="5"/>
			</td>
			<td>
				<s:fielderror fieldName="minNoOfBathRooms" />&nbsp;<s:fielderror fieldName="maxNoOfBathRooms" />
			</td>
		</tr>
		<tr class="furnitureStatus">
			<th><s:text name="furn.sts"/></th>
			<td colspan="3">		
				<s:checkboxlist name="furnitureStatus" list="#{1:getText('aprt.furn.sts.'+1),2:getText('aprt.furn.sts.'+2),3:getText('aprt.furn.sts.'+3)}" />	
			</td>
		</tr>
		<tr class="finishingStatus">
			<th><s:text name="finish.sts"/></th>
			<td colspan="3">		
				<s:checkboxlist name="finishingStatus" list="#{1:getText('finish.sts.'+1),2:getText('finish.sts.'+2),3:getText('finish.sts.'+3)}" />	
			</td>
		</tr>
	</table>
	</fieldset>
	<fieldset>
		<legend><s:text name="section.location.info" /></legend>
		<table class="search">
		<tr>
			<th><s:text name="location.country" /></th>
			<td>
				<sj:select href="listCountries" id="country" name="property.country.id" list="countriesList" listKey="id" listValue="fullName" emptyOption="false" headerValue="-- Select Country --" headerKey="-1" onChangeTopics="reloadStatesList" />
			</td>
			<th><s:text name="location.state" /></th>
			<td>
				<sj:select href="listStates" id="state" name="property.state.id" list="statesList" listKey="id" listValue="fullName" emptyOption="false" headerValue="-- Select State --" headerKey="-1" reloadTopics="reloadStatesList" onChangeTopics="reloadCitiesList" />
			</td>
		</tr>
		<tr>
			<th><s:text name="location.city" /></th>
			<td>
				<sj:select href="listCities" id="city" name="property.city.id" list="citiesList" listKey="id" listValue="fullName" emptyOption="false" headerValue="-- Select City --" headerKey="-1" reloadTopics="reloadCitiesList" onChangeTopics="reloadCompoundsList,reloadDistrictsList" required="true"/>
			</td>	
			<th><s:text name="location.compound" /></th>
			<td>
				<sj:select href="listCompounds" id="compound" name="property.compound.id" list="compoundsList" listKey="id" listValue="fullName" emptyOption="false" headerValue="-- Select Compound --" headerKey="-1" reloadTopics="reloadCompoundsList" onChangeTopics="disableAllOthers"/>
			</td>
		</tr>
		<tr>
			<th class="otherLocationData"><s:text name="location.district" /></th>
			<td class="otherLocationData">
				<sj:select href="listDistricts" id="district" name="property.district.id" list="districtsList" listKey="id" listValue="fullName" emptyOption="false" headerValue="-- Select District --" headerKey="-1" reloadTopics="reloadDistrictsList" onChangeTopics="reloadZonesList" />
			</td>
			<th class="otherLocationData"><s:text name="location.zone" /></th>
			<td class="otherLocationData">
				<sj:select href="listZones" id="zone" name="property.zone.id" list="zonesList" listKey="id" listValue="fullName" emptyOption="false" headerValue="-- Select Zone --" headerKey="-1" reloadTopics="reloadZonesList" onChangeTopics="reloadSubareasList" />
			</td>
		</tr>
		<tr>
			<th class="otherLocationData"><s:text name="location.subarea" /></th>
			<td class="otherLocationData">
				<sj:select href="listSubareas" cssClass="otherLocationData" id="subarea" name="property.subarea.id" list="subareasList" listKey="id" listValue="fullName" emptyOption="false" headerValue="-- Select Subarea --" headerKey="-1" reloadTopics="reloadSubareasList"/>
			</td>
		</tr>
		</table>
	</fieldset>
	<fieldset>
		<legend><s:text name="section.contract.info"/></legend>
		<table class="search">
		<tr>
			<th><s:text name="price"/></th>
			<td>
				<s:text name="range.from" />
				<sj:textfield id="minPrice" name="minPrice" maxlength="10" size="10"/><s:text name="price.unit" />
			</td>
			<td>
				<s:text name="range.to" />
				<sj:textfield id="maxPrice" name="maxPrice" maxlength="10" size="10"/><s:text name="price.unit" />
			</td>
			<td>
				<s:fielderror fieldName="price" />
			</td>
		</tr>
		<tr class="rentalPeriod">
			<th><s:text name="rental.period"/></th>
			<td>
				<s:checkboxlist name="rentalPeriod" list="#{1:getText('rental.period.'+1),2:getText('rental.period.'+2),3:getText('rental.period.'+3),4:getText('rental.period.'+4),5:getText('rental.period.'+5),6:getText('rental.period.'+6)}"/>
			</td>
		</tr>
		<tr class="paymentType">	
			<th><s:text name="payment.type"/></th>
			<td>
				<sj:checkboxlist id="paymentType" name="paymentType" list="#{1:getText('payment.type.'+1),2:getText('payment.type.'+2)}" onChangeTopics="reloadPaymentOptions" />
			</td>
		</tr>		
<%-- 			<th class="paymentInAdvance"><s:text name="pay.advance"/></th>
			<td class="paymentInAdvance">
				<sj:textfield id="paymentInAdvance" name="paymentInAdvance" maxlength="8" size="10"/>
				<s:fielderror fieldName="paymentInAdvance" />
			</td>
			<th class="installmentDuration"><s:text name="total.installment.duration"/></th>
			<td class="installmentDuration">
				<sj:textfield name="installmentTotalDuration" maxlength="2"/><s:text name="duration.unit"/>
				<s:fielderror fieldName="installmentTotalDuration" />
			</td>
		</tr>
 --%>		</table>
	</fieldset>
<s:if test="%{#session.userInfo.roleID==1}" >
	<fieldset>
		<legend><s:text name="section.owner.info"/></legend>
		<table class="search">
		<tr>
			<th><s:text name="owner.name"/></th>
			<td colspan="3">
				<sj:textfield name="ownerName" maxlength="40"/>
			</td>
		</tr>
		<tr>
			<th><s:text name="owner.mobile"/></th>
			<td colspan="3">
				<sj:textfield name="ownerMobile" maxlength="40"/>
				<s:fielderror fieldName="ownerMobile" />
			</td>
		</tr>
		<tr>
			<th><s:text name="owner.email"/></th>
			<td colspan="3">
				<sj:textfield name="ownerEmail" maxlength="40"/>
				<s:fielderror fieldName="ownerEmail" />
			</td>
		</tr>
		<tr>
			<th><s:text name="owner.address"/></th>
			<td colspan="3">
				<sj:textarea name="ownerAddress" resizable="true" rows="5" cols="50" />
			</td>
		</tr>
		</table>
	</fieldset>
</s:if>	
	<p class="submit"><sj:submit targets="bodyID" indicator="indicator" value="%{getText('SEARCH')}" button="true"/></p>
</s:form>	

<tr><th colspan="6"></th></tr>
<script>
if($("#propertyType option:selected").val()==''){
	$('.subtype').hide();
	$('#subtype1').show();
}
$.subscribe('propertyTypeChanged', function(event,data) {
	$('.subtype').hide();
	$('.floorNo').hide();
	$('.rooms').hide();
	$('.furnitureStatus').hide();
	$('.finishingStatus').hide();
	if($("#propertyType option:selected").val()=='1'){	
		$('#subtype1').show();
		$('.floorNo').show();
		$('.rooms').show();
		$('.furnitureStatus').show();
		$('.finishingStatus').show();
	}
	if($("#propertyType option:selected").val()=='2'){	
		$('#subtype2').show();
		$('#subtypeLabel2').show();
		$('.rooms').show();
		$('.furnitureStatus').show();
		$('.finishingStatus').show();
	}
	if($("#propertyType option:selected").val()=='3'){	
		$('.floorNo').show();
		$('.rooms').show();
		$('.furnitureStatus').show();
		$('.finishingStatus').show();
	}
	if($("#propertyType option:selected").val()=='13'){	
		$('.floorNo').show();
		$('.furnitureStatus').show();
		$('.finishingStatus').show();
	}

});
$.subscribe('disableAllOthers', function(event,data) {
	if($("#compound option:selected").val()=='-1'){
		$('.otherLocationData').show();
	}else{
		$('.otherLocationData').hide();
	}
});

$('.rentalPeriod').hide();
$.subscribe('showRentSaleItems', function(event,data) {
	if($("#propertyFor input:checked").val()=='1'){//Sale
		$('.rentalPeriod').hide();
		$('.paymentType').show();
	}else if($("#propertyFor input:checked").val()=='2'){//Rent
		$('.rentalPeriod').show();
		$('.paymentType').hide();
	}else if($("#propertyFor input:checked").val()=='3'){//Both
		$('.rentalPeriod').show();
		$('.paymentType').show();
	}
});
if($("#paymentType input:checked").val()=='1'){//Cash (Initially)
	$('.paymentInAdvance').hide();
	$('.installmentDuration').hide();
}
/* 
$.subscribe('reloadPaymentOptions', function(event,data) {
	if($("#paymentType input:checked").length==2){//Both Cash & Installment
		$('.paymentInAdvance').show();
		$('.installmentDuration').show();
	}else if($("#paymentType input:checked").length==0){//None
			$('.paymentInAdvance').hide();
			$('.installmentDuration').hide();
	}else if($("#paymentType input:checked").val()=='1'){//Cash
		$('.paymentInAdvance').hide();
		$('.installmentDuration').hide();
	}else if($("#paymentType input:checked").val()=='2'){//Installment
		$('.paymentInAdvance').show();
		$('.installmentDuration').show();
	}
});
 */
</script>