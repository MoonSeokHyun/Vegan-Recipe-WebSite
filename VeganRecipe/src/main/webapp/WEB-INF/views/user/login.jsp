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
<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>

<!-- 붙혀 넣는곳! -->
        <div class="inner_login">
        <div class="login_tistory">
    
  
                <input type="hidden" name="redirectUrl" value="https://blogpack.tistory.com/manage">
                <fieldset>
                <legend class="screen_out">로그인 정보 입력폼</legend>
                <div class="box_login">
                    <div class="inp_text">
                    <label for="loginId" class="screen_out">아이디</label>
                    <input type="text" id="loginId" name="user_id" placeholder="ID" >
                    </div>
                    <div class="inp_text">
                    <label for="loginPw" class="screen_out">비밀번호</label>
                    <input type="password" id="loginPw" name="user_pw" placeholder="Password" >
                    </div>
                </div>
               					 <button type="submit" class="btn_login">로그인</button>
                <div class="login_append">
                    <div class="inp_chk"> <!-- 체크시 checked 추가 -->

                    <label for="keepLogin" class="lab_g">
            <span class="img_top ico_check"></span>
            <span class="txt_lab"><a href="<c:url value='/user/userSign'/>">회원가입</a></span>
            </label>
                    </div>
                    <span class="txt_find">
                    <a href="/member/find/loginId" class="link_find">아이디</a>
                        / 
                    <a href="/member/find/password" class="link_find">비밀번호 찾기</a>
                    </span>
                </div>
                
                </fieldset>

        </div>
    </div>
    

</body>

<script>
	$(function() {
		$('.btn_login').click(function() {
			const user_id = $('#loginId').val();
			const user_pw = $('#loginPw').val();
			
			if(user_id === ''){
				alert('아이디를 입력하세요!!');
				return;
			}else if(user_pw === ''){
				alert('비밀번호를 입력하세요!!');
				return;
			}
			else{
				 const userInfo = {"user_id":user_id, "user_pw":user_pw};
				 
				$.ajax({
					type : 'post',
					url : '<c:url value="/user/userLogin" />',
					data : JSON.stringify(userInfo),
					dataType:"text",
					contentType : "application/json; charset=UTF-8",
					success : function(data) {
						if(data == 'loginFail'){
							alert('아이디 혹은 비밀번호가 틀립니다..');
						}else{
							alert(user_id+'님 반갑습니다.');
							location.href='/Vegan/';
						}
					},error : function(status, error) {
						console.log('에러발생!!');
						console.log(userInfo);
						console.log(status, error);
					}
					
				})// 로그인 아작스 끝
			}// 이프문 끝
		})
	})
</script>
</html>