<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
<script src="<%=request.getContextPath()%>/resources/js/menu.js"></script>
<div style="background-color:rgb(33,51,87);box-shadow: 5px 0px 2px 2px;height:50px;">
		<div class="menuContainer" style="height:100%;width:1400px;margin:0 auto;">
			<div class="btn-gender" style="float:left;font-size: 25px;line-height:50px;">
				<a href="#" class="M" style="" data-target=".MMenu">남성</a>
			    <a href="#" class="W" style="" data-target=".WMenu">여성</a>
				<a href="#" class="MW select" style="" data-target=".MWMenu">공용</a>
			</div>
			<div class="navContainer">
				<nav class="MMenu display-none" style="float:left;font-size: 35px;line-height:50px;margin-left:120px;margin-right:120px;">
					<a href="#" data-target=".subMMenu>.outer">아우터</a>
					<a href="#" data-target=".subMMenu>.top">상의</a>
					<a href="#" data-target=".subMMenu>.bottom">하의</a>
					<a href="#" data-target=".subMMenu>.shose">신발</a>
					<a href="#" data-target=".subMMenu>.etc">etc</a>
				</nav>
				<nav class="WMenu display-none" style="float:left;font-size: 35px;line-height:50px;margin-left:60px;margin-right:60px;">
					<a href="#" data-target=".subWMenu>.outer">아우터</a>
					<a href="#" data-target=".subWMenu>.onepiece">원피스</a>
					<a href="#" data-target=".subWMenu>.top">상의</a>
					<a href="#" data-target=".subWMenu>.bottom">하의</a>
					<a href="#" data-target=".subWMenu>.skirt">스커트</a>
					<a href="#" data-target=".subWMenu>.shose">신발</a>
					<a href="#" data-target=".subWMenu>.etc">etc</a>
				</nav>
				<nav class="MWMenu" style="float:left;font-size: 35px;line-height:50px;margin-left:120px;margin-right:120px;">
					<a href="#" data-target=".subMWMenu>.outer">아우터</a>
					<a href="#" data-target=".subMWMenu>.top">상의</a>
					<a href="#" data-target=".subMWMenu>.bottom">하의</a>
					<a href="#" data-target=".subMWMenu>.shose">신발</a>
					<a href="#" data-target=".subMWMenu>.etc">etc</a>
				</nav>
			</div>
			<form method="get">
				<div class="searchBox" style="float:right;margin-top:10px;">
					<input type="text" name="search" style="outline:none;width:250px;" autocomplete="off">
					<button type="submit" style="outline: none;">검색</button>
				</div>
			</form>
		</div>
		<div class="subContainer subMMenu" style="width:800px;margin:0 auto;">
			<div class="outer display-none subMenu" style="width:120px;text-align:center;margin-left:25px;">
				<a href="#">코트</a>
				<a href="#">점퍼</a>
				<a href="#">자켓</a>
				<a href="#">패딩</a>
				<a href="#">다운</a>
				<a href="#">무스탕</a>
				<a href="#">블루종</a>
				<a href="#">항공점퍼</a>
				<a href="#">가디건</a>
			</div>
			<div class="top display-none subMenu" style="width:130px;text-align:center;margin-left:160px;">
				<a href="#">반팔티</a>
				<a href="#">긴팔티</a>
				<a href="#">셔츠/남방</a>
				<a href="#">맨투맨</a>
				<a href="#">후드티/아노락</a>
				<a href="#">후드집업</a>
				<a href="#">니트/스웨터</a>
				<a href="#">민소매/나시</a>
				<a href="#">트레이닝복</a>
			</div>
			<div class="bottom display-none subMenu" style="width:120px;text-align:center;margin-left:285px;">
				<a href="#">반바지</a>
				<a href="#">청바지</a>
				<a href="#">슬랙스</a>
				<a href="#">면바지</a>
				<a href="#">트레이닝복</a>
			</div>
			<div class="shose display-none subMenu" style="width:120px;text-align:center;margin-left:405px;">
				<a href="#">슬립온</a>
				<a href="#">스니커즈</a>
				<a href="#">운동화</a>
				<a href="#">워커</a>
				<a href="#">부츠</a>
				<a href="#">로퍼</a>
				<a href="#">보트화</a>
				<a href="#">구두</a>
				<a href="#">슬리퍼</a>
				<a href="#">샌들</a>
			</div>
			<div class="etc display-none subMenu" style="width:110px;text-align:center;margin-left:515px;">
				<a href="#">가방</a>
				<a href="#">시계</a>
				<a href="#">지갑</a>
				<a href="#">벨트</a>
				<a href="#">장갑</a>
				<a href="#">양말</a>
				<a href="#">모자</a>
				<a href="#">목도리</a>
				<a href="#">안경</a>
				<a href="#">머플러</a>
			</div>
		</div>
		<div class="subContainer subWMenu" style="width:900px;margin:0 auto;">
			<div class="outer display-none subMenu" style="width:120px;text-align:center;margin-left:5px;">
				<a href="#">코트</a>
				<a href="#">점퍼</a>
				<a href="#">자켓</a>
				<a href="#">패딩</a>
				<a href="#">가디건</a>
			</div>
			<div class="onepiece display-none subMenu" style="width:130px;text-align:center;margin-left:135px;">
				<a href="#">미니원피스</a>
				<a href="#">롱원피스</a>
			</div>
			<div class="top display-none subMenu" style="width:130px;text-align:center;margin-left:250px;">
				<a href="#">반팔티</a>
				<a href="#">긴팔티</a>
				<a href="#">블라우스</a>
				<a href="#">셔츠/남방</a>
				<a href="#">맨투맨</a>
				<a href="#">후드티/아노락</a>
				<a href="#">후드집업</a>
				<a href="#">니트/스웨터</a>
				<a href="#">민소매/나시</a>
				<a href="#">트레이닝복</a>
			</div>
			<div class="bottom display-none subMenu" style="width:120px;text-align:center;margin-left:360px;">
				<a href="#">반바지</a>
				<a href="#">청바지</a>
				<a href="#">슬랙스</a>
				<a href="#">와이드팬츠</a>
				<a href="#">면바지</a>
				<a href="#">트레이닝복</a>
			</div>
			<div class="skirt display-none subMenu" style="width:120px;text-align:center;margin-left:475px;">
				<a href="#">미니스커트</a>
				<a href="#">미디스커트</a>
				<a href="#">롱스커트</a>
			</div>
			<div class="shose display-none subMenu" style="width:120px;text-align:center;margin-left:590px;">
				<a href="#">단화</a>
				<a href="#">스니커즈</a>
				<a href="#">부츠</a>
				<a href="#">힐</a>
				<a href="#">구두</a>
				<a href="#">샌들</a>
			</div>
			<div class="etc display-none subMenu" style="width:110px;text-align:center;margin-left:690px;">
				<a href="#">가방</a>
				<a href="#">시계</a>
				<a href="#">지갑</a>
				<a href="#">벨트</a>
				<a href="#">장갑</a>
				<a href="#">양말</a>
				<a href="#">모자</a>
				<a href="#">목도리</a>
				<a href="#">안경</a>
				<a href="#">머플러</a>
				<a href="#">귀걸이</a>
				<a href="#">목걸이</a>
				<a href="#">헤어</a>
				<a href="#">반지</a>
				<a href="#">초커</a>
				<a href="#">팔찌</a>
				<a href="#">발찌</a>
				<a href="#">파우치</a>
				<a href="#">클러치</a>
				<a href="#">스타킹</a>
				<a href="#">타이즈</a>
			</div>
		</div>
		<div class="subContainer subMWMenu" style="width:800px;margin:0 auto;">
			<div class="outer display-none subMenu" style="width:120px;text-align:center;margin-left:25px;">
				<a href="#">코트</a>
				<a href="#">점퍼</a>
				<a href="#">자켓</a>
				<a href="#">패딩</a>
				<a href="#">가디건</a>
			</div>
			<div class="top display-none subMenu" style="width:130px;text-align:center;margin-left:160px;">
				<a href="#">반팔티</a>
				<a href="#">긴팔티</a>
				<a href="#">셔츠/남방</a>
				<a href="#">맨투맨</a>
				<a href="#">후드티/아노락</a>
				<a href="#">후드집업</a>
				<a href="#">니트/스웨터</a>
				<a href="#">민소매/나시</a>
				<a href="#">트레이닝복</a>
			</div>
			<div class="bottom display-none subMenu" style="width:120px;text-align:center;margin-left:285px;">
				<a href="#">반바지</a>
				<a href="#">청바지</a>
				<a href="#">슬랙스</a>
				<a href="#">면바지</a>
				<a href="#">트레이닝복</a>
			</div>
			<div class="shose display-none subMenu" style="width:120px;text-align:center;margin-left:405px;">
				<a href="#">스니커즈</a>
				<a href="#">부츠</a>
				<a href="#">구두</a>
				<a href="#">샌들</a>
			</div>
			<div class="etc display-none subMenu" style="width:110px;text-align:center;margin-left:515px;">
				<a href="#">가방</a>
				<a href="#">시계</a>
				<a href="#">지갑</a>
				<a href="#">벨트</a>
				<a href="#">장갑</a>
				<a href="#">양말</a>
				<a href="#">모자</a>
				<a href="#">목도리</a>
				<a href="#">안경</a>
				<a href="#">머플러</a>
			</div>
		</div>
	</div>