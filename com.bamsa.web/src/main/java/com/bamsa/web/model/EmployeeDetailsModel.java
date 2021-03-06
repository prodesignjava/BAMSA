package com.bamsa.web.model;


import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class EmployeeDetailsModel {
	private int uid;
	private String name;
	private String empId;
	private Date dob;
	private String dateofbirth;
	private Date doj;
	private String mobileNo;
	private String emergencyMobileNo;
	private String email;
	private char gender;
	private byte[] picture;
	private float salary;
	private int streamId;
	private Date inTime;
	private Date outTime;
	private int desigId;
	private int hierarchyId;
	private String profilepic;
	private String branchname;


	

	public String getBranchname() {
		return branchname;
	}

	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}

	public String getProfilepic() {
		return profilepic;
	}

	public void setProfilepic(String profilepic) {
		this.profilepic = profilepic;
	}

	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public Date getDoj() {
		return doj;
	}

	public void setDoj(Date doj) {
		this.doj = doj;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmergencyMobileNo() {
		return emergencyMobileNo;
	}

	public void setEmergencyMobileNo(String emergencyMobileNo) {
		this.emergencyMobileNo = emergencyMobileNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public String getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public float getSalary() {
		return salary;
	}

	public void setSalary(float salary) {
		this.salary = salary;
	}

	public int getStreamId() {
		return streamId;
	}

	public void setStreamId(int streamId) {
		this.streamId = streamId;
	}

	public Date getInTime() {
		return inTime;
	}

	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}

	public Date getOutTime() {
		return outTime;
	}

	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}
	public int getDesigId() {
		return desigId;
	}
	public void setDesigId(int desigId) {
		this.desigId = desigId;
	}
	public int getHierarchyId() {
		return hierarchyId;
	}
	public void setHierarchyId(int hierarchyId) {
		this.hierarchyId = hierarchyId;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("EmployeeDetailsModel [uid=");
		builder.append(uid);
		builder.append(", name=");
		builder.append(name);
		builder.append(", empId=");
		builder.append(empId);
		builder.append(", dob=");
		builder.append(dob);
		builder.append(", doj=");
		builder.append(doj);
		builder.append(", mobileNo=");
		builder.append(mobileNo);
		builder.append(", emergencyMobileNo=");
		builder.append(emergencyMobileNo);
		builder.append(", email=");
		builder.append(email);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", dateofbirth=");
		builder.append(dateofbirth);
		builder.append(", picture=");
		builder.append(picture);
		builder.append(", salary=");
		builder.append(salary);
		builder.append(", streamId=");
		builder.append(streamId);
		builder.append(", inTime=");
		builder.append(inTime);
		builder.append(", outTime=");
		builder.append(outTime);
		builder.append(", outTime=");
		builder.append(outTime);
		builder.append(", desigId=");
		builder.append(desigId);
		builder.append(", hierarchyId=");
		builder.append(hierarchyId);
		builder.append(", profilepic=");
		builder.append(profilepic);
		builder.append(", status=");
		builder.append(profilepic);
		builder.append(", branchname=");
		builder.append(branchname);
		builder.append("]");
		return builder.toString();
	}
}
