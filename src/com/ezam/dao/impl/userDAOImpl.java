package com.ezam.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ezam.dao.userDAO;
import com.ezam.servlet.MybatisServlet;
import com.ezam.vo.UserVO;

public class userDAOImpl implements userDAO {

	public int insertUser(UserVO uv) {
		try (SqlSession ss = MybatisServlet.getSession()) {
			int result = ss.insert("user.insertuser", uv);
			ss.commit();
			return result;
		}
	}
	
	public UserVO doLogin(UserVO uv) {
		try(SqlSession ss = MybatisServlet.getSession()){
			return ss.selectOne("user.selectuser",uv);

		}
	}
	public static void main(String[] args) {
		userDAO udao = new userDAOImpl();
		UserVO uv = new UserVO();
//		uv.setUiName("test21");
//		uv.setUiAge(123);
//		uv.setUiBirth("20202020");
//		uv.setUiId("test13");
//		uv.setUiPassword("test31");
//		uv.setUiPhone("test3");
//		uv.setUiEmail("test3");
//		uv.setUiNickname("test13");
		uv.setUiId("test");
		uv.setUiPassword("test");
		System.out.println(udao.doLogin(uv));
		
	}

}
