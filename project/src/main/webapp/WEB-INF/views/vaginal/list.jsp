<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>문의사항</title>
<div>
	<h2 style="margin-left:20px;">문의게시판</h2>
</div>
<table class="table table-hover" style="text-align:center;">
	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성날짜</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="list" items="${vaginalList}">
			<tr>
				<td><c:if test="${list.auth == 1}"></c:if><c:if test="${list.auth == 0}">${list.registerNum}</c:if></td>
				<td><c:if test="${list.auth == 1}"><a href="<%=request.getContextPath()%>/vaginal/detail?num=${list.num}">(공지사항)${list.title}</a></c:if><c:if test="${list.auth == 0}">
					<c:if test="${list.isSecret == 'N'.charAt(0)}"><a href="<%=request.getContextPath()%>/vaginal/detail?num=${list.num}">${list.title}</a></c:if>
					<c:if test="${list.isSecret == 'Y'.charAt(0)}"><c:if test="${user.auth == 1 || user.id == list.userId}"><a href="<%=request.getContextPath()%>/vaginal/secret?num=${list.num}">비밀글입니다.</a></c:if><c:if test="${user.auth == 0 && user.id != list.userId || user == null}">비밀글입니다.</c:if></c:if>	
				</c:if></td>
				<td>${list.name}</td>
				<td>${list.registerDate}</td>
				<td>${list.view}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<ul class="pagination justify-content-center">
	<c:if test="${pageMaker.criteria.page != 1}">
		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/vaginal/list?page=${pageMaker.criteria.page - 1}">이전</a></li>
	</c:if>
  	<c:forEach var="index" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
  		<li class="page-item <c:if test="${pageMaker.criteria.page == index}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/vaginal/list?page=${index}">${index}</a></li>
  	</c:forEach>
  	<c:if test="${pageMaker.endPage != pageMaker.criteria.page}">
  		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/vaginal/list?page=${pageMaker.criteria.page + 1}">다음</a></li>
  	</c:if>
</ul>
<div style="text-align:right;">
	<a href="<%=request.getContextPath()%>/vaginal/register" style="height:50px;display:inline-block;line-height:50px;border-top:1px solid black;border-left:1px solid black;width:150px;text-align:center;background-color:rgb(33,51,87);color:white;">문의글 작성하기</a>
</div>