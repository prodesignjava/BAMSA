package com.bamsa.db.beans;

import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class CompanyAccessoryBean {
	
	private int caid;
	  private String accessoryname;
	  private String category;
	  private String manufacturer;
	  private String modelno;
	  private String orderno;
	  private Date purchaseDate;
	  private float purchasecost;
	  private int quantity;
	  private String accessorytag;
	  private String empid;
	  private String branchname;
		 
		 public String getBranchname() {
		return branchname;
	}
	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}
		public String getEmpid() {
			return empid;
		}
		public void setEmpid(String empid) {
			this.empid = empid;
		}
	  private Date createdBy;
	  public Date getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Date createdBy) {
		this.createdBy = createdBy;
	}
	public String getAccessorytag() {
		return accessorytag;
	}
	public void setAccessorytag(String accessorytag) {
		this.accessorytag = accessorytag;
	}

	  public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	private int userid;
		private Date createdDate;
	  public int getCaid() {
		return caid;
	}
	public void setCaid(int caid) {
		this.caid = caid;
	}
	public String getAccessoryname() {
		return accessoryname;
	}
	public void setAccessoryname(String accessoryname) {
		this.accessoryname = accessoryname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getModelno() {
		return modelno;
	}
	public void setModelno(String modelno) {
		this.modelno = modelno;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public float getPurchasecost() {
		return purchasecost;
	}
	public void setPurchasecost(float purchasecost) {
		this.purchasecost = purchasecost;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CompanyAccessoryBean [caid=");
		builder.append(caid);
		builder.append(", accessoryname=");
		builder.append(accessoryname);
		builder.append(", category=");
		builder.append(category);
		builder.append(", manufacturer=");
		builder.append(manufacturer);
		builder.append(", modelno=");
		builder.append(modelno);
		builder.append(", orderno=");
		builder.append(orderno);
		builder.append(", purchaseDate=");
		builder.append(purchaseDate);
		builder.append(", purchasecost=");
		builder.append(purchasecost);
		builder.append(", quantity=");
		builder.append(quantity);
		builder.append(", userid=");
		builder.append(userid);
		builder.append(", createdDate");
		builder.append(createdDate);
		builder.append(",accessorytag");
		builder.append(accessorytag);
		builder.append(",createdBy");
		builder.append(createdBy);
		builder.append(",empid=");
		builder.append(empid);
		builder.append(",branchname=");
		builder.append(branchname);
		builder.append("]");
		return builder.toString();
	
	}
	
}
