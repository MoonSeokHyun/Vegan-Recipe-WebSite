package com.vegan.recipe.freeBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vegan.recipe.freeBoard.Service.IfreeBoardService;

@Controller
@RequestMapping("/FreeBoard")
public class freeBoardController {
	
	@Autowired
	private IfreeBoardService service;
	
//	자유게시판 이동 메소드
	@GetMapping("/freeList")
	public String getFree(Model model) {
		System.out.println("자유 게시판으로 이동");
		
		model.addAttribute("freeList", service.getFreeBoard());
		
		return "/FreeBoard/freeList";
	}
//	글쓰기페이지로 이동 메소드
	@GetMapping("/freeWrite")
	public void freeWrite() {
		System.out.println("글쓰기 페이지로 이동");
	}
	
//	글 등록 
	@PostMapping("/insertFreeboard")
	public String insertFreeboard(freeboardVO vo) {
		
		service.insertFreeboard(vo);
		System.out.println("인서트 성공요");
		
		return "redirect:/FreeBoard/freeList";
	}
	
//	상세보기
	@GetMapping("/freeDetail")
	public void freeDetail(int freeboard_no, Model model) {
		
		System.out.println("상세보기 페이지");
		model.addAttribute("Detail", service.freeDetail(freeboard_no));
		
	}
}
