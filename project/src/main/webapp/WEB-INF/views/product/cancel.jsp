<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>상품 취소</title>
${purchaselist}
<div class="cancelContainer" style="width:800px;margin:20px auto;">
	<form method="post" enctype="multipart/form-data">
		<div class="form-group">
		    <label for="purchaselist"><c:if test="${purchase.deposit == 'N'}">취소</c:if><c:if test="${purchase.deposit == 'Y'}">환불</c:if> 상품</label>
		    <select id="purchaselist" name="listNum">
		    	<option value="">선택</option>
		    	<c:forEach var="purchase" items="${purchaselist}">
		    		<option value="${purchase.listNum }">${purchase.mainTitle}</option>
		    	</c:forEach>
		    </select>
		</div>
		<label for="reason"><c:if test="${purchase.deposit == 'N'}">취소</c:if><c:if test="${purchase.deposit == 'Y'}">환불</c:if> 사유</label>
		<select id="reason" name="reason">
			<option value="">선택</option>
		</select>
		<div class="inform">
			<h4>주문 정보</h4>
			<c:forEach var="list" items="${purchaselist}">
				<div class="${list.listNum} display-none form-control" style="height:64px;margin-bottom:10px;">
					<img src="<%=request.getContextPath()%>/resources/img/enrollment/${list.thumbnailImage}" style="width:50px;height:50px;">
					<span>${list.mainTitle} <span style="font-size:12px;">(색상 : ${list.color}, 사이즈 : ${list.size}, 갯수 : ${list.purchase}개)</span></span>
					<input type="hidden" class="finalPrice" value="${list.finalPrice}">
				</div>
			</c:forEach>
			<input type="hidden" id="price" name="price">
			<input type="hidden" name="userId" value="${user.id}">
		</div>
		<c:if test="${purchase.deposit == 'Y'}">
			<h4>계좌 정보</h4>
			<div class="form-group">
			    <label for="bank">은행명</label>
			    <input type="text" class="form-control" id="bank" name="bank">
			</div>
			<div class="form-group">
			    <label for="name">예금주</label>
			    <input type="text" class="form-control" id="refundName" name="refundName">
			</div>
			<div class="form-group">
			    <label for="account">계좌번호</label>
			    <input type="text" class="form-control" id="account" name="account">
			</div>
			<div style="text-align:right;">
				<button type="submit" style="height:50px;display:inline-block;line-height:50px;border-top:1px solid black;border-left:1px solid black;width:150px;text-align:center;background-color:rgb(33,51,87);color:white;">환불신청</button>
			</div>
		</c:if>
		<c:if test="${purchase.deposit == 'N'}">
			<button type="submit" style="height:50px;display:inline-block;line-height:50px;border-top:1px solid black;border-left:1px solid black;width:150px;text-align:center;background-color:rgb(33,51,87);color:white;">취소신청</button>
		</c:if>
	</form>
</div>
<script>
	var reason = ['단순 변심'];
	var i;
	for(i = 0; i < reason.length; i++){
		$('#reason').append('<option value="' + reason[i] + '">' + reason[i] +'</option>');
	}
	$('#purchaselist').change(function(){
		var num = '.'+$(this).val();
		if(num != ''){
			console.log(num);
			$('.inform').children('.form-control').addClass('display-none');
			$('.inform').children(num).removeClass('display-none');
			$('#price').val($('.inform').children(num).children('.finalPrice').val());
		}
	})
</script>