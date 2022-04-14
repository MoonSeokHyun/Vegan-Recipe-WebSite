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
        margin-top: 20px;
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
        <h1>Vegan Recipe</h1>
    </div>
  
        <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlInput1" class="form-label">Recipe Title</label>
            <input type="text" class="form-control" id="exampleFormControlInput1">
          </div>
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlInput1" class="form-label">Chef</label>
            <input type="text" class="form-control" id="exampleFormControlInput1">
          </div>
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlInput1" class="form-label">Date</label>
            <input type="text" class="form-control" id="exampleFormControlInput1">
          </div>

          <div class="mb-3" style="width: 50%; margin: 0 auto; border-bottom: 1px solid #212529; padding-bottom: 30px;">
            <label for="exampleFormControlTextarea1" class="form-label"></label>
            <div>
                <h3 style="text-align: center; margin-bottom: 20px;">요리 재료</h3>
                <p>1. 당근 2. 파스타 3.쫄면 4. 햄버거 </p>
            </div>
          </div>

          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlTextarea1" class="form-label"></label>
            <div>
                <h3 style="text-align: center; margin-bottom: 20px;">조리 과정</h3> 
                <p>맛있게 만드셈</p>
            </div>
          </div>

          <button type="button" class="btn btn-primary whyBtn">수정</button>
          <button type="button" class="btn btn-primary CancleBtn">목록</button>

          <!-- 댓글 -->
        
        
        
        <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlInput1" class="form-label">Comment Writer</label>
            <input type="text" class="form-control commnet_id" id="exampleFormControlInput1" name="commnet_id">
          </div>
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlTextarea1" class="form-label">Comment</label>
            <textarea class="form-control commnet_content" id="exampleFormControlTextarea1" rows="2" name="commnet_content"></textarea>
          </div>
       <button type="button" class="btn btn-primary whyBtn1" id="com_btn">댓글 등록</button>

        
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

</html>