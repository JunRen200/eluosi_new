package com.qjr.eluosi.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.qjr.eluosi.pojo.nameAndIntegral;
import com.qjr.eluosi.pojo.nameAndTimes;
import com.qjr.eluosi.service.FightInfoService;

@Service("fightService")
public class FightInfoServiceimpl implements FightInfoService {
	
	public List<nameAndIntegral> findUsersByIntegral(RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<nameAndTimes> findUserByTimes(RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}

}
