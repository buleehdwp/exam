<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/common/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/common/menu.jsp"></jsp:include>
	<form>
		<div class="form-group">
			<label for="uiId">아이디</label> <input
				type="text" class="form-control" id="uiId"
				aria-describedby="uiIdHelp"> <small id="uiIdHelp"
				class="form-text text-muted">당신의 아이디는 안전합니다</small>
		</div>
		<div class="form-group">
			<label for="uiPassword">비밀번호</label> <input
				type="password" class="form-control" id="uiPassword">
		</div>
		<div class="form-group form-check">
			<input type="checkbox" class="form-check-input" id="exampleCheck1">
			<label class="form-check-label" for="exampleCheck1">아이디 기억하기</label>
		</div>
		<button type="submit" class="btn btn-primary">로그인</button>
		<a href="/join.jsp"><button type=button class="btn btn-primary">회원가입</button></a>
	</form>
</body>
</html>