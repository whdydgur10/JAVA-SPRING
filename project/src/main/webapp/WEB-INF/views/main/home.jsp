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
<div class="productContainer" style="width:1400px;height:800px;border:1px solid black;margin:20px auto;position:relative;">
	<c:forEach var="product" items="${list}">
		<a href="<%=request.getContextPath()%>/product/detail?mainCategory=${pri.mainCategory}&productCode=${product.productCode}" class="product" style="width:200px;text-align:center;margin-left:50px;">
			<img src="<%=request.getContextPath()%>/resources/img/enrollment/${product.thumbnailImage}" style="width:200px;height:200px;">
			<span>${product.mainTitle}</span><br>
			<span>${product.stringFinalPrice}원</span>
		</a>
	</c:forEach>
	<a class="goTop" style="position:absolute;bottom:20px;right:700px;display:none;"><i class="fas fa-arrow-alt-circle-up" style="font-size:60px;z-index: 1;cursor: pointer;"></i></a>
</div>
<script>
	var allHeight = $('.productContainer').height();
	$(window).scroll(function () {
		var height = $(document).scrollTop();
		log(height);
	});
	function log(str){
	    if(str > 150){
	    	$('.goTop').css('display','inline-block');
		}
	    else if(str < 240){
	    	$('.goTop').css('display','none');
		}
	}
	$('.goTop').click(function() {
	    $('html, body').animate({scrollTop : 0}, 400);
	});
</script>