<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/global.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/list.css">
</head>
<body>
	<h2>게시판</h2>
	<p>현재게시글 ${boardCnt}</p>
	<c:if test="${user == null}">
		<a href="<%=request.getContextPath() %>/"><button>로그인</button></a>
	</c:if>
	<c:if test="${user != null}">
		<a href="<%=request.getContextPath() %>/board/register"><button>글쓰기</button></a>
	</c:if>
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
    <c:forEach var="board" items="${list}">
      	<tr>
        	<td>${board.num}</td>
        	<td><a href="<%=request.getContextPath()%>/board/detail?num=${board.num}&page=${pm.criteria.page}&type=${pm.criteria.type}&search=${pm.criteria.search}">${board.title}<c:if test="${board.modify == 'Y'.charAt(0)}">(수정)</c:if></a></td>
        	<td>${board.writer}</td>
        	<td>${board.registerDate}</td>
        	<td>${board.views}</td>
      	</tr>
      </c:forEach>
    </tbody>
  </table>
  <ul class="pagination justify-content-center">
  	<c:if test="${pm.prev}">
  		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.startPage-1}&type=${pm.criteria.type}&search=${pm.criteria.search}">이전페이지</a></li>
  	</c:if>
  	<c:if test="${pm.criteria.page != 1}">
  		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.criteria.page-1}&type=${pm.criteria.type}&search=${pm.criteria.search}"><i class="far fa-angle-left"></i></a></li>
  	</c:if>
  	<c:forEach var="index" begin="${pm.startPage}" end="${pm.endPage}">
  		<li class="page-item <c:if test="${index == pm.criteria.page}">active</c:if>"><a class="page-link " href="<%=request.getContextPath()%>/board/list?page=${index}&type=${pm.criteria.type}&search=${pm.criteria.search}">${index}</a></li>
  	</c:forEach>
	<c:if test="${pm.criteria.page != pm.lastContent}">
	  <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.criteria.page+1}&type=${pm.criteria.type}&search=${pm.criteria.search}"><i class="far fa-angle-right"></i></a></li>
	</c:if>
	<c:if test="${pm.next}">
		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.endPage+1}&type=${pm.criteria.type}&search=${pm.criteria.search}">다음페이지</a></li>
	</c:if>
  </ul>
  <form action="#" method="get">
    <div class="input-group mb-3">
	  <select class="form-control" id="sel1" name="type">
	    <option value="0" <c:if test="${pm.criteria.type == 0}">selected</c:if>>전체</option>
	    <option value="1" <c:if test="${pm.criteria.type == 1}">selected</c:if>>제목</option>
	    <option value="2" <c:if test="${pm.criteria.type == 2}">selected</c:if>>작성자</option>
	    <option value="3" <c:if test="${pm.criteria.type == 3}">selected</c:if>>내용</option>
	  </select>
	  <input type="text" class="form-control" placeholder="Search" name="search" value="${pm.criteria.search}">
	  <div class="input-group-append">
		<button class="btn btn-success" type="submit">검색</button>
	  </div>
    </div>
  </form>
</body>
</html>