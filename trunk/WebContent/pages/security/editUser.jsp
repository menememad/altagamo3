<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:if test="hasFieldErrors()">
   <h3 style="color: red"><s:text name="err.message" /></h3>
   <s:fielderror />
</s:if>
<s:elseif test="hasActionErrors()">
   <h3 style="color: red"><s:text name="err.message" /></h3>
   <s:actionerror />
</s:elseif>
<s:elseif test="hasActionMessages()">
   <h3 style="color: green"><s:actionmessage /></h3>
</s:elseif>
  <s:form   theme="simple" action="editUser" id="edituserformid" >
  <fieldset style="padding: 0 10 0 10;margin: 10 10 10 10;">
		<legend><s:text name="title.user.edit" /></legend>
<table   class="formTables">
	<tr>
		<td><s:text name="security.photo"/> </td>
		<td><s:file name="photo" title="%{getText('hint.user.photo')}" /></td>	
	</tr>
	<tr>
		<td><s:text name="security.username" /> <s:text name="required.flag" /> </td>
		<td><s:textfield name="username" maxlength="15" title="%{getText('hint.user.username')}"/></td>	
	</tr>
	<tr>
		<td><s:text name="security.newPassword" /> <s:text name="required.flag" /></td>
		<td><s:password name="newPassword" maxlength="15" title="%{getText('hint.user.password')}"/></td>	
	</tr>
	<tr>
		<td><s:text name="security.confirmNewPassword" /> <s:text name="required.flag" /></td>
		<td><s:password name="confirmPassword" maxlength="15" title="%{getText('hint.user.confirmPassword')}"/></td>	
	</tr>
<s:if test="%{#session.userInfo!=null && #session.userInfo.roleID==1}">
	<tr>
		<td><s:text name="security.role" /> <s:text name="required.flag" /></td>
		<td><sj:radio name="roleID" list="#{'1':'Administrator','2':'Seller'}" value="2"/></td>	
	</tr>
</s:if>
<s:elseif test="#session.userInfo.roleID==2">
		<s:hidden name="roleID" value="2" />
</s:elseif><s:else>
		<s:hidden name="roleID" value="3" />
</s:else>
	<tr>
		<td><s:text name="security.firstname" /> <s:text name="required.flag" /></td>
		<td><s:textfield name="firstname" maxlength="15"  title="%{getText('hint.user.firstname')}"/></td>	
	</tr>
	<tr>
		<td><s:text name="security.lastname" /> <s:text name="required.flag" /> </td>
		<td><s:textfield name="lastname" maxlength="15" title="%{getText('hint.user.lastname')}"/></td>	
	</tr>
	<tr>
		<td><s:text name="security.mobile" /> <s:text name="required.flag" /> </td>
		<td><s:textfield name="mobile" maxlength="15" title="%{getText('hint.user.mobile')}"/></td>	
	</tr>
	<tr>
		<td><s:text name="security.mobile2" /></td>
		<td><s:textfield name="mobile2" maxlength="15" title="%{getText('hint.user.mobile2')}"/></td>	
	</tr>
	<tr>
		<td><s:text name="security.email" /> </td>
		<td><s:textfield name="email" maxlength="45" title="%{getText('hint.user.email')}"/></td>	
	</tr>
	<tr>
		<td><s:text name="security.address" /> </td>
		<td><s:textarea name="address" cols="50" rows="5" /></td>	
	</tr>
</table> 
</fieldset> 
<div class="actionBtns">
	<sj:submit indicator="indicator" button="true" formIds="edituserformid" targets="bodyID" />
</div>
  </s:form>