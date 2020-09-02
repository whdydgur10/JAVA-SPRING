<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>${product.code}</title>
<style>
	.mainBox:after, .subThumnailBox:after, .allPriceBox:after, .detailConteiner:after{
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
	.adBox{
		width:300px;
		height:800px;
		position:absolute;
		right:0;
		top: 0;
	}
	.goTop{
		width:300px;
		display: none;
		position: fixed;
		right:12%;
		bottom:70px;
		text-align: center;
		cursor: pointer;
	}
	.white{
	background-color: white;
	}
	.red{
		background-color: red;
	}
	.orange{
		background-color: orange;
	}
	.black{
		background-color: black;
	}
	.green{
		background-color: green;
	}
	.pink{
		background-color: pink;
	}
	.blue{
		background-color: blue;
	}
	.yellow{
		background-color: yellow;
	}
	.beige{
		background-color: beige;
	}
	.khaki{
		background-color: #8f784b;
	}
	.gray{
		background-color: gray;
	}
	.ivory{
		background-color: ivory;
	}
	.oatmeal{
		background-color: #f4eddc;
	}
	.bluegreen{
		background-color: #0d98ba;
	}
	.mint{
		background-color: #aaf0d1;
	}
	.sky{
		background-color: #87ceeb;
	}
	.cobalt{
		background-color: #0047ab;
	}
	.hotpink{
		background-color: #ff69b4;
	}
	.pink{
		background-color: pink;
	}
	.purple{
		background-color: purple;
	}
	.lightpurple{
		background-color: #b19cd9;
	}
	/* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
    
    /* Modal Content/Box */
    .modal-content {
      	position:relative;
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 30%; /* Could be more or less, depending on screen size */
        min-height: 120px;                     
    }
    /* The Close Button */
    .close {
       	position:absolute;
        color: #aaa;
        right:20px;
        font-size: 28px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .modal-content button{
       	width: 100px;
       	background-color: transparent;
       	position: absolute;
       	bottom:20px;
    }
	.modal-content button:hover{
		background-color: rgb(33,51,87);
		color: white;
	}
	#yes{
		left: 20%;
	}
	#no{
		right: 20%;
	}
