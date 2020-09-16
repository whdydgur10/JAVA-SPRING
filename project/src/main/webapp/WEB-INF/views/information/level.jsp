<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>내 정보</title>
<style>
	input{
		border: none;
		width: 100px;
	}
	.showPoint>div{
		float: left;
	}
	.showPoint input:nth-of-type(1) {
		width:40px;
	}
	.showPoint input:nth-of-type(2) {
		width:60px;
	}
	.table{
		margin:0;
		height:100%;
		text-align: center;
	}
	th{
		font-size:13px;
		width: 150px !important;
	}
	th:nth-of-type(2){
		width: 300px !important;
	}
	td{
		font-size:12px;
		padding:15px !important;
	}
</style>

<div class="level">
	<h4>레벨</h4>
	<hr>
	<div class="nowLevel" style="width:300px;float:left;height: 240px;">
		레벨 <input type="text" value="${level.level}" readonly><br>
		적립률 <input type="text" value="${level.point * 100}%" readonly><br>
		누적 사용 금액 <input type="text" value="${purchase}원" readonly><br>
		다음 레벨까지 필요한 금액 <input type="text" value="${remain}원" readonly><br>
		현재 적립금 <input type="text" value="${point}point" readonly><br>
		사용한 적립금 <input type="text" value="${usePoint}point" readonly>
	</div>
	<div class="showPoint" style="float:right;width:450px;height:240px;">
		<c:forEach var="point" items="${pointList}">
			<div>
				레벨 <input type="text" value="${point.level}" readonly>
				적립률  <input type="text" value="${point.point * 100}%" readonly>
				누적 사용 금액 <input type="text" value="${point.stringNeedPrice}원" readonly>
			</div>
		</c:forEach>
	</div>
	<div class="showGetPoint" style="float:left;width:100%;height:170px;box-shadow: 2px 2px 2px 2px;margin-top:20px;">
		<b>적립 포인트</b>
		<div style="width:100%;height:140px;overflow:auto">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>구매번호</th>
						<th>주문내역</th>
						<th>주문일자</th>
						<th>확정일자</th>
						<th>적립 포인트</th>
					</tr>
				</thead>
				<tbody >
					<c:if test="${purchaseList.size() == 0}">
						<tr>
							<td colspan="5">적립 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${purchaseList.size() != 0}">
					<c:set var="listLength" value="${purchaseList.size()}"/>
						<c:forEach var="list" items="${purchaseList}" varStatus="status">
							<tr>
								<td>${listLength - status.count + 1}</td>
								<td><a href="#">상품이름</a></td>
								<td>${list.orderDate}</td>
								<td>${list.confirmDate}</td>
								<td>${list.pricePoint * level.intPoint }point</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
	<div class="showUsePoint" style="float:left;width:100%;height:170px;box-shadow: 2px 2px 2px 2px;">
	<b style="line-height:20px;display:inline-block;padding:10px 0 0 10px;">사용 포인트</b>
		<div style="width:100%;height:140px;overflow:auto">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>구매번호</th>
						<th>주문내역</th>
						<th>주문일자</th>
						<th>확정일자</th>
						<th>사용 포인트</th>
					</tr>
				</thead>
				<tbody >
					<c:if test="${usePointList.size() == 0}">
						<tr>
							<td colspan="5">사용 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${usePointList.size() != 0}">
					<c:set var="listLength" value="${usePointList.size()}"/>
						<c:forEach var="list" items="${usePointList}" varStatus="status">
							<tr>
								<td>${listLength - status.count + 1}</td>
								<td><a href="#">상품이름</a></td>
								<td>${list.orderDate}</td>
								<td>${list.confirmDate}</td>
								<td>${list.usePoint}point</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>