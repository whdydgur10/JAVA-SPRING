<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.linkBox{
		width:200px;
		height:100px;
		border:1px solid black;
		font-size:20px;
		text-align:center;
		line-height:100px;
		float:left;
	}
</style>
<title>관리자페이지</title>
<div class="linkBox">
	<a href="<%=request.getContextPath()%>/root/product/register">신상품 등록</a>
</div>
<div class="linkBox">
	<a href="<%=request.getContextPath()%>/root/product/amount">상품 재고관리</a>
</div>
<div class="linkBox">
	<a href="<%=request.getContextPath()%>/root/product/update">상품정보 재등록</a>
</div>
<div class="linkBox">
	<a href="<%=request.getContextPath()%>/root/product/enrollment">판매글 작성</a>
</div>
<form method="post">
	<input name="mainCategory" value="W">
	<input name="middleCategory" value="스커트">
	<input name="subCategory" value="미니스커트">
	<input name="subCategory" value="미디스커트">
	<input name="subCategory" value="롱스커트">
	반바지', '청바지', '슬랙스', '와이드팬츠', '면바지', '트레이닝복'
	<button>버튼</button>
</form>