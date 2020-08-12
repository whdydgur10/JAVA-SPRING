<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>내 정보</title>
<div class="all">
	<h4>내 정보</h4>
	<div class="accountBox">
		<span>안녕하세요. ${user.name}님<a href="<%=request.getContextPath()%>/information/account" class="more">계정</a></span>
	</div>
	<div class="levelBox">
		<span>레벨 ${userInform.level}<a href="<%=request.getContextPath()%>/information/level" class="more">레벨</a></span>
	</div>
	<div class="couponBox">
		<span>쿠폰 보유량 ${couponList.size()}<a href="<%=request.getContextPath()%>/information/coupon" class="more">쿠폰</a></span>
	</div>
	<div class="purchaseListBox">
		<span>주문내역  ${userInform.purchaseListNum}<a href="<%=request.getContextPath()%>/information/purchaseList" class="more">주문내역</a></span>
	</div>
	<div class="vaginalBox">
		<span>문의내역  ${userInform.vaginalNum}<a href="<%=request.getContextPath()%>/information/vaginal" class="more">문의내역</a></span>
	</div>
	<div class="shoppingBasketBox">
		<span>장바구니  ${userInform.shoppingBasketNum}<a href="<%=request.getContextPath()%>/information/shoppingBasket" class="more">장바구니</a></span>
	</div>
</div>	
