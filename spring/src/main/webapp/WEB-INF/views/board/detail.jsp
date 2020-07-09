<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/detail.css">
</head>
<body>
	<div class="container board">
		<div class="boardHead">
			<div class="boardNum">
				<p class="textNum">게시글번호</p>
				<p class="dataNum">${board.num}</p>
			</div>
			<div class="boardTitle">
				<p class="textTitle">제목</p>
				<p class="dataTitle">${board.title}</p>	
			</div>
			<div class="boardViews">
				<p class="textViews">조회수</p>
				<p class="dataViews">${board.views}</p>
			</div>
			<div class="boardWriter">
				<p class="textWriter">작성자</p>
				<p class="dataWriter">${board.writer}</p>
			</div>
			<div class="boardDate">
				<p class="textDate">작성일</p>
				<p class="dataDate">${board.registerDate}</p>
			</div>
		</div>
		<div class="boardBody">
			<div class="textContent">내용</div>
			<div class="dataContent">${board.content}</div>
		</div>
	</div>
</body>
</html>