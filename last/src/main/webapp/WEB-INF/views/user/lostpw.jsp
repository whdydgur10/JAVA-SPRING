<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>비밀번호 찾기</title>
<form action="<%=request.getContextPath()%>/mail/lostpw" method="POST">
	<div class="form-group">
		<input class="form-control" type="text" name="id" placeholder="가입한 아이디">
	</div>
	<button class="btn btn-outline-seccess col-12">메일보내기</button>
</form>