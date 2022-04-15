package com.vegan.recipe.commnet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vegan.recipe.commnet.Service.ICommentService;

@RestController
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
	
	@GetMapping("/getList/{bno}/{comment_type}")
	public Map<String, Object> getList(@PathVariable int bno , @PathVariable int comment_type) {
		System.out.println(bno +","+comment_type + "번 댓글 리스트 요청");
		int Total = service.getTotal(bno, comment_type);
		System.out.println(Total);
		List<CommentVO> list = service.getList(bno, comment_type);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", Total);
		map.put("getList", list);
		System.out.println(map);
		
		return map;
		
		
		
	}
}
