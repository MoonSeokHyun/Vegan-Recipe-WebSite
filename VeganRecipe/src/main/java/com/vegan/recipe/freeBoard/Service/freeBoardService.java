package com.vegan.recipe.freeBoard.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.recipe.freeBoard.freeboardVO;
import com.vegan.recipe.freeBoard.mapper.IfreeBoardMapper;
import com.vegan.recipe.util.LikeVO;
import com.vegan.recipe.util.PageVO;
@Service
public class freeBoardService implements IfreeBoardService {
	
	@Autowired
	private IfreeBoardMapper mapper;
	
	@Override
	public void insertFreeboard(freeboardVO vo) {
		mapper.insertFreeboard(vo);
	}
	@Override
	public List<freeboardVO> getFreeBoard(PageVO vo) {
	
		return mapper.getFreeBoard(vo);
	}
	@Override
	public freeboardVO freeDetail(int freeboard_no) {
		return mapper.freeDetail(freeboard_no);
	}
	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}
	@Override
	public void hit(int freeboard_no) {
		mapper.hit(freeboard_no);
	}
	@Override
	public void comCNT(int freeboard_no) {
		mapper.comCNT(freeboard_no);
		
	}
	@Override
	public int findLike(int board_no, String user_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", board_no);
		map.put("user_no", user_no);
		return mapper.findLike(map);
	}
	
	@Override
	public void likeUp(int board_no, String user_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", board_no);
		map.put("user_no", user_no);
		mapper.likeUp(map);
	}
	@Override
	public void likeDown(int board_no, String user_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", board_no);
		map.put("user_no", user_no);

		mapper.likeDown(map);
	}
	@Override
	public int getLike(int board_no) {
		return mapper.getLike(board_no);	
		
		
	}
	
	@Override
	public void deleteFree(int freeboard_no) {
		mapper.deleteFree(freeboard_no);
	}
	@Override
	public void updateFree(freeboardVO vo) {
		mapper.updateFree(vo);
	}
}
