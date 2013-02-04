<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:iterator var="projectsList" id="prj">
Item: <s:property value="title" />
</s:iterator>