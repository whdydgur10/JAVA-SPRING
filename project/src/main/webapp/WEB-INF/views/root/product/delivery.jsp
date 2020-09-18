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
		<h4 style="float:left;">배송현황</h4>
		<form method="get" style="float:right;">
			<input type="text" class="search" value="${rri.search}" name="search" style="width:250px;">
			<button>송장검색</button>
		</form>
	</div>
	<table class="table table-hover" style="text-align:center">
		<thead>
			<tr>
				<th>구매번호</th>
				<th>구매고객</th>
				<th>주문일자</th>
				<th>입금여부</th>
				<th>입금일자</th>
				<th>배송상황</th>
				<th>송장번호</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody class="ll">
			<c:forEach var="list" items="${purchaselist}">
				<tr>
					<td class="num">${list.num}</td>
					<td>${list.userId}</td>
					<td>${list.orderDate}</td>
					<td>${list.deposit}</td>
					<td><c:if test="${list.deposit == 'Y'}">${list.depositDate}</c:if></td>
					<td>
						<c:if test="${list.isConfirm == 'N'.charAt(0)}">
						<select class="situation">
							<option <c:if test="${list.situation == '상품 준비중'}">selected</c:if>>상품 준비중</option>
							<option <c:if test="${list.situation == '상품 배송중'}">selected</c:if>>상품 배송중</option>
							<option <c:if test="${list.situation == '상품 도착'}">selected</c:if>>상품 도착</option>
						</select>
						</c:if>
						<c:if test="${list.isConfirm == 'Y'.charAt(0)}">
							${list.situation}
						</c:if>
					</td>
					<td>
						<c:if test="${list.situation != '상품 배송중'}">${list.invoice}<input type="hidden" class="noInvoice" value="${list.invoice}" style="text-align:center;"></c:if>
						<c:if test="${list.situation == '상품 배송중'}"><input type="text" class="invoice" value="${list.invoice}" style="text-align:center;"></c:if>
					</td>
					<td>${list.change}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${RootPage.rootCri.page != 1}">
			<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/root/product/delivery?page=${RootPage.rootCri.page - 1}">이전</a></li>
		</c:if>
	  	<c:forEach var="index" begin="${RootPage.startPage}" end="${RootPage.endPage}">
	  		<li class="page-item <c:if test="${RootPage.rootCri.page == index}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/root/product/delivery?page=${index}">${index}</a></li>
	  	</c:forEach>
	  	<c:if test="${RootPage.endPage != RootPage.rootCri.page}">
	  		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/root/product/delivery?page=${RootPage.rootCri.page + 1}">다음</a></li>
	  	</c:if>
	</ul>
</div>
<script>
	$('.situation').change(function(){
		var invoice = $(this).parents('tr').find('.noInvoice');
		if($(this).val() == '상품 배송중'){
			if(invoice.val() == ''){
				alert('송장번호를 입력해주세요.');
				$(invoice).attr('type','text');
				$(invoice).focus();
			}else{
				list = {"num":$(this).parents('tr').find('.num').text(), "situation":"상품 배송중"};
				$.ajax({
					async:true,
					type:'POST',
					data:JSON.stringify(list),
					url:"<%=request.getContextPath()%>/updateSituation",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					success : function(data){
					    alert('상품 배송중으로 변경되었습니다.');
					    location.reload();
				    }
				});
			}
		}else if($(this).val() == '상품 준비중'){
			list = {"num":$(this).parents('tr').find('.num').text(), "situation":"상품 준비중"};
			$.ajax({
				async:true,
				type:'POST',
				data:JSON.stringify(list),
				url:"<%=request.getContextPath()%>/updateSituation",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
				    alert('상품 준비중으로 변경되었습니다.');
				    location.reload();
			    }
			});
		}else if($(this).val() == '상품 도착'){
			list = {"num":$(this).parents('tr').find('.num').text(), "situation":"상품 도착"};
			$.ajax({
				async:true,
				type:'POST',
				data:JSON.stringify(list),
				url:"<%=request.getContextPath()%>/updateSituation",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
				    alert('상품 도착으로 변경되었습니다.');
				    location.reload();
			    }
			});
		}
	})
	$('.noInvoice').change(function(){
		if($(this).val() != ''){
			list = {"num":$(this).parents('tr').find('.num').text(), "situation":"상품 배송중", "invoice":$(this).val()};
			$.ajax({
				async:true,
				type:'POST',
				data:JSON.stringify(list),
				url:"<%=request.getContextPath()%>/insertInvoice",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
				    alert('송장번호가 등록되었습니다.');
				    location.reload();
			    }
			});
		}else
			location.reload();
		return false;
	})
	$('.invoice').change(function(){
		if($(this).val() != ''){
			list = {"num":$(this).parents('tr').find('.num').text(), "invoice":$(this).val()};
			$.ajax({
				async:true,
				type:'POST',
				data:JSON.stringify(list),
				url:"<%=request.getContextPath()%>/updateInvoice",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
				    alert('송장번호가 변경되었습니다.');
				    location.reload();
			    }
			});
		}
	})
</script>