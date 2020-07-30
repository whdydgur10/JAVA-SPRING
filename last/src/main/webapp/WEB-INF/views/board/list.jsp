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
	  	<a href="<%=request.getContextPath()%>/board/register">글쓰기</a>
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
				        	<td><a href="<%=request.getContextPath()%>/board/detail?num=${board.num}">${board.title}<c:if test="${board.modify == 'Y'.charAt(0)}">(수정)</c:if></a></td>
				        	<td>${board.writer}</td>
				        	<td>${board.registerDate}</td>
				        	<td>${board.views}</td>
				      	</tr>
		      		</c:forEach>
		    	</c:if>
		    </tbody> 
		</table>
		<ul class="pagination" style="justify-content: center;">
		  	<c:if test="${pm.prev}">
		        <li class="page-item">
		            <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.startPage-1}"><i class="fas fa-angle-double-left"></i></a>
		        </li>
		    </c:if>
		    <c:if test="${pm.criteria.page != 1}">
		        <li class="page-item">
		            <a style="height:38px;padding-top:10px;" class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.criteria.page - 1}"><i class="fas fa-angle-left"></i></a>
		        </li>
		    </c:if>
		    <c:forEach var="index" begin="${pm.startPage}" end="${pm.endPage}">
		  		<li class="page-item <c:if test="${index == pm.criteria.page}">active</c:if>">
		  			<a class="page-link " href="<%=request.getContextPath()%>/board/list?page=${index}">${index}</a>
		  		</li>
		  	</c:forEach>
		  	<c:if test="${pm.criteria.page != pm.endPage}">
		        <li class="page-item" >
		            <a style="height:38px;padding-top:10px;" class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.criteria.page + 1}"><i class="fas fa-angle-right"></i></a>
		        </li>
		    </c:if>
		    <c:if test="${pm.next}">
		        <li class="page-item">
		            <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.endPage+1}"><i class="fas fa-angle-double-right"></i></a>
		        </li>
		    </c:if>
		</ul>
  	</div>
</div>
