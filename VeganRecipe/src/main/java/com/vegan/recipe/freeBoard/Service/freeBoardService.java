package com.vegan.recipe.freeBoard.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.recipe.freeBoard.freeboardVO;
import com.vegan.recipe.freeBoard.mapper.IfreeBoardMapper;
@Service
public class freeBoardService implements IfreeBoardService {
	
	@Autowired
	private IfreeBoardMapper mapper;
	
	@Override
	public void insertFreeboard(freeboardVO vo) {
		mapper.insertFreeboard(vo);
	}
	@Override
	public List<freeboardVO> getFreeBoard() {
	
		return mapper.getFreeBoard();
	}
	@Override
	public freeboardVO freeDetail(int freeboard_no) {
		return mapper.freeDetail(freeboard_no);
	}

}
