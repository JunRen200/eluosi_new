package com.qjr.eluosi.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qjr.eluosi.dao.FightInfoDao;
import com.qjr.eluosi.dao.UserDao;
import com.qjr.eluosi.pojo.FightInfo;
import com.qjr.eluosi.pojo.User;
import com.qjr.eluosi.pojo.nameAndIntegral;
import com.qjr.eluosi.pojo.nameAndTimes;
import com.qjr.eluosi.service.UserService;

@Service("userService")
public class UserServiceimpl implements UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private FightInfoDao fightInfoDao;
	
	public User LoginUser(User user) {
		User loginuser=userDao.loginUser(user);
		return loginuser;
	}

	public List<User> findUsers(RowBounds rowBounds) {
		return userDao.findUsers(rowBounds);
	}


	public int increaseUserIntegral(String userName) {
		return userDao.increaseUserIntegral(userName);
	}


	public int increaseUserTimes(String userName) {
		return userDao.increaseUserTimes(userName);
	}


	public List<nameAndIntegral> findUsersByIntegral(RowBounds rowBounds) {
		
		return userDao.findUsersByIntegral(rowBounds);
	}


	public boolean notExistUsername(String userName) {
		User user=userDao.findUserByName(userName);
		if(user==null){
			return true;
		}
		return false;
	}

	public boolean registerUser(User user) {
		if(notExistUsername(user.getUserName())){
			int num=userDao.inserUser(user);
			if(num>0){
				return true;
			}
		}
		return false;
	}


	public List<nameAndTimes> findUserByTimes(RowBounds rowBounds) {
		return userDao.findUsersByTimes(rowBounds);
	}


	public User findUserByName(String userName) {
		return userDao.findUserByName(userName);
	}

	public void Result(String victoryUserName, String defeatedUserName) {
		//增加积分，场数，胜场
		userDao.defeatedByName(defeatedUserName);
		//获取id
		String defeatedId=userDao.findIdByName(defeatedUserName);
		//增加场数，输场
		userDao.victoryUserByName(victoryUserName);
		//获取id
		String victoryId=userDao.findIdByName(victoryUserName);
		
		FightInfo win=this.initFightInfo(1,victoryId,defeatedUserName);
		
		FightInfo defeated=this.initFightInfo(0,defeatedId,victoryUserName);
		
		fightInfoDao.insert(win);
		fightInfoDao.insert(defeated);
	}

	public FightInfo initFightInfo(int result,String userId,String oppsite){
		FightInfo fightInfo=new FightInfo();
		fightInfo.setResult(result);
		fightInfo.setUserId(userId);
		fightInfo.setOppsite(oppsite);
		return fightInfo;
	}

	public User findFightInfos(String userName) {
		
		return userDao.findFightInfos(userName);
	}

	@Override
	public void updateUser(User user) {
		 userDao.updatePassword(user);
	}


}
