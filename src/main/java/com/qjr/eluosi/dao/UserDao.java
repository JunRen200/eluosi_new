package com.qjr.eluosi.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Qualifier;

import com.qjr.eluosi.pojo.FightInfo;
import com.qjr.eluosi.pojo.User;
import com.qjr.eluosi.pojo.nameAndIntegral;
import com.qjr.eluosi.pojo.nameAndTimes;

public interface UserDao {
	public User loginUser(User user);
	
	public int inserUser(User user);
	
	public List<User> findUsers(RowBounds rowBounds);
		
	public int increaseUserIntegral(String userName);
	
	public int increaseUserTimes(String userName);
	
	public List<nameAndIntegral> findUsersByIntegral(RowBounds rowBounds);

	public User findUserByName(String userName);

	public List<nameAndTimes> findUsersByTimes(RowBounds rowBounds);

	public void victoryUserByName(String userName);

	public void defeatedByName(String userName);

	public String findIdByName(String victoryUserName);

	public User findFightInfos(@Param("userName") String userName);

	public void updatePassword(User user);
	
}
