<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>내 정보</title>
<div class="vaginal">
	<h4>문의내역</h4>
	<hr>
	<div style="width:100%;height:550px;box-shadow: 2px 2px 2px 2px;margin-top:20px;">
		<div style="width:100%;height:500px;overflow:auto;">
			<table class="table table-hover" style="text-align:center;">
				<thead>
					<tr>
						<th>문의번호</th>
						<th>문의제목</th>
						<th>작성날짜</th>
						<th>답변여부</th>
					</tr>
				</thead>
				<tbody >
				<c:if test="${vaginalList.size() == 0}">
					<tr>
						<td colspan = "4">문의 내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${vaginalList.size() != 0}">
					<c:forEach var="list" items="${vaginalList}" varStatus="status">
						<tr>
							<td>${list.registerNum}</td>
							<td><a href="<%=request.getContextPath()%>/vaginal/detail?num=${list.num}">${list.title}</a></td>
							<td>${list.registerDate}</td>
							<td>${list.isAnswer}</td>
						</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<a href="<%=request.getContextPath()%>/vaginal/register" style="height:50px;display:inline-block;line-height:50px;border-top:1px solid black;border-left:1px solid black;width:150px;text-align:center;float:right;background-color:rgb(33,51,87);color:white;">문의하러 가기</a>
	</div>
</div>