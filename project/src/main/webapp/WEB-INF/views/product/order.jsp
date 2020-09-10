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
	.orderConteiner:after, .payment:after {
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
    .modal-content a, .modal-content button{
       	width: 100px;
       	background-color: transparent;
       	bottom:20px;
       	display: inline-block;
       	text-align: center;
       	background-color: rgb(33,51,87);
		color: white;
    }
	.modal-content button:hover{
		background-color: rgb(33,51,87);
		color: white;
	}
	.informBox{
		width:450px;
		display:inline-block;
	}
	.deliberyBox{
		height: calc(1.5em + .75rem + 2px);
	    padding: .375rem .75rem;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #495057;
	    background-color: #fff;
	    background-clip: padding-box;
	    border: 1px solid #ced4da;
	    border-radius: .25rem;
	    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	    display: inline-block;
	    width:300px;
	}
	.deliberyBox:focus {
		color: #495057;
	    background-color: #fff;
	    border-color: #80bdff;
	    outline: 0;
	    box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
	}
	.form-group>label{
		width:100px;
	}
	button{
		background-color: rgb(33,51,87);
		color: white;
	}
	#isAddress>.modal-content{
		width:600px;
	}
	.address>label{
		width:100px;
	}
	.payment>div{
		width:150px;
		float:left;
	}
	.payment input{
		display:inline-block;
		width:16px;
		height:16px;
	}
	.payment label{
		font-size:20px;
	}
	hr{
		margin-bottom:40px;
	}
</style>
<div class="orderConteiner" style="width:1000px;margin:20px auto;">
	<h3>주문하기</h3><br>
	<input type="hidden" class="purchaseNum" name="purchaseNum" value="${purchase.num}">
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
	<div style="margin-top:50px;">
		<div style="float:left;width:600px;position: relative;">
			<h4>쿠폰</h4>
			<div class="informBox">
				<input type="hidden" class="useCouponNum"> 
				<span class="isUseCoupon">보유</span> 쿠폰 : 
				<span class="couponCount"></span>
				<hr>
			</div>
			<button class="removeCoupon" type="button" style="position: absolute;right:150px;border:none;background-color: transparent;display:none;">X</button>
			<button class="useCoupon" type="button" style="position: absolute;right:20px;background-color: rgb(33,51,87);color: white;height:40px;">쿠폰 사용하기</button>
			<h4>적립금</h4>
			<div class="informBox">
				<span>보유</span> 적립금 : <span class="userPoint">${user.point}</span>
				<input type="text" style="width:300px;margin-left:20px;text-align:right;" class="usePoint" value="0">
				<button class="userAll" type="button" style="position: absolute;right:50px;height:40px;">모두 사용</button>
				<p style="font-size:12px;margin-top:5px;">※쿠폰과 적립금은 중복사용이 불가능합니다.</p>
				<hr>
			</div>
			<h4>배송지</h4>
			<div class="informBox" style="width:600px;">
				<div class="form-group">
				    <label for="code">주문자</label>
					  <input type="text" class="deliberyBox" value="${user.name}" id="name">
				</div>
				<div class="form-group">
					<label for="code">연락처</label>
					<input type="text" class="deliberyBox" value="${user.phone}" id="phone">
				</div>
				<c:forEach var="address" items="${addresslist}">
					<c:if test="${address.isMain == 'Y'.charAt(0)}">
						<input type="hidden" id="addressNum" value="${address.num}"> 
						<div class="form-group">
						    <label for="code">우편번호</label>
						    <input type="text" class="deliberyBox" value="${address.code}" name="addressCode" id="addressCode" disabled readonly style="background-color: #f1f3f6;width:200px;">
							<button class="searchAddress" style="height:38px;margin-left:10px;">주소검색</button>
						</div>
						<div class="form-group">
						    <label for="code">주소</label>
						    <input type="text" class="deliberyBox" value="${address.address}" name="address" id="address" disabled readonly style="background-color: #f1f3f6;width:450px;">
						</div>
						<div class="form-group">
						    <label for="code">상세주소</label>
						    <input type="text" class="deliberyBox" value="${address.detail}" name="detail" id="detail" style="width:450px;">
						</div>
						<div class="form-group">
						    <label for="code">배송요청사항</label>
						    <input type="text" class="deliberyBox" style="width:450px;">
						</div>
					</c:if>
				</c:forEach>
				<c:if test="${addresslist.size() == 0}">
					<input type="hidden" id="addressNum" value="${address.num}"> 
					<div class="form-group">
						<label for="code">우편번호</label>
						<input type="text" class="deliberyBox" value="${address.code}" name="addressCode" id="addressCode" disabled readonly style="background-color: #f1f3f6;width:200px;">
						<button class="newAddress" style="height:38px;margin-left:10px;">주소검색</button>
					</div>
					<div class="form-group">
						<label for="code">주소</label>
						<input type="text" class="deliberyBox" value="${address.address}" name="address" id="address" disabled readonly style="background-color: #f1f3f6;width:450px;">
					</div>
					<div class="form-group">
						<label for="code">상세주소</label>
						<input type="text" class="deliberyBox" value="${address.detail}" name="detail" id="detail" style="width:450px;">
					</div>
					<div class="form-group">
						<label for="code">배송요청사항</label>
						<input type="text" class="deliberyBox" style="width:450px;">
					</div>
				</c:if>
				<hr>
			</div>
			<h4>결제방법</h4>
			<div class="payment">
				<div>
					<input id="card" type="radio" value="card">
					<label for="card">카드결제</label>
				</div>
				<div>
					<input id="account" type="radio" value="account">
					<label for="account">가상계좌</label>
				</div>
				<div>
					<input id="naver" type="radio" value="naver">
					<label for="naver">네이버페이</label>
				</div>
				<div>
					<input id="kakao" type="radio" value="kakao">
					<label for="kakao">카카오페이</label>
				</div>
				<div>
					<input id="payco" type="radio" value="payco">
					<label for="payco">페이코</label>
				</div>
				<div>
					<input id="phone" type="radio" value="phone">
					<label for="phone">핸드폰결제</label>
				</div>	
			</div>
			<span style="font-size:12px;">※계좌이체에 경우 주문 후 5일안에 입금해야합니다.</span>
		</div>
	</div>
	<div style="float:right;width:300px;position:sticky;top:200px;">
		<h4>결제금액</h4>
		<span class="left">상품 금액</span><span class="productPrice right"></span>
		<span class="left">쿠폰 금액</span><span class="couponPrice right">0원</span>
		<span class="left">적립금 금액</span><span class="pointPrice right">0원</span>
		<span class="left">배송비 금액</span><span class="deliveryPrice right"></span>
		<hr>
		<span class="left" style="color:red;font-size:20px;opacity:1;">최종 결제 금액</span><span id="finalPrice" class="right"></span>
		<span class="left" style="color:blue;opacity:1;">예상 적립금</span><span id="givePoint" class="right"></span>
		<button class="goPayment" type="button" style="height:50px;display:inline-block;line-height:50px;border-left:1px solid black;width:100%;text-align:center;background-color:rgb(33,51,87);color:white;margin-top:20px;font-size:23px;opacity:0.7;" disabled>결제하기</button>
	</div>
