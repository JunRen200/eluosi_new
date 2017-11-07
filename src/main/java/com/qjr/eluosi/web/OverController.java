package com.qjr.eluosi.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.qjr.eluosi.service.UserService;
import com.qjr.eluosi.web.IOver;

@RestController("MyOver")
@RequestMapping("/Over")
public class OverController implements IOver{
	
	@Autowired
	private UserService userService;
	//游戏结束，积分结算，游戏结果记录
	@RequestMapping("/Result")
	public void Result(String VictoryUserName, String DefeatedUserName) {
		userService.Result(VictoryUserName, DefeatedUserName);
	}	
}
