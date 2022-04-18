package com.vegan.recipe.commnet.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.recipe.commnet.CommentVO;
import com.vegan.recipe.commnet.mapper.ICommentMapper;
@Service
public class CommentService implements ICommentService {

	@Autowired
	private ICommentMapper mapper;
	
	@Override
	public void insertCom(CommentVO vo) {
		mapper.insertCom(vo);
	}

	@Override
	public List<CommentVO> getList(int bno , int comment_type) {
		List<CommentVO> list = new ArrayList<CommentVO>();
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("bno", bno);
		data.put("comment_type", comment_type);
		
		return mapper.getList(data);
	}

	@Override
	public int getTotal(int bno , int comment_type) {
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("bno", bno);
		data.put("comment_type", comment_type);
		return mapper.getTotal(data);
	}
	
	@Override
	public void deleteCOm(int comment_no) {
		mapper.deleteCOm(comment_no);
		
	}
}