</div>
<div class="modal" id="isCoupon">
    <div class="modal-content">
        <span class="close" onclick="close()">&times;</span>
        <div style="padding-bottom:20px;">
        	<p>※쿠폰과 적립금은 중복사용이 불가능 합니다.</p>                                                           
        </div>
        <div style="margin:0 auto">
        	<button type="button" id="use">사용하기</button>
        </div>
	</div>
</div>
<div class="modal" id="useCoupon">
    <div class="modal-content">
        <span class="close">&times;</span>
        <c:forEach var="coupon" items="${couponlist}">
        	<div class="coupon">
        		<input type="radio">
        		<input type="hidden" class="couponNum" value="${coupon.num}">
        		<span class="couponName">${coupon.name}</span>
        		<span class="couponDis">${coupon.discount}<span>원</span></span>
        		<hr>
        	</div>
        </c:forEach>
        <div style="text-align: right;">
    		<button type="button" id="choiceCoupon">선택</button>
    	</div>
	</div>
</div>
<div class="modal" id="isAddress">
    <div class="modal-content">
        <span class="close" onclick="close()">&times;</span>
        <c:forEach var="address" items="${addresslist}">
        	<div class="address" style="margin-bottom:20px;">
        		<input type="hidden" class="addressNum" value="${address.num}"> 
	        	<input type="radio" <c:if test = "${address.isMain == 'Y'.charAt(0)}">checked</c:if>><br>
				<label for="code">우편번호</label>
				<input type="text" class="deliberyBox addressCode" value="${address.code}" disabled readonly style="background-color: #f1f3f6;"><br>
				<label for="code">주소</label>
				<input type="text" class="deliberyBox address" value="${address.address}" disabled readonly style="background-color: #f1f3f6;width:450px;"><br>
				<label for="code">상세주소</label>
				<input type="text" class="deliberyBox detail" value="${address.detail}" style="width:450px;">
        	</div>
		</c:forEach>
       	<div>
       		<span style="font-size:12px;margin-right:80px;">※주소지 설정은 내정보-계정에서 설정해주세요.</span>
       		<button type="button" class="newAddress" style="margin-right:5px;">임시 주소</button>
    		<button type="button" id="choiceAddress">선택</button>
    	</div>
	</div>
