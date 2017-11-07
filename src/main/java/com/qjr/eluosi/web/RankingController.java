package com.qjr.eluosi.web;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.qjr.eluosi.pojo.nameAndIntegral;
import com.qjr.eluosi.pojo.nameAndTimes;
import com.qjr.eluosi.service.UserService;
import com.qjr.eluosi.web.IRanking;


@RestController("MyRanking")
@RequestMapping("/Ranking")
public class RankingController implements IRanking{
	@Autowired
	private UserService userService;
	
	//等级排行榜
	@RequestMapping("/integralRanking")
	public List<nameAndIntegral> integralRanking(){
		RowBounds rowBounds =new RowBounds(0,10);
		return userService.findUsersByIntegral(rowBounds);
	}
	
	//场数排行榜
	@RequestMapping("/timesRanking")
	public List<nameAndTimes> timesRanking(){
		RowBounds rowBounds =new RowBounds(0,10);
		return userService.findUserByTimes(rowBounds);
	}
}
