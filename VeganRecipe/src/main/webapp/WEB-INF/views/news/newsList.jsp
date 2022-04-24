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
</style>
<body>
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>

<!-- 붙혀 넣는곳! -->
<!-- 뉴스 리스트 -->
    <div class="container">
        <h1>NEWS AND PRESS RELEASES</h1>
        <div class="row">
         <c:forEach var="vo" items="${newsList}">
          <div class="col">
          <a href="#">
                <div class="card" style="width: 18rem;">
                <img src="../img/stro.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Title : ${vo.vboard_title}</h5>
                  <p class="card-text"> Writer : ${vo.vboard_writer}</p>
                  <p class="card-text"> Date : ${vo.vboard_Regdate}</p>
                </div>
          </a>

              </div>
          </div>
           </c:forEach>
 
        </div>
      </div>

      <!-- 글작성 -->

      <div class="newsWrite">
        <button type="button" class="btn btn-primary whyBtn">뉴스 작성</button>
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
			</div>			<div class="paging">
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

<!-- 푸터 -->
<%@include file="../include/footer.jsp"%>
</body>

<script type="text/javascript">
	$(function() {
		
		// 뉴스 페이지로 이동
		$('.whyBtn').click(function() {
			location.href = "<c:url value = '/news/newsWrite'/>";
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