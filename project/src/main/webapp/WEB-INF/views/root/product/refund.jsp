<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>상품 취소관리</title>
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
<div class="refundContainer">
	<div>
		<h4 style="float:left;">취소현황</h4>
		<form method="get" style="float:right;">
			<select name="search" style="width:100px;" id="stat">
				<option value="">선택</option>
				<option value="대기" <c:if test="${rri.search == '대기' }">selected</c:if>>대기</option>
				<option value="완료" <c:if test="${rri.search == '완료' }">selected</c:if>>완료</option>
			</select>
			<button class="stat" hidden=""></button>
		</form>
	</div>
	<table class="table table-hover" style="text-align:center">
		<thead>
			<tr>
				<th></th>
				<th>아이디</th>
				<th>처리상황</th>
				<th>사유</th>
				<th>금액</th>
				<th>은행명</th>
				<th>예금주</th>
				<th>계좌번호</th>
				<th>입금일자</th>
				<th>환불신청일자</th>
				<th>처리일자</th>
			</tr>
		</thead>
		<tbody class="ll">
			<c:forEach var="list" items="${refundlist}">
				<tr>
					<td><input type="hidden" value="${list.refundNum}" class="refundNum"></td>
					<td>${list.userId}</td>
					<td>
						<c:if test="${rri.search == ''}">
							<c:set var = "stat" value = "${list.stat}"/>
							<c:if test = "${fn:contains(stat, '완료')}">
								${stat}
							</c:if>
							<c:if test = "${!fn:contains(stat, '완료')}">
								<select class="stat">
									<option>${stat}</option>
									<option>${stat} 완료</option>
								</select>
							</c:if>
						</c:if>
						<c:if test="${rri.search == '대기' }">
							<select class="stat">
								<option>${list.stat}</option>
								<option>${list.stat} 완료</option>
							</select>
						</c:if>
						<c:if test="${rri.search == '완료' }">
							${list.stat}
						</c:if>
					</td>
					<td>${list.reason}</td>
					<td>${list.stringPrice}</td>
					<td>${list.bankName}</td>
					<td>${list.refundName }</td>
					<td>${list.account}</td>
					<td>${list.depositDate}</td>
					<td>${list.refundDate}</td>
					<td>${list.completeDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${refundlist.size() != 0}">
		<ul class="pagination justify-content-center">
			<c:if test="${RootPage.rootCri.page != 1}">
				<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/root/product/refund?page=${RootPage.rootCri.page - 1}">이전</a></li>
			</c:if>
		  	<c:forEach var="index" begin="${RootPage.startPage}" end="${RootPage.endPage}">
		  		<li class="page-item <c:if test="${RootPage.rootCri.page == index}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/root/product/refund?page=${index}">${index}</a></li>
		  	</c:forEach>
		  	<c:if test="${RootPage.endPage != RootPage.rootCri.page}">
		  		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/root/product/refund?page=${RootPage.rootCri.page + 1}">다음</a></li>
		  	</c:if>
		</ul>
	</c:if>
</div>
<script>
	$('#stat').change(function(){
		$('.stat').click();
	})
	$('.stat').change(function(){
		list = {"refundNum":$(this).parents('tr').find('.refundNum').val(), "stat":$(this).val()};
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(list),
			url:"<%=request.getContextPath()%>/updateRefund",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
			    location.reload();
		    }
		});
	})
</script>