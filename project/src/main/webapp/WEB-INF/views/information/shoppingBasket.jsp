<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>내 정보</title>
<div class="shoppingBasket">
	<h4>장바구니</h4>
	<hr>
	<div style="width:100%;height:550px;box-shadow: 2px 2px 2px 2px;margin-top:20px;">
		<div style="width:100%;height:550px;overflow:auto;">
			<table class="table table-hover" style="text-align:center;">
				<thead>
					<tr>
						<th colspan="6">상품정보</th>
						<th>상품가격</th>
					</tr>
				</thead>
				<tbody >
					<c:if test="${shoppingBasketList.size() == 0}">
						<tr>
							<td colspan = "7">장바구니 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${shoppingBasketList.size() != 0}">
						<c:forEach var="list" items="${purchaseList}" varStatus="status">
							<tr>
								<td><input type="checkbox"></td>
								<td><a href="#">상품이름</a></td>
								<td>${list.stringPrice}</td>
								<td>${list.orderDate}</td>
								<td>${list.deposit}</td>
								<td>${list.situation}</td>
								<td>후기번호</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>