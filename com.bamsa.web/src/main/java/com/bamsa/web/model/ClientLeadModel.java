package com.bamsa.web.model;

import org.springframework.stereotype.Component;

@Component
public class ClientLeadModel {
	private int cid;
	private String client;
	private String contactName;
	private String phoneNo;
	private String emailId;
	private String designation;
	private String location;
	private String status;
	private String feedbackStatus;
	private String createdBy;
	private String meetingDetails;
	private int raisedBy;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFeedbackStatus() {
		return feedbackStatus;
	}
	public void setFeedbackStatus(String feedbackStatus) {
		this.feedbackStatus = feedbackStatus;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getMeetingDetails() {
		return meetingDetails;
	}
	public void setMeetingDetails(String meetingDetails) {
		this.meetingDetails = meetingDetails;
	}
	public int getRaisedBy() {
		return raisedBy;
	}
	public void setRaisedBy(int raisedBy) {
		this.raisedBy = raisedBy;
	}

}
