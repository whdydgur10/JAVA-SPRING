<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>문의사항</title>
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
					<c:if test="${list.isSecret == 'Y'.charAt(0)}"><c:if test="${user.auth == 1 || user.id == list.userId}"><a href="<%=request.getContextPath()%>/vaginal/detail?num=${list.num}">비밀글입니다.</a></c:if><c:if test="${user.auth == 0 && user.id != list.userId || user == null}">비밀글입니다.</c:if></c:if>	
				</c:if></td>
				<td>${list.name}</td>
				<td>${list.registerDate}</td>
				<td>${list.view}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>