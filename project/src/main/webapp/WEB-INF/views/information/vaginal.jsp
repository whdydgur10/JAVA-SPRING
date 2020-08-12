<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>내 정보</title>
<div class="vaginal">
	<h4>문의내역</h4>
	<hr>
	<div style="width:100%;height:550px;box-shadow: 2px 2px 2px 2px;margin-top:20px;">
		<div style="width:100%;height:550px;overflow:auto;">
			<table class="table" style="text-align:center;">
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
					<c:forEach var="list" items="${purchaseList}" varStatus="status">
						<tr>
							<td>${vaginalList.size() - status.count + 1}</td>
							<td><a href="#">${list.title}</a></td>
							<td>${list.registerDate}</td>
							<td>${list.isAnswer}</td>
						</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>