</style>
<div class="detailConteiner" style="width:1450px;margin:20px auto;">
	<div class="mainBox" style="width:1100px;float:left;">
		<h1>${enrollment.mainTitle }</h1>
		<hr>
		<hr>
		<div class="thumnailBox" style="width:600px;float:left;margin-bottom:20px;">
			<img style="width:600px;height:600px;" src="<c:if test="${thumbnail[0].thumbnailImage != null}"><%=request.getContextPath()%>/resources/img/${thumbnail[0].thumbnailImage}</c:if><c:if test="${thumbnail[0].thumbnailImage == null}"><%=request.getContextPath()%>/resources/img/썸네일 준비중.png</c:if>">
			<div class="subThumnailBox" style="width:100%;">
				<c:if test="${thumbnail[1].thumbnailImage != null}"><img src="<%=request.getContextPath()%>/resources/img/${thumbnail[1].thumbnailImage}"></c:if>
				<c:if test="${thumbnail[2].thumbnailImage != null}"><img src="<%=request.getContextPath()%>/resources/img/${thumbnail[2].thumbnailImage}"></c:if>
				<c:if test="${thumbnail[3].thumbnailImage != null}"><img src="<%=request.getContextPath()%>/resources/img/${thumbnail[3].thumbnailImage}"></c:if>
				<c:if test="${thumbnail[4].thumbnailImage != null}"><img src="<%=request.getContextPath()%>/resources/img/${thumbnail[4].thumbnailImage}"></c:if>
				<c:if test="${thumbnail[5].thumbnailImage != null}"><img src="<%=request.getContextPath()%>/resources/img/${thumbnail[5].thumbnailImage}"></c:if>
				<c:if test="${thumbnail[6].thumbnailImage != null}"><img src="<%=request.getContextPath()%>/resources/img/${thumbnail[6].thumbnailImage}"></c:if>
			</div>
		</div>
		<form method="post" style="margin-top:20px;">
			<div class="setProductBox" style="width:500px;float:left;padding-left:100px;">
				<div class="setProductBoxHead">
				<span>${enrollment.subTitle}</span>
				<span style="font-size:20px;">${product.code}</span>
				<input type="hidden" id="code" value="${product.code}" >
				<input type="hidden" id="code" name="enrollmentNum" value="${enrollment.num}" >
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
					<div class="allPriceBox" style="margin-bottom:15px;"><span>총 상품금액 : <span class="allPrice" style="font-size:25px;color:red;">0</span></span></div>
					<button type="button" class="linkShoppingBasket">장바구니</button><button class="linkPurchaseList" type="button">구매하기</button>
					<button type="submit" hidden="" class="btn-submit"></button>
					<input type="hidden" class="linkWhere" name="where">
				</div>
			</div>
		</form>
		<div class="informationBox" style="width:100%;float:left;">
			<h1 style="text-align:center;">상품정보</h1>
			<div class="sizeInformBox">
				<h3>사이즈</h3><input type="hidden" id="enrollmentNum" name="enrollmentNum" value="${enrollment.num }">
				<table class="table">
					<thead>
						<tr>
							<th style="width:10%;">사이즈</th>
							<th style="width:22.5%;">총장</th>
							<th style="width:22.5%;">어깨너비</th>
							<th style="width:22.5%;">가슴단면</th>
							<th style="width:22.5%;">소매길이</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="option" items="${sizeList}">
							<tr>
								<td><span>${option.contentSize}</span>
								<td><span>${option.contentLength}</span></td>
								<td><span>${option.contentShoulder}</span></td>
								<td><span>${option.contentChest}</span></td>
								<td><span>${option.contentSleeve}</span></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="5" style="text-align: right;">단위 : cm</td>
						</tr>
					</tbody>
				</table>
				<textarea readonly>${sizeText.contentSizeText}</textarea>
			</div>
			<div class="remarkInformBox">
				<h3>참고사항</h3>
				<table class="table">
					<tbody>
						<tr>
							<td>신축성 (elasticity)</td>
							<td style="<c:if test="${remark.contentElasticity == 'good'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>좋음</span></td>
							<td style="<c:if test="${remark.contentElasticity == 'normal'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>보통</span></td>
							<td style="<c:if test="${remark.contentElasticity == 'no'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>없음</span></td>
							<td></td>
						</tr>
						<tr>
							<td>안감 (lining)</td>
							<td style="<c:if test="${remark.contentLining == 'yes'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>있음</span></td>
							<td style="<c:if test="${remark.contentLining == 'no'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>없음</span></td>
							<td style="<c:if test="${remark.contentLining == 'fleece'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>기모</span></td>
							<td></td>
						</tr>
						<tr>
							<td>비침 (see-through)</td>
							<td style="<c:if test="${remark.contentSeethrough == 'yes'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>있음</span></td>
							<td style="<c:if test="${remark.contentSeethrough == 'little'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>약간</span></td>
							<td style="<c:if test="${remark.contentSeethrough == 'bright'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>약간(밝은색만)</span></td>
							<td style="<c:if test="${remark.contentSeethrough == 'no'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>없음, 안비침</span></td>
						</tr>
						<tr>
							<td>두께 (thickness)</td>
							<td style="<c:if test="${remark.contentThickness == 'thick'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>두꺼움</span></td>
							<td style="<c:if test="${remark.contentThickness == 'normal'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>보통</span></td>
							<td style="<c:if test="${remark.contentThickness == 'little'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>약간얇음</span></td>
							<td style="<c:if test="${remark.contentThickness == 'thin'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>얇음</span></td>
						</tr>
						<tr>
							<td>무게감(weight)</td>
							<td style="<c:if test="${remark.contentWeight == 'heavy'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>무거움</span></td>
							<td style="<c:if test="${remark.contentWeight == 'suitable'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>적당함</span></td>
							<td style="<c:if test="${remark.contentWeight == 'light'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>가벼움</span></td>
							<td></td>
						</tr>
						<tr>
							<td>세탁방법 (dry)</td>
							<td style="<c:if test="${remark.contentDry == 'dry'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>드라이클리닝</span></td>
							<td style="<c:if test="${remark.contentDry == 'wash'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>단독세탁</span></td>
							<td style="<c:if test="${remark.contentDry == 'dryWash'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>드라이,단독세탁</span></td>
							<td style="<c:if test="${remark.contentDry == 'cold'}">background-color:rgb(33,51,87);color:white;</c:if>"><span>찬물손세탁</span></td>
						</tr>
						<tr>
							<td colspan="5"></td>
						</tr>
					</tbody>
				</table>
				<textarea readonly >${remark.contentRemarkText}
				</textarea>
			</div>
			<div class="colorInformBox">
				<h3>색상표</h3>
			</div>
			<div class="imageInformBox" style="position:relative;padding-bottom:30px;">
				<c:forEach var="content" items="${image}">
					<img style="width:800px;height:800px;margin-bottom:30px;" src="<%=request.getContextPath()%>/resources/img/${content.contentImage}">
				</c:forEach>
			</div>
		</div>
	</div>
	<div style="width:300px;height:100%;float:left;margin-left:50px;position:relative;">
		<div class="adBox" style="overflow:hidden;">
			<div class="adImageBox" style="width:400%;">
				<a href="#">
					<img style="width:25%;height:100%;background:aqua; ">
				</a>
				<a href="#">
					<img style="width:25%;height:100%;background:black; ">
				</a>
				<a href="#">
					<img style="width:25%;height:100%;background:blue; ">
				</a>
				<a href="#">
					<img style="width:25%;height:100%;background:fuchsia; ">
				</a>
			</div>
		</div>
		<a class="goTop"><i class="far fa-hand-pointer">맨 위로</i></a>
	</div>
</div>
<!-- The Modal -->
<div id="myModal" class="modal">
 
    <!-- Modal content -->
    <div class="modal-content">
        <span class="close" onclick="close()">&times;</span>
        <div style="padding-bottom:20px;">
        	<p>장바구니에 담겼습니다.</p>                                                           
        	<p>상품들을 더 보시겠습니까?</p>
        </div>
        <button type="button" id="yes">예</button>
    	<button type="button" id="no">아니오</button>
	</div>
</div>
<c:if test="${user == null}">
	<script>
		$('.linkShoppingBasket').click(function(){
			alert('로그인 후 이용해주세요.');
		})
		$('.linkPurchaseList').click(function(){
			alert('로그인 후 이용해주세요.');
		})
	</script>
</c:if>
<c:if test="${user != null}">
	<script>
		$('.linkShoppingBasket').click(function(){
			modal.style.display = "block";
		})
		$('.linkPurchaseList').click(function(){
			if($('.allPrice').text() != 0){
				$('.linkWhere').val('list');
				$('.btn-submit').click();
			}else
				alert('상품을 선택해주세요.');
		})
	</script>
</c:if>
<script>
	var modal = document.getElementById('myModal');
	var span = document.getElementsByClassName("close")[0];          
	span.onclick = function() {
	    modal.style.display = "none";
	}

	function yes_close(obj){
	    obj.click(function(){
	    	modal.style.display = "none";
	    	if($('.allPrice').text() != 0){
	    		$('.linkWhere').val('noBasket');
				$('.btn-submit').click();
			}else
				alert('상품을 선택해주세요.');
	    })
	}
    
	function no_close(obj){
	    obj.click(function(){
	    	modal.style.display = "none";
	    	if($('.allPrice').text() != 0){
	    		$('.linkWhere').val('goBasket');
				$('.btn-submit').click();
			}else
				alert('상품을 선택해주세요.');
	    })
	}
	
	window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

	yes_close($('#yes'));
	no_close($('#no'));

	setInterval(function(){
	    $('.adImageBox').children().first().animate({'margin-left':'-300px'},1,function(){
	        $('.adImageBox').children().first().detach().appendTo('.adImageBox');
	        $(this).removeAttr('style');
	    })
	},5000)
	var allHeight = $('.detailConteiner').height();
	$(window).scroll(function () {
		var height = $(document).scrollTop();
		log(height);
	});
	function log(str){
	    if(str > (allHeight - 800)) {
		    $('.adBox').css({'position':'absolute','right':'0','top':allHeight - 900});
		    $('.goTop').css({'position':'absolute','right':'0','bottom':-(allHeight -1000)});
	    }else if(str > 150){
	    	$('.adBox').css({'position':'fixed','right':'12%','top':'50px'});
	    	$('.goTop').css({'position':'fixed','right':'12%','bottom':'70px'});
	    	$('.goTop').css('display','inline-block');
		}
	    else if(str < 240){
	    	$('.adBox').css({'position':'absolute','right':'0','top':'0'});
	    	$('.goTop').css('display','none');
		}
	    	
	}
	$('.goTop').click(function() {
        $('html, body').animate({scrollTop : 0}, 400);
    });
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
	if($('#code').val() != '')
		$.ajax({
			async:true,
			type:'POST',
			data:code,
			url:"<%=request.getContextPath()%>/enrollment/colorBox",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				for(i = 0; i < data['color'].length;i++){
					$('.colorInformBox').append(data['color'][i]);
				}
		    }
		});
	function allPrice(){
		allPurchase = 0;
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
		str = code + " - " + color + " - " + size;
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
			$('.allPriceBox').before('<div class="productBox"><span>' + str + '</span><input type="hidden" class="optionCode" name="optionCode"><input type="hidden" class="color"><input type="hidden" class="size"><button class="deleteProduct" type="button">X</button>'
					+'<div style="height:30px;margin-top:5px;"><button type="button" class="decrease">-</button><span class="showPurchase" style="margin:0 15px;">1</span><input type="hidden" class="purchase" name="purchase" value="1"><button type="button" class="increase">+</button><span class="showPrice">${enrollment.stringFinalPrice}원</span><input type="hidden" class="price" name="price"></div><hr></div>');
			$('.productBox').last().children('.color').val(color);
			$('.productBox').last().children('.size').val(size);
			var list = {"color":color, "size":size, "productCode":code}
			$.ajax({
				async:true,
				type:'POST',
				data:JSON.stringify(list),
				url:"<%=request.getContextPath()%>/enrollment/optionCode",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
					$('.productBox').last().children('.optionCode').val(data['optionCode']);
			    }
			});
			$('#color').val("");
			$('#size').val("");
			$('#size').attr('disabled','disabled');
			codeL.push(code);
			colorL.push(color);
			sizeL.push(size);
			deleteBox($('.productBox').last().children('.deleteProduct'));
			decPurchase($('.productBox').last().find('.decrease'));
			incPurchase($('.productBox').last().find('.increase'));
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
			var list = {"productCode":code, "color":color};
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
					for(var i = 0; i < data['option'].length; i++){
						$('#size').append(data['option'][i]);
					}
			    }
			});
		}else
			$('#size').attr('disabled','disbaled');
	})
</script>