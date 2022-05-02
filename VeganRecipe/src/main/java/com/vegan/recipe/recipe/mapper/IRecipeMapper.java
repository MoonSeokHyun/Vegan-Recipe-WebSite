package com.vegan.recipe.recipe.mapper;

import java.util.List;
import java.util.Map;

import com.vegan.recipe.news.VboardVO;
import com.vegan.recipe.util.PageVO;

public interface IRecipeMapper {

	// 레시피 등록
	void insertRecipe(VboardVO vo);
	// 레시피 리스트
	List<VboardVO> getRecipe(PageVO vo);
	
	int getTotal(PageVO vo);
	VboardVO recipeDetail(int vboard_no);
	
	void recipeHit(Map<String, Object> data);
	
	void recipeHit(int vboard_no);
}
