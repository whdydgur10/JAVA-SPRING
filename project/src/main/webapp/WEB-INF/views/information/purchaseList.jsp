<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>내 정보</title>
<div class="purchase">
	<h4>주문내역</h4>
	<hr>
	<div style="width:100%;height:550px;box-shadow: 2px 2px 2px 2px;margin-top:20px;">
		<div style="width:100%;height:550px;overflow:auto;">
			<table class="table table-hover" style="text-align:center;">
				<thead>
					<tr>
						<th style="width:100px;">구매번호</th>
						<th>구매내역</th>
						<th style="width:130px;">구매금액</th>
						<th style="width:150px;">주문날짜</th>
						<th style="width:100px;">입금여부</th>
						<th style="width:150px;">배송상태</th>
					</tr>
				</thead>
				<tbody >
					<c:if test="${purchaseList.size() == 0}">
						<tr>
							<td colspan = "6">주문 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${purchaseList.size() != 0}">
						<c:forEach var="list" items="${purchaseList}" varStatus="status">
							<tr>
								<td >${purchaseList.size() - status.count + 1}</td>
								<td><a href="<%=request.getContextPath() %>/product/purchase?purchaseNum=${list.num}" style="overflow:hidden;text-overflow: ellipsis;white-space: nowrap;width:230px;display:inline-block;">${list.mainTitle }</a></td>
								<td>${list.stringPrice}</td>
								<td>${list.orderDate}</td>
								<td>${list.deposit}</td>
								<td>${list.situation}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>