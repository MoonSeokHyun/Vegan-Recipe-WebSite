package com.vegan.recipe.news.service;

import java.util.List;

import com.vegan.recipe.news.VboardVO;
import com.vegan.recipe.util.PageVO;

public interface INewsService {
	
	void newsInsert(VboardVO vo);
	
	//뉴스 리스트
	List<VboardVO> listNews(PageVO vo);
	// 게시뭘 수
	int Total(PageVO vo);
	//상세보기 
	
	VboardVO newsDetail(int Vboard_no);
	
	void hitNews(int Vboard_no);
	
	List<VboardVO> main();
	
	void deleteNews(int Vboard_no);
}
