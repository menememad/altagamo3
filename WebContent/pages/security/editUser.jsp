<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@page import="com.altagamo3.to.User" %>
<%String dir = request.getLocale().getLanguage().equals("en")?"ltr":"rtl"; %>
<div id="container" dir='<%=dir%>'> 
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
<s:form action="editUser" method="POST" enctype="multipart/form-data" theme="simple">
	<fieldset style="padding: 0 10 0 10;margin: 10 10 10 10;">
		<legend><s:text name="title.user.edit" /></legend>
		<img src='<s:url action="displayUserImage" method="displayUserImage"/>' width="160" height="160" align="right"/>
		<dl style="width: 500px;">
			<dt style="width: 200px;"><s:text name="security.photo" /></dt>
			<dd><s:file name="photo" />
			<span class="hint"><s:text name="hint.user.photo"/><span class="hint-pointer">&nbsp;</span></span></dd>
			<dt style="width: 200px;"><s:text name="security.username" /></dt>
			<dd><s:property value="username" /></dd>
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
		<sj:submit indicator="indicator" targets="bodyID" />
	</fieldset>
</s:form>
</div>
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
