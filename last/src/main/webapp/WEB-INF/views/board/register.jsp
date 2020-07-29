<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>게시글작성</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/register.css">
<div class="registerContainer">
	<form method="post">
		<div class="titleBox box">
			<h4>제목</h4>
			<input type="text" name="title" class="title">
		</div>
		<div class="titleBox box">
			<h4>내용</h4>
			<textarea class="content" name="content"></textarea>
		</div>
		<button type="submit">등록하기</button>
	</form>
</div>