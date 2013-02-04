package com.altagamo3.web.actions;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import com.altagamo3.helper.PropertyHelper;
import com.altagamo3.to.Property;
import com.altagamo3.to.PropertySearch;
import com.altagamo3.to.SearchConditions;
import com.opensymphony.xwork2.ActionSupport;

public class AdsAction extends ActionSupport {

	private static final long serialVersionUID = -6107098924089451402L;
	private String marqueeAds="";
	public String displayMarqueeData(){
		PropertySearch prpSrch = new PropertySearch();
		PropertyHelper prpHelp = PropertyHelper.getInstance();
		SearchConditions cond = new SearchConditions();
		cond.setItemsPerPage(5);
		cond.setOrderByColumn("property.id");
		cond.isOrderAscending(false);
		for (Property  prp: prpHelp.searchProperties(prpSrch, cond, null)) {
			marqueeAds+="  ---  <a href=\'getPropertyDetails!getPropertyDetails?propertyID="+prp.getId()+"' >"+prp.getDescription()+"</a>";
		}
		return SUCCESS;
	}
	public String getMarqueeAds() {
		return marqueeAds;
	}
	public void setMarqueeAds(String marqueeAds) {
		this.marqueeAds = marqueeAds;
	}
	public InputStream getInputStream () { return new ByteArrayInputStream ( marqueeAds.getBytes() ); }
}
