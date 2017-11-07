package com.qjr.eluosi.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class User implements Serializable{
	private String userId;
	private List<FightInfo> fightList;
	@NotNull
	@Size(min=1 ,max=15)
	private String userName;
	
	@NotNull
	@Size(min=5 ,max=15)
	private String password;
	private Date createTime;
	private Integer integral=0;
	private Integer times;
	private Integer winTimes;
	private Integer defeatedTimes;
	private int grade=1;

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public List<FightInfo> getFightList() {
		return fightList;
	}
	public void setFightList(List<FightInfo> fightList) {
		this.fightList = fightList;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getIntegral() {
		return integral%300;
	}
	public void setIntegral(Integer integral) {
		this.integral = integral;
	}
	public Integer getTimes() {
		return times;
	}
	public void setTimes(Integer times) {
		this.times = times;
	}
	public Integer getWinTimes() {
		return winTimes;
	}
	public void setWinTimes(Integer winTimes) {
		this.winTimes = winTimes;
	}
	public Integer getDefeatedTimes() {
		return defeatedTimes;
	}
	public void setDefeatedTimes(Integer defeatedTimes) {
		this.defeatedTimes = defeatedTimes;
	}
	public int getGrade() {
		return (integral/300)+1;
	}	
	public void setGrade(int grade) {
		this.grade = grade;
	}	
}
