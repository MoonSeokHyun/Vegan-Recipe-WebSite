<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>
<%@ include file="include/header.jsp"%>


    <!-- 메인 이미지 -->

    <div class="container main_con" style="margin-bottom: 2.5rem; margin-top: 1.5rem">
        <div class="row">
          <div class="col main">
            <h3>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Provident atque nobis dolores ab consequatur, sit quaerat alias praesentium explicabo porro, ratione assumenda dolorum natus architecto sequi sunt libero optio esse.</h3>
            <button type="button" class="btn btn-primary whyBtn">Click</button>
          </div>
          <div class="col">
            <img src="<c:url value= '/img/stro.jpg'/>" alt="" width="100%">
          </div>
        </div>

    <!-- 비건 뉴스 -->
    <div class="container veganNews">
        <div class="row">
            <h1 style="margin-bottom: 2.5rem; margin-top: 1.5rem">VEGAN NEWS</h1>
                 <div class="row" style="margin-bottom: 2.5rem;">
         <c:forEach var="vo" items="${main}">
          <div class="col">
          <a href="<c:url value='/news/newsDetail?Vboard_no=${vo.vboard_no}'/>">
                <div class="card" style="width: 18rem;">
                <img src="<c:url value='/news/display?fileloca=${vo.fileloca}&filename=${vo.filename}'/>" class="card-img-top" alt="..." style="height: 10rem;">
                <div class="card-body">
                  <h5 class="card-title">Title : ${vo.vboard_title}</h5>
                  <p class="card-title"> Writer : ${vo.vboard_writer}</p>
                  <p class="card-title"> Date : ${vo.vboard_Regdate}</p>
				  <p class="card-title">댓글 ${vo.com_cnt} 좋아요 ${vo.like_cnt} 조회수 ${vo.vboard_hit} </p>
                  
                </div>
                
          </a>

              </div>
          </div>
     </c:forEach>
      <!-- 비건이란? -->

      <div class="container veganWhy">
        <div class="row">
            <h1 style="margin-bottom: 2.5rem; margin-top: 1.5rem">WHY VEGAN</h1>
          <div class="col">
            <img src="<c:url value= '/img/stro.jpg'/>" alt="" width="100%">
          </div>
          <div class="col">
            <div class="whyContent">
                <div class="whyContent2">
                    <h4>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Maxime ad vel ut et magni! Odio, illum aliquid porro maiores dolorem cum voluptate, molestiae doloremque culpa nesciunt veritatis expedita ipsa. Velit!
                    </h4>
    
                    <button type="button" class="btn btn-primary whyBtn">Primary</button>
                </div>
            </div>
          </div>
        </div>

	<!-- 푸터 -->
	<%@include file="include/footer.jsp"%>
</body>
</html>