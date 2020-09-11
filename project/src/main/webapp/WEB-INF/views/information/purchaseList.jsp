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
						<th style="width:88px;">구매번호</th>
						<th style="width:238px;">구매내역</th>
						<th style="width:110px;">구매금액</th>
						<th style="width:110px;">주문날짜</th>
						<th style="width:88px;">결제여부</th>
						<th style="width:110px;">배송상태</th>
						<th style="width:97px;">비고</th>
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
								<td>
									<c:if test="${list.deposit == 'N'}"><a href="<%=request.getContextPath()%>/product/order?purchaseNum=${list.num}&mainCategory=${user.gender}" style="overflow:hidden;text-overflow: ellipsis;white-space: nowrap;width:210px;display:inline-block;">${list.mainTitle }</a></c:if>
									<c:if test="${list.deposit == 'Y'}"><span style="overflow:hidden;text-overflow: ellipsis;white-space: nowrap;width:230px;display:inline-block;">${list.mainTitle }</span></c:if>
								</td>
								<td>${list.stringPrice}</td>
								<td>${list.orderDate}</td>
								<td>${list.deposit}</td>
								<td>${list.situation}</td>
								<td><c:if test="${list.isConfirm == 'Y'.charAt(0)}"><a href="<%=request.getContextPath()%>/review/register?mainCategory=${user.gender}&purchaseNum=${list.num}">후기작성</a></c:if>
									<c:if test="${list.isConfirm == 'N'.charAt(0) && list.situation == '상품 도착'}"><a type="button">확정</a></c:if>
									<c:if test="${list.isConfirm == 'N'.charAt(0) && list.situation != '상품 준비중'}"><a href="<%=request.getContextPath()%>/product/return?mainCategory=${user.gender}&purchaseNum=${list.num}">반품/교환</a></c:if>
									<c:if test="${list.situation == '상품 준비중'}"><a href="<%=request.getContextPath()%>/product/cancel?mainCategory=${user.gender}&purchaseNum=${list.num}">취소/환불</a></c:if>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
	<div style="text-align:right;margin-top:5px;">
		※비고란은 주문 상품에 대한 가능한 서비스 내용입니다.
	</div>
</div>