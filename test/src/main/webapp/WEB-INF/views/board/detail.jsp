<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/global.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/detail.css">
</head>
<body>
	<c:if test="${board.num eq null}">
		<h1>해당 게시물은 없는 게시물입니다.</h1>
	</c:if>
	<c:if test="${board.num ne null}">
		<c:if test="${board.isDel == 'Y'.charAt(0)}">
			<h1>해당 게시물은 삭제되었습니다.</h1>
		</c:if>
		<c:if test="${board.isDel == 'N'.charAt(0)}">
			<div class="container detail">
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
					<div class="dataContent">${board.content}</div>
				</div>
				<a href="<%=request.getContextPath() %>/board/list"><button>목록</button></a>
				<c:if test="${user != null}">
					<a href="<%=request.getContextPath() %>/board/register"><button>글쓰기</button></a>
				</c:if>
				<c:if test="${user.id == board.writer}">
					<a href="<%=request.getContextPath() %>/board/modify?num=${board.num}"><button>수정</button></a>
					<a href="<%=request.getContextPath() %>/board/delete?num=${board.num}"><button>삭제</button></a>
				</c:if>
			</div>
		</c:if>
	</c:if>
</body>
</html>