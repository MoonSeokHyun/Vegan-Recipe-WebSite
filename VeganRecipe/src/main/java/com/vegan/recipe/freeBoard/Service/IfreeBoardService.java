package com.vegan.recipe.freeBoard.Service;

import java.util.List;

import com.vegan.recipe.freeBoard.freeboardVO;

public interface IfreeBoardService {
	
//	글 등록
	void insertFreeboard(freeboardVO vo);
//	글 목록
	List<freeboardVO> getFreeBoard();
//	글 상세보기 
	freeboardVO freeDetail(int freeboard_no);
}
