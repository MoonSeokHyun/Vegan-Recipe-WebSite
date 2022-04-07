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
        text-align: center;
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
</style>
<body>
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>

<!-- 붙혀 넣는곳! -->

    <!-- 뉴스 리스트 -->
    <div class="container">
        <h1>Vegan Recipe List</h1>
        <div class="row">
          <div class="col">
            <div class="card" style="width: 18rem;">
                <img src="../img/딸기 메인.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
              </div>
          </div>
          <div class="col">
            <div class="card" style="width: 18rem;">
                <img src="../img/딸기 메인.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
              </div>
          </div>
          <div class="col">
            <div class="card" style="width: 18rem;">
                <img src="../img/딸기 메인.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
              </div>
          </div>
          <div class="col">
            <div class="card" style="width: 18rem;">
                <img src="../img/딸기 메인.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
              </div>
          </div>
          <div class="col">
            <div class="card" style="width: 18rem;">
                <img src="../img/딸기 메인.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
              </div>
          </div>
          <div class="col">
            <div class="card" style="width: 18rem;">
                <img src="../img/딸기 메인.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
              </div>
          </div>
          <div class="col">
            <div class="card" style="width: 18rem;">
                <img src="../img/딸기 메인.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
              </div>
          </div>
                    <div class="col">
            <div class="card" style="width: 18rem;">
                <img src="../img/딸기 메인.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
              </div>
          </div>
        </div>
      </div>

      <!-- 글작성 -->

      <div class="newsWrite">
        <button type="button" class="btn btn-primary whyBtn">뉴스 작성</button>
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