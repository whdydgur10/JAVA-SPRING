<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>내 정보</title>
<style>
	li{
		margin-top:20px;
	}
	li>a, .more:hover{
		color:white;
	}
	.more{
		border: 1px solid white;
		background-color: rgb(33,51,87);
		color: white;
		margin-left:10px;
		padding: 2px;
		border-radius: 10px;
	}
	.select, li>a:hover {
		color: rgb(57,219,53);
		text-decoration: underline;
	}
	.all>div{
		box-shadow: 5px 2px 2px 2px;
		height:60px;
		line-height:60px;
	}
</style>
<div class="middleContainer" style="width:1400px;border:1px solid black;height:700px;margin:20px auto;">
	<div class="leftContainer" style="width:200px;height:100%;float:left;background-color:rgb(33,51,87);">
		<ul style="list-style:none;text-align:center;margin:0;padding:0;">
			<li><a href="#" class="information select" data-target=".all">내 정보</a></li>
			<li><a href="#" class="information" data-target=".account">계정</a></li>
			<li><a href="#" class="information" data-target=".level">레벨</a></li>
			<li><a href="#" class="information" data-target=".coupon">쿠폰</a></li>
			<li><a href="#" class="information" data-target=".point">적립금</a></li>
			<li><a href="#" class="information" data-target=".purchaseList">주문내역</a></li>
			<li><a href="#" class="information" data-target=".vaginal">문의내역</a></li>
			<li><a href="#" class="information" data-target=".shoppingBasket">장바구니</a></li>
			<li><a href="#" class="information" data-target=".review">후기</a></li>
		</ul>
	</div>
	<div class="centerContainer" style="width:900px;height:100%;border-right:1px solid black;border-left:1px solid black;box-sizing:border-box;float:left;padding:20px;">
		<div class="all">
			<h4>내 정보</h4>
			<div class="accountBox">
				<span>안녕하세요. ${user.name}님<a href="#" data-target=".account" class="more">계정</a></span>
			</div>
			<div class="levelBox">
				<span>레벨 ${userInform.level}<a href="#" data-target=".level" class="more">레벨</a></span>
			</div>
			<div class="couponBox">
				<span>쿠폰 보유량 ${userInform.couponNum}<a href="#" data-target=".coupon" class="more">쿠폰</a></span>
			</div>
			<div class="pointBox">
				<span>적립금  ${user.point}<a href="#" data-target=".coupon" class="more">적립금</a></span>
			</div>
			<div class="purchaseListBox">
				<span>주문내역  ${userInform.purchaseListNum}<a href="#" data-target=".purchaseList" class="more">주문내역</a></span>
			</div>
			<div class="vaginalBox">
				<span>문의내역  ${userInform.vaginalNum}<a href="#" data-target=".vaginal" class="more">문의내역</a></span>
			</div>
			<div class="shoppingBasketBox">
				<span>장바구니  ${userInform.shoppingBasketNum}<a href="#" data-target=".shoppingBasket" class="more">장바구니</a></span>
			</div>
			<div class="reviewBox">
				<span>후기  ${userInform.reviewNum}<a href="#" data-target=".review" class="more">후기</a></span>
			</div>
		</div>
		<div class="account display-none">
			<h4>계정</h4>
		</div>
		<div class="level display-none">
			<h4>레벨</h4>
		</div>
		<div class="coupon display-none">
			<h4>쿠폰</h4>
		</div>
		<div class="point display-none">
			<h4>포인트</h4>
		</div>
		<div class="purchaseList display-none">
			<h4>구매내역</h4>
		</div>
		<div class="vaginal display-none">
			<h4>문의내역</h4>
		</div>
		<div class="shoppingBasket display-none">
			<h4>장바구니</h4>
		</div>
		<div class="review display-none">
			<h4>후기</h4>
		</div>
	</div>
	<div class="rightContainer" style="width:300px;height:100%;float:left;">
	
	</div>
</div>
<script>
	$(function(){
		$('.leftContainer a').click(function(){
			var target = $(this).attr('data-target');
			$('.leftContainer').parent().find('a').removeClass('select');
			$(this).addClass('select');
			$('.centerContainer').children().addClass('display-none');
			$(target).removeClass('display-none');
		})
		$('.all a').click(function(){
			var target = $(this).attr('data-target');
			$('.leftContainer').parent().find('a').removeClass('select');
			$(this).addClass('select');
			$('.centerContainer').children().addClass('display-none');
			$(target).removeClass('display-none');
		})
	})
</script>