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
        margin-top: 30px;
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


</style>
<body>
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>

<!-- 붙혀 넣는곳! -->
 <div class="mainTitle">
        <h1>Free Board</h1>
    </div>

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
          <tr>
            <th scope="row">1</th>
            <td><a href="#">비건 음식 추천좀</a></td>
            <td>비건짱</td>
            <td>2022-04-03</td>
            <td>123</td>
            <td>123</td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td><a href="#">비건 음식 추천좀</a></td>
            <td>비건짱</td>
            <td>2022-04-03</td>
            <td>123</td>
            <td>123</td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td><a href="#">비건 음식 추천좀</a></td>
            <td>비건짱</td>
            <td>2022-04-03</td>
            <td>123</td>
            <td>123</td>
          </tr>

        </tbody>
      </table>

            <!-- 글작성 -->

            <div class="newsWrite">
                <button type="button" class="btn btn-primary whyBtn">글작성</button>
              </div>
        
              <!-- 페이징 -->
        
              <div class="paging">
                <nav aria-label="..." class="paging">
                    <ul class="pagination">
                      <li class="page-item disabled">
                        <a class="page-link">Previous</a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item active" aria-current="page">
                        <a class="page-link" href="#">2</a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                      </li>
                    </ul>
                  </nav>
              </div>


<!-- 푸터 -->
<%@include file="../include/footer.jsp"%>
</body>
</html>