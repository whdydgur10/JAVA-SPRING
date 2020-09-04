<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>상품구매</title>
<style>
	th{
		background-color: rgb(33,51,87) !important;
    	color: white !important;
	}
	td{
		vertical-align: baseline !important;
	}
	.orderConteiner:after {
		clear: both;
		content: '';
		display: block;
	}
	.left{
		display:inline-block;
		width:150px;
		text-align:left;
		opacity: 0.7;
	}
	.right{
		display:inline-block;
		width:150px;
		text-align:right;
	}
</style>
<div class="orderConteiner" style="width:1000px;margin:20px auto;height:800px;">
	<h3>주문하기</h3><br>
	<input type="hidden" class="purchaseNum" value="${purchase.num}">
	<h4>주문 상품 내역</h4>
	<div style="width:100%;box-shadow: 2px 2px 2px 2px;margin-top:20px;">
		<div style="width:100%;">
			<table class="table" style="text-align:center;">
				<thead>
					<tr>
						<th colspan="2" style="width:620px;">상품정보</th>
						<th style="width:130px;">상품가격</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="list" items="${purchaselist}" varStatus="status">
					<tr>
						<td colspan="2" style="width:620px;text-align: left;">
							<span style="height:50px;display:inline-block;">
								<img src="<%=request.getContextPath()%>/resources/img/${list.thumbnailImage}" style="width:50px;height:50px;">
								<span>${list.mainTitle} <span style="font-size:12px;">(색상 : ${list.color}, 사이즈 : ${list.size}, 갯수 : ${list.purchase}개)</span></span><br>
							</span>
							<input type="hidden" class="purchase" value="${list.purchase}">
							<input type="hidden" class="optionCode" value="${list.optionCode}">
							<input type="hidden" class="enrollNum" value="${list.enrollNum}">
							<input type="hidden" class="finalPrice" value="${list.finalPrice}">
						</td>
						<td style="width:130px;">${list.stringFinalPrice}원</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div style="float:left;width:600px;position: relative;">
		<h4>쿠폰</h4>
		<div style="width:450px;display:inline-block;">
			<span class="isUseCoupon">보유</span> 쿠폰 : 
			<span class="couponCount"></span>
			<hr>
		</div>
		<button class="useCoupon" type="button" style="position: absolute;right:20px;background-color: rgb(33,51,87);color: white;height:40px;">쿠폰 사용하기</button>
		<h4>적립금</h4>
		<div style="width:450px;display:inline-block;">
			<span class="isUseCoupon">보유</span> 적립금 : <span class="userPoint">${user.point}</span>
			<input type="text" style="width:300px;margin-left:20px;text-align:right;" class="usePoint">
			<hr>
		</div>
		<button class="userAll" type="button" style="position: absolute;right:50px;background-color: rgb(33,51,87);color: white;height:40px;">모두 사용</button>
	</div>
	<div style="float:right;width:300px;">
		<h4>결제금액</h4>
		<span class="left">상품 금액</span><span class="productPrice right"></span>
		<span class="left">쿠폰 금액</span><span class="couponPrice right">0원</span>
		<span class="left">적립금 금액</span><span class="pointPrice right">0원</span>
		<span class="left">배송비 금액</span><span class="deliveryPrice right"></span>
		<hr>
		<span class="left" style="color:red;font-size:20px;opacity:1;">최종 결제 금액</span><span id="finalPrice" class="right"></span>
		<span class="left" style="color:blue;opacity:1;">예상 적립금</span><span id="givePoint" class="right"></span>
	</div>
</div>
<script>
	var i;
	var finalPrice = 0;
	var index;
	var purchaseNum = $('.purchaseNum').val();
	var product;
	var coupon = $('.couponPrice').text();
	var point = $('.pointPrice').text();
	var delibery;
	var finalPrice;
	var usePoint;
	var pointPer;
	$.ajax({
		async:false,
		type:'POST',
		data:purchaseNum,
		url:"<%=request.getContextPath()%>/purchasePrice",
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(data){
			$('.productPrice').text(data['price'] + '원');
			product = $('.productPrice').text();
	    }
	});
	$.ajax({
		async:false,
		type:'POST',
		data:purchaseNum,
		url:"<%=request.getContextPath()%>/deliveryPrice",
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(data){
			$('.deliveryPrice').text(data['price'] + '원');
			delibery = $('.deliveryPrice').text();
			$('#finalPrice').text(calc(product, coupon, point, delibery)+ '원');
	    }
	});
	$.ajax({
		async:true,
		type:'POST',
		url:"<%=request.getContextPath()%>/pointPercent",
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(data){
			pointPer = data['point'];
			$('#givePoint').text(toStr(((toInt($('#finalPrice').text())* pointPer).toFixed()))+ '원');
		}	
	});
	$.ajax({
		async:true,
		type:'POST',
		url:"<%=request.getContextPath()%>/couponCount",
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(data){
			$('.couponCount').text(data['count']);
			if(data['count'] == 0){
				$('.useCoupon').css({'opacity':'0.5','cursor':'default'});
				$('.useCoupon').click(function(){
					false;
				})
			}else
				$('.useCoupon').css({'opacity':'1','cursor':'pointer'});
	    }
	});
	$('.userAll').click(function(){
		$('.usePoint').val($('.userPoint').text());
		usePoint = $('.usePoint').val();
		$('.pointPrice').text(toStr(usePoint) + '원');
		point = $('.pointPrice').text();
		$('#finalPrice').text(calc(product, coupon, point, delibery));
	})
	$('.usePoint').change(function(){
		var userPoint = Number($('.userPoint').text());
		if($(this).val() > userPoint){
			$(this).val(userPoint);
			usePoint = $('.usePoint').val();	
		}else
			usePoint = $('.usePoint').val();
		$('.pointPrice').text(toStr(usePoint) + '원');
		point = $('.pointPrice').text();
		$('#finalPrice').text(calc(product, coupon, point, delibery));
	})
	function toStr(obj){
	    var len, num, str;  
	    obj = obj + "";  
	    num = obj.length % 3 ;
	    len = obj.length;  
	    str = obj.substring(0, num);  
	    while (num < len) {  
	        if (str != "") str += ",";  
	        str += obj.substring(num, num + 3);  
	        num += 3;  
	    }
	    return str;
	}
	function toInt(str)
	{
		str = str.substring(0, str.length-1);
		num = parseInt(str.replace(/,/g,""));
		return num; 
	}
	function calc(product, coupon, point, delibery){
		var productP, couponP, pointP, deliberyP, res;
		productP = toInt(product);
		couponP = toInt(coupon);
		pointP = toInt(point);
		deliberyP = toInt(delibery);
		finalPrice = productP - couponP - pointP + deliberyP;
		var a = (finalPrice / 100).toFixed();
		var b = (Math.pow(10,2));
		var c = Math.floor(finalPrice / 100*b)/b;
		var d = c.toFixed(0);
		$('#givePoint').text(toStr(d)+ '원');
		return toStr(finalPrice);
	}
</script>
