<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>상품 취소</title>
${purchaselist}
<div class="cancelContainer" style="width:1400px;margin:20px auto;">
	<form method="post" enctype="multipart/form-data">
		<div class="form-group">
		    <label for="purchaselist">환불 상품</label>
		    <select id="purchaselist">
		    	<option value="">선택</option>
		    	<c:forEach var="purchase" items="${purchaselist}">
		    		<option value="${purchase.num }">${purchase.mainTitle}</option>
		    	</c:forEach>
		    </select>
		</div>
		<label for="reason">환불 사유</label>
		<select id="purchaselist">
			<option value="">선택</option>
			<option>단순 변심</option>
		</select>
		<div>
			<h4>주문 정보</h4>
		</div>
		<c:if test="${purchase.deposit == 'Y'}">
			<h4>계좌 정보</h4>
			<div class="form-group">
			    <label for="bank">은행명</label>
			    <input type="text" class="form-control" id="bank" name="bank">
			</div>
			<div class="form-group">
			    <label for="name">예금주</label>
			    <input type="text" class="form-control" id="name" name="name">
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