package com.altagamo3.to;

import java.io.Serializable;

public class SearchConditions implements Serializable{
 	private static final long serialVersionUID = -4230097930791423264L;
	private int pageNo = 1;//Initial Value
	private int itemsPerPage = 200;//Initial Value
	private static final String ORDER_ASCENDING = "ASC";
	private static final String ORDER_DESCENDING = "DESC";
	private String orderByColumn;
	private String orderByDirection = ORDER_DESCENDING;//Initial Value
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getItemsPerPage() {
		return itemsPerPage;
	}
	public void setItemsPerPage(int itemsPerPage) {
		this.itemsPerPage = itemsPerPage;
	}
	public String getOrderByColumn() {
		return orderByColumn;
	}
	public void setOrderByColumn(String orderByColumn) {
		this.orderByColumn = orderByColumn;
	}
	public String getOrderByDirection() {
		return orderByDirection;
	}
	public void isOrderAscending(boolean isAscending) {
		if(isAscending)
			orderByDirection = ORDER_ASCENDING;
		else
			orderByDirection = ORDER_DESCENDING;
	}
	public String getLimitStatement() {
		if(itemsPerPage>0 && pageNo>0)
			return " LIMIT "+itemsPerPage * (pageNo - 1)+","+itemsPerPage;
		else
			return "";
	}
	public String getOrderByStatement() {
		if(orderByColumn!=null)
			return " ORDER BY "+orderByColumn+" "+orderByDirection;
		else
			return "";
	}
}
