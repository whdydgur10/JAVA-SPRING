<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/list.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<div class="container">
	<div class="header">
		<h2>게시판</h2>
		<div class="selectBox">
			<form method="GET">
				<select name="searchType" class="searchType">
					<option value="all" <c:if test="${pm.cri.searchType == 'all'}">selected</c:if>>전체</option>
					<option value="title" <c:if test="${pm.cri.searchType == 'title'}">selected</c:if>>제목</option>
					<option value="writer" <c:if test="${pm.cri.searchType == 'writer'}">selected</c:if>>작성자</option>
					<option value="content" <c:if test="${pm.cri.searchType == 'content'}">selected</c:if>>내용</option>
				</select>
				<input type="text" class="searchWord" name="searchWord" value="${pm.cri.searchWord}">
				<button type="submit">검색</button>
			</form>
		</div>
	</div>
  	<div class="body">
  		<table class="table table-dark table-striped">
		    <thead>
		      	<tr>
		      		<th>번호</th> 
		        	<th>제목</th>
		        	<th>작성자</th>
		        	<th>작성일</th>
		        	<th>조회수</th>
		      	</tr>
		    </thead>
		    <tbody>
		    	<c:if test="${list.size() == 0}">
		    		<tr>
		    			<td colspan="5" style="text-align: center;">등록된 게시글이 없습니다.</td>
		    		</tr>
		    	</c:if>
		    	<c:if test="${list.size() != 0}">
		    		<c:forEach var="board" items="${list}"> 
				    	<tr>
				    		<td>${board.num}</td>
				        	<td><a href="<%=request.getContextPath()%>/board/detail?num=${board.num}&page=${pm.cri.page}&searchType=${pm.cri.searchType}&searchWord=${pm.cri.searchWord}">${board.title}<c:if test="${board.modify == 'Y'.charAt(0)}">(수정)</c:if></a></td>
				        	<td>${board.writer}</td>
				        	<td>${board.registerDate}</td>
				        	<td>${board.views}</td>
				      	</tr>
		      		</c:forEach>
		    	</c:if>
		    </tbody> 
		</table>
		<c:if test="${user != null}"><a href="<%=request.getContextPath()%>/board/register" class="register"><button type="button" class="linkRegister">글쓰기</button></a></c:if>
		<c:if test="${user == null}"><a href="<%=request.getContextPath()%>/user/signin" class="register"><button type="button" class="linkRegister">글쓰기</button></a></c:if>
		<ul class="pagination" style="justify-content: center;">
		  	<c:if test="${pm.prev}">
		        <li class="page-item">
		            <a class="page-link" style="height:38px;padding-top:10px;" href="<%=request.getContextPath()%>/board/list?searchType=${pm.cri.searchType}&searchWord=${pm.cri.searchWord}&page=${pm.startPage-1}"><i class="fas fa-angle-double-left"></i></a>
		        </li>
		    </c:if>
		    <c:if test="${pm.cri.page != 1}">
		        <li class="page-item">
		            <a style="height:38px;padding-top:10px;" class="page-link" href="<%=request.getContextPath()%>/board/list?searchType=${pm.cri.searchType}&searchWord=${pm.cri.searchWord}&page=${pm.cri.page - 1}"><i class="fas fa-angle-left"></i></a>
		        </li>
		    </c:if>
		    <c:forEach var="index" begin="${pm.startPage}" end="${pm.endPage}">
		  		<li class="page-item <c:if test="${index == pm.cri.page}">active</c:if>">
		  			<a class="page-link " href="<%=request.getContextPath()%>/board/list?searchType=${pm.cri.searchType}&searchWord=${pm.cri.searchWord}&page=${index}">${index}</a>
		  		</li>
		  	</c:forEach>
		  	<c:if test="${pm.cri.page != pm.endPage}">
		        <li class="page-item" >
		            <a style="height:38px;padding-top:10px;" class="page-link" href="<%=request.getContextPath()%>/board/list?searchType=${pm.cri.searchType}&searchWord=${pm.cri.searchWord}&page=${pm.cri.page + 1}"><i class="fas fa-angle-right"></i></a>
		        </li>
		    </c:if>
		    <c:if test="${pm.next}">
		        <li class="page-item">
		            <a class="page-link" style="height:38px;padding-top:10px;" href="<%=request.getContextPath()%>/board/list?searchType=${pm.cri.searchType}&searchWord=${pm.cri.searchWord}&page=${pm.endPage+1}"><i class="fas fa-angle-double-right"></i></a>
		        </li>
		    </c:if>
		</ul>
  	</div>
</div>
<c:if test="${user == null}">
	<script>
		$(function(){
			$('.linkRegister').click(function(){
				alert('로그인 후 이용하세요.');
			})
		})
	</script>
</c:if>
