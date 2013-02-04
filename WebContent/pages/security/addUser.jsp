<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@page import="com.altagamo3.to.User" %>
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
<s:form action="addUser" method="POST" enctype="multipart/form-data" theme="simple">
	<fieldset style="padding: 0 10 0 10;margin: 10 10 10 10;">
		<legend><s:text name="title.registration" /></legend>
		<dl style="width: 500px;">
			<dt style="width: 200px;"><s:text name="security.photo" /></dt>
			<dd><s:file name="photo" />
			<span class="hint"><s:text name="hint.user.photo"/><span class="hint-pointer">&nbsp;</span></span></dd>
			<dt style="width: 200px;"><s:text name="security.username" /> <s:text name="required.flag" /></dt>
			<dd><s:textfield name="username" maxlength="15" />
			<span class="hint"><s:text name="hint.user.username"/><span class="hint-pointer">&nbsp;</span></span></dd>
			<br/>
			<dt style="width: 200px;"><s:text name="security.newPassword" /> <s:text name="required.flag" /></dt>
			<dd><s:password name="newPassword" maxlength="15"/>
			<span class="hint"><s:text name="hint.user.password"/><span class="hint-pointer">&nbsp;</span></span></dd>
			<br/>
			<dt style="width: 200px;"><s:text name="security.confirmNewPassword" /> <s:text name="required.flag" /></dt>
			<dd><s:password name="confirmPassword" maxlength="15" />
			<span class="hint"><s:text name="hint.user.confirmPassword"/><span class="hint-pointer">&nbsp;</span></span></dd>
			<br/>
			<%if(session.getAttribute("userInfo")!=null){ 
			User u = (User)session.getAttribute("userInfo");
			if(u.getRoleID()==1){%>
			<dt style="width: 200px;"><s:text name="security.role" /> <s:text name="required.flag" /></dt>
			<dd><sj:radio name="roleID" list="#{'1':'Administrator','2':'Seller'}" value="2"/></dd>
			<%}else if(u.getRoleID()==2){ %>
			<s:hidden name="roleID" value="2" />
			<%}}else{ %>
			<s:hidden name="roleID" value="3" />
			<%}%>
			<br/>
			<dt style="width: 200px;"><s:text name="security.firstname" /> <s:text name="required.flag" /></dt>
			<dd><s:textfield name="firstname" maxlength="15" />
			<span class="hint"><s:text name="hint.user.firstname"/><span class="hint-pointer">&nbsp;</span></span></dd>
			<br/>
			<dt style="width: 200px;"><s:text name="security.lastname" /> <s:text name="required.flag" /></dt>
			<dd><s:textfield name="lastname" maxlength="15" />
			<span class="hint"><s:text name="hint.user.lastname"/><span class="hint-pointer">&nbsp;</span></span></dd>
			<br/>
			<dt style="width: 200px;"><s:text name="security.mobile" /> <s:text name="required.flag" /></dt>
			<dd><s:textfield name="mobile" maxlength="15" />
			<span class="hint"><s:text name="hint.user.mobile"/><span class="hint-pointer">&nbsp;</span></span></dd>
			<br/>
			<dt style="width: 200px;"><s:text name="security.mobile2" /></dt>
			<dd><s:textfield name="mobile2" maxlength="15" />
			<span class="hint"><s:text name="hint.user.mobile2"/><span class="hint-pointer">&nbsp;</span></span></dd>
			<br/>
			<dt style="width: 200px;"><s:text name="security.email" /></dt>
			<dd><s:textfield name="email" maxlength="45" />
			<span class="hint"><s:text name="hint.user.email"/><span class="hint-pointer">&nbsp;</span></span></dd>
		</dl>
		<dl style="width: 700px;">
			<dt style="width: 200px;"><s:text name="security.address" /></dt>
			<dd style="width: 500px;"><s:textarea name="address" cols="50" rows="5" /></dd>
		</dl>
		<sj:submit targets="bodyID" />
	</fieldset>
</s:form>
<script>
function prepareInputsForHints() {
	var inputs = document.getElementsByTagName("input");
	for (var i=0; i<inputs.length; i++){
		// test to see if the hint span exists first
		if (inputs[i].parentNode.getElementsByTagName("span")[0]) {
			// the span exists!  on focus, show the hint
			inputs[i].onfocus = function () {
				this.parentNode.getElementsByTagName("span")[0].style.display = "inline";
			}
			// when the cursor moves away from the field, hide the hint
			inputs[i].onblur = function () {
				this.parentNode.getElementsByTagName("span")[0].style.display = "none";
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
</script>	