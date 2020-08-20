<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>${product.code}</title>
<style>
	.mainBox:after, .subThumnailBox:after, .allPriceBox:after{
		clear: both;
		content: '';
		display: block;
	}
	.subThumnailBox>img{
		width:100px;
		height:100px;
		float:left;
	}
	.mainBox{
		font-size: 28px;
	}
	select{
		font-size: 15px;
		width:100%;
		height:30px;
	}
	.mainBox input{
		border:none;
		display: inline-block;
	}
	form{
		font-size: 15px;
	}
	.deleteProduct{
		border:none;
		background-color:transparent;
		float:right;
	}
	.decrease, .increase{
		background-color:transparent;
		border: 1px solid black;
		padding-bottom: 5px;
		width:30px;
		height:30px;
	}
	.showPrice{
		float:right;
	}
	button[type=button]{
		outline:none;
	}
	.linkShoppingBasket, .linkPurchaseList{
		height:50px;
		display:inline-block;
		line-height:50px;
		border-top:1px solid black;
		border-left:1px solid black;
		width:150px;
		text-align:center;
		background-color:rgb(33,51,87);
		color:white;
		margin-left: 40px;
	}
	.linkPurchaseList {
		margin-left: 20px;
	}
	.allPriceBox>span{
		float:right;
	}
</style>
<div class="mainBox" style="width:1100px;margin:20px auto;">
	<h1>${enrollment.mainTitle }</h1>
	<hr>
	<hr>
	<div class="thumnailBox" style="width:600px;float:left;margin-bottom:20px;">
		<img style="width:600px;height:600px;">
		<div class="subThumnailBox" style="width:100%;">
			<img>
			<img>
			<img>
			<img>
			<img>
			<img>
		</div>
	</div>
		<div class="setProductBox" style="width:500px;float:left;padding-left:100px;">
			<div class="setProductBoxHead">
			<span>${enrollment.subTitle}</span>
			<span style="font-size:20px;">${product.code}</span>
			<input type="hidden" id="code" value="${product.code}" >
				<hr><br>
				<c:if test="${enrollment.discount == 0}"><span style="color:red;">${product.stringPrice}원</span></c:if>
				<c:if test="${enrollment.discount != 0}"><span style="color:red;">${enrollment.stringFinalPrice}원</span><span style="color:gray;text-decoration:line-through;margin-left:10px;">${product.stringPrice}원</span><span class="discount" style="font-size:15px;float:right;margin-top:10px;"></span></c:if>
				<hr>
				<span style="font-size:15px;margin-bottom:15px;display:inline-block;">옵션선택</span>
				<br>
				<select name="color" id="color">
					<option value="" selected>색상</option>
					<c:forEach var="option" items="${colorList}">
						<option value="${option.color}"<c:if test="${option.allAmount == 0}">disabled="disabled"</c:if>>${option.color}<c:if test="${option.allAmount == 0}">(품절)</c:if></option>
					</c:forEach>
				</select>
				<select name="size" id="size" disabled="disabled">
					<option value="" selected>사이즈</option>
				</select>
			<form method="post" style="margin-top:20px;">
				<div class="allPriceBox" style="margin-bottom:15px;"><span>총 상품금액 : <span class="allPrice" style="font-size:25px;color:red;">0</span></span></div>
				<button class="linkShoppingBasket" action="#" >장바구니</button><button class="linkPurchaseList" action="#">구매하기</button>
			</form>
		</div>
	</div>
	<div style="width:100%;height:500px;float:left;">
	
	</div>
