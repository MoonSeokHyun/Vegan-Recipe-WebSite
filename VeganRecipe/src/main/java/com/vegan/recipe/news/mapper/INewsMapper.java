package com.vegan.recipe.news.mapper;

import java.util.List;

import com.vegan.recipe.news.VboardVO;
import com.vegan.recipe.util.PageVO;

public interface INewsMapper {
	
	void newsInsert(VboardVO vo);
	List<VboardVO> listNews(PageVO vo);
	int Total(PageVO vo);
	VboardVO newsDetail(int Vboard_no);
	void hitNews(int Vboard_no);
	List<VboardVO> main();
	void deleteNews(int Vboard_no);
}

