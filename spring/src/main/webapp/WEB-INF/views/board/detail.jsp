<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/detail.css">
</head>
<body>
	<div class="container detail">
		<form action="<%=request.getContextPath() %>/board/register" method="POST">
			<div class="detailHead">
				<div class="detailNum">
					<p class="textNum">게시글번호</p>
					<p class="dataNum">${board.num}</p>
				</div>
				<div class="detailTitle">
					<p class="textTitle">제목</p>
					<p class="dataTitle">${board.title}</p>	
				</div>
				<div class="detailViews">
					<p class="textViews">조회수</p>
					<p class="dataViews">${board.views}</p>
				</div>
				<div class="detailWriter">
					<p class="textWriter">작성자</p>
					<p class="dataWriter">${board.writer}</p>
				</div>
				<div class="detailDate">
					<p class="textDate">작성일</p>
					<p class="dataDate">${board.registerDate}</p>
				</div>
			</div>
			<div class="detailBody">
				<div class="textContent">내용</div>
				<div class="dataContent">${board.content}</div>
			</div>
		</form>
		<a href="<%=request.getContextPath() %>/board/list?page=${cri.page}&type=${cri.type}&search=${cri.search}"><button>목록</button></a>
		<a href="<%=request.getContextPath() %>/board/modify?num=${board.num}"><button>수정</button></a>
		<a href="<%=request.getContextPath() %>/board/delete?num=${board.num}"><button>삭제</button></a>
	</div>
</body>
</html>