package com.qjr.eluosi.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.qjr.eluosi.pojo.FightInfo;
import com.qjr.eluosi.pojo.User;
import com.qjr.eluosi.pojo.nameAndIntegral;
import com.qjr.eluosi.pojo.nameAndTimes;

public interface UserService {
	public User LoginUser(User user);
	public boolean  registerUser(User user);
	public boolean notExistUsername(String userName);
	public List<User> findUsers(RowBounds rowBounds);
	public User findUserByName(String userName);
	public void Result(String victoryUserName, String defeatedUserName);
	public List<nameAndIntegral> findUsersByIntegral(RowBounds rowBounds);
	public List<nameAndTimes> findUserByTimes(RowBounds rowBounds);
	public User findFightInfos(String userName);
	public void updateUser(User user);
	
}
