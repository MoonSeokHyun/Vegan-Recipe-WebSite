package com.vegan.recipe.commnet.Service;

import java.util.List;

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
	public List<CommentVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void getTotal() {
		// TODO Auto-generated method stub

	}

}
