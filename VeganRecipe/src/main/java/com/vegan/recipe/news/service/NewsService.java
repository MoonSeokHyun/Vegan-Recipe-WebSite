package com.vegan.recipe.news.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.recipe.news.VboardVO;
import com.vegan.recipe.news.mapper.INewsMapper;
import com.vegan.recipe.util.PageVO;

@Service
public class NewsService implements INewsService {

	@Autowired
	private INewsMapper mapper;
	
	@Override
	public void newsInsert(VboardVO vo) {
		System.out.println("여기까진 오니?");
		mapper.newsInsert(vo);
		
	}
	
	@Override
	public List<VboardVO> listNews(PageVO vo) {
		return mapper.listNews(vo);
	}
	
	@Override
	public int Total(PageVO vo) {
		return mapper.Total(vo);
	}
}
