package com.vegan.recipe.commnet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vegan.recipe.commnet.Service.ICommentService;

@Controller
@RequestMapping("/com")
public class CommentContoller {

	@Autowired
	private ICommentService service;
	
	
	@PostMapping("/insertCom")
	public String insertCom(@RequestBody CommentVO vo) {
		System.out.println("댓글 등록");
		service.insertCom(vo);
		System.out.println("댓글 등록 서비스 성공");
		return "ok";
	}
}
