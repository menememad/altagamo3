<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>

<sj:a href="preAddUser" targets="bodyID" id="addUserLink" button="true">Add New User</sj:a>
<br/>
    <s:url id="remoteurl" action="listUsers" method="listUsers"/>
    <sjg:grid 
    	id="gridtable"
    	caption="Users"
    	dataType="json"
    	href="%{remoteurl}"
    	pager="true"
    	gridModel="usersList"
    	rowList="10,15,20"
    	rowNum="15"
    	rownumbers="true"
    	loadonce="true" 
    	editinline="true" editurl="%{remoteurl}"
    	navigator="true"
    	navigatorSearchOptions="{sopt:['eq','ne','lt','gt']}"
    	navigatorAddOptions="{height:280,reloadAfterSubmit:true}"
    	navigatorEditOptions="{height:280,reloadAfterSubmit:false}"
    	navigatorEdit="false"
    	navigatorView="false"
    	navigatorDelete="true"
    	navigatorDeleteOptions="{height:280,reloadAfterSubmit:true}"
    	navigatorExtraButtons="{
    		seperator: { 
    			title : 'seperator'  
    		}, 
    		hide : { 
	    		title : 'Show/Hide', 
	    		icon: 'ui-icon-wrench', 
	    		topic: 'showcolumns'
    		},
    		alert : { 
	    		title : 'Alert', 
	    		onclick: function(){ alert('Grid Button clicked!') }
    		}
    	}"
    	
    >
    	<sjg:gridColumn name="selectID" index="id" title="Select" formatter="checkbox" />
    	<sjg:gridColumn name="id" index="id" title="ID" sortable="true" formatter="integer" />
    	<sjg:gridColumn name="username" index="username" title="Username" sortable="true"/>
    	<sjg:gridColumn name="fullName" index="fullName" title="Full Name" sortable="true" />
     	<sjg:gridColumn name="firstName" index="firstName" title="First Name" sortable="true" hidden="true"/>
    	<sjg:gridColumn name="lastName" index="lastName" title="Last Name" sortable="true" hidden="true"/>
    	<sjg:gridColumn name="mobile" index="mobile" title="Mobile"  sortable="false"/>
    	<sjg:gridColumn name="email" index="email" title="E-Mail" sortable="false"/>
    </sjg:grid>
