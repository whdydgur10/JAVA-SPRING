<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/global.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/list.css">
</head>
<body>
 	<h2>게시판</h2>
	<div class="boardSearch ">
		<form>
			<select name="type" id="type">
        		<option value="all" <c:if test="${pm.criteria.type == 'all'}">selected</c:if>>전체</option> 
				<option value="title" <c:if test="${pm.criteria.type == 'title'}">selected</c:if>>제목</option> 
				<option value="writer" <c:if test="${pm.criteria.type == 'writer'}">selected</c:if>>작성자</option>  
				<option value="content" <c:if test="${pm.criteria.type == 'content'}">selected</c:if>>내용</option>
			</select>
			<input class="search" type="text" name="search" placeholder="검색어를 입력하세요." value="${pm.criteria.search}">
			<button>검색</button>
		</form>
 	</div>
	<p>현재게시글 ${boardCnt}</p>
	<a href="<%=request.getContextPath() %>/board/register"><button>글쓰기</button></a>
	<table class="table table-dark table-striped">
    <thead>
    	<tr>
        	<th>게시글번호</th>
        	<th>제목</th>
        	<th>작성자</th>
        	<th>작성일</th>
        	<th>조회수</th>
    	</tr>
    </thead>
    <tbody>
	    <c:if test="${list.size() != 0}">
	    	<c:forEach var="board" items="${list}">
		      	<tr>
		        	<td>${board.num}</td>
		        	<td><a href="<%=request.getContextPath()%>/board/detail?num=${board.num}&page=${pm.criteria.page}&type=${pm.criteria.type}&search=${pm.criteria.search}">${board.title}<c:if test="${board.modify == 'Y'.charAt(0)}">(수정)</c:if></a></td>
		        	<td>${board.writer}</td>
		        	<td>${board.registerDate}</td>
		        	<td>${board.views}</td>
		      	</tr>
	      	</c:forEach>
	     </c:if>
	     <c:if test="${list.size() == 0}">
	     	<tr>
	     		<td colspan = "5">등록된 게시글이 없습니다.</td>
	     	</tr>
	     </c:if>
    </tbody>
  </table>
  
  <ul class="pagination justify-content-center">
	  <c:if test="${pm.prev}">
	  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>" ><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.startPage-1}&page=${pm.criteria.page}&type=${pm.criteria.type}&search=${pm.criteria.search}">이전페이지</a></li>
	  </c:if>
	  <c:if test="${pm.criteria.page != 1}">
	  	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.criteria.page-1}&page=${pm.criteria.page}&type=${pm.criteria.type}&search=${pm.criteria.search}">이전</a></li>
	  </c:if>
	  <c:forEach var="index" begin="${pm.startPage}" end="${pm.endPage}">
	  	<li class="page-item <c:if test="${index == pm.criteria.page}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${index}&type=${pm.criteria.type}&search=${pm.criteria.search}">${index}</a></li>
	  </c:forEach>
	  <c:if test="${pm.getLastContent() != pm.criteria.page}">
	  	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.criteria.page+1}&page=${pm.criteria.page}&type=${pm.criteria.type}&search=${pm.criteria.search}">다음</a></li>
	  </c:if>
	  <c:if test="${pm.next}">
	  	<li class="page-item <c:if test="${!pm.next}">disabled</c:if>" ><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.endPage+1}&page=${pm.criteria.page}&type=${pm.criteria.type}&search=${pm.criteria.search}">다음페이지</a></li>
	  </c:if>
	</ul>
</body>
</html>