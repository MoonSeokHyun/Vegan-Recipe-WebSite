package com.vegan.recipe.user.mapper;

import com.vegan.recipe.user.common.UserVO;

public interface IUserMapper {
	// 회원 가입
	void joinUser(UserVO vo);
	
	// 아이디 중복확인
	int idCheck(String user_id);
	
}
