package com.qjr.eluosi.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.qjr.eluosi.pojo.nameAndIntegral;
import com.qjr.eluosi.pojo.nameAndTimes;

public interface FightInfoService {
	public List<nameAndIntegral> findUsersByIntegral(RowBounds rowBounds);
	public List<nameAndTimes> findUserByTimes(RowBounds rowBounds);
}
