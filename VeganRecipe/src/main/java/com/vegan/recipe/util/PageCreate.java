package com.vegan.recipe.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageCreate {

	private PageVO paging;
	private int articleTotalCount;
	private int endPage;
	private int beginPage;
	private boolean prev;
	private boolean next;
	
	private final int buttonNum = 10;
	
	
	private void calcDataOfPage() {
		
		endPage = (int) (Math.ceil(paging.getPageNum() / (double) buttonNum) * buttonNum);
		
		beginPage = (endPage - buttonNum) + 1;
		
		prev = (beginPage == 1) ? false : true;
		
		next = articleTotalCount <= (endPage * paging.getCountPerPage()) ? false : true;
		
		if(!next) {
			endPage = (int) Math.ceil(articleTotalCount / (double) paging.getCountPerPage()); 
		}
		
	}
	
	//컨트롤러가 총 게시물의 개수를 PageCreator에게 전달한 직후에 
	//바로 페이징 버튼 알고리즘이 돌아갈 수 있도록 setter를 커스텀.
	public void setArticleTotalCount(int articleTotalCount) {
		this.articleTotalCount= articleTotalCount;
		calcDataOfPage();
	}

}	
