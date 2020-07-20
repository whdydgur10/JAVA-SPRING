<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="#" method="POST">
		<div>
			아이디 : 
			<input type="text" name="id">
		</div>
		<div>
			비밀번호 :
			<input type="password" name="pw">
		</div>
		<div>
			이메일 :
			<input type="text" name="emailId">@
			<select name="emailSite">
				<option selected>선택</option>
				<option value="naver.com">naver.com</option>
				<option value="kakao.com">kakao.com</option>
				<option value="daum.net">daum.net</option>
			</select>
		</div>
		<div>
			성별 :
			<select name="gender">
				<option value="male" selected>남성</option>
				<option value="female">여성</option>
			</select>
		</div>
		<button>회원가입 완료</button>
	</form>
</body>
</html>