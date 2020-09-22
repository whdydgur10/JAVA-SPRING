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
	<h4 style="float:left;">계좌이체 관리</h4>
	<table class="table table-hover" style="text-align:center">
		<thead>
			<tr>
				<th>구매번호</th>
				<th>구매고객</th>
				<th>주문일자</th>
				<th>입금여부</th>
				<th>입금일자</th>
				<th>결제금액</th>
			</tr>
		</thead>
		<tbody class="ll">
			<c:forEach var="list" items="${account}">
				<tr>
					<td class="num">${list.num}</td>
					<td>${list.userId}</td>
					<td>${list.orderDate}</td>
					<td>
						<c:if test="${list.deposit == 'N'}">
							<select class="deposit" style="width:100px;">
								<option selected>입금 대기</option>
								<option value="Y">입금 완료</option>
							</select>
						</c:if>
						<c:if test="${list.deposit == 'Y'}">입금 완료</c:if>
					</td>
					<td><c:if test="${list.deposit == 'Y'}">${list.depositDate}</c:if></td>
					<td>${list.stringPrice}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${rootPage.rootCri.page != 1}">
			<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/root/product/account?page=${rootPage.rootCri.page - 1}">이전</a></li>
		</c:if>
	  	<c:forEach var="index" begin="${rootPage.startPage}" end="${rootPage.endPage}">
	  		<li class="page-item <c:if test="${rootPage.rootCri.page == index}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/root/product/account?page=${index}">${index}</a></li>
	  	</c:forEach>
	  	<c:if test="${rootPage.endPage != rootPage.rootCri.page}">
	  		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/root/product/account?page=${rootPage.rootCri.page + 1}">다음</a></li>
	  	</c:if>
	</ul>
</div>
<script>
	$('.deposit').change(function(){
		list = {"num":$(this).parents('tr').find('.num').text(), "deposit":$(this).val()};
		if($(this).val() == 'Y')
			$.ajax({
				async:true,
				type:'POST',
				data:JSON.stringify(list),
				url:"<%=request.getContextPath()%>/updateDeposit",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
				    alert('입금처리되었습니다.');
				    location.reload();
			    }
			});
	});
</script>