package com.vegan.recipe.freeBoard.mapper;

import java.util.List;

import com.vegan.recipe.freeBoard.freeboardVO;

public interface IfreeBoardMapper {

//	글 등록
	void insertFreeboard(freeboardVO vo);
//	글 목록
	List<freeboardVO> getFreeBoard();
//	글 상세보기 
	freeboardVO freeDetail(int freeboard_no);
}
