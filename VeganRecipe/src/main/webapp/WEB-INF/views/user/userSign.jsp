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


    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
<body>
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>

<!-- 붙혀 넣는곳! -->
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" action="#">
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="id">아이디</label>
              <input type="text" class="form-control" id="user_id" placeholder="아이디를 입력해주세요" value="" required>
              <div class="invalid-feedback">
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" placeholder="이름을 입력해주세요" value="" required>
              <div class="invalid-feedback">
              </div>
            </div>
          </div>
          
           <div class="row">
            <div class="col-md-6 mb-3">
                <button class="btn btn-primary" id="idcheck_btn" >중복확인</button>
            </div>
            <div class="col-md-6 mb-3">

            </div>
          </div>

          <div class="mb-3">
            <label for="pw">비밀번호</label>
            <input type="password" class="form-control" id="pw" required>
            <div class="invalid-feedback">
            </div>
          </div>

          <div class="mb-3">
            <label for="pw-ck">비밀번호 확인</label>
            <input type="password" class="form-control" id="pwck" required>
            <div class="invalid-feedback">
            </div>
          </div>

          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="email">이메일</label>
              <input type="text" class="form-control" id="user_email" placeholder="abc1234@naver.com" value="" required>
              <div class="invalid-feedback">
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="emailck">인증번호</label>
              <input type="text" class="form-control" id="emailck" placeholder="" value="" required>
              <div class="mail-check-warn">
               
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6 mb-3">
                <button class="btn btn-primary" id="mail-check-btn" >인증 번호 보내기</button>
            </div>
            <div class="col-md-6 mb-3">

            </div>
          </div>

          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" id="address" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
            <input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요.">
          </div>

          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg"  type="submit">가입 완료</button>
        </form>
      </div>
    </div>
<!-- 푸터 -->
<%@include file="../include/footer.jsp"%>
</body>
	
	<script>
	
	let code = '';	
	
		$('#idcheck_btn').click(function() {
			if($('#user_id').val() == ''){
				alert('아이디 값을 입력해주세요');
				return;
			}
			
			const userId = $('#user_id').val();
			
			$.ajax({
				type : 'post',
				url : '<c:url value = "/user/idCheck"/>',
				data : userId,
				contentType : 'application/json',
				success : function(data) {
					console.log("ㅇㅇ 아작스 성공임 ㅊㅋㅊㅋ")
					if(data == 'ok'){
						alert('아이디 사용 가능합니다.')
					}else{
						alert('아이디가 중복되었습니다.')
					}
				},
				error : function() {
					alert('아작스 실패임 ㅠㅜ');
				}
			});// 아작스 끝
			
			
		});// 중복처리 이벤트 종료
		
		$('#mail-check-btn').click(function() {
			const user_email = 	$('#user_email').val();
			const email_ck = $('#emailck')
			
			$.ajax({
				type : 'get',
				url : '<c:url value = "/user/emailck?user_email=" />'+user_email,
				success : function(data) {
					console.log(data);
					email_ck.attr('disabled',false);
					code = data;
					alert('인증번호가 전송 되엇습니다.');
				}
			}); //이메일 아작스 끝
			
		}); //이메일 전송 끝	
		
		$('#emailck').blur(function() {
			const inputCode = $(this).val();
			const resultMsg = $('.mail-check-warn');
			
			if(inputCode === code){
				resultMsg.html('인증번호가 일치합니다.')
				$('#user_email').attr('readonly', true);
			}else{
				resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요.');
			}
		})
	</script>

  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</html>