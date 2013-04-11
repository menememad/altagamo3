<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<head>  
  <sj:head/>  
</head><h2><s:text name="title.property.addNew" /></h2>
<s:form id="defineRentalPeriod" theme="xhtml">
<sj:datepicker id="rentStart" name="rentStart" label="Show Years only from 2008 until 2012" yearRange="2008:2012" changeYear="true"/>
<sj:datepicker id="rentEnd" name="rentEnd" label="Show Years only from 2008 until 2012" yearRange="2012:2100" changeYear="true"/>
<sj:submit value="Submit" indicator="indicator" />
</s:form>