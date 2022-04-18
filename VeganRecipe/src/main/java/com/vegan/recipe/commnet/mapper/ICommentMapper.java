package com.vegan.recipe.commnet.mapper;

import java.util.List;
import java.util.Map;

import com.vegan.recipe.commnet.CommentVO;

public interface ICommentMapper {

	// 댓글 등록
	void insertCom(CommentVO vo);
	
	// 댓글 리스트
	List<CommentVO> getList(Map<String, Object> data);
	
	// 댓글 총 개수
	int getTotal(Map<String, Object> data);
	// 댓글 삭제 
	void deleteCOm(int comment_no);
}
