package com.ezam.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ezam.service.UserService;
import com.ezam.service.impl.UserServiceImpl;
import com.ezam.vo.UserVO;
import com.google.gson.Gson;

@WebServlet("/ajax/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson aGson = new Gson();
	private UserService userService = new UserServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		BufferedReader br = request.getReader();
		String str;
		StringBuffer sb = new StringBuffer();
		while ((str = br.readLine()) != null) {
			sb.append(str);
		}
		System.out.println(sb.toString());
		UserVO ui = aGson.fromJson(sb.toString(), UserVO.class);
		System.out.println(ui);
		Map<String, Object> result = new LinkedHashMap<>();
		if ("insert".equals(ui.getUiCmd())) {
			result.put("result", userService.insertUser(ui));
		}
		String json = aGson.toJson(result);
		PrintWriter pw = response.getWriter();
		pw.println(json);
	}

}
