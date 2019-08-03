package com.hwaboon.myapp.user.model;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {

	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private Date userRegDate;
	private String sessionId;
	private Date sessionLimit;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Date getUserRegDate() {
		return userRegDate;
	}
	public void setUserRegDate(Date userRegDate) {
		this.userRegDate = userRegDate;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public Date getSessionLimit() {
		return sessionLimit;
	}
	public void setSessionLimit(Date sessionLimit) {
		this.sessionLimit = sessionLimit;
	}
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userEmail=" + userEmail
				+ ", userRegDate=" + userRegDate + ", sessionId=" + sessionId + ", sessionLimit=" + sessionLimit + "]";
	}
	
	
	
}
