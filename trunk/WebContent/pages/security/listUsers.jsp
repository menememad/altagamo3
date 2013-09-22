<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<%String dir = request.getLocale().getLanguage().equals("en")?"ltr":"rtl"; %>
<script type="text/javascript">
function editUserLink(cellvalue, options, rowObject)
{

return "<input type=button value='edit' onclick='runlink(\""+cellvalue+"\");'/>";
}
function runlink(obj)
{
$('#usernameID').val(obj);
$('#editUserLinkID').click();

}
</script>

<s:form theme="simple" id="listUserFormId">

<s:hidden name="username" id="usernameID"></s:hidden>
<sj:a href="preAddUser" indicator="indicator" targets="bodyID" id="addUserLink" button="true"><s:text name="menu.user.add"></s:text> </sj:a>
<sj:a href="preEditUser" formIds="listUserFormId" indicator="indicator" targets="bodyID" id="editUserLinkID" ></sj:a>

<br/>
    <s:url includeContext="false" id="remoteurl" action="listUsers" method="listUsers"/>
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
    	direction="%{dir}"
    	loadonce="true" 
    	editinline="true" editurl="%{remoteurl}"
    	navigator="false"
    	autowidth="true"
    >
    	<sjg:gridColumn name="id" align="center" title="%{getText('ID')}" sortable="true" formatter="integer" />
    	<sjg:gridColumn name="username" align="center" index="username" title="%{getText('security.username')}" sortable="true"/>
    	<sjg:gridColumn name="fullName" align="center" title="%{getText('security.fullname')}" sortable="true" />
     	<sjg:gridColumn name="firstName" align="center" title="%{getText('security.firstname')}" sortable="true" hidden="true"/>
    	<sjg:gridColumn name="lastName" align="center" title="%{getText('security.lastname')}" sortable="true" hidden="true"/>
    	<sjg:gridColumn name="mobile" align="center" title="%{getText('security.mobile')}"  sortable="false"/>
    	<sjg:gridColumn name="email" align="center" title="%{getText('security.email')}" sortable="false"/>
    	<sjg:gridColumn name="username" align="center" title="%{getText('EDIT')}" formatter="editUserLink" sortable="false"/>
    </sjg:grid>
</s:form>