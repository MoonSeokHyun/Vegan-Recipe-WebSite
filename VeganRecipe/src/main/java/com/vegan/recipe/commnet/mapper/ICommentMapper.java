package com.vegan.recipe.commnet.mapper;

import java.util.List;

import com.vegan.recipe.commnet.CommentVO;

public interface ICommentMapper {

	// 댓글 등록
	void insertCom(CommentVO vo);
	
	// 댓글 리스트
	List<CommentVO> getList();
	
	// 댓글 총 개수
	void getTotal();
}
