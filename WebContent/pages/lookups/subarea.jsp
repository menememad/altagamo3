<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<br/>
    <s:url id="remoteurl" action="listAllSubareas" method="listAllSubareas"/>
     <sjg:grid
    	id="gridtable"
    	caption="Sub Areas"
    	dataType="json"
    	href="%{remoteurl}"
    	pager="true"
    	gridModel="subareasList"
    	rowList="10,15,20"
    	rowNum="15"
    	rownumbers="true"
    	navigator="true"
    	navigatorSearchOptions="{sopt:['eq','ne','lt','gt','cn']}"
    	navigatorAddOptions="{height:280,reloadAfterSubmit:true}"
    	navigatorEditOptions="{height:280,reloadAfterSubmit:false}"
    	navigatorEdit="false"
    	navigatorView="true"
    	navigatorDelete="true"
    	navigatorDeleteOptions="{height:280,reloadAfterSubmit:true}"
    	editurl="%{editurl}"
    	editinline="true"
    	onSelectRowTopics="rowselect"
    	onEditInlineSuccessTopics="oneditsuccess"
    	viewrecords="true"
    	loadonce="true" autowidth="true">
    	<sjg:gridColumn name="id" index="id" title="ID" sortable="true" width="15"/>
    	<sjg:gridColumn name="arabicName" index="arabicName" title="Arabic Name" sortable="true" editable="true" edittype="text" editrules="{required:true}"/>
    	<sjg:gridColumn name="englishName" index="englishName" title="English Name" sortable="true" editable="true"/>
    	<sjg:gridColumn name="parentLocation.id" index="parentLocationID" title="City ID" sortable="true" editable="true" />
    	<sjg:gridColumn name="parentLocation.fullName" index="parentLocationFullName" title="City Name" sortable="true"/>
    </sjg:grid>
