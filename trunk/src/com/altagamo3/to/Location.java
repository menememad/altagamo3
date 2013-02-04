package com.altagamo3.to;

import java.io.Serializable;

public class Location implements Serializable{

	private static final long serialVersionUID = -427218106420483744L;
	private Integer id = -1;
	private String arabicName;
	private String englishName;
	private boolean isActive;
	private Location parentLocation;

	public Location(){}
	public Location(Integer givenID, String givenArabicName, String givenEnglishName){
		id = givenID;
		arabicName = givenArabicName;
		englishName = givenEnglishName;
	}
	
	public Location getParentLocation() {
		return parentLocation;
	}
	public void setParentLocation(Location parentLocation) {
		this.parentLocation = parentLocation;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getArabicName() {
		return arabicName;
	}
	public void setArabicName(String arabicName) {
		this.arabicName = arabicName;
	}
	public String getEnglishName() {
		return englishName;
	}
	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	public String getFullName() {
		return englishName + " - " + arabicName;
	}
	public void setFullName(String fullName) {
	}
}
