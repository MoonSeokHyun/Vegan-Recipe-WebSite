package com.vegan.recipe.freeBoard.Service;

import java.util.List;

import com.vegan.recipe.freeBoard.freeboardVO;
import com.vegan.recipe.util.LikeVO;
import com.vegan.recipe.util.PageVO;

public interface IfreeBoardService {
	
//	글 등록
	void insertFreeboard(freeboardVO vo);
//	글 목록
	List<freeboardVO> getFreeBoard(PageVO vo);
//	글 상세보기 
	freeboardVO freeDetail(int freeboard_no);
	
	int getTotal(PageVO vo);
	
	void hit(int freeboard_no);
	
	void comCNT(int freeboard_no);

	// 좋아요 눌럿는지 안눌럿는지 먼저 체크 
	
	int findLike(int board_no , String user_no);
	
	void likeUp(int board_no , String user_no);
	
	void likeDown(int board_no , String user_no);
	
	int getLike(int board_no);
}
