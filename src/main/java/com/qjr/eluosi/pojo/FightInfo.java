package com.qjr.eluosi.pojo;

import java.io.Serializable;
import java.util.Date;

public class FightInfo implements Serializable {
	private String fightInfoId;
	private String userId;
	private Integer result;
	private String oppsite;//对战用户名
	private Date fightTime;


	public Date getFightTime() {
		return fightTime;
	}
	public void setFightTime(Date fightTime) {
		this.fightTime = fightTime;
	}
	public String getFightInfoId() {
		return fightInfoId;
	}
	public void setFightInfoId(String fightInfoId) {
		this.fightInfoId = fightInfoId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getResult() {
		return result;
	}
	public void setResult(Integer result) {
		this.result = result;
	}
	public String getOppsite() {
		return oppsite;
	}
	public void setOppsite(String oppsite) {
		this.oppsite = oppsite;
	}
	
	
}
