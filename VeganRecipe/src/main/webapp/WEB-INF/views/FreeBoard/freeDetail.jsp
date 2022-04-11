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
</style>
<body>
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>


<!-- 붙혀 넣는곳 -->
    <div class="mainTitle">
        <h1>Free Board</h1>
    </div>
  
        <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlInput1" class="form-label">Title</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" value="${Detail.freeboard_title}">
          </div>
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlInput1" class="form-label">Witer</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" value="${Detail.freeboard_writer}">
          </div>
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlInput1" class="form-label">date</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" value="${Detail.freeboard_regDate}">
          </div>
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlTextarea1" class="form-label"></label>
            <div>
         		${Detail.freeboard_content}
            </div>
          </div>

          <button type="button" class="btn btn-primary whyBtn">수정</button>
          <button type="button" class="btn btn-primary CancleBtn listBtn">목록</button>
		  <button type="button" class="btn btn-primary CancleBtn">삭제</button>
          <!-- 댓글 -->
        
        
        
        <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlInput1" class="form-label">Comment Writer</label>
            <input type="text" class="form-control" id="exampleFormControlInput1">
          </div>
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlTextarea1" class="form-label">Comment</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="2"></textarea>
          </div>
       <button type="button" class="btn btn-primary whyBtn1">댓글 등록</button>

        
        <!-- 댓글이 들어갈 부분 -->
        <div>
            <div class="mb-3" style="width: 50%; margin: 0 auto;">
                <label for="exampleFormControlInput1" class="form-label">Comment Writer :  asdasd</label>
                &nbsp;&nbsp;&nbsp;<a href="#" >삭제</a></span>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="2" readonly>나는 비건</textarea>
               
            </div>
            <div class="mb-3" style="width: 50%; margin: 0 auto;">
                <label for="exampleFormControlInput1" class="form-label">Comment Writer :  asdasd</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="2" readonly>나는 비건</textarea>
            </div>
        </div>

<!-- 푸터 -->
<%@include file="../include/footer.jsp"%>
</body>

<script>
	$(function() {
		$('.listBtn').click(function() {
			location.href = '<c:url value="/FreeBoard/freeList"/>';
		})
	})
</script>
</html>