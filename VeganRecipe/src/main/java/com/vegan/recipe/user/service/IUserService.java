package com.vegan.recipe.user.service;

import com.vegan.recipe.user.common.UserVO;

public interface IUserService {
	// 회원 가입
	void joinUser(UserVO vo);
	
	// 아이디 중복확인
	int idCheck(String user_id);
	
}



	
/*
	
//로그인
UserVO login(String id, String pw);
	
//회원 정보 얻기
UserVO getInfo(String id);
	
//회원 정보 수정
void updateUser(UserVO vo);
	
//회원 삭제
void deleteUser(UserVO vo);
*/