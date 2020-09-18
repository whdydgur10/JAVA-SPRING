<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>내 정보</title>
<div class="purchase">
	<h4>주문내역</h4>
	<hr>
	<div style="width:100%;height:500px;box-shadow: 2px 2px 2px 2px;margin-top:20px;">
		<div style="width:100%;height:500px;overflow:auto;">
			<table class="table table-hover" style="text-align:center;">
				<thead>
					<tr>
						<th style="width:88px;">구매번호</th>
						<th style="width:200px;">구매내역</th>
						<th style="width:110px;">구매금액</th>
						<th style="width:110px;">주문날짜</th>
						<th style="width:88px;">결제여부</th>
						<th style="width:120px;">배송상태</th>
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
									<c:if test="${list.deposit == 'N'}"><a href="<%=request.getContextPath()%>/product/order?num=${list.num}&mainCategory=${user.gender}" style="overflow:hidden;text-overflow: ellipsis;white-space: nowrap;width:150px;display:inline-block;">${list.mainTitle }</a></c:if>
									<c:if test="${list.deposit == 'Y'}"><span style="overflow:hidden;text-overflow: ellipsis;white-space: nowrap;width:150px;display:inline-block;">${list.mainTitle }</span></c:if>
								</td>
								<td>${list.stringPrice}</td>
								<td>${list.orderDate}</td>
								<td>${list.deposit}</td>
								<td style="position:relative;" class="invoice">${list.situation}<c:if test="${list.change == '교환건'}"><br><span style="font-size:12px;opacity:0.7;">(교환)</span></c:if>
									<c:if test="${list.isConfirm == 'N'.charAt(0) && list.situation == '상품 배송중'}"><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking?paramInvcNo=${list.invoice}" class="linkCJ" style="position:absolute;display:none;top:-10px;left:10px;border:1px solid black;background-color:white;z-index:1;">송장번호 <span>${list.invoice}</span></a></c:if>
								</td>
								<td><c:if test="${list.isConfirm == 'Y'.charAt(0)}"><a href="<%=request.getContextPath()%>/review/register?mainCategory=${user.gender}&purchaseNum=${list.num}">후기작성</a></c:if>
									<c:if test="${list.isConfirm == 'N'.charAt(0) && list.situation == '상품 도착'}"><a href="#" type="button" class="confirm">확정</a><br><input type="hidden" value="${list.num}" class="num"></c:if>
									<c:if test="${list.isConfirm == 'N'.charAt(0) && list.situation != '상품 준비중'}"><a href="<%=request.getContextPath()%>/product/cancel?mainCategory=${user.gender}&purchaseNum=${list.num}">반품/교환</a></c:if>
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
		※배송 상태 중 상품 배송중에 마우스를 대면 택배조회 링크가 있습니다.<br>
		※비고란은 주문 상품에 대한 가능한 서비스 내용입니다.<br>
		※상품 도착일로부터 7일 후 자동확정 처리됩니다.<br>
		※확정후 포인트 적립과 후기작성이 가능하며 환불이 불가능합니다.<br>
	</div>
</div>
<script>
	
	$('.invoice').hover(function(){
		$(this).children('.linkCJ').css('display','inline-block');
	},function(){
		$(this).children('.linkCJ').css('display','none');
	});
	$('.confirm').click(function(){
		var num = $(this).next().next().val();
		$.ajax({
			async:true,
			type:'POST',
			data:num,
			url:"<%=request.getContextPath()%>/updateConfirm",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				location.reload();
		    }
		});
		return false;
	})
</script>