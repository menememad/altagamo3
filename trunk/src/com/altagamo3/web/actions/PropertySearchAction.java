package com.altagamo3.web.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.altagamo3.helper.PropertyHelper;
import com.altagamo3.to.Property;
import com.altagamo3.to.PropertySearch;
import com.altagamo3.to.SearchConditions;
import com.altagamo3.to.User;
import com.opensymphony.xwork2.ActionSupport;

public class PropertySearchAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -746270398790301333L;
	private HttpServletRequest servletRequest; 
	private PropertySearch propertySearch;
	private Property property;
	private List<Property> propertiesList;
	//private Integer page;
	private SearchConditions cond = new SearchConditions();;
	
	public String preSearchProperty(){
		return SUCCESS;
	}

		
	public String searchProperty(){
		System.out.println("Hello1");
		propertySearch = new PropertySearch();
		if(servletRequest.getParameter("propertyTypeID")!=null)
			propertySearch.setPropertyTypeID(convertSingleParamToIntegerArray("propertyTypeID"));
		System.out.println("Hello2");
		if(servletRequest.getParameter("propertyFor")!=null)
			propertySearch.setPropertyFor(convertParamToInteger("propertyFor"));
		System.out.println("Hello3");
		if(servletRequest.getParameter("subtype")!=null)
			propertySearch.setSubtype(convertMultiParamToIntegerArray("subtype"));
		System.out.println("Hello4");
		if(servletRequest.getParameter("description")!=null)
			propertySearch.setDescription(servletRequest.getParameter("description"));
		System.out.println("Hello5");
		if(servletRequest.getParameter("minArea").length()>0)
			propertySearch.setMinArea(convertParamToInteger("minArea"));
		System.out.println("Hello6");
		if(servletRequest.getParameter("maxArea").length()>0)
			propertySearch.setMaxArea(convertParamToInteger("maxArea"));
		System.out.println("Hello7");
		if(servletRequest.getParameter("minFloorNo").length()>0)
			propertySearch.setMinFloorNo(convertParamToInteger("minFloorNo"));
		System.out.println("Hello8");
		if(servletRequest.getParameter("maxFloorNo").length()>0)
			propertySearch.setMaxFloorNo(convertParamToInteger("maxFloorNo"));
		System.out.println("Hello9");
		if(servletRequest.getParameter("minNoOfBathRooms").length()>0)
			propertySearch.setMinNoOfBathRooms(convertParamToInteger("minNoOfBathRooms"));
		System.out.println("Hello0");
		if(servletRequest.getParameter("maxNoOfBathRooms").length()>0)
			propertySearch.setMaxNoOfBathRooms(convertParamToInteger("maxNoOfBathRooms"));
		System.out.println("Helloa");
		if(servletRequest.getParameter("minNoOfHallRooms").length()>0)
			propertySearch.setMinNoOfHallRooms(convertParamToInteger("minNoOfHallRooms"));
		System.out.println("Hellob");
		if(servletRequest.getParameter("maxNoOfHallRooms").length()>0)
			propertySearch.setMaxNoOfHallRooms(convertParamToInteger("maxNoOfHallRooms"));
		System.out.println("Helloc");
		if(servletRequest.getParameter("minNoOfBedRooms").length()>0)
			propertySearch.setMinNoOfBedRooms(convertParamToInteger("minNoOfBedRooms"));
		System.out.println("Hellod");
		if(servletRequest.getParameter("maxNoOfBedRooms").length()>0)
			propertySearch.setMaxNoOfBedRooms(convertParamToInteger("maxNoOfBedRooms"));
		System.out.println("Helloe");
		if(servletRequest.getParameter("furnitureStatus")!=null)
			propertySearch.setFurnitureStatus(convertMultiParamToIntegerArray("furnitureStatus"));
		System.out.println("Hellof");
		if(servletRequest.getParameter("finishingStatus")!=null)
			propertySearch.setFinishingStatus(convertMultiParamToIntegerArray("finishingStatus"));
		System.out.println("Hellog");
		
		propertySearch.setCountryID(property.getCountry().getId());
		System.out.println("Helloh");
		propertySearch.setStateID(property.getState().getId());
		System.out.println("Helloi");
		propertySearch.setCityID(property.getCity().getId());
		System.out.println("Helloj");
		propertySearch.setDistrictID(property.getDistrict().getId());
		System.out.println("Hellok");
		propertySearch.setCompoundID(property.getCompound().getId());
		System.out.println("Hellol");
		propertySearch.setZoneID(property.getZone().getId());
		System.out.println("Hellom");
		propertySearch.setSubareaID(property.getSubarea().getId());
		System.out.println("Hellon");
		
		if(servletRequest.getParameter("minPrice").length()>0)
		propertySearch.setMinPrice(convertParamToInteger("minPrice"));
		System.out.println("Helloo");
		if(servletRequest.getParameter("maxPrice").length()>0)
			propertySearch.setMaxPrice(convertParamToInteger("maxPrice"));
		System.out.println("Hellop");
		if(servletRequest.getParameter("rentalPeriod")!=null)
			propertySearch.setRentalPeriod(convertMultiParamToIntegerArray("rentalPeriod"));
		System.out.println("Helloq");
		if(servletRequest.getParameter("paymentType")!=null)
			propertySearch.setPaymentType(convertMultiParamToIntegerArray("paymentType"));
		System.out.println("Hellor");

		PropertyHelper prpHelp = PropertyHelper.getInstance();
		System.out.println("hellos");
		User currentUser = (User)servletRequest.getSession().getAttribute("userInfo");
		System.out.println("hellot");
		propertiesList = prpHelp.searchProperties(propertySearch, cond, currentUser);
		System.out.println("list: "+propertiesList.size());
		return SUCCESS;
	} 

	public String searchPropertyFor(){
		propertySearch = new PropertySearch();
		propertySearch.setPropertyFor(Integer.parseInt(servletRequest.getParameter("propertyFor")));
		PropertyHelper prpHelp = PropertyHelper.getInstance();
		User currentUser = (User)servletRequest.getSession().getAttribute("userInfo");
		propertiesList = prpHelp.searchProperties(propertySearch, cond, currentUser);
		return SUCCESS;
	}

	public String searchMyProperties(){
		propertySearch = new PropertySearch();
		User currentUser = (User)servletRequest.getSession().getAttribute("userInfo");
		propertySearch.setCreatedBy(new Integer[]{currentUser.getId()});
		propertySearch.setStatuses(new Integer[]{1,2,3,4,5});
		PropertyHelper prpHelp = PropertyHelper.getInstance();
		propertiesList = prpHelp.searchProperties(propertySearch, cond, currentUser);
		return SUCCESS;
	}
	
	public String fastSearch(){
		propertySearch = new PropertySearch();
		propertySearch.setPropertyTypeID(new Integer[]{Integer.parseInt(servletRequest.getParameter("propertyTypeID"))});
		propertySearch.setPropertyFor(Integer.parseInt(servletRequest.getParameter("propertyFor")));
		propertySearch.setCityID(property.getCity().getId());
		propertySearch.setDistrictID(property.getDistrict().getId());
		propertySearch.setCompoundID(property.getCompound().getId());
		propertySearch.setZoneID(property.getZone().getId());
		propertySearch.setSubareaID(property.getSubarea().getId());
		
		PropertyHelper prpHelp = PropertyHelper.getInstance();
		User currentUser = (User)servletRequest.getSession().getAttribute("userInfo");
		propertiesList = prpHelp.searchProperties(propertySearch, cond, currentUser);
		return SUCCESS;
	}

	public String searchPropertyType(){
		propertySearch = new PropertySearch();
		propertySearch.setPropertyTypeID(new Integer[]{Integer.parseInt(servletRequest.getParameter("propertyType"))});
		PropertyHelper prpHelp = PropertyHelper.getInstance();
		User currentUser = (User)servletRequest.getSession().getAttribute("userInfo");
		propertiesList = prpHelp.searchProperties(propertySearch, cond, currentUser);
		return SUCCESS;
	}

	public String searchPropertyByStatus(){
		propertySearch = new PropertySearch();
		propertySearch.setStatuses(new Integer[]{Integer.parseInt(servletRequest.getParameter("status"))});
		PropertyHelper prpHelp = PropertyHelper.getInstance();
		User currentUser = (User)servletRequest.getSession().getAttribute("userInfo");
		propertiesList = prpHelp.searchProperties(propertySearch, cond, currentUser);
		addActionMessage(getText("menu.property.list."+servletRequest.getParameter("status")));
		return SUCCESS;
	}
	
	public String searchAllProperties(){
		try {
			propertySearch = new PropertySearch();
			PropertyHelper prpHelp = PropertyHelper.getInstance();
			User currentUser = (User)servletRequest.getSession().getAttribute("userInfo");
			propertiesList = prpHelp.searchProperties(propertySearch, cond, currentUser);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return INPUT;
		}
	}

	public String searchMyFavorites(){
		try {
			System.out.println("searchMyFavorites::::::");
			propertySearch = new PropertySearch();
			User currentUser = (User)servletRequest.getSession().getAttribute("userInfo");
			PropertyHelper prpHelp = PropertyHelper.getInstance();
			Integer[] propertyIDs = prpHelp.getFavoritesPropertyIDs(currentUser.getId());
			propertySearch.setPropertyID(propertyIDs);
			propertySearch.setStatuses(new Integer[]{1,2,3,4,5});
			propertiesList = prpHelp.searchProperties(propertySearch, cond, currentUser);
			
		} catch (Exception e) {
			e.printStackTrace();
			return SUCCESS;
		}
		return SUCCESS;
	}

	public Integer convertParamToInteger(String requestParam){
		return Integer.parseInt(servletRequest.getParameter(requestParam));
	}
	
	public Integer[] convertSingleParamToIntegerArray(String requestParam){
		return new Integer[]{Integer.parseInt(servletRequest.getParameter(requestParam))};
	}
	
	public Integer[] convertMultiParamToIntegerArray(String requestParam){
		String[] x = servletRequest.getParameterValues(requestParam);
		Integer[] y = new Integer[x.length];
		for (int i=0; i<x.length; i++) {
			y[i] = Integer.parseInt(x[i]);
		}
		return y;
	}

	public PropertySearch getPropertySearch() {
		return propertySearch;
	}

	public void setPropertySearch(PropertySearch propertySearch) {
		this.propertySearch = propertySearch;
	}

	public List<Property> getPropertiesList() {
		return propertiesList;
	}

	public void setPropertiesList(List<Property> propertiesList) {
		this.propertiesList = propertiesList;
	}
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}
	public Property getProperty() {
		return property;
	}
	public void setProperty(Property property) {
		this.property = property;
	}
}