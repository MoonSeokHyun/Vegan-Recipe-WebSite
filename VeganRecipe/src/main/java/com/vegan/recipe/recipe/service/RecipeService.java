package com.vegan.recipe.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.recipe.news.VboardVO;
import com.vegan.recipe.recipe.mapper.IRecipeMapper;
import com.vegan.recipe.util.PageVO;

@Service
public class RecipeService implements IRecipeService {

	@Autowired
	private IRecipeMapper mapper;
	
	@Override
	public List<VboardVO> getRecipe(PageVO vo) {
		// TODO Auto-generated method stub
		return mapper.getRecipe(vo);
	}
	
	@Override
	public void insertRecipe(VboardVO vo) {
		mapper.insertRecipe(vo);
	}
	
	@Override
	public int getTotal(PageVO vo) {
		// TODO Auto-generated method stub
		return mapper.getTotal(vo);
	}
	@Override
	public VboardVO recipeDetail(int vboard_no) {
		// TODO Auto-generated method stub
		return mapper.recipeDetail(vboard_no);
	}
	
}
