package com.vegan.recipe.user.mapper;

import org.apache.ibatis.annotations.Param;

import com.vegan.recipe.user.common.UserVO;

public interface IUserMapper {
	// 회원 가입
	void joinUser(UserVO vo);
	
	// 아이디 중복확인
	int idCheck(String user_id);
	
	//로그인
	UserVO Login(@Param("user_id") String user_id, @Param("user_pw")String user_pw);
}
