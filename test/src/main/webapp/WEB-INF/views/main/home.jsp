<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/global.css">

<c:if test="${user == null }">
	<h1>
		Hello world!  		
	</h1>
	<form action="<%=request.getContextPath() %>/user/signin" method="POST">
		<div>
			아이디 : 
			<input type="text" name="id" id="id">
		</div>
		<div>
			비밀번호 :
			<input type="password" name="pw" id="pw">
		</div>
		<button>로그인</button>
	</form>
</c:if>

