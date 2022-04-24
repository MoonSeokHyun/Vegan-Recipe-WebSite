package com.vegan.recipe.news;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vegan.recipe.news.service.INewsService;
import com.vegan.recipe.util.PageCreate;
import com.vegan.recipe.util.PageVO;

@Controller
@RequestMapping("/news")
public class newsController {
	@Autowired
	private INewsService service;
	
	@GetMapping("/newsList")
	public String newsList(Model model , PageVO vo) {
		System.out.println(service.Total(vo));
		PageCreate pc = new PageCreate();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.Total(vo));
		vo.setPagecnt((vo.getPageNum()-1) * vo.getCountPerPage());
		System.out.println("뉴스페이지로 이동");
		model.addAttribute("newsList", service.listNews(vo));
		model.addAttribute("pc", pc);
		
		return "news/newsList"; 
	}
	
	@GetMapping("/newsWrite")
	public void newsWrite() {
		System.out.println("뉴스 작성페이지로 이동");
	}
	
	
	@PostMapping("/newsInsert")
	public String newsInsert(VboardVO vo) {
		System.out.println(vo.getVboard_no()+"번 뉴스 작성");
		System.out.println(vo.getVboard_title());
		service.newsInsert(vo);
		
		return "redirect:/news/newsList";
	} 
	
	
	
	
	
}
