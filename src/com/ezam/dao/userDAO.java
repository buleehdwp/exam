package com.ezam.dao;

import java.util.List;
import java.util.Map;

import com.ezam.vo.UserVO;

public interface userDAO {
	int insertUser(UserVO uv);
	UserVO doLogin(UserVO uv);
}
