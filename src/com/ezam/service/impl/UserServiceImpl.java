package com.ezam.service.impl;

import com.ezam.dao.userDAO;
import com.ezam.dao.impl.userDAOImpl;
import com.ezam.service.UserService;
import com.ezam.vo.UserVO;

public class UserServiceImpl implements UserService {
	private userDAO udao = new userDAOImpl();

	public int insertUser(UserVO uv) {
		return udao.insertUser(uv);
	}

	public static void main(String[] args) {
		UserService us = new UserServiceImpl();
		UserVO uv = new UserVO();
		uv.setUiName("g");
		uv.setUiAge(123);
		uv.setUiBirth("g");
		uv.setUiId("g");
		uv.setUiPassword("g");
		uv.setUiPhone("g");
		uv.setUiEmail("g");
		uv.setUiNickname("g");
		uv.setUiAdmin("1");
		System.out.println(us.insertUser(uv));
	}
}
