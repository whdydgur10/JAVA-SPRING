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
	
	
	
