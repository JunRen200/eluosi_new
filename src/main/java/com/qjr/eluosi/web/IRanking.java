package com.qjr.eluosi.web;

import java.util.List;

import com.qjr.eluosi.pojo.nameAndIntegral;
import com.qjr.eluosi.pojo.nameAndTimes;

public interface IRanking {

	public List<nameAndIntegral> integralRanking();
	
	public List<nameAndTimes> timesRanking();
}
