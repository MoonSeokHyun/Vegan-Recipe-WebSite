package com.vegan.recipe.freeBoard.mapper;

import java.util.List;
import java.util.Map;

import com.vegan.recipe.freeBoard.freeboardVO;
import com.vegan.recipe.util.LikeVO;
import com.vegan.recipe.util.PageVO;

public interface IfreeBoardMapper {

//	글 등록
	void insertFreeboard(freeboardVO vo);
//	글 목록
	List<freeboardVO> getFreeBoard(PageVO vo);
//	글 상세보기 
	freeboardVO freeDetail(int freeboard_no);
	int getTotal(PageVO vo);
	void hit(int freeboard_no);
	void comCNT(int freeboard_no);
	int findLike(Map<String, Object> data);
	void likeUp(Map<String, Object> data);
	void likeDown(Map<String, Object> data);
	int getLike(int board_no);
	void deleteFree(int freeboard_no);
	void updateFree(freeboardVO vo);
}
