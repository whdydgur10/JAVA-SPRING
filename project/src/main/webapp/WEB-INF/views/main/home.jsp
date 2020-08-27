<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>삐숑빠숑뿌슝</title>
<style>
	.productContainer:after{
		clear: both;
		content: '';
		display: block;
	}
	.product{
		float:left;
	}
	.productContainer a:hover{
		text-decoration: none;
		color: black;
	}
</style>
<div class="productContainer" style="width:1400px;height:800px;border:1px solid black;margin:20px auto;">
	<c:forEach var="product" items="${list}">
		<a href="<%=request.getContextPath()%>/product/detail?mainCategory=${cri.mainCategory}&productCode=${product.productCode}" class="product" style="width:200px;text-align:center;margin-left:50px;">
			<img src="<%=request.getContextPath()%>/resources/img/${product.thumbnailImage}" style="width:200px;height:200px;">
			<span>${product.mainTitle}</span><br>
			<span>${product.finalPrice}원</span>
		</a>
	</c:forEach>
</div>