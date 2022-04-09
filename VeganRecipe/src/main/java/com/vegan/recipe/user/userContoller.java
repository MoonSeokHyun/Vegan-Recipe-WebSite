package com.vegan.recipe.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vegan.recipe.user.common.UserVO;
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
	public String idCheck(@RequestBody String user_id) {
		
		int usercheck = service.idCheck(user_id);
		System.out.println(usercheck);
		System.out.println(user_id);
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
	
	
//	유저 회원 가입
	
	@PostMapping("/insertUser")
	public String insertUser(UserVO vo) {
		System.out.println("회원가입 요청"+vo);
		service.joinUser(vo);
		return "redirect:/user/login";
	}
	
	@ResponseBody
	@PostMapping("/userLogin")
	public String userLogin(@RequestBody UserVO vo, HttpSession session) {
		System.out.println(vo.getUser_id() + "로그인 요청");
		UserVO dbData = service.Login(vo.getUser_id(), vo.getUser_pw());
		
		if(dbData != null) {
			session.setAttribute("login", dbData);
			return "loginSuccess";
		}else {
			return "loginFail";
		}
	
	}
	
}
