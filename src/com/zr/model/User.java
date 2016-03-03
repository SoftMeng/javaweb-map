package com.zr.model;

import java.util.Calendar;

public class User {
	private String userId;
	private String userType;
	private String userName;
	private String userPwd;
	private String userSex;
	private Integer userAge;
	private Calendar userLoginTime;
	private String userCard;
	private String userLocation;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public Integer getUserAge() {
		return userAge;
	}
	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}
	public Calendar getUserLoginTime() {
		return userLoginTime;
	}
	public void setUserLoginTime(Calendar userLoginTime) {
		this.userLoginTime = userLoginTime;
	}
	
	public String getUserCard() {
		return userCard;
	}
	public void setUserCard(String userCard) {
		this.userCard = userCard;
	}
	public String getUserLocation() {
		return userLocation;
	}
	public void setUserLocation(String userLocation) {
		this.userLocation = userLocation;
	}
	
		
}
