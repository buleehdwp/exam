<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/common/head.jsp"></jsp:include>
<script src="https://code.jwquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="/common/menu.jsp"></jsp:include>

	<article class="container">
		<div class="p-3 mb-2 bg-dark text-white">
			<div class="page-header">
				<div class="col-md-6 col-md-offset-3">
					<h3>회원가입</h3>
				</div>
			</div>
			<div class="col-sm-6 col-md-offset-3">
				<form role="form">
					<div class="form-group">
						<label for="inputName">성명</label> <input type="text"
							class="form-control" id="uiName" placeholder="이름을 입력해 주세요">
					</div>
					<div class="form-group">
						<label for="inputAge">나이</label> <input type="number"
							class="form-control" id="uiAge" placeholder="나이를 입력해 주세요">
					</div>
					<div class="form-group">
						<label for="inputBirth">생년월일</label> <input type="date"
							class="form-control" id="uiBirth" placeholder="생년월일을 입력해 주세요">
					</div>
					<div class="form-group">
						<label for="inputId">아이디</label> <input type="text"
							class="form-control" id="uiId" placeholder="아이디를 입력해 주세요">
					</div>
					<div class="form-group">
						<label for="inputPassword">비밀번호</label> <input type="password"
							class="form-control" id="uiPassword" placeholder="비밀번호를 입력해 주세요">
					</div>
					<div class="form-group">
						<label for="inputPhone">전화번호</label> <input type="number"
							class="form-control" id="uiPhone" placeholder="전화번호를 입력해 주세요">
					</div>
					<div class="form-group">
						<label for="inputEmail">e메일</label> <input type="text"
							class="form-control" id="uiEmail" placeholder="e메일을 입력해 주세요">
					</div>
					<div class="form-group">
						<label for="inputNickname">닉네임</label> <input type="text"
							class="form-control" id="uiNickname" placeholder="닉네임을 입력해 주세요">
					</div>
					<div class="form-group text-center">
						<button type="button" class="btn btn-primary" onclick="doJoin()">
							회원가입<i class="fa fa-check spaceLeft"></i>
						</button>
						<button type="submit" class="btn btn-danger">
							가입취소<i class="fa fa-times spaceLeft"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
	</article>
	<script>
		function doJoin() {
			if ($('#uiName').val().trim().length < 2) {
				alert("이름은 2글자 이상입니다.")
				return $('#uiName').focus();
			}
			if (isNaN($('#uiAge').val()) || $('#uiAge').val() < 1
					|| $('#uiAge').val() > 150) {
				alert("나이는1이상 150이하의 숫자로 입력하셔야 합니다.")
				return $('#uiAge').focus();
				;
			}
			if ($('#uiBirth').val().trim().length < 8) {
				alert("생년월일을 체크해 주세요.")
				return $('#uiBirth').focus();
			}
			if ($('#uiId').val().trim().length < 4) {
				alert("아이디는 4글자 이상입니다.")
				return $('#uiId').focus();
			}
			if ($('#uiPassword').val().trim().length < 4) {
				alert("비밀번호는 4글자 이상입니다.")
				return $('#uiPassword').focus();
			}
			if ($('#uiPhone').val().includes("-")) {
				alert("전화번호는 ('-')를 제외한 숫자로만 입력해주세요.")
				return $('#uiPhone').focus();
			}
			if ($('#uiNickname').val().trim().length < 4) {
				alert("닉네임은 4글자 이상입니다.")
				return $('#uiNickname').focus();
			}
			var uiCmd = "insert";
			var param = {
				uiName : $('#uiName').val(),
				uiAge : $('#uiAge').val(),
				uiBirth : $('#uiBirth').val(),
				uiId : $('#uiId').val(),
				uiPassword : $('#uiPassword').val(),
				uiPhone : $('#uiPhone').val(),
				uiEmail : $('#uiEmail').val(),
				uiNickname : $('#uiNickname').val(),
				uiCmd : uiCmd
			}

			$.ajax({
				url : "/ajax/user",
				method : "POST",
				data : JSON.stringify(param),
				contentType : "application/json",
				success : function(res) {
					if (res.result === 1) {
						alert("가입되셨습니다");
					}
				}
			})
		}
	</script>
</body>
</html>