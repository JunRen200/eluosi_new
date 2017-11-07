package com.qjr.eluosi.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.google.code.kaptcha.Constants;
import com.qjr.eluosi.pojo.FightInfo;
import com.qjr.eluosi.pojo.User;
import com.qjr.eluosi.service.UserService;
import com.qjr.eluosi.web.IUser;

@RestController("MyUser")
@RequestMapping("/User")
public class UserController implements IUser {

	@Autowired
	private UserService userService;

	//用户登录
	@RequestMapping("/LoginUser")
	public boolean LoginUser(User user) {
		User loginUser = userService.LoginUser(user);
		if (loginUser == null) {
			return false;
		}
		return true;
	}

	//用户注册(验证码)
	@RequestMapping("/RegisterUser")
	public String RegisterUser(@Valid User user, Errors errors, HttpServletRequest request,
			HttpServletResponse response, @RequestParam(value = "kaptcha", required = true) String kaptchaReceived) {

		String kaptchaExpected = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);

		if (kaptchaReceived == null || !kaptchaReceived.equals(kaptchaExpected)) {
			System.err.println(kaptchaReceived);
			System.out.println(kaptchaExpected);
			System.out.println("返回验证码错误");
			return "kaptcha_error";// 返回验证码错误
		}

		boolean a = false;
		if (errors.hasErrors()) {
			List<FieldError> errorList = errors.getFieldErrors();
			for (FieldError error : errorList) {
				System.out.println("错误信息" + error.getDefaultMessage());
			}
			return "defeated";
		} else {
			a = userService.registerUser(user);
		}
		if(a==true){
			return "success"; // 校验通过返回成功
		}
		return "defeated";

	}
	//
	@RequestMapping("/check")
	public String loginCheck(HttpServletRequest request,
			@RequestParam(value = "kaptcha", required = true) String kaptchaReceived) {
		System.out.println("===============================================================");
		// 用户输入的验证码的值
		String kaptchaExpected = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		// 校验验证码是否正确
		if (kaptchaReceived == null || !kaptchaReceived.equals(kaptchaExpected)) {
			System.out.println(" "+kaptchaReceived);
			System.out.println(" "+kaptchaExpected);
			return "kaptcha_error";// 返回验证码错误
		}

		return "success"; // 校验通过返回成功
	}

	//验证用户名是否存在
	@RequestMapping("/notExistUsername")
	public boolean notExistUsername(@RequestParam("userName") String userName) {
		return userService.notExistUsername(userName);
	}

	//个人信息查看
	@RequestMapping("/FindUserByName")
	public User findUserByName(@RequestParam("userName") String userName) {
		return userService.findUserByName(userName);
	}

	//个人战绩查看
	@RequestMapping("/fightMessage")
	public List<FightInfo> fightMessage(String userName) {
		return userService.findFightInfos(userName).getFightList();
	}

	//修改密码
	@RequestMapping("/updatePassword")
	public String updatePassword(String userName,String oldPassword,String newPassword) {
		if(newPassword.length()<5){
			return "lose";
		}
		User user=new User();
		user.setUserName(userName);
		user.setPassword(oldPassword);
		User oldUser=userService.LoginUser(user);
		if (oldUser == null) {
			return "lose";
		}
		oldUser.setPassword(newPassword);
		userService.updateUser(oldUser);
		return "success";

	}

}
