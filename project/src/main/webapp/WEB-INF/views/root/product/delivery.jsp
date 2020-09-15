<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>택배 배송현황</title>
<style>
	th{
		background-color: rgb(33,51,87) !important;
		color:white !important;
	}
	table input{
		border: none;
		border-bottom: 1px solid black;
	}
</style>
<div class="consumerContainer">
	<div>
		<h4 style="float:left;">고객리스트</h4>
		<form method="get" style="float:right;">
			<input type="text" class="search" value="${rri.search}" name="search" style="width:250px;">
			<button>검색</button>
		</form>
	</div>
	<table class="table table-hover" style="text-align:center">
		<thead>
			<tr>
				<th>구매고객</th>
				<th>입금여부</th>
				<th>입금일자</th>
				<th>배송상황</th>
				<th>송장번호</th>
			</tr>
		</thead>
		<tbody class="ll">
			<c:forEach var="list" items="${purchaselist}">
				<tr>
					<td>${list.userId}</td>
					<td>${list.deposit}</td>
					<td><c:if test="${list.deposit == 'Y'}">${list.depositDate}</c:if></td>
					<td>
						<select>
							<option <c:if test="${list.situation == '상품 준비중'}">selected</c:if>>상품 준비중</option>
							<option <c:if test="${list.situation == '상품 배송중'}">selected</c:if>>상품 배송중</option>
							<option <c:if test="${list.situation == '상품 도착'}">selected</c:if>>상품 도착</option>
						</select>
					</td>
					<td><c:if test="${list.situation == '상품 배송중'}">${list.invoice}</c:if></td>
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
</div>