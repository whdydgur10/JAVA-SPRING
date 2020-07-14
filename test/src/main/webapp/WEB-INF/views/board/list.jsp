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
	<div class="boardSearch">
		<select name="type" id="type">
            <option value="" selected>선택</option> 
            <option value="title">제목</option> 
            <option value="writer">작성자</option>  
            <option value="content">내용</option>
        </select>
    	<input type="text">
    <button>검색</button>
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
		        	<td><a href="<%=request.getContextPath()%>/board/detail?num=${board.num}">${board.title}<c:if test="${board.modify == 'Y'.charAt(0)}">(수정)</c:if></a></td>
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
  <div>
  </div>
</body>
</html>