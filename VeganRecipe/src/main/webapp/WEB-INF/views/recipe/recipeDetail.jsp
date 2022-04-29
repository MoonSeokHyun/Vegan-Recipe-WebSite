<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>

<style>
    .mainTitle{
        text-align: center;
    }

    .newsWrite{
        width: 1200px;
        margin: 0 auto;
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
        margin-left: 46%;
    }
    .whyBtn1{
        margin-left: 69%;
    }
    .del-btn{
        margin-left: 95%
    }
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>

<!-- 붙혀 넣는곳! -->
 <div class="mainTitle">
        <h1>Vegan News</h1>
    </div>
  
              <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlInput1" class="form-label">Title</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" value="${detail.vboard_title}" readonly>
          </div>
          <div class="row g-3" style="width: 51%; margin: 0 auto; margin-top: -25px" >
		  <div class="col">
		   <label for="exampleFormControlInput1" class="form-label">Witer</label>
		    <input type="text" class="form-control" id="exampleFormControlInput1" value="${detail.vboard_writer}" readonly>
		  </div>
		  <div class="col">
		   <label for="exampleFormControlInput1" class="form-label">date</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" value="${detail.vboard_Regdate}" readonly>
		  </div>
		</div>
	
		<div class="row g-3" style="width: 51%; margin: 0 auto; margin-top: -10px" >
		 <div class="col">
		   <label for="exampleFormControlInput1" class="form-label">HIT</label>
		    <input type="text" class="form-control" id="exampleFormControlInput1" value="${detail.vboard_hit}" readonly>
		  </div>
		  <div class="col">
		   <label for="exampleFormControlInput1" class="form-label">Like</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" value="${getLike}" readonly>
		  </div>
		  
		</div>
		
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlTextarea1" class="form-label">재료</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="material" readonly="readonly">${detail.material}</textarea>
          </div>
          
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlTextarea1" class="form-label"></label>
            <div>
                ${detail.vboard_content}
            </div>
          </div>


          <button type="button" class="btn btn-primary whyBtn CancleBtn listBtn">목록</button>
		  <button type="button" class="btn btn-primary CancleBtn delbtn">삭제</button>
		  <button type="button" class="btn btn-primary CancleBtn LikeBtn">좋아요</button>


          <!-- 댓글 -->
        
        
       <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlInput1" class="form-label">Comment Writer</label>
            <input type="text" class="form-control commnet_id" id="exampleFormControlInput1" name="commnet_id" value="${login.user_id}">
          </div>
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlTextarea1" class="form-label">Comment</label>
            <textarea class="form-control commnet_content" id="exampleFormControlTextarea1" rows="2" name="commnet_content"></textarea>
          </div>
       <button type="button" class="btn btn-primary whyBtn1" id="com_btn">댓글 등록</button>

        
        <!-- 댓글이 들어갈 부분 -->
        <div class="com_box">

        </div>

<!-- 푸터 -->
<%@include file="../include/footer.jsp"%>
</body>

</html>