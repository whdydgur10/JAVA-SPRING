<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/register.css">
</head>
<body>
	<form action="<%=request.getContextPath() %>/board/register" method="POST" enctype="multipart/form-data">
		<div class="registerTitle">
			<p class="textTitle">제목</p>
			<input type="text" class="dataTitle" name="title">
		</div>
		<div class="registerWriter">
			<p class="textWriter">작성자</p>
			<input type="text" class="dataWriter" name="writer" value="${user.id}" readonly>
		</div>
		<div class="registerContent">
			<p class="textContent">내용</p>
			<textarea class="dataContent" name="content"></textarea>
		</div>
		<div class="form-group">
        	<label>파일</label>
        	<input type="file" class="form-control" name="file2"/>
    	</div>
		<button type="submit">등록</button>
	</form>
</body>
</html>
