package com.altagamo3.web.actions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.altagamo3.helper.LocationHelper;
import com.altagamo3.helper.PropertyHelper;
import com.altagamo3.to.Location;
import com.altagamo3.to.Property;
import com.opensymphony.xwork2.ActionSupport;

public class LookupAction extends ActionSupport{
	private static final long serialVersionUID = 5724286605804043856L;
	private Property property;
//	private PropertySearch propertySearch;
	private Map<Integer, String> propertyTypesMap;


	private List<Location> countriesList;
	private List<Location> statesList;
	private List<Location> citiesList;
	private List<Location> compoundsList;
	private List<Location> districtsList;
	private List<Location> zonesList;
	private List<Location> subareasList;

	public List<Location> getDistrictsList() {
		return districtsList;
	}

	public List<Location> getZonesList() {
		return zonesList;
	}

	public List<Location> getSubareasList() {
		return subareasList;
	}

	public void setDistrictsList(List<Location> districtsList) {
		this.districtsList = districtsList;
	}

	public void setZonesList(List<Location> zonesList) {
		this.zonesList = zonesList;
	}

	public void setSubareasList(List<Location> subareasList) {
		this.subareasList = subareasList;
	}

	public String listPropertyTypes(){
		PropertyHelper prpHelp = PropertyHelper.getInstance();
		propertyTypesMap = prpHelp.listPropertyTypes();
		System.out.println("HELP: "+propertyTypesMap.size());
		return SUCCESS;
	}

	public String listCountries(){
		LocationHelper locHelp = LocationHelper.getInstance();
		countriesList = locHelp.listActiveCountries();
		return SUCCESS;
	}
	public String listStates(){
		LocationHelper locHelp = LocationHelper.getInstance();
		if(property.getCountry().getId()!=null && property.getCountry().getId()>0)
			statesList = locHelp.listActiveStatesByCountry(property.getCountry().getId());
		else
			statesList = null;
		return SUCCESS;
	}
	public String listCities(){
		LocationHelper locHelp = LocationHelper.getInstance();
		if(property.getState().getId()!=null && property.getState().getId()>0)
			citiesList = locHelp.listActiveCitiesByState(property.getState().getId());
		return SUCCESS;
	}
	public String listCompounds(){
		LocationHelper locHelp = LocationHelper.getInstance();
		if(property.getCity().getId()!=null && property.getCity().getId()>0)
			compoundsList = locHelp.listActiveCompoundsByCity(property.getCity().getId());
		return SUCCESS;
	}
	public String listDistricts(){
		LocationHelper locHelp = LocationHelper.getInstance();
		if(property.getCity().getId()!=null && property.getCity().getId()>0)
			districtsList = locHelp.listActiveDistrictsByCity(property.getCity().getId());
		return SUCCESS;
	}
	public String listZones(){
		LocationHelper locHelp = LocationHelper.getInstance();
		if(property.getDistrict().getId()!=null && property.getDistrict().getId()>0)
			zonesList = locHelp.listActiveZonesByDistrict(property.getDistrict().getId());
		return SUCCESS;
	}
	public String listSubareas(){
		LocationHelper locHelp = LocationHelper.getInstance();
		if(property.getZone().getId()!=null && property.getZone().getId()>0)
			subareasList = locHelp.listActiveSubareasByZone(property.getZone().getId());
		return SUCCESS;
	}
	public String listLocations(){
		countriesList = new ArrayList<Location>();
		LocationHelper locHelp = LocationHelper.getInstance();
		if(property.getCountry().getId()!=null && property.getCountry().getId()>0){
			if(property.getState().getId()!=null && property.getState().getId()>0){
				if(property.getCity().getId()!=null && property.getCity().getId()>0){
					System.out.println("id: "+property.getCity().getId());
					if(compoundsList==null)
						compoundsList = locHelp.listActiveCompoundsByCity(property.getCity().getId());
					if(property.getDistrict().getId()!=null && property.getDistrict().getId()>0){
						if(property.getZone().getId()!=null && property.getZone().getId()>0){
							if(subareasList==null)
								subareasList = locHelp.listActiveSubareasByZone(property.getZone().getId());
						}else{
							if(zonesList==null)
								zonesList = locHelp.listActiveZonesByDistrict(property.getDistrict().getId());
							subareasList = new ArrayList<Location>();
						}
					}else{
						if(districtsList==null)
							districtsList = locHelp.listActiveDistrictsByCity(property.getCity().getId());
						zonesList = new ArrayList<Location>();
					}

				}else{
					if(citiesList==null)
						citiesList = locHelp.listActiveCitiesByState(property.getState().getId());
					System.out.println("cities: "+citiesList.size());
					compoundsList = new ArrayList<Location>();
					districtsList = new ArrayList<Location>();
				}
			}else{
				if(statesList.isEmpty())
					statesList = locHelp.listActiveStatesByCountry(property.getCountry().getId());
					citiesList = new ArrayList<Location>();
			}
		}else{
			if(countriesList.isEmpty())
				countriesList = locHelp.listActiveCountries();
				statesList = new ArrayList<Location>();
		}
		return SUCCESS;
	}

	public String listAllCountries(){
		LocationHelper locHelp = LocationHelper.getInstance();
		countriesList = locHelp.listAllCountries();
		System.out.println("countriesList: "+countriesList.size());
		return SUCCESS;
	}

	public String listAllStates(){
		LocationHelper locHelp = LocationHelper.getInstance();
		statesList = locHelp.listAllStatesByCountry(null);
		System.out.println("statesList: "+statesList.size());
		return SUCCESS;
	}

	public String listAllCities(){
		LocationHelper locHelp = LocationHelper.getInstance();
		citiesList = locHelp.listAllCitiesByState(null);
		System.out.println("citiesList: "+citiesList.size());
		return SUCCESS;
	}

	public String listAllDistricts(){
		LocationHelper locHelp = LocationHelper.getInstance();
		districtsList = locHelp.listAllDistrictsByCity(null);
		System.out.println("districtsList: "+districtsList.size());
		return SUCCESS;
	}

	public String listAllCompounds(){
		LocationHelper locHelp = LocationHelper.getInstance();
		compoundsList = locHelp.listAllCompoundsByCity(null);
		System.out.println("compoundsList: "+compoundsList.size());
		return SUCCESS;
	}

	public Map<Integer, String> getPropertyTypesMap() {
		return propertyTypesMap;
	}

	public void setPropertyTypesMap(Map<Integer, String> propertyTypes) {
		this.propertyTypesMap = propertyTypes;
	}

	public List<Location> getCountriesList() {
		return countriesList;
	}

	public void setCountriesList(List<Location> countriesList) {
		this.countriesList = countriesList;
	}

	public List<Location> getStatesList() {
		return statesList;
	}

	public void setStatesList(List<Location> statesList) {
		this.statesList = statesList;
	}

	public List<Location> getCitiesList() {
		return citiesList;
	}

	public void setCitiesList(List<Location> citiesList) {
		this.citiesList = citiesList;
	}

	public List<Location> getCompoundsList() {
		return compoundsList;
	}

	public void setCompoundsList(List<Location> compoundsList) {
		this.compoundsList = compoundsList;
	}

	public Property getProperty() {
		return property;
	}

	public void setProperty(Property property) {
		this.property = property;
	}
}