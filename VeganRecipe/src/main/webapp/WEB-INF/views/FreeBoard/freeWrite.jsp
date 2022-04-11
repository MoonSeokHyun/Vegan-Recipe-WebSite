<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
    .mainTitle{
        text-align: center;
    }

    .whyBtn{
        margin-left: 46%;
    }
    h1{
        padding-top: 30px;
        padding-bottom: 30px
    }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>

<!-- 붙혀 넣는곳! -->

    <div class="mainTitle">
        <h1>Free Board</h1>
    </div>
    <form action="<c:url value ='/FreeBoard/insertFreeboard'/>" method="post">
        <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlInput1" class="form-label">News Title</label>
            <input type="text" class="form-control" name="freeboard_title" id="exampleFormControlInput1">
          </div>
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlInput1" class="form-label">News Witer</label>
            <input type="text" class="form-control" name="freeboard_writer" value="${login.user_id}" id="exampleFormControlInput1">
          </div>
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlTextarea1" class="form-label">News Content</label>
            <textarea class="form-control " name="freeboard_content" id="exampleFormControlTextarea1" rows="6"></textarea>
          </div>
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="formFileMultiple" class="form-label"></label>
            <input class="form-control" type="file" id="formFileMultiple" multiple>
          </div>

          <button type="button" class="btn btn-primary whyBtn">글 작성</button>
          <button type="button" class="btn btn-primary CancleBtn">취 &nbsp; 소</button>
    </form>

<!-- 푸터 -->
<%@include file="../include/footer.jsp"%>
</body>

<script>
$(function() {
	$('.whyBtn').click(function() {
		$("form").submit();
	})
})

</script>
</html>