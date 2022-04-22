package com.vegan.recipe.news;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/news")
public class newsController {
//	ㄹ
	@GetMapping("newsList")
	public void newsList() {
		System.out.println("뉴스페이지로 이동");
	}
	
	@GetMapping("/newsWrite")
	public void newsWrite() {
		System.out.println("뉴스 작성페이지로 이동");
	}
}
