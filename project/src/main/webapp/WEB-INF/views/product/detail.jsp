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
	.informationBox{
		font-size:16px;
	}
	.informationBox>div{
		width:800px;
		margin:20px auto;
	}
	textarea{
		width:100%;
		height:200px;
		resize:none;
		outline:none;
		opacity:0.7;
		line-height: 200%;
		border:none;
	}
	.table{
		text-align:center;
		margin-bottom: 20px;
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
				<c:if test="${enrollment.discount != 0}"><span style="color:red;">${enrollment.stringFinalPrice}원</span><span style="color:gray;text-decoration:line-through;margin-left:10px;">${product.stringPrice}원</span><span class="discount" style="font-size:15px;float:right;margin-top:10px;">${enrollment.discountPercent}% 할인</span></c:if>
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
	<div class="informationBox" style="width:100%;float:left;">
		<h1 style="text-align:center;">상품정보</h1>
		<div class="sizeInformBox">
			<h3>사이즈</h3><input type="hidden" name="enrollmentNum" value="${enrollment.num }">
			<table class="table">
				<thead>
					<tr>
						<th style="width:10%;">size</th>
						<th style="width:22.5%;">총장</th>
						<th style="width:22.5%;">어깨너비</th>
						<th style="width:22.5%;">가슴단면</th>
						<th style="width:22.5%;">소매길이</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="option" items="${sizeList}">
						<tr>
							<td><input type="hidden" name="contentSize" value="${option.size}">${option.size}</td>
							<td><input type="text" name="contentLength"></td>
							<td><input type="text" name="contentShoulder"></td>
							<td><input type="text" name="contentChest"></td>
							<td><input type="text" name="contentSleeve"></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" style="text-align: right;">단위 : cm</td>
					</tr>
				</tbody>
			</table>
			<textarea name="contentSizeText" readonly>
- 사이즈는 재는 방법에 따라 1~2 cm 정도 오차가 생길 수 있습니다.
- 사이즈 교환,반품은 배송비가 발생되오니 꼭 상세사이즈 확인후에
- 실제 입고 있는 옷을 측정 후 비교하여 구매하시면 실수없는 구매를 하실 수 있답니다.</textarea>
		</div>
		<div class="remarkInformBox">
			<h3>참고사항</h3>
			<table class="table">
				<tbody>
					<tr>
						<td>신축성 (elasticity)</td>
						<td><input type="radio" name="elasticity" value="good">좋음</td>
						<td><input type="radio" name="elasticity" value="normal">보통</td>
						<td><input type="radio" name="elasticity" value="no">없음</td>
						<td></td>
					</tr>
					<tr>
						<td>안감 (lining)</td>
						<td><input type="radio" name="lining" value="yes">있음</td>
						<td><input type="radio" name="lining" value="no">없음</td>
						<td><input type="radio" name="lining" value="fleece">기모</td>
						<td></td>
					</tr>
					<tr>
						<td>비침 (see-through)</td>
						<td><input type="radio" name="seethrough" value="yes">있음</td>
						<td><input type="radio" name="seethrough" value="little">약간</td>
						<td><input type="radio" name="seethrough" value="bright">약간(밝은색만)</td>
						<td><input type="radio" name="seethrough" value="no">없음, 안비침</td>
					</tr>
					<tr>
						<td>두께 (thickness)</td>
						<td><input type="radio" name="thickness" value="thick">두꺼움</td>
						<td><input type="radio" name="thickness" value="normal">보통</td>
						<td><input type="radio" name="thickness" value="little">약간얇음</td>
						<td><input type="radio" name="thickness" value="thin">얇음</td>
					</tr>
					<tr>
						<td>무게감(weight)</td>
						<td><input type="radio" name="weight" value="heavy">무거움</td>
						<td><input type="radio" name="weight" value="suitable">적당함</td>
						<td><input type="radio" name="weight" value="light">가벼움</td>
						<td></td>
					</tr>
					<tr>
						<td>세탁방법 (dry)</td>
						<td><input type="radio" name="dry" value="dry">드라이클리닝</td>
						<td><input type="radio" name="dry" value="wash">단독세탁</td>
						<td><input type="radio" name="dry" value="dryWash">드라이,단독세탁</td>
						<td><input type="radio" name="dry" value="cold">찬물손세탁</td>
					</tr>
				</tbody>
			</table>
			<textarea name="contentRemarkText" readonly>
- 소재 : 면100%
- 제조국 : 베트남
- 제조사 : (주)스타일노리터
- 제조연월 : 2020년 03월 이후
- 세탁방법 : 면 원단으로 형태 변형 및 이염 방지를 위해 차가운 물에 중성 세제 이용하여 손세탁하기를 권장합니다.
			</textarea>
		</div>
		<div class="colorInformBox">
			<h3>색상표</h3>
		</div>
	</div>
</div>
<script>
	$('.remarkInformBox input').click(function(){
		return false;
	})
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
		url:"<%=request.getContextPath()%>/enrollment/color",
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(data){
			for(i = 0; i < data['color'].length;i++){
				$('.colorInformBox').append(data['color'][i]);
			}
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