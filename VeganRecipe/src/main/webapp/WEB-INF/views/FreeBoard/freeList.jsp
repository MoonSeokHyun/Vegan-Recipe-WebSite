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

    .whyBtn{
        margin-left: 46%;
    }

    .whyBtn1{
        margin-left: 69%;
    }

    .del-btn{
        margin-left: 95%
    }

    h1{
        padding-top: 30px;
        padding-bottom: 30px
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
	
	/*---검색버튼--- */
.search-wrap {
	overflow: hidden; /*부모요소에 히든 */
	margin-bottom: 20px;
}

.search-btn, .search-input, .search-select {
	float: right; /*우측 플로팅 */
}

.search-input {
	width: 140px;
}

#search-select {
	width: 80px;
}
	

</style>
<body>
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>

<!-- 붙혀 넣는곳! -->
 <div class="mainTitle">
        <h1>Free Board</h1>
    </div>
	
                 <form action="<c:url value='/FreeBoard/freeList'/>">
                        <div class="search-wrap clearfix">
                            <button type="submit" class="btn btn-primary search-btn" style="margin-right: 24%;">검색</button>
                            <input type="text" name="keyword" class="form-control search-input" value="${pc.paging.keyword}"
                            style="width: 200px; ">
                            <select class="form-control" id="search-select" name="condition" style="width: 80px; margin-left: 54%">
                                <option value="freeboard_title" ${pc.paging.condition == 'freeboard_title' ? 'selected' : ''}>제목</option>
                                <option value="freeboard_content" ${pc.paging.condition == 'freeboard_content' ? 'selected' : ''}>내용</option>
                                <option value="freeboard_writer" ${pc.paging.condition == 'freeboard_writer' ? 'selected' : ''}>작성자</option>
                            </select>
                        </div>
                    </form> 
	
    <!-- 비건 뉴스 상세보기 -->
    <table class="table" style="width: 70%; margin: 0 auto;">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성 시간</th>
            <th scope="col">조회수</th>
            <th scope="col">좋아요</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="vo" items="${freeList}">
          <tr>
          	<th scope="row">${vo.freeboard_no}</th>
            <td><a href="<c:url value='/FreeBoard/freeDetail?freeboard_no=${vo.freeboard_no}'/>">${vo.freeboard_title}</a></td>
            <td>${vo.freeboard_writer}</td>
            <td>${vo.freeboard_regDate}</td>
            <td>${vo.freeboard_hit}</td>
            <td>${vo.freeboard_like}</td>
          </tr>
         </c:forEach>
        </tbody>
      </table>

            <!-- 글작성 -->

            <div class="newsWrite">
                <button type="button" class="btn btn-primary whyBtn">글작성</button>
              </div>
        
              <!-- 페이징 -->
        
			<div class="paging">
					<form action="<c:url value='/FreeBoard/freeList' />" name="pageForm">
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
	                            <input type="hidden" name="pagecnt" value="10">
	                        </div>
                        </form>
			</div>
                        
<%@include file="../include/footer.jsp"%>
</body>

<script>
	$(function() {
		$('.whyBtn').click(function() {
			location.href = '<c:url value="/FreeBoard/freeWrite"/>';
		})
		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault();
			console.log($(this));
			const value = $(this).data('pagenum');
			console.log(value);
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		});
		
	})
</script>
</html>