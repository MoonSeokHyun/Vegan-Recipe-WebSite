package com.vegan.recipe.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.recipe.user.common.UserVO;
import com.vegan.recipe.user.mapper.IUserMapper;
@Service
public class UserService implements IUserService {
	@Autowired
	private IUserMapper mapper;
	
	@Override
	public void joinUser(UserVO vo) {
		mapper.joinUser(vo);
	}

	@Override
	public int idCheck(String user_id) {
		return mapper.idCheck(user_id);
	}
	
	@Override
	public UserVO Login(String user_id, String user_pw) {
		return mapper.Login(user_id, user_pw);
	}
}
