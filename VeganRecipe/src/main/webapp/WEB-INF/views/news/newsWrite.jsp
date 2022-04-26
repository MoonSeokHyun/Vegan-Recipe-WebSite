<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
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
</style>
<body>
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>

<!-- 붙혀 넣는곳! -->
 <!-- 비건 뉴스 글쓰기 -->

    <div class="mainTitle">
        <h1>Vegan News</h1>
    </div>
    <form action="<c:url value='/news/newsInsert'/>" method="post" enctype="multipart/form-data">
        <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlInput1" class="form-label">News Title</label>
            <input type="email" class="form-control" id="exampleFormControlInput1" name="Vboard_title">
          </div>
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlInput1" class="form-label">News Witer</label>
            <input type="email" class="form-control" id="exampleFormControlInput1" name="Vboard_writer">
          </div>
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlTextarea1" class="form-label">News Content</label>
            <textarea class="form-control" id="ckeditor" rows="3" name="Vboard_content"></textarea>
          </div>
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="formFileMultiple" class="form-label">썸네일</label>
            <input class="form-control" type="file" id="formFileMultiple" name="file1">
          </div>
 			
 			<input type="hidden" value="0" name="Vboard_type">
          <button type="button" class="btn btn-primary whyBtn">글 작성</button>
          <button type="button" class="btn btn-primary CancleBtn">취 &nbsp; 소</button>
    </form>


<!-- 푸터 -->
<%@include file="../include/footer.jsp"%>
</body>
</html>

<script type="text/javascript">
$(function() {
	
	$('.whyBtn').click(function() {
		$("form").submit();
	})
	 CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
         width:'100%',
         height:'400px',
         filebrowserUploadUrl:  "fileupload.do"
     });

});
</script>