package com.altagamo3.to;

import java.io.Serializable;

public class PropertyType implements Serializable{

	private static final long serialVersionUID = -8952839281503150219L;
	private Integer id;
	private String arabicName;
	private String englishName;
	
	public PropertyType(){}
	public PropertyType(Integer id){
		this.id = id;
	}
	public PropertyType(Integer id, String arabicName, String englishName){
		this.id = id;
		this.arabicName = arabicName;
		this.englishName = englishName;
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
	public String getFullName() {
		return englishName+" - "+arabicName;
	}
	
}
