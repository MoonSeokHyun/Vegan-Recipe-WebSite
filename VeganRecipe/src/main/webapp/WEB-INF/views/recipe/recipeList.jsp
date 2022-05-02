<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    .mainTitle{
        text-align: center;
    }
    .newsWrite{
        width: 1200px;
        margin: 0 auto;
    }
    h1{
        margin-top: 40px;
        margin-bottom: 30px;
        margin-left: 30%;
    }
    .paging{
        margin-left: auto;
        margin-right: auto;
        display: table;
    }
    
    .whyBtn{
        margin-left: 80%;
        margin-top: 30px;
    }
    
	    h1{
        padding-top: 30px;
        padding-bottom: 30px
    }
  
  
  
    a:link {
    text-decoration: none;
    color: black;
    }

    a:visited {
        text-decoration: none;
    }

    a:hover {
        text-decoration: none;
    }

    a:active {
        text-decoration: none;
    }
	.col{
		margin-bottom: 10px
	}
	

</style>
<body>
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>

<!-- 붙혀 넣는곳! -->
<!-- 뉴스 리스트 -->
    <div class="container">
        <h1>NEWS AND PRESS RELEASES</h1>
        
        			   <form action="<c:url value='/recipe/recipeList'/>">
                        <div class="search-wrap clearfix">
                            <button type="submit" class="btn btn-primary search-btn" style="margin-right: 24%;">검색</button>
                            <input type="text" name="keyword" class="form-control search-input" value="${pc.paging.keyword}"
                            style="width: 200px; ">
                            <select class="form-control" id="search-select" name="condition" style="width: 80px; margin-left: 54%">
                                <option value="Vboard_title" ${pc.paging.condition == 'vboard_title' ? 'selected' : ''}>제목</option>
                                <option value="Vboard_content" ${pc.paging.condition == 'vboard_content' ? 'selected' : ''}>내용</option>
                                <option value="Vboard_writer" ${pc.paging.condition == 'vboard_writer' ? 'selected' : ''}>작성자</option>
                            </select>
                        </div>
                    </form> 
        
        <div class="row">
         <c:forEach var="vo" items="${recipeList}">
          <div class="col">
          <a href="<c:url value='/recipe/recipeDetail?Vboard_no=${vo.vboard_no}&user_id=${login.user_id}&vboard_type=1'/>">
                <div class="card" style="width: 18rem;">
                <img src="<c:url value='/recipe/display?fileloca=${vo.fileloca}&filename=${vo.filename}'/>" class="card-img-top" alt="..." style="height: 10rem;">
                <div class="card-body">
                  <h5 class="card-title"> ${vo.vboard_title}</h5>
                  <p class="card-title"> ${vo.file}</p>
				  <p class="card-title">댓글 ${vo.com_cnt} 좋아요 ${vo.like_cnt} 조회수 ${vo.vboard_hit} </p>
                  
                </div>
                
          </a>

              </div>
          </div>
           </c:forEach>
 
        </div>
      </div>

      <!-- 글작성 -->

      <div class="newsWrite">
        <button type="button" class="btn btn-primary whyBtn">요리 작성</button>
      </div>

      <!-- 페이징 -->
			

			
			<div class="paging">
					<form action="<c:url value='/recipe/recipeList' />" name="pageForm">
	                        <div class="text-center clearfix">
	                            <ul class="pagination" id="pagination">
	                            	<c:if test="${pc.prev}">
	                                	<li class="page-item "><a  class="page-link" href="#" data-pageNum="${pc.beginPage-1}">Prev</a></li>
	                                </c:if>
	                                
	                                <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
	                                	<li class="${pc.paging.pageNum == num ? 'age-item active' : ''}" page-item><a class="page-link" href="#" data-pageNum="${num}">${num}</a></li>
	                                </c:forEach>
	                                
	                                <c:if test="${pc.next}">
	                               		<li class="page-item"><a class="page-link" href="#" data-pageNum="${pc.endPage+1}">Next</a></li>
	                                </c:if>
	                            </ul>
	                            
	                            <!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
	                            <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
	                            <input type="hidden" name="countPerPage" value="${pc.paging.countPerPage}">
	                            <input type="hidden" name="keyword" value="${pc.paging.keyword}">
	                            <input type="hidden" name="condition" value="${pc.paging.condition}">
	                        </div>
                        </form>
			</div>			

<!-- 푸터 -->
<%@include file="../include/footer.jsp"%>
</body>

<script type="text/javascript">
	$(function() {
		
		// 뉴스 페이지로 이동
		$('.whyBtn').click(function() {
			location.href = "<c:url value = '/recipe/recipeWrite'/>";
		})
		
		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault();
			console.log($(this));
			const value = $(this).data('pagenum');
			console.log(value);
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		});
		

		
	})// 제이쿼리 끝
</script>
</html> 