</div>
<c:if test="${purchase.deposit == 'Y'}">
	<div class="modal" id="alreadyPayment" style="display:block;text-align:center;">
	    <div class="modal-content">
	        <span>이미 결제가 완료된 주문 상품입니다.</span>
	        <a href="javascript:history.back();" style="margin:0 auto;margin-top:30px;">뒤로가기</a>
		</div>
	</div>
</c:if>
<script>
	var len, num, str;
	var productP, couponP, pointP, deliberyP, res;
	var useCouponNum;
	var payment;
	var givePoint;
	var isAddress = $('#isAddress');
	var addressNum;
	var addressCode;
	var address;
	var detail;
	var couponNum;
	var couponName;
	var isCoupon = $('#isCoupon');
	var useCoupon = $('#useCoupon');
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
	$('.goPayment').click(function(){
		if($('#name').val() == '')
			return false;
		else if($('#phone').val() == '')
			return false;
		else if($('#addressCode').val() == '')
			return false;
		else{
			addressNum = $('#addressNum').val();
			addressCode = $('#addressCode').val();
			address = $('#address').val();
			detail = $('#detail').val();
			list = {"code":addressCode, "address":address, "detail":detail};
			useCouponNum = $('.useCouponNum').val();
			console.log(addressNum);
			console.log(pointP);
			if(addressNum == '')
				$.ajax({
					async:false,
					type:'POST',
					data:JSON.stringify(list),
					url:"<%=request.getContextPath()%>/address",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					success : function(data){
						addressNum = data['addressNum'];
				    }
				});
			
			if(useCouponNum != ''){
				list = {"num":purchaseNum, "isCoupon":'Y',"price":finalPrice,"givePoint":givePoint, "payment":payment, "addressNum":addressNum};
				$.ajax({
					async:true,
					type:'POST',
					data:JSON.stringify(list),
					url:"<%=request.getContextPath()%>/purchase/coupon",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					success : function(data){
						
				    }
				});
				list = {"purchaseNum":purchaseNum, "num":useCouponNum};
				$.ajax({
					async:true,
					type:'POST',
					data:JSON.stringify(list),
					url:"<%=request.getContextPath()%>/purchase/useCoupon",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					success : function(data){
						
				    }
				});
			}
			else if(pointP != 0){
				list = {"num":purchaseNum, "isPoint":'Y', "price":finalPrice, "givePoint":givePoint, "payment":payment, "addressNum":addressNum, "usePoint":pointP};
				$.ajax({
					async:true,
					type:'POST',
					data:JSON.stringify(list),
					url:"<%=request.getContextPath()%>/purchase/point",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					success : function(data){
						
				    }
				});
			}else{
				list = {"num":purchaseNum, "price":finalPrice, "givePoint":givePoint, "payment":payment, "addressNum":addressNum, "usePoint":pointP};
				$.ajax({
					async:true,
					type:'POST',
					data:JSON.stringify(list),
					url:"<%=request.getContextPath()%>/purchase",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					success : function(data){
						
				    }
				});
			}
				
		}
	})
	
	$('.payment input[type=radio]').click(function(){
		$('.payment').find('input[type=radio]').prop('checked',false);
		$(this).prop('checked',true);
		payment = $(this).val();
		$('.goPayment').removeAttr('disabled');
		$('.goPayment').css('opacity','1');
	})
	
	$('.newAddress').click(function(){
		isAddress.css('display','none');
	    getPost();
	})
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
	function getPost() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = '';
	            var extraAddr = '';
	            if (data.userSelectedType === 'R') {
	                addr = data.roadAddress;
	            } else {
	                addr = data.jibunAddress;
	            }
	            if(data.userSelectedType === 'R'){
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                $('.form-group #detail').val(extraAddr);
	            } else {
	                $('.form-group #detail').val('');
	            }
	            
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            $('#addressNum').val('');
	            $('.form-group #addressCode').val(data.zonecode);
	            $('.form-group #address').val(addr);
	            // 커서를 상세주소 필드로 이동한다.
	            $('.form-group #detail').focus();
	        }
	    }).open();
	}
	
	$('.searchAddress').click(function(e){
		isAddress.css('display','block');
		e.stopPropagation();
	})
	
	$('#isAddress input[type=radio]').click(function(){
		$('.address').children('input[type=radio]').prop('checked',false);
		$(this).prop('checked',true);
	})
	
	$('#choiceAddress').click(function(){
		for(i = 0; i < $('.address').length; i++){
			index = $('.address')[i];
			if($(index).children('input[type=radio]').prop('checked') == true){
				addressNum = $(index).children('.addressNum').val();
				addressCode = $(index).children('.addressCode').val();
				address = $(index).children('.address').val();
				detail = $(index).children('.detail').val();
			}		
		}
		$('#addressNum').val(addressNum);
		$('.form-group #addressCode').val(addressCode);
		$('.form-group #address').val(address);
		$('.form-group #detail').val(detail);
		isAddress.css('display','none');
	})
	
	$('#choiceCoupon').click(function(){
		for(i = 0; i < $('.coupon').length; i++){
			index = $('.coupon')[i];
			if($(index).children('input[type=radio]').prop('checked') == true){
				couponName = $(index).children('.couponName').text();
				coupon = $(index).children('.couponDis').text();
				$('.useCouponNum').val($(index).children('.couponNum').val());
			}		
		}
		$('.isUseCoupon').text('사용');
		useCoupon.css('display','none');
		$('.couponCount').text(couponName);
		$('.couponPrice').text(coupon);
		$('#finalPrice').text(calc(product, coupon, point, delibery) + '원');
		$('.removeCoupon').css('display','inline-block');
		resetPoint();
	})
	
	$('.coupon input[type=radio]').click(function(){
		$('.coupon').children('input[type=radio]').prop('checked',false);
		$(this).prop('checked',true);
	})
	
	function resetCoupon(){
		$('.isUseCoupon').text('보유');
		$('.useCouponNum').val('');
		$('.couponCount').text(couponNum);
		coupon = '0원';
		$('.couponPrice').text(coupon);
		$('#finalPrice').text(calc(product, coupon, point, delibery) + '원');
	}
	
	function resetPoint(){
		$('.usePoint').val('0');
		$('.pointPrice').text('0원');
		point = $('.pointPrice').text();
		$('#finalPrice').text(calc(product, coupon, point, delibery) + '원');
	}
	
	$('.removeCoupon').click(function(){
		resetCoupon();
		$(this).css('display','none');
	})
	
	$('.useCoupon').click(function(e){
		isCoupon.css('display','block');
		e.stopPropagation();
	})
	
	$('.close').click(function(e){
		$(this).parents('.modal').css('display','none');
		e.stopPropagation();
	})
	
	$('#use').click(function(e){
		$(this).parents('.modal').css('display','none');
		useCoupon.css('display','block');	
		
		e.stopPropagation();
	})
	
	$('body').click(function(e){
		var target = $(e.target).parents('.modal').length;
		if(target == 0){
			isCoupon.css('display','none');
			useCoupon.css('display','none');
			isAddress.css('display','none');
		}
	})
	
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
			$('.couponCount').text(data['count'] + '개');
			couponNum = data['count'] + '개';
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
		$('.removeCoupon').css('display','none');
		resetCoupon();
		$('#finalPrice').text(calc(product, coupon, point, delibery) + '원');
	})
	
	$('.usePoint').keypress(function(event){
            if(event.keyCode >= 48 && event.keyCode <= 57){
                return true;
            }else{
                return false;
            }
        })
        
	$('.usePoint').change(function(){
		var userPoint = Number($('.userPoint').text());
		if($(this).val() == '')
			$(this).val('0');
		if($(this).val() > userPoint){
			$(this).val(userPoint);
			usePoint = $('.usePoint').val();	
		}else
			usePoint = $('.usePoint').val();
		$('.pointPrice').text(toStr(usePoint) + '원');
		point = $('.pointPrice').text();
		$('.removeCoupon').css('display','none');
		resetCoupon();
		$('#finalPrice').text(calc(product, coupon, point, delibery) + '원');
	})
	
	function toStr(obj){
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
		productP = toInt(product);
		couponP = toInt(coupon);
		pointP = toInt(point);
		deliberyP = toInt(delibery);
		finalPrice = productP - couponP - pointP + deliberyP;
		var a = (finalPrice / 100).toFixed();
		var b = (Math.pow(10,2));
		var c = Math.floor(finalPrice / 100*b)/b;
		var d = c.toFixed(0);
		givePoint = d;
		$('#givePoint').text(toStr(d)+ '원');
		return toStr(finalPrice);
	}
</script>
