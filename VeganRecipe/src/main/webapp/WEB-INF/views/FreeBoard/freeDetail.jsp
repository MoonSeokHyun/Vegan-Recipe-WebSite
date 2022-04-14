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
            <input type="text" class="form-control commnet_id" id="exampleFormControlInput1" name="commnet_id" value="${login.user_id}">
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

<script>
	$(function() { // 스크립트 시작문
		$('.listBtn').click(function() {
			location.href = '<c:url value="/FreeBoard/freeList"/>';
		})
		
		$('#com_btn').click(function() {
			const commnet_id = $('.commnet_id').val();
			const commnet_content = $('.commnet_content').val();
			const bno = ${Detail.freeboard_no};
			const comment_type = 0; 
			
			if(commnet_id == ''){
				alert('아이디를 입력해주세요');
				return;
			}else if(commnet_content == ''){
				alert('내용을 입력해주세요');
				return;
			}else{
				$.ajax({
					type : 'post',
					url: '<c:url value="/com/insertCom"/>',
					data : JSON.stringify(
						{
							"commnet_id" : commnet_id,
							"commnet_content" : commnet_content,
							"bno" : bno,
							"comment_type" : comment_type 
						}		
					),
					contentType: 'application/json',
					success: function(data) {
						console.log('통신성공' + data);
						if(data == 'ok'){
							alert("댓글 등록 성공");
							getList();
						}
					},	error : function(status, error) {
						console.log('에러발생!!');

						console.log(status, error);
					}
				});//아작스 끝
			} //  else 문 끝
		})// 댓글 등록 끝
		
		
	})// 스크립트 종료문

</script>
</html>