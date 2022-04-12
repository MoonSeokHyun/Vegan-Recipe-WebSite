package com.vegan.recipe.freeBoard.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.recipe.freeBoard.freeboardVO;
import com.vegan.recipe.freeBoard.mapper.IfreeBoardMapper;
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
}
