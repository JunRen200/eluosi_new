package com.qjr.eluosi.pojo;

import java.io.Serializable;

public class nameAndTimes implements Serializable {
	private String userName;
	//积分
	private long times;
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public long getTimes() {
		return times;
	}
	public void setTimes(long times) {
		this.times = times;
	}
	
}
