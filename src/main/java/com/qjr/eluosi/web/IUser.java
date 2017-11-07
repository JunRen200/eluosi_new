package com.qjr.eluosi.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.qjr.eluosi.pojo.FightInfo;
import com.qjr.eluosi.pojo.User;
import com.qjr.eluosi.pojo.nameAndIntegral;

public interface IUser {
	
	public boolean LoginUser(User user);
	
	public String RegisterUser(User user, Errors errors, HttpServletRequest request,
			HttpServletResponse response, String kaptchaReceived);
	
	public User findUserByName(String userName);
	
	public List<FightInfo> fightMessage(String userName);
}
