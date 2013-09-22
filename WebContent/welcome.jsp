<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<script src='<s:url value="res/scripts/jquery.slides.min.js" />'></script>
<title>AlTagamo3.com - التجمع.كوم</title>

<div id="welcome-part1" style="border-color:red;border:2; direction: ltr; background-image: url('res/tgm3/images/banner.jpg');background-repeat: no-repeat;background-position: center;height: 505px;width: 100%">			
	<div style="display: inline-block;margin: 15px;background-color: transparent;">
	<s:form id="searchPropertyForm" action="fastSearch" method="POST" cssStyle="width: 250px;">
	<s:select id="propertyType" label="Property Type" labelposition="top" name="propertyTypeID" list="%{#application.propertyTypes}" />
	<s:select id="propertyFor" label="For" labelposition="top" name="propertyFor"  list="#{1:getText('propertyfor.'+1),2:getText('propertyfor.'+2),3:getText('propertyfor.'+3)}"/>
	<s:url includeContext="false" id="listCairoLocations" action="listLocations" method="listLocations" />
	<s:hidden name="property.country.id" value="1" />
	<s:hidden name="property.state.id" value="1" />
		<sj:select label="City" labelposition="top"
		        href="listCities"
		        id="city"
		        name="property.city.id"
		        list="citiesList"
		        listKey="id"
		        listValue="fullName"
		        emptyOption="false" headerKey="-1" headerValue="-- Select City --"
		        onChangeTopics="reloadCompoundsAndDistrictsList" />
		<sj:select label="Compound" labelposition="top"
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
		<sj:select label="District" labelposition="top"
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
		<sj:select label="Zone" labelposition="top"
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
		<sj:select label="Subarea" labelposition="top"
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
		<sj:submit targets="bodyID" indicator="indicator" button="true" value="%{getText('SEARCH')}"/>
		<sj:a indicator="indicator" href="preSearchProperty" button="true" targets="bodyID"><s:text name="welcome.advancedsearch" /></sj:a>
	
	</s:form>
	</div>								
	<sj:dialog id="loginDialog" autoOpen="false"  showEffect="puff" 
    	hideEffect="explode"  title="%{getText('welcome.membersarea')}" modal="true" width="400">
	<sj:div>
				<s:form action="login" method="POST" theme="simple" focusElement="username">
								<font face="Arial" ><s:text name="global.username" /></font>
								<s:textfield id="username" name="username" size="29" cssClass="ui-corner-all ui-widget-content"/>
					<br><br>		
								<font face="Arial" ><s:text name="global.password" />&nbsp;&nbsp;</font>
								<s:password name="password" size="29" cssClass="ui-corner-all ui-widget-content"/>
						<br><!--<br>	
								<font face="Arial" ><s:checkbox name="remember" /><s:text name="global.rememberMe" /></font>
								<font face="Arial" style="font-size: 10pt; font-weight: 700" color="red"><s:fielderror /></font>
							--><br>
								<center>
								<sj:submit indicator="indicator"   button="true" value="%{getText('global.login')}"/>  </center>
						<center>								<font face="Arial"  size="2">
								<sj:a indicator="indicator" href="/pages/security/forgotPassword.jsp" targets="bodyID"><s:text name="global.forgotpassword" /></sj:a> | <sj:a href="preAddUser" targets="bodyID"><s:text name="global.registernow" /></sj:a></font>
								</center>	
				</s:form> 
</sj:div>
</sj:dialog>
</div>

