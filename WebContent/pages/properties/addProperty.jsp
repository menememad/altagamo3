<!DOCTYPE HTML>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
 
<div id="container" dir='${dir}'> 
	<h2><s:text name="title.property.addNew" /></h2>
	<s:form id="addPropertyForm" action="addProperty" method="POST" theme="simple">
	<s:url includeContext="false" id="listPropertiesData" action="listPropertyTypes" method="listPropertyTypes"/>
		<s:if test="hasFieldErrors()">
		 	<img src='<s:url includeContext="false" value="/res/tgm3/images/signs/error.gif" />' /><h3 style="color: red"><s:text name="err.message" /></h3>
		   	<s:fielderror />
		</s:if>
		<s:elseif test="hasActionErrors()">
			<img src='<s:url includeContext="false" value="/res/tgm3/images/signs/error.gif" />' /> <h3 style="color: red"><s:text name="err.message" /></h3>
		   	<s:actionerror />
		</s:elseif>
		<s:elseif test="hasActionMessages()">
		   <img src='<s:url includeContext="false" value="/res/tgm3/images/signs/success.gif" />' /><h3 style="color: green"><s:actionmessage /></h3>
		</s:elseif>
	<fieldset>
		<legend><s:text name="section.property.info" /></legend>
		<table class="propertyForm">
			<tr class="even">
				<td width="10%"><s:text name="propertyTitle"/> <s:text name="required.flag" /></td>
				<td width="30%"><s:textfield id="title" name="property.title" maxlength="70"/></td>
				<td colspan="4" width="60%"><span class="hint"><s:text name="hint.propertyTitle"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="odd">
				<td width="10%"><s:text name="propertyType"/> <s:text name="required.flag" /></td>
				<td width="30%"><sj:select href="%{listPropertiesData}" id="propertyType" name="property.propertyType.id" list="propertyTypesMap" emptyOption="false" headerKey="-1" required="true" requiredposition="right" onChangeTopics="propertyTypeChanged" /></td>
				<td width="10%"><span class="hint"><s:text name="hint.propertyType"/><span class="hint-pointer">&nbsp;</span></span></td>
				<td width="10%"><s:text name="propertyFor" /> <s:text name="required.flag" /></td>
				<td width="30%"><sj:radio id="propertyFor" name="property.propertyFor" list="#{1:getText('propertyfor.'+1),2:getText('propertyfor.'+2),3:getText('propertyfor.'+3)}" value="1" onChangeTopics="showRentSaleItems"/></td>
				<td width="10%"><span class="hint"><s:text name="hint.propertyFor"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="even subtype" id="subtype1">
				<td><s:text name="subtype"/> <s:text name="required.flag" /></td>
				<td colspan="4"><s:radio id="property.subtype" name="aprtSubtype" list="#{1:getText('aprt.subtype.'+1),2:getText('aprt.subtype.'+2),3:getText('aprt.subtype.'+3),4:getText('aprt.subtype.'+4),5:getText('aprt.subtype.'+5),6:getText('aprt.subtype.'+6)}" value="1"/></td>
				<td colspan="1"><s:fielderror fieldName="property.subtype" /><span class="hint"><s:text name="hint.subtype"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="even subtype" id="subtype2">
				<td><s:text name="subtype"/> <s:text name="required.flag" /></td>
				<td colspan="3"><s:radio name="villaSubtype" list="#{1:getText('villa.subtype.'+1),2:getText('villa.subtype.'+2),3:getText('villa.subtype.'+3)}" /></td>
				<td colspan="2"><s:fielderror fieldName="property.subtype" /><span class="hint"><s:text name="hint.subtype"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="odd">
				<td><s:text name="desciption" /> <s:text name="required.flag" /></td>
				<td colspan="2"><s:textarea id="description" name="property.description" resizable="true" rows="5" cols="50" /></td>
				<td><s:text name="area" /></td>
				<td><sj:textfield id="area" name="property.area" maxlength="7" size="10"/><s:text name="area.unit" /></td>
				<td><s:fielderror fieldName="property.area" /><span class="hint"><s:text name="hint.area"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="even">
				<td class="floorNo"><s:text name="floorNo" /></td>
				<td width="30%" class="floorNo"><sj:textfield id="floorNo" name="property.floorNo" maxlength="3" size="5"/></td>
				<td class="floorNo"><s:fielderror fieldName="property.floorNo" /><span class="hint"><s:text name="hint.floorNo"/><span class="hint-pointer">&nbsp;</span></span></td>
				<td class="rooms"><s:text name="bedrooms.No" /></td>
				<td width="30%" class="rooms"><sj:textfield name="property.noOfBedRooms" maxlength="3" size="5"/></td>
				<td class="rooms"><s:fielderror fieldName="property.noOfBedRooms" /><span class="hint"><s:text name="hint.bedrooms.No"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="odd">
				<td class="rooms"><s:text name="hallrooms.No" /></td>
				<td class="rooms"><sj:textfield name="property.noOfHallRooms" maxlength="3" size="5"/></td>
				<td class="rooms"><s:fielderror fieldName="property.noOfHallRooms" /><span class="hint"><s:text name="hint.hallrooms.No"/><span class="hint-pointer">&nbsp;</span></span></td>
				<td class="rooms"><s:text name="bathrooms.No" /></td>
				<td class="rooms"><sj:textfield name="property.noOfBathRooms" maxlength="2" size="5"/></td>
				<td class="rooms"><s:fielderror fieldName="property.noOfBathRooms" /><span class="hint"><s:text name="hint.bathrooms.No"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="even">
				<td class="furnitureStatus"><s:text name="furn.sts"/></td>
				<td width="30%" class="furnitureStatus"><s:radio name="property.furnitureStatus" list="#{1:getText('aprt.furn.sts.'+1),2:getText('aprt.furn.sts.'+2),3:getText('aprt.furn.sts.'+3)}" value="3"/></td>
				<td class="furnitureStatus"><span class="hint"><s:text name="hint.furn.sts"/><span class="hint-pointer">&nbsp;</span></span></td>
				<td class="finishingStatus"><s:text name="finish.sts"/></td>
				<td width="30%" class="finishingStatus"><s:radio name="property.finishingStatus" list="#{1:getText('finish.sts.'+1),2:getText('finish.sts.'+2),3:getText('finish.sts.'+3)}" value="3"/></td>
				<td class="finishingStatus"><span class="hint"><s:text name="hint.finish.sts"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
		</table>
	</fieldset>
	<fieldset>
		<legend><s:text name="property.upload.image"/></legend>
		<table class="propertyForm">
			<tr class="odd">
				<td colspan="6">
					<sj:a indicator="indicator" href="openUploadAttachedFile" targets="openUploadAttachedFileID" >
						<img border="0" src='<s:url includeContext="false" value="/res/tgm3/images/attachement.jpg" />' width="16" height="16" />
						<s:text name="attach.file.title" />
					</sj:a>	
					<sj:div id="openUploadAttachedFileID" ></sj:div>	
				</td>
			</tr>
			<tr class="even">
				<td><s:text name="videolink"/></td>
				<td colspan="3" width="30%">http://www.youtube.com/watch?v=<s:textfield name="property.videoLink" maxlength="30"/></td>
				<td colspan="2"><span class="hint"><s:text name="hint.videolink"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
		</table>
	</fieldset>
	<fieldset>
		<legend><s:text name="section.location.info" /></legend>
		<table class="propertyForm">
			<tr class="odd">
				<td width="10%"><s:text name="location.country" /> <s:text name="required.flag" /></td>
				<td width="30%"><sj:select href="listCountries" id="country" name="property.country.id" list="countriesList" listKey="id" listValue="fullName" emptyOption="false" headerValue="-- Select Country --" headerKey="-1" onChangeTopics="reloadStatesList" /></td>
				<td width="10%"><s:fielderror fieldName="property.country.id" /><span class="hint"><s:text name="hint.location.country"/><span class="hint-pointer">&nbsp;</span></span></td>
				<td width="10%"><s:text name="location.state" /> <s:text name="required.flag" /></td>
				<td width="30%"><sj:select href="listStates" id="state" name="property.state.id" list="statesList" listKey="id" listValue="fullName" emptyOption="false" headerValue="-- Select State --" headerKey="-1" reloadTopics="reloadStatesList" onChangeTopics="reloadCitiesList" /></td>
				<td width="10%"><s:fielderror fieldName="property.state.id" /><span class="hint"><s:text name="hint.location.state"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="even">
				<td width="10%"><s:text name="location.city" /> <s:text name="required.flag" /></td>
				<td width="30%"><sj:select href="listCities" id="city" name="property.city.id" list="citiesList" listKey="id" listValue="fullName" emptyOption="false" headerValue="-- Select City --" headerKey="-1" reloadTopics="reloadCitiesList" onChangeTopics="reloadCompoundsList,reloadDistrictsList" required="true"/></td>
				<td width="10%"><s:fielderror fieldName="property.city.id" /><span class="hint"><s:text name="hint.location.city"/><span class="hint-pointer">&nbsp;</span></span></td>
				<td width="10%"><s:text name="location.compound" /></td>
				<td width="30%"><sj:select href="listCompounds" id="compound" name="property.compound.id" list="compoundsList" listKey="id" listValue="fullName" emptyOption="false" headerValue="-- Select Compound --" headerKey="-1" reloadTopics="reloadCompoundsList" onChangeTopics="disableAllOthers"/></td>
				<td width="10%"><span class="hint"><s:text name="hint.location.compound"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="odd otherLocationData">
				<td width="10%"><s:text name="location.district" /></td>
				<td width="30%"><sj:select href="listDistricts" id="district" name="property.district.id" list="districtsList" listKey="id" listValue="fullName" emptyOption="false" headerValue="-- Select District --" headerKey="-1" reloadTopics="reloadDistrictsList" onChangeTopics="reloadZonesList" /></td>
				<td width="10%"><span class="hint"><s:text name="hint.location.district"/><span class="hint-pointer">&nbsp;</span></span></td>
				<td width="10%"><s:text name="location.zone" /></td>
				<td width="30%"><sj:select href="listZones" id="zone" name="property.zone.id" list="zonesList" listKey="id" listValue="fullName" emptyOption="false" headerValue="-- Select Zone --" headerKey="-1" reloadTopics="reloadZonesList" onChangeTopics="reloadSubareasList" /></td>
				<td width="10%"><span class="hint"><s:text name="hint.location.zone"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="even otherLocationData">
				<td width="10%"><s:text name="location.subarea" /></td>
				<td colspan="3" width="30%"><sj:select href="listSubareas" cssClass="otherLocationData" id="subarea" name="property.subarea.id" list="subareasList" listKey="id" listValue="fullName" emptyOption="false" headerValue="-- Select Subarea --" headerKey="-1" reloadTopics="reloadSubareasList"/></td>
				<td colspan="2" width="10%"><span class="hint"><s:text name="hint.location.subarea"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
		</table>
	</fieldset>
	<fieldset>
		<legend><s:text name="section.contract.info"/></legend>
		<table class="propertyForm">
			<tr class="odd">
				<td width="10%"><s:text name="price"/></td>
				<td colspan="3" width="30%"><sj:textfield id="price" name="property.price" maxlength="10" size="10"/><s:text name="price.unit" /></td>
				<td colspan="2" width="10%"><s:fielderror fieldName="property.price" /><span class="hint"><s:text name="hint.price"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="even">
				<td class="paymentType" width="10%"><s:text name="payment.type"/></td>
				<td class="paymentType" width="30%"><sj:radio id="paymentType" name="property.paymentType" list="#{1:getText('payment.type.'+1),2:getText('payment.type.'+2)}" value="1" onChangeTopics="reloadPaymentOptions"/></td>
				<td class="paymentType" width="10%"><span class="hint"><s:text name="hint.payment.type"/><span class="hint-pointer">&nbsp;</span></span></td>
				<td class="rentalPeriod" width="10%"><s:text name="rental.period"/></td>
				<td class="rentalPeriod" width="30%"><s:radio name="property.rentalPeriod" list="#{1:getText('rental.period.'+1),2:getText('rental.period.'+2),3:getText('rental.period.'+3),4:getText('rental.period.'+4),5:getText('rental.period.'+5),6:getText('rental.period.'+6)}" value="3"/></td>
				<td class="rentalPeriod" width="10%"><span class="hint"><s:text name="hint.rental.period"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="odd">
				<td class="paymentInAdvance" width="10%"><s:text name="pay.advance"/></td>
				<td class="paymentInAdvance" width="30%"><sj:textfield id="paymentInAdvance" name="property.paymentInAdvance" maxlength="8" size="10"/></td>
				<td class="paymentInAdvance" width="10%"><s:fielderror fieldName="property.paymentInAdvance" /><span class="hint"><s:text name="hint.pay.advance"/><span class="hint-pointer">&nbsp;</span></span></td>
				<td class="installmentDuration" width="10%"><s:text name="total.installment.duration"/></td>
				<td class="installmentDuration" width="30%"><sj:textfield name="property.installmentTotalDuration" maxlength="2"/><s:text name="duration.unit"/></td>
				<td class="installmentDuration" width="10%"><s:fielderror fieldName="property.installmentTotalDuration" /><span class="hint"><s:text name="hint.total.installment.duration"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
		</table>
	</fieldset>
	<fieldset>
		<legend><s:text name="section.owner.info"/></legend>
		<table class="propertyForm">
			<tr class="odd">
				<td width="10%"><s:text name="owner.name"/> <s:text name="required.flag" /></td>
				<td width="30%"><sj:textfield name="property.client.username" maxlength="40"/></td>
				<td width="10%"><s:fielderror fieldName="property.client.username" /><span class="hint"><s:text name="hint.owner.name"/><span class="hint-pointer">&nbsp;</span></span></td>
				<td width="10%"><s:text name="owner.email"/></td>
				<td width="30%"><sj:textfield name="property.client.email" maxlength="40" size="50"/></td>
				<td width="10%"><s:fielderror fieldName="property.client.email" /><span class="hint"><s:text name="hint.owner.email"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
			<tr class="even">
				<td width="10%"><s:text name="owner.mobile"/></td>
				<td width="30%"><sj:textfield name="property.client.mobile" maxlength="40"/></td>
				<td width="10%"><s:fielderror fieldName="property.client.mobile" /><span class="hint"><s:text name="hint.owner.mobile"/><span class="hint-pointer">&nbsp;</span></span></td>
				<td width="10%"><s:text name="owner.address"/></td>
				<td width="30%"><sj:textarea name="property.client.address" resizable="true" rows="5" cols="50" /></td>
				<td width="10%"><span class="hint"><s:text name="hint.owner.address"/><span class="hint-pointer">&nbsp;</span></span></td>
			</tr>
		</table>
	</fieldset>
	<p class="submit"><sj:submit indicator="indicator" targets="bodyID" button="true" key="Submit" onclick="window.location.href='#top';"/></p>
