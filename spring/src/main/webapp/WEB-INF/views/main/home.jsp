<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${user == null}">
	<div style="height: 800px">
		<h1>
			로그인  
		</h1>
		<form action="#" method="POST">
			<div>
				아이디
				<input type="text" name=id>
			</div>
			<div>
				비밀번호
				<input type="password" name=pw>
			</div>
			<button type="submit">로그인</button>
		</form>
	</div>
</c:if>