<div id="welcome-part2" dir="ltr">
<s:url includeContext="false" var="marquee" action="displayMarqueeData" method="displayMarqueeData" />
<marquee truespeed="truespeed" behavior="scroll" direction="right" loop="true" style="text-align: center;background-color: #E9E9E9;height: 37;width: 100%;font: Tahoma;font-size: 10pt" onmouseover="this.setAttribute('scrollamount', 0, 0);" onmouseout="this.setAttribute('scrollamount', 6, 0);">
<font face="Tahoma" style="font-size: 10pt"><sj:div href="%{marquee}" name="marqueeAds" targets="bodyID"/></font></marquee>
</div>  
<div id="welcome-part3" dir="ltr">
	<table border=0 width="100%" cellspacing="0" cellpadding="0">
		<tr>
		<td width="3%" height="108" bgcolor="#99DDE0">
		<img border="0" src='<s:url includeContext="false" value="/res/tgm3/images/welcome/side-label1.jpg" />' width="28" height="199"></td>
					<td align="center">
			<s:url includeContext="false" var="searchLand" action="searchPropertyType" method="searchPropertyType">
				<s:param name="propertyType" value="10" />
			</s:url>
			<sj:a href="%{searchLand}" indicator="indicator" targets="bodyID" onmouseover="">
			<img border="0" src='<s:url includeContext="false" value="/res/tgm3/images/welcome/big-property01.jpg" />' width="179" height="225">
			</sj:a></td>
			
			<td align="center">
			<s:url includeContext="false" var="searchApartment" action="searchPropertyType" method="searchPropertyType">
				<s:param name="propertyType" value="1" />
			</s:url>
			<sj:a href="%{searchApartment}" indicator="indicator" targets="bodyID">
			<img border="0" src='<s:url includeContext="false" value="/res/tgm3/images/welcome/big-property02.jpg" />' width="180" height="225">
			</sj:a></td>
			<td align="center">
			<s:url includeContext="false" var="searchDuplex" action="searchPropertyType" method="searchPropertyType">
				<s:param name="propertyType" value="1" />
				<s:param name="subType" value="3" />
			</s:url>
			<sj:a href="%{searchDuplex}" indicator="indicator" targets="bodyID">
			<img border="0" src='<s:url includeContext="false" value="/res/tgm3/images/welcome/big-property03.jpg" />' width="180" height="225">
			</sj:a></td>
			<td align="center">
			<s:url includeContext="false" var="searchVilla" action="searchPropertyType" method="searchPropertyType">
				<s:param name="propertyType" value="2" />
			</s:url>
			<sj:a href="%{searchVilla}" indicator="indicator" targets="bodyID">
			<img border="0" src='<s:url includeContext="false" value="/res/tgm3/images/welcome/big-property04.jpg" />' width="181" height="225">
			</sj:a></td>
			<td align="center">
			<s:url includeContext="false" var="searchBusiness" action="searchPropertyType" method="searchPropertyType">
				<s:param name="propertyType" value="13" />
			</s:url>
			<sj:a href="%{searchBusiness}" indicator="indicator" targets="bodyID">
			<img border="0" src='<s:url includeContext="false" value="/res/tgm3/images/welcome/big-property05.jpg" />' width="182" height="225">
			</sj:a></td>
		</tr>
	</table>
</div>
<br />
<div id="welcome-part4">
	<table border=0 width="100%" cellspacing="0" cellpadding="0" height="199">
	<tr>
			<td width="3%" height="108" bgcolor="#99DDE0">
		<img border="0" src='<s:url includeContext="false" value="/res/tgm3/images/welcome/side-label2.jpg" />' width="28" height="199"></td>
	
	<s:iterator value="arProperties"> 
		<td width="20%" bgcolor="#F0FAFF" valign="top" align="center" height="108">
	       		<table border="0" width="25%" cellpadding="2" height="196">
			<tr>
				<td>
				<p align="center">
				<img border="0" class="watermark" src='<s:url includeContext="false" value="/res/tgm3/prop_img/%{id}/thumbnail-1.jpg" />' width="168" height="105" />
				</td>
			</tr>
			<tr>
				<td><font face="Arial" style="font-size: 8pt">
                     <s:property value="description"/>
                     </font></td>
			</tr>
		</table>
	    </td>
     </s:iterator> 
    </tr>
</table>
</div>
<script type="text/javascript">
//$('#box1').animate({boxShadow: '0 0 30px #44f'});
$('#box1').corner();
</script>