</s:form>	
</div>
<script>
function prepareInputsForHints() {
	var inputs = document.getElementsByTagName("input");
	for (var i=0; i<inputs.length; i++){
		// test to see if the hint span exists first
		if (inputs[i].parentNode.getElementsByTagName("span")[0]) {
			// the span exists!  on focus, show the hint
			//alert("this.parentNode");
			inputs[i].onfocus = function () {
				this.parentNode.getElementsByTagName("span")[0].style.display = "inline";
				//alert("hi2");
			}
			// when the cursor moves away from the field, hide the hint
			inputs[i].onblur = function () {
				this.parentNode.getElementsByTagName("span")[0].style.display = "none";
				//alert("hi3");
			}
		}
	}
	// repeat the same tests as above for selects
	var selects = document.getElementsByTagName("select");
	for (var k=0; k<selects.length; k++){
		if (selects[k].parentNode.getElementsByTagName("span")[0]) {
			selects[k].onfocus = function () {
				this.parentNode.getElementsByTagName("span")[0].style.display = "inline";
			}
			selects[k].onblur = function () {
				this.parentNode.getElementsByTagName("span")[0].style.display = "none";
			}
		}
	}
}
prepareInputsForHints();
if($("#propertyType option:selected").val()==''){
	$('.subtype').hide();
	$('#subtypeLabel1').show();
	$('#subtype1').show();
	$('#property.subtype').val('1');
}
$.subscribe('propertyTypeChanged', function(event,data) {
	$('.subtype').hide();
	$('.floorNo').hide();
	$('.rooms').hide();
	$('.furnitureStatus').hide();
	$('.finishingStatus').hide();
	if($("#propertyType option:selected").val()=='1'){	
		$('#subtype1').show();
		$('#subtypeLabel1').show();
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
$.subscribe('reloadPaymentOptions', function(event,data) {
	if($("#paymentType input:checked").val()=='1'){//Cash
		$('.paymentInAdvance').hide();
		$('.installmentDuration').hide();
	}else if($("#paymentType input:checked").val()=='2'){//Installment
		$('.paymentInAdvance').show();
		$('.installmentDuration').show();
	}
});
</script>