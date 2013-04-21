<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<title>Welcome to AlTagamo3.com Website</title>

<div id="welcome-part1" dir="ltr">			
	<table>
		<tr>
			<td valign="top" width="260">
				<table height="285">
					<tr>
						<td bgcolor="#99DDE0" valign="top" height="284">
							<table height="100%">
								<tr>
									<td>&nbsp;</td>
									<td bgcolor="#FFB00F" width="220" valign="top">
									<s:url var="listPropertiesData" action="listPropertyTypes" method="listPropertyTypes"/>
									<s:form id="searchPropertyForm" action="fastSearch" method="POST" theme="simple">
										<table cellpadding="5" height="91%">
											<tr>
												<th><font face="Arial" size="4" color="#AD7400"><s:text name="welcome.fastsearch" /></font></th>
											</tr>
											<tr>
												<td align="center">
												<p align="center">
												<sj:select id="propertyType" label="Property Type" name="propertyTypeID" href="%{listPropertiesData}" list="propertyTypesMap" />
												</td>
											</tr>
											<tr>
												<td align="center">
												<s:select name="propertyFor" id="propertyFor" list="#{1:getText('propertyfor.'+1),2:getText('propertyfor.'+2),3:getText('propertyfor.'+3)}"/>
												</td>
											</tr>
											<s:url id="listCairoLocations" action="listLocations" method="listLocations" />
											<s:hidden name="property.country.id" value="1" />
											<s:hidden name="property.state.id" value="1" />
											
											<tr>
												<td align="center">
												<sj:select label="City"
												        href="listCities"
												        id="city"
												        name="property.city.id"
												        list="citiesList"
												        listKey="id"
												        listValue="fullName"
												        emptyOption="false" headerKey="-1" headerValue="-- Select City --"
												        onChangeTopics="reloadCompoundsAndDistrictsList" />
												</td>
											</tr>
											<tr>
												<td align="center">
												<sj:select label="Compound"
												        href="listCompounds"
												        id="compound"
												        name="property.compound.id"
												        list="compoundsList"
												        listKey="id"
												        listValue="fullName"
												        emptyOption="false" headerValue="-- Select Compound --"
												        headerKey="-1" 
												        reloadTopics="reloadCompoundsAndDistrictsList"  
												        />
												</td>
											</tr>
											<tr>
												<td align="center">
												<sj:select label="District"
												        href="listDistricts"
												        id="district"
												        name="property.district.id"
												        list="districtsList"
												        listKey="id"
												        listValue="fullName"
												        emptyOption="false" headerValue="-- Select District --"
												        headerKey="-1"
												        reloadTopics="reloadCompoundsAndDistrictsList"
												        onChangeTopics="reloadZonesList"  
												        />
												</td>
											</tr>
											<tr>
												<td align="center">
												<sj:select label="Zone"
												        href="listZones"
												        id="zone"
												        name="property.zone.id"
												        list="zonesList"
												        listKey="id"
												        listValue="fullName"
												        emptyOption="false" headerValue="-- Select Zone --"
												        headerKey="-1"
												        reloadTopics="reloadZonesList"
												        onChangeTopics="reloadSubareasList"
												        />
												</td>
											</tr>
											<tr>
												<td align="center">
												<sj:select label="Subarea"
												        href="listSubareas"
												        id="subarea"
												        name="property.subarea.id"
												        list="subareasList"
												        listKey="id"
												        listValue="fullName"
												        emptyOption="false" headerValue="-- Select Subarea --"
												        headerKey="-1" 
												        reloadTopics="reloadSubareasList"
												        />
												</td>
											</tr>
											<tr>
												<td>
												<p align="center">
												<sj:submit targets="bodyID" indicator="indicator" type="image" src="/images/buttons/btn_search.jpg" /><br />
												<s:url var="preSearch" action="preSearchProperty" method="preSearchProperty"/>
												<sj:a indicator="indicator" href="%{preSearch}" targets="bodyID"><s:text name="welcome.advancedsearch" /></sj:a>
												</td>
											</tr>
										</table>
										</s:form>
									</td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td> 
			<td  width="488" align="left" valign="top">
				<table height="285" >
					<tr>
						<td bgcolor="#99DDE0" width="220" >
						<sj:a indicator="indicator"  href="/pages/about/Consultant.htm" targets="bodyID">
							<img border="0" src="images/welcome/allam-consult.jpg" width="620" height="258"> 
						</sj:a>
						</td>
					</tr>
				</table>
		</td>
			
		</tr>
	</table>
