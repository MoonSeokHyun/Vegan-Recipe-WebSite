package com.vegan.recipe.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vegan.recipe.user.mail.MailService;
import com.vegan.recipe.user.service.IUserService;

@Controller
@RequestMapping("/user")
public class userContoller {
	
	@Autowired
	private IUserService service;
	@Autowired
	private MailService mailService;
	@GetMapping("/login")
	public void login() {
		System.out.println("로그인 페이지로 이동");
	}
	
	@GetMapping("userSign")
	public void userSign() {
		System.out.println("회원가입 페이지로 이동!");
	}
	
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(String user_id) {
		int usercheck = service.idCheck(user_id);
		if(usercheck == 0) {
			return "ok";
		}else {
			return "fail";
		}
		
	}
	@ResponseBody
	@GetMapping("/emailck")
	public String mailCheck(String user_email) {
		System.out.println("메일 전송 요청");
		System.out.println(user_email);
		return mailService.sendEmail(user_email);
	}
}
