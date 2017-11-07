package com.qjr.eluosi.web;

import org.springframework.web.bind.annotation.RequestParam;

public interface IOver {

	public void Result(@RequestParam("userName") String VictoryUserName,String DefeatedUserName);
	
}
