<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>상품 취소</title>
<div class="cancelContainer" style="width:800px;margin:40px auto;min-height:435px;">
	<c:if test="${purchase.situation == '상품 준비중'}">
	<h1 style="margin-bottom:20px;">
		<c:if test="${purchase.deposit == 'N'}">취소</c:if><c:if test="${purchase.deposit == 'Y'}">환불</c:if>
	하기</h1>
	<form method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${purchase.num}">
		<input type="hidden" name="stat" value="<c:if test="${purchase.deposit == 'N'}">취소</c:if><c:if test="${purchase.deposit == 'Y'}">환불 대기</c:if>">
		<div class="form-group">
		    <label for="purchaselist"><c:if test="${purchase.deposit == 'N'}">취소</c:if><c:if test="${purchase.deposit == 'Y'}">환불</c:if>
		     상품</label>
		    <select id="purchaselist" name="listNum">
		    	<option value="">선택</option>
		    	<c:forEach var="purchase" items="${purchaselist}">
		    		<option value="${purchase.listNum }">${purchase.mainTitle}</option>
		    	</c:forEach>
		    </select>
		</div>
		<label for="reason"><c:if test="${purchase.deposit == 'N'}">취소</c:if><c:if test="${purchase.deposit == 'Y'}">환불</c:if>
		 사유</label>
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
		<c:if test="${purchase.deposit == 'Y' && purchase.payment == 'account'}">
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
		</c:if>
		<div style="text-align:center;">
			<button class="return" type="submit" style="height:50px;display:inline-block;line-height:50px;border-top:1px solid black;border-left:1px solid black;width:150px;text-align:center;background-color:rgb(33,51,87);color:white;">
			<c:if test="${purchase.deposit == 'N'}">취소</c:if><c:if test="${purchase.deposit == 'Y'}">환불</c:if>
			신청</button>
		</div>
	</form>
	<script>
		var reason = ['단순 변심'];
	</script>
	</c:if>
	
	<c:if test="${purchase.situation != '상품 준비중'}">
	<h1 style="margin-bottom:20px;">반품/교환 하기</h1>
	<form method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${purchase.num}">
		<input type="hidden" name="stat">
		<div class="form-group">
		    <label for="purchaselist">반품/교환 상품</label>
		    <select id="purchaselist" name="listNum">
		    	<option value="">선택</option>
		    	<c:forEach var="purchase" items="${purchaselist}">
		    		<option value="${purchase.listNum }">${purchase.mainTitle}</option>
		    	</c:forEach>
		    </select>
		</div>
		<label for="reason">반품/교환 사유</label>
		<select id="reason" name="reason">
			<option value="">선택</option>
		</select>
		<span style="font-size:12px;opacity:0.7;">※상품문제가 아닌 경우 택배비가 발생합니다.</span>
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
		<c:if test="${purchase.deposit == 'Y' && purchase.payment == 'account'}">
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
		</c:if>
		<div style="text-align:center;">
			<button class="return" type="button" style="height:50px;display:inline-block;line-height:50px;border-top:1px solid black;border-left:1px solid black;width:150px;text-align:center;background-color:rgb(33,51,87);color:white;">반품 신청</button>
			<button class="change" type="button" style="height:50px;display:inline-block;line-height:50px;border-top:1px solid black;border-left:1px solid black;width:150px;text-align:center;background-color:rgb(33,51,87);color:white;margin-left:20px;">교환 신청</button>
			<button type="submit" class="sub" hidden=""></button>
			<input type="hidden" name="type" class="type">
		</div>
	</form>
	<script>
		var reason = ['단순 변심','오염','변질'];
		$('.return').click(function(){
			$('.type').val('반품');
			$('input[name=stat]').val('환불 대기');
			$('.sub').click();
		})
		$('.change').click(function(){
			$('.type').val('교환');
			$('input[name=stat]').val('교환');
			$('.sub').click();
		})
	</script>
	</c:if>
</div>
<script>
	
	var i;
	for(i = 0; i < reason.length; i++){
		$('#reason').append('<option value="' + reason[i] + '">' + reason[i] +'</option>');
	}
	$('#purchaselist').change(function(){
		var num = '.'+$(this).val();
		if(num != ''){
			$('.inform').children('.form-control').addClass('display-none');
			$('.inform').children(num).removeClass('display-none');
			$('#price').val($('.inform').children(num).children('.finalPrice').val());
		}
	})
	
</script>