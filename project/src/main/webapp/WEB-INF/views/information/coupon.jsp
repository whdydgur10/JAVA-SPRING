<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>내 정보</title>
<style>
	th:nth-of-type(1), th:nth-of-type(3) {
		width:200px !important;
	}
</style>
<div class="coupon">
	<h4>쿠폰</h4>
	<hr>
	<form method="POST">
		<input type="text" placeholder="쿠폰번호를 입력하세요." name="code" class="code" style="width:300px;"> 
		<button type="button" style="display:inline-block;background-color:rgb(33,51,87);color:white;margin-left:10px;">쿠폰 등록하기</button>
		<button type="submit" class="btn-coupon" hidden="hidden"></button>
	</form>
	
	<div class="getCoupon" style="width:100%;height:240px;box-shadow: 2px 2px 2px 2px;margin-top:20px;">
	<b>사용 가능한 쿠폰</b>
		<div style="width:100%;height:210px;overflow:auto">
			<table class="table table-hover" style="text-align:center">
				<thead>
					<tr>
						<th>쿠폰번호</th>
						<th>쿠폰이름</th>
						<th>할인금액</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${couponList.size() == 0}">
					<tr>
						<td colspan="3">쿠폰이.. 텅텅..</td>
					</tr>
				</c:if>
				<c:if test="${couponList.size() != 0}">
					<c:forEach var="list" items="${couponList}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${list.name}</td>
							<td>${list.stringDiscount}</td>
						</tr>
					</c:forEach>
				</c:if>
				</tbody>
			</table>
		</div>	
	</div>
	<div class="useCoupon" style="width:100%;height:240px;box-shadow: 2px 2px 2px 2px;margin-top:20px;">
	<b>사용한 쿠폰</b>
		<div style="width:100%;height:210px;overflow:auto">
			<table class="table" style="text-align:center;">
				<thead>
					<tr>
						<th>쿠폰번호</th>
						<th>쿠폰이름</th>
						<th>구매내역</th>
					</tr>
				</thead>
				<tbody >
					<c:if test="${useCouponList.size() == 0}">
						<tr>
							<td colspan="3">외아직사용않함</td>
						</tr>
					</c:if>
					<c:if test="${useCouponList.size() != 0}">
						<c:forEach var="list" items="${useCouponList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${list.name}</td>
								<td><a href="#">상품이름</a></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(function(){
		$('button[type=button]').click(function(){
			code = $('.code').val();
			$.ajax({
				async:true,
				type:'POST',
				data:code,
				url:"<%=request.getContextPath()%>/codeCheck",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
				    if(data['codeCheck'] == 2) {
					    alert('쿠폰등록이 되었습니다.');
					    $('button[type=submit]').click();
				    }
				    else if(data['codeCheck'] == 0){
				    	alert('존재하지 않는 쿠폰번호입니다.');
				    }
				    else if(data['codeCheck'] == 1){
				    	alert('이미 등록된 쿠폰번호입니다.');
				    }
			    }
			});
		})
	})
</script>