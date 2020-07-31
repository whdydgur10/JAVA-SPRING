<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>로그인</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/signin.css">
<form method="post">
	<div class="signinContainer">
		<div class="idBox">
			아이디
			<input type="text" name="id" class="id">
		</div>
		<div class="pwBox">
			비밀번호
			<input type="password" name="pw" class="pw">
		</div>
		<div class="search">
			<button type="submit">로그인</button>|
			<a href="<%=request.getContextPath()%>/user/lostid">아이디 찾기</a>|
			<a href="<%=request.getContextPath()%>/user/lostpw">비밀번호 찾기</a>|
			<a href="<%=request.getContextPath()%>/user/signup">회원가입</a>
		</div>
	</div>
</form>