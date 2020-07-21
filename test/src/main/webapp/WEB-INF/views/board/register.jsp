<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글작성</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/global.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/register.css">
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/naver.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/register.js"></script>
</head>
<body>
	<form action="<%=request.getContextPath() %>/board/register" method="POST">
		<div class="registerTitle">
			<p class="textTitle">제목</p>
			<input type="text" class="dataTitle" name="title">
		</div>
		<div class="registerContent">
			<p class="textContent">내용</p>
			<textarea class="dataContent" name="content"></textarea>
		</div>
		<button type="submit">등록</button>
	</form>
	<script>
		$(function(){
			$('form').submit(function(){
				if($('.dataTitle').val() == ''){
					alert('제목을 입력하세요.');
					return false;
				}
			})
		})
	</script>
</body>
</html>
