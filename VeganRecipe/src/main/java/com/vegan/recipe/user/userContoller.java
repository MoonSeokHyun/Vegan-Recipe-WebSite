package com.vegan.recipe.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class userContoller {
	
	@GetMapping("/login")
	public void login() {
		System.out.println("로그인 페이지로 이동");
	}
	
	@GetMapping("userSign")
	public void userSign() {
		System.out.println("회원가입 페이지로 이동!");
	}
}