</div>
<div id="welcome-part2" dir="ltr">
<s:url var="marquee" action="displayMarqueeData" method="displayMarqueeData" />
<marquee truespeed="truespeed" behavior="scroll" direction="right" loop="true" style="text-align: center;background-color: #E9E9E9;height: 37;width: 100%;font: Tahoma;font-size: 10pt" onmouseover="this.setAttribute('scrollamount', 0, 0);" onmouseout="this.setAttribute('scrollamount', 6, 0);">
<font face="Tahoma" style="font-size: 10pt"><sj:div href="%{marquee}" name="marqueeAds" targets="bodyID"/></font></marquee>
</div>  
<div id="welcome-part3" dir="ltr">
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
		<tr>
		<td width="3%" height="108" bgcolor="#99DDE0">
		<img border="0" src="images/welcome/side-label1.jpg" width="28" height="199"></td>
					<td align="center">
			<s:url var="searchLand" action="searchPropertyType" method="searchPropertyType">
				<s:param name="propertyType" value="10" />
			</s:url>
			<sj:a href="%{searchLand}" indicator="indicator" targets="bodyID" onmouseover="">
			<img border="0" src="images/welcome/big-property01.jpg" width="179" height="225">
			</sj:a></td>
			
			<td align="center">
			<s:url var="searchApartment" action="searchPropertyType" method="searchPropertyType">
				<s:param name="propertyType" value="1" />
			</s:url>
			<sj:a href="%{searchApartment}" indicator="indicator" targets="bodyID">
			<img border="0" src="images/welcome/big-property02.jpg" width="180" height="225">
			</sj:a></td>
			<td align="center">
			<s:url var="searchDuplex" action="searchPropertyType" method="searchPropertyType">
				<s:param name="propertyType" value="1" />
				<s:param name="subType" value="3" />
			</s:url>
			<sj:a href="%{searchDuplex}" indicator="indicator" targets="bodyID">
			<img border="0" src="images/welcome/big-property03.jpg" width="180" height="225">
			</sj:a></td>
			<td align="center">
			<s:url var="searchVilla" action="searchPropertyType" method="searchPropertyType">
				<s:param name="propertyType" value="2" />
			</s:url>
			<sj:a href="%{searchVilla}" indicator="indicator" targets="bodyID">
			<img border="0" src="images/welcome/big-property04.jpg" width="181" height="225">
			</sj:a></td>
			<td align="center">
			<s:url var="searchBusiness" action="searchPropertyType" method="searchPropertyType">
				<s:param name="propertyType" value="13" />
			</s:url>
			<sj:a href="%{searchBusiness}" indicator="indicator" targets="bodyID">
			<img border="0" src="images/welcome/big-property05.jpg" width="182" height="225">
			</sj:a></td>
		</tr>
	</table>
</div>
<br />
<div id="welcome-part4">
	<table border="0" width="100%" cellspacing="0" cellpadding="0" height="199">
	<tr>
		<td width="3%" height="108" bgcolor="#99DDE0">
		<img border="0" src="images/welcome/side-label2.jpg" width="28" height="199"></td>
		<td width="20%" bgcolor="#F0FAFF" valign="top" align="center" height="108">
		<table border="0" width="25%" cellpadding="2" height="196">
			<tr>
				<td>
				<p align="center">
				<img border="0" src="images/welcome/property1.jpg" width="168" height="105"></td>
			</tr>
			<tr>
				<td><font face="Arial" style="font-size: 8pt">Quiet 
				area, Security Services, Green spaces, Near to the 
				services, Near to the Ring Road , Near to 90 st, Nearby 
				the shopping areas and the transportation, Nearby the 
				American University</font></td>
			</tr>
		</table>
		</td>
		<td width="20%" bgcolor="#F0FAFF" valign="top" align="center" height="108">
		<table border="0" width="96%" cellpadding="2" height="196">
			<tr>
				<td>
				<p align="center">
				<img border="0" src="images/welcome/property2.jpg" width="167" height="105"></td>
			</tr>
			<tr>
				<td><font face="Arial" style="font-size: 8pt">Quiet 
				area, Security Services, Green spaces, Near to the 
				services, Near to the Ring Road , Near to 90 st, Nearby 
				the shopping areas and the transportation, Nearby the 
				American University</font></td>
			</tr>
		</table>
		</td>
		<td width="20%" bgcolor="#F0FAFF" valign="top" align="center" height="108">
		<table border="0" width="25%" cellpadding="2" height="196">
			<tr>
				<td>
				<p align="center">
				<img border="0" src="images/welcome/property3.jpg" width="168" height="104"></td>
			</tr>
			<tr>
				<td><font face="Arial" style="font-size: 8pt">Quiet 
				area, Security Services, Green spaces, Near to the 
				services, Near to the Ring Road , Near to 90 st, Nearby 
				the shopping areas and the transportation, Nearby the 
				American University</font></td>
			</tr>
		</table>
		</td>
		<td width="20%" bgcolor="#F0FAFF" valign="top" align="center" height="108">
		<table border="0" width="25%" cellpadding="2" height="196">
			<tr>
				<td>
				<p align="center">
				<img border="0" src="images/welcome/property4.jpg" width="168" height="104"></td>
			</tr>
			<tr>
				<td><font face="Arial" style="font-size: 8pt">Quiet 
				area, Security Services, Green spaces, Near to the 
				services, Near to the Ring Road , Near to 90 st, Nearby 
				the shopping areas and the transportation, Nearby the 
				American University</font></td>
			</tr>
		</table>
		</td>
		<td width="20%" bgcolor="#F0FAFF" valign="top" align="center" height="108">
		<table border="0" width="25%" cellpadding="2" height="196">
			<tr>
				<td> 
				<p align="center">
				<img border="0" src="images/welcome/property5.jpg" width="168" height="104"></td>
			</tr>
			<tr>
				<td><font face="Arial" style="font-size: 8pt">Quiet 
				area, Security Services, Green spaces, Near to the 
				services, Near to the Ring Road , Near to 90 st, Nearby 
				the shopping areas and the transportation, Nearby the 
				American University</font></td>
			</tr>
		</table>
		</td>
	</tr>
	</table>
</div>
<script type="text/javascript">
//$('#box1').animate({boxShadow: '0 0 30px #44f'});
$('#box1').corner();
</script>
