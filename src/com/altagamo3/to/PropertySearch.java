package com.altagamo3.to;

import java.io.Serializable;
import java.sql.Timestamp;


public class PropertySearch implements Serializable{
	
	private static final long serialVersionUID = 8417219923229702703L;

	private Integer[] propertyTypeID;
	private Integer[] propertyID;
	private Integer propertyFor;
	private Integer[] status;
	private String description;
	private Integer countryID;
	private Integer stateID;
	private Integer cityID;
	private Integer districtID;
	private Integer compoundID;
	private Integer zoneID;
	private Integer subareaID;
	
	private Integer minPrice;
	private Integer maxPrice;
	private Integer[] rentalPeriod;
	private String minRentStart;
	private String maxRentStart;
	private String minRentEnd;
	private String maxRentEnd;
	
	private Integer[] paymentType;
	private Integer[] createdBy;
	private Timestamp createdFrom;
	private Timestamp createdTo;
	private Timestamp approvedFrom;
	private Timestamp approvedTo;
	
	private Integer[] furnitureStatus;
	private Integer[] finishingStatus;
	private Integer minArea;
	private Integer maxArea;
	private Integer[] subtype;
	private Integer minFloorNo;
	private Integer maxFloorNo;
	private Integer minNoOfBedRooms;
	private Integer maxNoOfBedRooms;
	private Integer minNoOfHallRooms;
	private Integer maxNoOfHallRooms;
	private Integer minNoOfBathRooms;
	private Integer maxNoOfBathRooms;
	private boolean inCompoundFlag;

	private String getArrayDataAsString(Integer[] srcAry){
		String result = "";
		for (Integer element : srcAry) {
			result+=","+element;
		}
		return result.substring(1);
	}
	public String getPropertyTypeIDsAsString() {
		return getArrayDataAsString(propertyTypeID);
	}
	public String getPaymentTypesAsString() {
		return getArrayDataAsString(paymentType);
	}
	public String getStatusesAsString() {
		return getArrayDataAsString(status);
	}
	public String getRentalPeriodsAsString() {
		return getArrayDataAsString(rentalPeriod);
	}
	public String getCreatedByAsString() {
		return getArrayDataAsString(createdBy);
	}
	public String getFurnitureStatusAsString() {
		return getArrayDataAsString(furnitureStatus);
	}
	public String getFinishingStatusAsString() {
		return getArrayDataAsString(finishingStatus);
	}
	public String getPropertyIDsAsString() {
		return getArrayDataAsString(propertyID);
	}
	public String getSubTypeAsString() {
		return getArrayDataAsString(subtype);
	}
	
