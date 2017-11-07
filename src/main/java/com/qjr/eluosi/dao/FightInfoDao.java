package com.qjr.eluosi.dao;

import org.apache.ibatis.annotations.Param;

import com.qjr.eluosi.pojo.FightInfo;

public interface FightInfoDao {
	public int insert(FightInfo fightInfo);
	public int findFightInfoByUserid(@Param("id")String id);
}
