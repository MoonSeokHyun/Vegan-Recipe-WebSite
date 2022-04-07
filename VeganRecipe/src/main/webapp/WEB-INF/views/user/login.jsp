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
    
            <form method="post" id="authForm" action="#">
                <input type="hidden" name="redirectUrl" value="https://blogpack.tistory.com/manage">
                <fieldset>
                <legend class="screen_out">로그인 정보 입력폼</legend>
                <div class="box_login">
                    <div class="inp_text">
                    <label for="loginId" class="screen_out">아이디</label>
                    <input type="email" id="loginId" name="loginId" placeholder="ID" >
                    </div>
                    <div class="inp_text">
                    <label for="loginPw" class="screen_out">비밀번호</label>
                    <input type="password" id="loginPw" name="password" placeholder="Password" >
                    </div>
                </div>
                <button type="submit" class="btn_login"  disabled>로그인</button>
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
            </form>
            
        </div>
    </div>
    

</body>
</html>