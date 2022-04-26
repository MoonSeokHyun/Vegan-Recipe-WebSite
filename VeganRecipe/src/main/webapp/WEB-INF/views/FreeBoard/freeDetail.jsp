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
            <input type="text" class="form-control" id="exampleFormControlInput1" value="${Detail.freeboard_title}" readonly>
          </div>
          <div class="row g-3" style="width: 51%; margin: 0 auto; margin-top: -25px" >
		  <div class="col">
		   <label for="exampleFormControlInput1" class="form-label">Witer</label>
		    <input type="text" class="form-control" id="exampleFormControlInput1" value="${Detail.freeboard_writer}" readonly>
		  </div>
		  <div class="col">
		   <label for="exampleFormControlInput1" class="form-label">date</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" value="${Detail.freeboard_regDate}" readonly>
		  </div>
		</div>
		<div class="row g-3" style="width: 51%; margin: 0 auto; margin-top: -10px" >
		 <div class="col">
		   <label for="exampleFormControlInput1" class="form-label">HIT</label>
		    <input type="text" class="form-control" id="exampleFormControlInput1" value="${Detail.freeboard_hit}" readonly>
		  </div>
		  <div class="col">
		   <label for="exampleFormControlInput1" class="form-label">Like</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" value="${getLike}" readonly>
		  </div>
		</div>
		
          <div class="mb-3" style="width: 50%; margin: 0 auto;">
            <label for="exampleFormControlTextarea1" class="form-label"></label>
            <div>
         		${Detail.freeboard_content}
            </div>
          </div>

          <button type="button" class="btn btn-primary whyBtn updateBtn">수정</button>
          <button type="button" class="btn btn-primary CancleBtn listBtn">목록</button>
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

<script>
	
	//RedirectAttributes 로 던져서 메시지 출력
	const msg = '${msg}';
	if(msg !== '') {
		alert("게시물 수정 완료되었습니다.");
	}
	
	
	$(function() { // 스크립트 시작문
		
		
		
		// 글수정
		$('.updateBtn').click(function() {
			location.href = "<c:url value='/FreeBoard/freeUpdate?freeboard_no=${Detail.freeboard_no}'/>";
		})
		// 삭제
		$('.delbtn').click(function() {
			if(!confirm("해당 게시물을 삭제 하시겠습니까?")){
				return;
			}else{
				location.href = "<c:url value='/FreeBoard/deleteFree?freeboard_no=${Detail.freeboard_no}'/>";
			}
		})
		
		
		// 좋아요 
		var likeval = ${like};
		
		let board_no = ${Detail.freeboard_no};
		let user_no = '${login.user_id}';
		let like_type = 1;
		
		if(likeval > 0){
			console.log(likeval + "좋아요 누름");
			$('.LikeBtn').html("좋아요 취소");
			$('.LikeBtn').click(function() {
				$.ajax({
					type :'post',
					url : '<c:url value ="/FreeBoard/likeDown"/>',
					contentType: 'application/json',
					data : JSON.stringify(
							{
								"board_no" : board_no,
								"user_no" : user_no,
								"like_type" : like_type
							}		
						),
					success : function(data) {
						alert('취소 성공');
					}
				})// 아작스 끝
			})

		}else{
			console.log(likeval + "좋아요 안누름")
			console.log(user_no);
			$('.LikeBtn').click(function() {
				$.ajax({
					type :'post',
					url : '<c:url value ="/FreeBoard/likeUp"/>',
					contentType: 'application/json',
					data : JSON.stringify(
							{
								"board_no" : board_no,
								"user_no" : user_no,
								"like_type" : like_type
							}		
						),
					success : function(data) {
						alert('성공염');
					}
				})// 아작스 끝
			})
		
			
		}
			
		
		
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
		getList(); 
	
	
		
		
		function getList() {
			const bno = ${Detail.freeboard_no};
			const comment_type = 0; 
			const commnet_id = $('.commnet_id').val();
			const commnet_content = $('.commnet_content').val();
			
			$.getJSON(
				"<c:url value = '/com/getList/'/>" + bno + "/"+ comment_type,
				function(data) {
					console.log(data.total);
					if(data.total > 0){
						var list = data.getList;
						let str = "";
						for(i = 0; i<list.length; i++){
							let commnet_id = list[i].commnet_id;
							let commnet_content = list[i].commnet_content;
							let comment_no = list[i].comment_no;
							console.log(commnet_id);
							console.log(commnet_content);
							str += "<div>";
							str += "<div class='' style='width: 50%; margin: 0 auto;'>"
							str += "<label for 'exampleFormControlInput1' class='form-label'>Comment Writer :"+commnet_id+"</label>"
							str += "&nbsp;&nbsp;&nbsp;<span id='asdfg' style='cursor:pointer' data-id = '"+comment_no+"'>삭제</span>&nbsp;&nbsp;<span style='cursor:pointer'>답글</span></span>"
							str += "<textarea class='form-control' id='exampleFormControlTextarea1' rows='3' readonly>"+commnet_content+"</textarea>"
							str += " </div>"
						}
						
						$('.com_box').html(str);
						
					}else{
						str = "<div>";
						str = "<div class='' style='width: 50%; margin: 0 auto;'>"
						str = "&nbsp;&nbsp;&nbsp;<a href='#' >삭제</a></span>"
						str = "<textarea class='form-control' id='exampleFormControlTextarea1' rows='3' readonly>등록된 댓글이 없어요 ㅠㅠ</textarea>"
						str = " </div>"
						$('.com_box').html(str);
					}
				}
			)
			
		}
		
		
		$(document).on('click','#asdfg', function() {
			const comment_no = $(this).data('id');
			console.log(comment_no)
			
			$.ajax({
				url : '<c:url value = "/com/comDelete" />',
				type : 'post',
				data:JSON.stringify(
		                  {
		                	  /* "com_bno":com_bno, */
		                     "comment_no":comment_no
		                  }),
		                  headers : {
		  					'Content-type' : 'application/json'
		  				},
				success : function(data) {
					alert('삭제완료')
					getList();
				}
				
			})// 삭제 아작스 끝
			
		})
		
		
		
		
	})// 스크립트 종료문
</script>
</html>