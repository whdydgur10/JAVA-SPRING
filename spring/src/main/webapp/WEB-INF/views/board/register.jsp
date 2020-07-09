<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/register.css">
</head>
<body>
	<form action="<%=request.getContextPath() %>/board/register" method="POST">
		<div class="registerTitle">
			<p class="textTitle">제목</p>
			<input type="text" class="dataTitle" name="title">
		</div>
		<div class="registerWriter">
			<p class="textWriter">작성자</p>
			<input type="text" class="dataWriter" name="writer">
		</div>
		<div class="registerContent">
			<p class="textContent">내용</p>
			<textarea class="dataContent" name="content"></textarea>
		</div>
		<button type="submit">등록</button>
	</form>
</body>
</html>
