package com.bamsa.db.beans;

import java.sql.Blob;
import java.util.Arrays;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class CandidateInfoBean {

	private int ciid;
	private String firstName;
	private String middleName;
	private String lastName;
	private String emailid;
	private String mobile;
	private Date availableFrom;
	private String visaStatus;
	private char gender;
	private Date createdDate;
	private String coverletter;
	private String resume;
	private String state;
	private String city;
	private String typeofConsultant;
	private char hotlist;
	private char relocate;
	private String primaryskills;
	private String ssn;
	private String billRateType;
	private Float rate;
	private int createdby;
	private String empId;
	
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public int getCreatedby() {
		return createdby;
	}
	public void setCreatedby(int createdby) {
		this.createdby = createdby;
	}
	public int getCiid() {
		return ciid;
	}
	public void setCiid(int ciid) {
		this.ciid = ciid;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Date getAvailableFrom() {
		return availableFrom;
	}
	public void setAvailableFrom(Date availableFrom) {
		this.availableFrom = availableFrom;
	}
	public String getVisaStatus() {
		return visaStatus;
	}
	public void setVisaStatus(String visaStatus) {
		this.visaStatus = visaStatus;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
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
	public String getTypeofConsultant() {
		return typeofConsultant;
	}
	public void setTypeofConsultant(String typeofConsultant) {
		this.typeofConsultant = typeofConsultant;
	}
	public char getHotlist() {
		return hotlist;
	}
	public void setHotlist(char hotlist) {
		this.hotlist = hotlist;
	}
	public char getRelocate() {
		return relocate;
	}
	public void setRelocate(char relocate) {
		this.relocate = relocate;
	}
	public String getPrimaryskills() {
		return primaryskills;
	}
	public void setPrimaryskills(String primaryskills) {
		this.primaryskills = primaryskills;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getBillRateType() {
		return billRateType;
	}
	public void setBillRateType(String billRateType) {
		this.billRateType = billRateType;
	}
	public Float getRate() {
		return rate;
	}
	public void setRate(Float rate) {
		this.rate = rate;
	}
	public String getCoverletter() {
		return coverletter;
	}
	public void setCoverletter(String coverletter) {
		this.coverletter = coverletter;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CandidateInfoBean [ciid=");
		builder.append(ciid);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", middleName=");
		builder.append(middleName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", emailid=");
		builder.append(emailid);
		builder.append(", mobile=");
		builder.append(mobile);
		builder.append(", availableFrom=");
		builder.append(availableFrom);
		builder.append(", visaStatus=");
		builder.append(visaStatus);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", createdDate=");
		builder.append(createdDate);
		builder.append(", state=");
		builder.append(state);
		builder.append(", city=");
		builder.append(city);
		builder.append(", typeofConsultant=");
		builder.append(typeofConsultant);
		builder.append(", hotlist=");
		builder.append(hotlist);
		builder.append(", relocate=");
		builder.append(relocate);
		builder.append(", primarysilla=");
		builder.append(primaryskills);
		builder.append(", ssn=");
		builder.append(ssn);
		builder.append(", createdby=");
		builder.append(createdby);
		builder.append(", resume=");
		builder.append(resume);
		builder.append(", coverletter=");
		builder.append(coverletter);
		builder.append(", billRateType=");
		builder.append(billRateType);
		builder.append(", rate=");
		builder.append(rate);
		builder.append(", empId=");
		builder.append(empId);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
}
