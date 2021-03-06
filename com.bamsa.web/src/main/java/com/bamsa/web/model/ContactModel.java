package com.bamsa.web.model;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ContactModel {

	private int acid;
	private String accountName;
	private String accountOwner;
	private String category;
	private String website;
	private String status;
	private String addresInfo;
	private String phoneno;
	private String state;
	private String city;
	private String primaryemail;
	private String description;
	private String firstname;
	private String lastname;
	private String secondaryemail;
	private char reqlist;
	private char hotlist;
	private Date createddate;
	private int createdby;
	private String empId;
	
	public int getCreatedby() {
		return createdby;
	}
	public void setCreatedby(int createdby) {
		this.createdby = createdby;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public Date getCreateddate() {
		return createddate;
	}
	public void setCreateddate(Date createddate) {
		this.createddate = createddate;
	}
	public int getAcid() {
		return acid;
	}
	public void setAcid(int acid) {
		this.acid = acid;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getAccountOwner() {
		return accountOwner;
	}
	public void setAccountOwner(String accountOwner) {
		this.accountOwner = accountOwner;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAddresInfo() {
		return addresInfo;
	}
	public void setAddresInfo(String addresInfo) {
		this.addresInfo = addresInfo;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPrimaryemail() {
		return primaryemail;
	}
	public void setPrimaryemail(String primaryemail) {
		this.primaryemail = primaryemail;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getSecondaryemail() {
		return secondaryemail;
	}
	public void setSecondaryemail(String secondaryemail) {
		this.secondaryemail = secondaryemail;
	}
	public char getReqlist() {
		return reqlist;
	}
	public void setReqlist(char reqlist) {
		this.reqlist = reqlist;
	}
	public char getHotlist() {
		return hotlist;
	}
	public void setHotlist(char hotlist) {
		this.hotlist = hotlist;
	}
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ContactBean [acid=");
		builder.append(acid);
		builder.append(", accountName=");
		builder.append(accountName);
		builder.append(", accountOwner=");
		builder.append(accountOwner);
		builder.append(", category=");
		builder.append(category);
		builder.append(", website=");
		builder.append(website);
		builder.append(", status=");
		builder.append(status);
		builder.append(", addresInfo=");
		builder.append(addresInfo);
		builder.append(", phoneno=");
		builder.append(phoneno);
		builder.append(", state=");
		builder.append(state);
		builder.append(", city=");
		builder.append(city);
		builder.append(", primaryemail=");
		builder.append(primaryemail);
		builder.append(", description=");
		builder.append(description);
		builder.append(", firstname=");
		builder.append(firstname);
		builder.append(", lastname=");
		builder.append(lastname);
		builder.append(", secondaryemail=");
		builder.append(secondaryemail);
		builder.append(",reqlist=");
		builder.append(reqlist);
		builder.append(", hotlist=");
		builder.append(hotlist);
		builder.append(",createddate=");
		builder.append(createddate);
		builder.append(", createdby=");
		builder.append(createdby);
		builder.append(",empId=");
		builder.append(empId);
		
		builder.append("]");
		return builder.toString();
	}
}