	public Integer[] getPropertyTypeID() {
		return propertyTypeID;
	}
	public Integer getPropertyFor() {
		return propertyFor;
	}
	public String getDescription() {
		return description;
	}
	public Integer getMinPrice() {
		return minPrice;
	}
	public Integer getMaxPrice() {
		return maxPrice;
	}
	public Integer[] getRentalPeriod() {
		return rentalPeriod;
	}
	public Integer[] getPaymentType() {
		return paymentType;
	}
	public Integer[] getCreatedBy() {
		return createdBy;
	}
	public Timestamp getCreatedFrom() {
		return createdFrom;
	}
	public Timestamp getCreatedTo() {
		return createdTo;
	}
	public Integer[] getFurnitureStatus() {
		return furnitureStatus;
	}
	public Integer[] getFinishingStatus() {
		return finishingStatus;
	}
	public Integer getMinArea() {
		return minArea;
	}
	public Integer getMaxArea() {
		return maxArea;
	}
	public Integer[] getSubtype() {
		return subtype;
	}
	public Integer getMinFloorNo() {
		return minFloorNo;
	}
	public Integer getMaxFloorNo() {
		return maxFloorNo;
	}
	public Integer getMinNoOfBedRooms() {
		return minNoOfBedRooms;
	}
	public Integer getMaxNoOfBedRooms() {
		return maxNoOfBedRooms;
	}
	public Integer getMinNoOfHallRooms() {
		return minNoOfHallRooms;
	}
	public Integer getMaxNoOfHallRooms() {
		return maxNoOfHallRooms;
	}
	public Integer getMinNoOfBathRooms() {
		return minNoOfBathRooms;
	}
	public Integer getMaxNoOfBathRooms() {
		return maxNoOfBathRooms;
	}
	public boolean isInCompoundFlag() {
		return inCompoundFlag;
	}
	public void setPropertyTypeID(Integer[] propertyTypeIDs) {
		this.propertyTypeID = propertyTypeIDs;
	}
	public void setPropertyFor(Integer propertyFor) {
		this.propertyFor = propertyFor;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setMinPrice(Integer minPrice) {
		this.minPrice = minPrice;
	}
	public void setMaxPrice(Integer maxPrice) {
		this.maxPrice = maxPrice;
	}
	public void setRentalPeriod(Integer[] rentalPeriod) {
		this.rentalPeriod = rentalPeriod;
	}
	public void setPaymentType(Integer[] paymentType) {
		this.paymentType = paymentType;
	}
	public void setCreatedBy(Integer[] createdBy) {
		this.createdBy = createdBy;
	}
	public void setCreatedFrom(Timestamp createdfrom) {
		this.createdFrom = createdfrom;
	}
	public void setCreatedTo(Timestamp createdTo) {
		this.createdTo = createdTo;
	}
	public void setFurnitureStatus(Integer[] furnitureStatus) {
		this.furnitureStatus = furnitureStatus;
	}
	public void setFinishingStatus(Integer[] finishingStatus) {
		this.finishingStatus = finishingStatus;
	}
	public void setMinArea(Integer minArea) {
		this.minArea = minArea;
	}
	public void setMaxArea(Integer maxArea) {
		this.maxArea = maxArea;
	}
	public void setSubtype(Integer[] subtype) {
		this.subtype = subtype;
	}
	public void setMinFloorNo(Integer minFloorNo) {
		this.minFloorNo = minFloorNo;
	}
	public void setMaxFloorNo(Integer maxFloorNo) {
		this.maxFloorNo = maxFloorNo;
	}
	public void setMinNoOfBedRooms(Integer minNoOfBedRooms) {
		this.minNoOfBedRooms = minNoOfBedRooms;
	}
	public void setMaxNoOfBedRooms(Integer maxNoOfBedRooms) {
		this.maxNoOfBedRooms = maxNoOfBedRooms;
	}
	public void setMinNoOfHallRooms(Integer minNoOfHallRooms) {
		this.minNoOfHallRooms = minNoOfHallRooms;
	}
	public void setMaxNoOfHallRooms(Integer maxNoOfHallRooms) {
		this.maxNoOfHallRooms = maxNoOfHallRooms;
	}
	public void setMinNoOfBathRooms(Integer minNoOfBathRooms) {
		this.minNoOfBathRooms = minNoOfBathRooms;
	}
	public void setMaxNoOfBathRooms(Integer maxNoOfBathRooms) {
		this.maxNoOfBathRooms = maxNoOfBathRooms;
	}
	public void setInCompoundFlag(boolean inCompoundFlag) {
		this.inCompoundFlag = inCompoundFlag;
	}
	public Integer getCountryID() {
		return countryID;
	}
	public void setCountryID(Integer countryID) {
		this.countryID = countryID;
	}
	public Integer getStateID() {
		return stateID;
	}
	public void setStateID(Integer stateID) {
		this.stateID = stateID;
	}
	public Integer getCityID() {
		return cityID;
	}
	public void setCityID(Integer cityID) {
		this.cityID = cityID;
	}
	public Integer getDistrictID() {
		return districtID;
	}
	public void setDistrictID(Integer districtID) {
		this.districtID = districtID;
	}
	public Integer getCompoundID() {
		return compoundID;
	}
	public void setCompoundID(Integer compoundID) {
		this.compoundID = compoundID;
	}
	public Integer getZoneID() {
		return zoneID;
	}
	public void setZoneID(Integer zoneID) {
		this.zoneID = zoneID;
	}
	public Integer getSubareaID() {
		return subareaID;
	}
	public void setSubareaID(Integer subareaID) {
		this.subareaID = subareaID;
	}
	public String getMinRentStart() {
		return minRentStart;
	}
	public void setMinRentStart(String minRentStart) {
		this.minRentStart = minRentStart;
	}
	public String getMaxRentStart() {
		return maxRentStart;
	}
	public void setMaxRentStart(String maxRentStart) {
		this.maxRentStart = maxRentStart;
	}
	public String getMinRentEnd() {
		return minRentEnd;
	}
	public void setMinRentEnd(String minRentEnd) {
		this.minRentEnd = minRentEnd;
	}
	public String getMaxRentEnd() {
		return maxRentEnd;
	}
	public void setMaxRentEnd(String maxRentEnd) {
		this.maxRentEnd = maxRentEnd;
	}
	public Integer[] getStatus() {
		return status;
	}
	public void setStatuses(Integer[] statuses) {
		this.status = statuses;
	}
	public Timestamp getApprovedFrom() {
		return approvedFrom;
	}
	public void setApprovedFrom(Timestamp approvedFrom) {
		this.approvedFrom = approvedFrom;
	}
	public Timestamp getApprovedTo() {
		return approvedTo;
	}
	public void setApprovedTo(Timestamp approvedTo) {
		this.approvedTo = approvedTo;
	}
	public Integer[] getPropertyID() {
		return propertyID;
	}
	public void setPropertyID(Integer[] propertyID) {
		this.propertyID = propertyID;
	}
}