</div>
<script>
	var allPurchase;
	var codeL = [];
	var colorL = [];
	var sizeL = [];
	var code = $('#code').val();
	var color;
	var size;
	var i;
	var list;
	var list2;
	var index;
	var purchase;
	$.ajax({
		async:true,
		type:'POST',
		data:code,
		url:"<%=request.getContextPath()%>/enrollment/discount",
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(data){
			$('.discount').text(data['discount'] + "% 할인");
	    }
	});
	function allPrice(){
		for(i = 0; i < $('.productBox').length; i++){
			index = $('.productBox')[i];
			allPurchase = allPurchase + parseInt($(index).find('.purchase').val());	
		}
		list = {"productCode":code, "purchase":allPurchase};
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(list),
			url:"<%=request.getContextPath()%>/enrollment/finalPrice",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				$('.allPrice').text(data['price']+"원");
		    }
		});
	}
	
	$('#size').change(function(){
		color = $('#color').val();
		size = $('#size').val();
		var str = code + " - " + color + " - " + size;
		var cnt = 0;
		for(i = 0; i < codeL.length; i++){
			if(codeL[i] == code && colorL[i] == color && sizeL[i] == size){
				cnt++;
				break;
			}
			else{
				continue;
			}
		}
		if(cnt == 1){
			alert('이미 주문목록에 있습니다.');
			$('#color').val("");
			$('#size').val("");
			$('#size').attr('disabled','disabled');
		}
		else{
			$('.allPriceBox').before('<div class="productBox"><span>' + str + '</span><input type="hidden" class="productCode" name="productCode"><input type="hidden" class="color" name="color"><input type="hidden" class="size" name="size"><button class="deleteProduct" type="button">X</button>'
					+'<div style="height:30px;margin-top:5px;"><button type="button" class="decrease">-</button><span class="showPurchase" style="margin:0 15px;">1</span><input type="hidden" class="purchase" name="purchase" value="1"><button type="button" class="increase">+</button><span class="showPrice">${enrollment.stringFinalPrice}원</span><input type="hidden" class="price" name="price"></div><hr></div>');
			$('.productBox').last().children('productCode').val(code);
			$('.productBox').last().children('.color').val(color);
			$('.productBox').last().children('.size').val(size);
			$('#color').val("");
			$('#size').val("");
			$('#size').attr('disabled','disabled');
			codeL.push(code);
			colorL.push(color);
			sizeL.push(size);
			deleteBox($('form').children('.productBox').last().children('.deleteProduct'));
			decPurchase($('form').children('.productBox').last().find('.decrease'));
			incPurchase($('form').children('.productBox').last().find('.increase'));
			allPrice();
		}
	})
	function deleteBox(obj){
		obj.click(function(){
			color = obj.parents('.productBox').children('.color').val();
			size = obj.parents('.productBox').children('.size').val();
			for(i = 0; i < codeL.length; i++){
				if(codeL[i] == code && colorL[i] == color && sizeL[i] == size){
					codeL.splice(i, 1);
					colorL.splice(i, 1);
					sizeL.splice(i, 1);
					$(this).parent().remove();
					allPrice();
					break;
				}
			}
		})
	}
	function decPurchase(obj){
		obj.click(function(){
			purchase = parseInt($(this).parent().children('.showPurchase').text());
			if (purchase <= 1)
				return false;
			else{
				purchase = purchase - 1;
				$(this).parent().children('.showPurchase').text(purchase);
				$(this).parent().children('.purchase').val(purchase);
				list = {"productCode":code, "purchase":purchase};
				$.ajax({
					async:true,
					type:'POST',
					data:JSON.stringify(list),
					url:"<%=request.getContextPath()%>/enrollment/finalPrice",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					success : function(data){
						obj.parent().children('.showPrice').text(data['price']+"원");
						allPrice();
				    }
				});
			}
		})
	}
	function incPurchase(obj){
		obj.click(function(){
			purchase = parseInt($(this).parent().children('.showPurchase').text());
			color = obj.parents('.productBox').children('.color').val();
			size = obj.parents('.productBox').children('.size').val();
			list = {"productCode":code, "color":color, "size":size, "purchase":purchase};
			$.ajax({
				async:true,
				type:'POST',
				data:JSON.stringify(list),
				url:"<%=request.getContextPath()%>/enrollment/amount",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
					if(data['more'] == true){
						purchase = purchase + 1;
						obj.parent().children('.showPurchase').text(purchase);
						obj.parent().children('.purchase').val(purchase);
						list2 = {"productCode":code, "purchase":purchase};
						$.ajax({
							async:true,
							type:'POST',
							data:JSON.stringify(list2),
							url:"<%=request.getContextPath()%>/enrollment/finalPrice",
							dataType:"json",
							contentType:"application/json; charset=UTF-8",
							success : function(data){
								obj.parent().children('.showPrice').text(data['price']+"원");
								allPrice();
						    }
						});
					}else
						return false;
			    }
			});
		})
	}
	$('#color').change(function(){
		color = $('#color').val();
		if(color != ""){
			$('#size').removeAttr('disabled');
			list = {"productCode":code, "color":color};
			$.ajax({
				async:true,
				type:'POST',
				data:JSON.stringify(list),
				url:"<%=request.getContextPath()%>/enrollment/size",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
					$('#size').empty();
					$('#size').append('<option value="" selected>사이즈</option>');
					for(i = 0; i < data['option'].length; i++){
						$('#size').append(data['option'][i]);
					}
			    }
			});
		}else
			$('#size').attr('disabled','disbaled');
	})
</script>