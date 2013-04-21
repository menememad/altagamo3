package com.altagamo3.to;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;


public class Property implements Serializable{
	
	private static final long serialVersionUID = 8417219923229702703L;
	private Integer id;
	private String title;
	private PropertyType propertyType;
	private Integer propertyFor;
	private String description;
	private Location country;
	private Location state;
	private Location city;
	private Location compound;
	private Location district;
	private Location zone;
	private Location subarea;
	private Integer price;
	private Integer rentalPeriod;
	private Integer paymentType;
	private Integer paymentInAdvance;
	private Integer installmentTotalDuration;
	private User createdBy;
	private Timestamp createdAt;
	private Integer furnitureStatus;
	private Integer finishingStatus;
	private Integer area;
	private Integer subtype;
	private Integer floorNo;
	private Integer noOfBedRooms;
	private Integer noOfHallRooms;
	private Integer noOfBathRooms;
	private String commercialFlag;
	private boolean inCompoundFlag;
	private User approvedBy;
	private Timestamp approvedAt;
	private User client;
	private String videoLink;
	private List<Image> imagesList;
	private List<Object[]> objects;
	private Integer status;
	private String stPropertyTypeName;
	private Date rentStartDate;
	private Date rentEndDate;
	private int imageCount;
	public Integer getId() {
		return id;
	}
	public PropertyType getPropertyType() {
		return propertyType;
	}
	public Integer getPropertyFor() {
		return propertyFor;
	}
	public String getDescription() {
		return description;
	}
	public Integer getPrice() {
		return price;
	}
	public Integer getRentalPeriod() {
		return rentalPeriod;
	}
	public Integer getPaymentType() {
		return paymentType;
	}
	public Integer getPaymentInAdvance() {
		return paymentInAdvance;
	}
	public Integer getInstallmentTotalDuration() {
		return installmentTotalDuration;
	}
	public User getCreatedBy() {
		if(createdBy==null)
			createdBy = new User();
		return createdBy;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public Integer getFurnitureStatus() {
		return furnitureStatus;
	}
	public Integer getArea() {
		return area;
	}
	public Integer getSubtype() {
		return subtype;
	}
	public Integer getFloorNo() {
		return floorNo;
	}
	public Integer getNoOfBedRooms() {
		return noOfBedRooms;
	}
	public Integer getNoOfHallRooms() {
		return noOfHallRooms;
	}
	public Integer getNoOfBathRooms() {
		return noOfBathRooms;
	}
	public String getCommercialFlag() {
		return commercialFlag;
	}
	public boolean isInCompoundFlag() {
		return inCompoundFlag;
	}
	public List<Image> getImagesList() {
		return imagesList;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setPropertyType(PropertyType propertyType) {
		this.propertyType = propertyType;
	}
	public void setPropertyFor(Integer propertyFor) {
		this.propertyFor = propertyFor;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public void setRentalPeriod(Integer rentalPeriod) {
		this.rentalPeriod = rentalPeriod;
	}
	public void setPaymentType(Integer paymentType) {
		this.paymentType = paymentType;
	}
	public void setPaymentInAdvance(Integer paymentInAdvance) {
		this.paymentInAdvance = paymentInAdvance;
	}
	public void setInstallmentTotalDuration(Integer installmentTotalDuration) {
		this.installmentTotalDuration = installmentTotalDuration;
	}
	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public void setFurnitureStatus(Integer furnitureStatus) {
		this.furnitureStatus = furnitureStatus;
	}
	public void setArea(Integer area) {
		this.area = area;
	}
	public void setSubtype(Integer subtype) {
		this.subtype = subtype;
	}
	public void setFloorNo(Integer floorNo) {
		this.floorNo = floorNo;
	}
	public void setNoOfBedRooms(Integer noOfBedRooms) {
		this.noOfBedRooms = noOfBedRooms;
	}
	public void setNoOfHallRooms(Integer noOfHallRooms) {
		this.noOfHallRooms = noOfHallRooms;
	}
	public void setNoOfBathRooms(Integer noOfBathRooms) {
		this.noOfBathRooms = noOfBathRooms;
	}
	public void setCommercialFlag(String commercialFlag) {
		this.commercialFlag = commercialFlag;
	}
	public void setInCompoundFlag(boolean inCompoundFlag) {
		this.inCompoundFlag = inCompoundFlag;
	}
	public void setImagesList(List<Image> imagesList) {
		this.imagesList = imagesList;
	}
	public User getApprovedBy() {
		return approvedBy;
	}
	public Timestamp getApprovedAt() {
		return approvedAt;
	}
	public String getVideoLink() {
		return videoLink;
	}
	public void setApprovedBy(User approvedBy) {
		this.approvedBy = approvedBy;
	}
	public void setApprovedAt(Timestamp approvedAt) {
		this.approvedAt = approvedAt;
	}
	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}
	public Integer getFinishingStatus() {
		return finishingStatus;
	}
	public void setFinishingStatus(Integer finishingStatus) {
		this.finishingStatus = finishingStatus;
	}
	public List<Object[]> getObjects() {
		return objects;
	}
	public void setObjects(List<Object[]> objects) {
		this.objects = objects;
	}
	public String getStPropertyTypeName() {
		return stPropertyTypeName;
	}
	public void setStPropertyTypeName(String stPropertyTypeName) {
		this.stPropertyTypeName = stPropertyTypeName;
	}
	public User getClient() {
		return client;
	}
	public void setClient(User client) {
		this.client = client;
	}
	public Location getCountry() {
		return country;
	}
	public Location getState() {
		return state;
	}
	public Location getCity() {
		return city;
	}
	public Location getCompound() {
		return compound;
	}
	public Location getDistrict() {
		return district;
	}
	public Location getZone() {
		return zone;
	}
	public Location getSubarea() {
		return subarea;
	}
	public void setCountry(Location country) {
		this.country = country;
	}
	public void setState(Location state) {
		this.state = state;
	}
	public void setCity(Location city) {
		this.city = city;
	}
	public void setCompound(Location compound) {
		this.compound = compound;
	}
	public void setDistrict(Location district) {
		this.district = district;
	}
	public void setZone(Location zone) {
		this.zone = zone;
	}
	public void setSubarea(Location subarea) {
		this.subarea = subarea;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getRentStartDate() {
		return rentStartDate;
	}
	public void setRentStartDate(Date rentStartDate) {
		this.rentStartDate = rentStartDate;
	}
	public Date getRentEndDate() {
		return rentEndDate;
	}
	public void setRentEndDate(Date rentEndDate) {
		this.rentEndDate = rentEndDate;
	}
	public int getImageCount() {
		return imageCount;
	}
	public void setImageCount(int imageCount) {
		this.imageCount = imageCount;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
}