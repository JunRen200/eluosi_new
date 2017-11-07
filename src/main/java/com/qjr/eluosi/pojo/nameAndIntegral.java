package com.qjr.eluosi.pojo;

import java.io.Serializable;

public class nameAndIntegral implements Serializable {
	private String userName;
	//积分
	private Integer integral=0;
	private int grade=1;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getIntegral() {
		return integral%300;
	}
	public void setIntegral(Integer integral) {
		this.integral = integral;
	}
	public int getGrade() {
		return (integral/300)+1;
	}	
	public void setGrade(int grade) {
		this.grade = grade;
	}	
}
