<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>등록글 수정</title>
<style>
	.mainBox:after, .subThumnailBox:after, .allPriceBox:after, .detailConteiner:after, .form:after{
		clear: both;
		content: '';
		display: block;
	}
	.subThumnailBox input{
		width:85px;
		float:left;
	}
	.subThumnailBox>div{
		float:left;
		font-size: 15px;
		margin-left:10px;
	}
	.subThumnailBox img{
		width:100px;
		height:100px;
		border:1px solid black;
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
	.productBox, .setProductBoxHead button{
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
		width:100%;
	}
	.adBox{
		width:300px;
		height:800px;
		position:absolute;
		right:0;
		top: 0;
	}
	.subThumnailBox>div{
		position: relative;
	}
	.sizeInformBox .table input{
		width:180px;
	}
	.sizeInformBox .table input:nth-of-type(1){
		width:80px;
	}
	.subThumnailBox .btn-del{
		top:50px !important;
		right:120px !important;
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
</style>
<div class="detailConteiner" style="width:1450px;margin:20px auto;">
	<form method="get">
		<input class="select" type="search" name="productCode" placeholder="제품코드" style="width:300px;" value="${product.code }">
		<button>검색</button>
	</form>
	<form method="post" class="form" enctype="multipart/form-data" id="fo">
		<div class="mainBox" style="width:1100px;float:left;">
			<input type="text" id="mainTitle" name="mainTitle" accept="image/*" style="width:100%;border:1px solid black;height:35px;" value="${enrollment.mainTitle}">
			<hr>
			<hr>
			<div class="thumnailBox" style="width:600px;float:left;margin-bottom:20px;">
				<input type="file" style="width:400px;" <c:if test="${thumbnail[0].thumbnailImage == null}">name="thumbnailImage" class="insert"</c:if><c:if test="${thumbnail[0].thumbnailImage != null}">class="update"</c:if>>
				<img style="width:600px;height:600px;border:1px solid black;" <c:if test="${thumbnail[0].thumbnailImage != null}">src="<%=request.getContextPath()%>/resources/img/${thumbnail[0].thumbnailImage}"</c:if>>
				<input type="hidden" value="${thumbnail[0].thumbnailNum}">
				<div class="subThumnailBox" style="width:100%;">
					<div>
						<input type="file" accept="image/*" <c:if test="${thumbnail[1].thumbnailImage == null}">name="thumbnailImage" class="insert"</c:if><c:if test="${thumbnail[1].thumbnailImage != null}">class="update"</c:if>>
						<img <c:if test="${thumbnail[1].thumbnailImage != null}">src="<%=request.getContextPath()%>/resources/img/${thumbnail[1].thumbnailImage}"</c:if>>
						<input type="hidden" value="${thumbnail[1].thumbnailNum}">
						<c:if test="${thumbnail[1].thumbnailImage != null}"><button type="button" style="position:absolute;right:0;top:0;" class="btn-del">삭제</button></c:if>
					</div>
					<div>
						<input type="file" accept="image/*" <c:if test="${thumbnail[2].thumbnailImage == null}">name="thumbnailImage" class="insert"</c:if><c:if test="${thumbnail[2].thumbnailImage != null}">class="update"</c:if>>
						<img <c:if test="${thumbnail[2].thumbnailImage != null}">src="<%=request.getContextPath()%>/resources/img/${thumbnail[2].thumbnailImage}"</c:if>>
						<input type="hidden" value="${thumbnail[2].thumbnailNum}">
						<c:if test="${thumbnail[2].thumbnailImage != null}"><button type="button" style="position:absolute;right:0;top:0;" class="btn-del">삭제</button></c:if>
					</div>
					<div>
						<input type="file" accept="image/*" <c:if test="${thumbnail[3].thumbnailImage == null}">name="thumbnailImage" class="insert"</c:if><c:if test="${thumbnail[3].thumbnailImage != null}">class="update"</c:if>>
						<img <c:if test="${thumbnail[3].thumbnailImage != null}">src="<%=request.getContextPath()%>/resources/img/${thumbnail[3].thumbnailImage}"</c:if>>
						<input type="hidden" value="${thumbnail[3].thumbnailNum}">
						<c:if test="${thumbnail[3].thumbnailImage != null}"><button type="button" style="position:absolute;right:0;top:0;" class="btn-del">삭제</button></c:if>
					</div>
					<div>
						<input type="file" accept="image/*" <c:if test="${thumbnail[4].thumbnailImage == null}">name="thumbnailImage" class="insert"</c:if><c:if test="${thumbnail[4].thumbnailImage != null}">class="update"</c:if>>
						<img <c:if test="${thumbnail[4].thumbnailImage != null}">src="<%=request.getContextPath()%>/resources/img/${thumbnail[4].thumbnailImage}"</c:if>>
						<input type="hidden" value="${thumbnail[4].thumbnailNum}">
						<c:if test="${thumbnail[4].thumbnailImage != null}"><button type="button" style="position:absolute;right:0;top:0;" class="btn-del">삭제</button></c:if>
					</div>
					<div>
						<input type="file" accept="image/*" <c:if test="${thumbnail[5].thumbnailImage == null}">name="thumbnailImage" class="insert"</c:if><c:if test="${thumbnail[5].thumbnailImage != null}">class="update"</c:if>>
						<img <c:if test="${thumbnail[5].thumbnailImage != null}">src="<%=request.getContextPath()%>/resources/img/${thumbnail[5].thumbnailImage}"</c:if>>
						<input type="hidden" value="${thumbnail[5].thumbnailNum}">
						<c:if test="${thumbnail[5].thumbnailImage != null}"><button type="button" style="position:absolute;right:0;top:0;" class="btn-del">삭제</button></c:if>
					</div>
					<div>
						<input type="file" accept="image/*" <c:if test="${thumbnail[6].thumbnailImage == null}">name="thumbnailImage" class="insert"</c:if><c:if test="${thumbnail[6].thumbnailImage != null}">class="update"</c:if>>
						<img <c:if test="${thumbnail[6].thumbnailImage != null}">src="<%=request.getContextPath()%>/resources/img/${thumbnail[6].thumbnailImage}"</c:if>>
						<input type="hidden" value="${thumbnail[6].thumbnailNum}">
						<c:if test="${thumbnail[6].thumbnailImage != null}"><button type="button" style="position:absolute;right:0;top:0;" class="btn-del">삭제</button></c:if>
					</div>
					<input type="hidden" class="thumbnaildata">
				</div>
			</div>
				<div class="setProductBox" style="width:500px;float:left;padding-left:100px;">
					<div class="setProductBoxHead">
					<span>${enrollment.subTitle}</span>
					<span style="font-size:20px;">${product.code}</span>
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
					<div class="allPriceBox" style="margin-bottom:15px;"><span style="font-size:15px;">총 상품금액 : <span class="allPrice" style="font-size:25px;color:red;">0</span></span></div>
					<button class="linkShoppingBasket" type="button" <c:if test="${user == null}">disabled</c:if>>장바구니</button><button class="linkPurchaseList" type="button" <c:if test="${user == null}">disabled</c:if>>구매하기</button>
				</div>
			</div>
			<div class="informationBox" style="width:100%;float:left;">
				<h1 style="text-align:center;">상품정보</h1>
				<div class="sizeInformBox">
					<h3>사이즈</h3><input type="hidden" id="enrollmentNum" name="enrollmentNum" value="${enrollment.num }">
					<table class="table">
						<thead>
							<tr>
								<th>사이즈</th>
								<th>총장</th>
								<th>어깨너비</th>
								<th>가슴단면</th>
								<th>소매길이</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="option" items="${sizeList}">
								<tr>
									<td><input type="hidden"  name="contentSize" value="${option.contentSize}">${option.contentSize}</td>
									<td><input type="text" name="contentLength" value="${option.contentLength}"></td>
									<td><input type="text" name="contentShoulder" value="${option.contentShoulder}"></td>
									<td><input type="text" name="contentChest" value="${option.contentChest}"></td>
									<td><input type="text" name="contentSleeve" value="${option.contentSleeve}"></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="5" style="text-align: right;">단위 : cm</td>
							</tr>
						</tbody>
					</table>
					<textarea name="contentSizeText">${sizeText.contentSizeText}</textarea>
				</div>
				<div class="remarkInformBox">
					<h3>참고사항</h3>
					<table class="table">
						<tbody>
							<tr class="elasticity">
								<td>신축성 (elasticity)</td>
								<td><input type="radio" name="contentElasticity" value="good" <c:if test="${remark.contentElasticity == 'good'}">checked</c:if>>좋음</td>
								<td><input type="radio" name="contentElasticity" value="normal" <c:if test="${remark.contentElasticity == 'normal'}">checked</c:if>>보통</td>
								<td><input type="radio" name="contentElasticity" value="no" <c:if test="${remark.contentElasticity == 'no'}">checked</c:if>>없음</td>
								<td></td>
							</tr>
							<tr>
								<td>안감 (lining)</td>
								<td><input type="radio" name="contentLining" value="yes" <c:if test="${remark.contentLining == 'yes'}">checked</c:if>>있음</td>
								<td><input type="radio" name="contentLining" value="no" <c:if test="${remark.contentLining == 'no'}">checked</c:if>>없음</td>
								<td><input type="radio" name="contentLining" value="fleece" <c:if test="${remark.contentLining == 'fleece'}">checked</c:if>>기모</td>
								<td></td>
							</tr>
							<tr>
								<td>비침 (see-through)</td>
								<td><input type="radio" name="contentSeethrough" value="yes" <c:if test="${remark.contentSeethrough == 'yes'}">checked</c:if>>있음</td>
								<td><input type="radio" name="contentSeethrough" value="little" <c:if test="${remark.contentSeethrough == 'little'}">checked</c:if>>약간</td>
								<td><input type="radio" name="contentSeethrough" value="bright" <c:if test="${remark.contentSeethrough == 'bright'}">checked</c:if>>약간(밝은색만)</td>
								<td><input type="radio" name="contentSeethrough" value="no" <c:if test="${remark.contentSeethrough == 'no'}">checked</c:if>>없음, 안비침</td>
							</tr>
							<tr>
								<td>두께 (thickness)</td>
								<td><input type="radio" name="contentThickness" value="thick" <c:if test="${remark.contentThickness == 'thick'}">checked</c:if>>두꺼움</td>
								<td><input type="radio" name="contentThickness" value="normal" <c:if test="${remark.contentThickness == 'normal'}">checked</c:if>>보통</td>
								<td><input type="radio" name="contentThickness" value="little" <c:if test="${remark.contentThickness == 'little'}">checked</c:if>>약간얇음</td>
								<td><input type="radio" name="contentThickness" value="thin" <c:if test="${remark.contentThickness == 'thin'}">checked</c:if>>얇음</td>
							</tr>
							<tr>
								<td>무게감(weight)</td>
								<td><input type="radio" name="contentWeight" value="heavy" <c:if test="${remark.contentWeight == 'heavy'}">checked</c:if>>무거움</td>
								<td><input type="radio" name="contentWeight" value="suitable"<c:if test="${remark.contentWeight == 'suitable'}">checked</c:if>>적당함</td>
								<td><input type="radio" name="contentWeight" value="light"<c:if test="${remark.contentWeight == 'light'}">checked</c:if>>가벼움</td>
								<td></td>
							</tr>
							<tr>
								<td>세탁방법 (dry)</td>
								<td><input type="radio" name="contentDry" value="dry" <c:if test="${remark.contentDry == 'dry'}">checked</c:if>>드라이클리닝</td>
								<td><input type="radio" name="contentDry" value="wash" <c:if test="${remark.contentDry == 'wash'}">checked</c:if>>단독세탁</td>
								<td><input type="radio" name="contentDry" value="dryWash" <c:if test="${remark.contentDry == 'dryWash'}">checked</c:if>>드라이,단독세탁</td>
								<td><input type="radio" name="contentDry" value="cold" <c:if test="${remark.contentDry == 'cold'}">checked</c:if>>찬물손세탁</td>
							</tr>
						</tbody>
					</table>
					<textarea name="contentRemarkText">${remark.contentRemarkText}</textarea>
				</div>
				<div class="colorInformBox">
					<h3>색상표</h3>
				</div>
				<div class="imageInformBox" style="position:relative;padding-bottom:30px;">
					<c:forEach var="content" items="${image}">
						<div style="position:relative;">
							<input type="file" class="update" accept="image/*">
							<img style="width:800px;height:800px;margin-bottom:30px;" src="<%=request.getContextPath()%>/resources/img/${content.contentImage}">
							<input type="hidden" value="${content.contentImageNum}">
							<button type="button" style="position:absolute;right:0;top:0;" class="btn-del">삭제</button>
						</div>
					</c:forEach>
					<button class="addImage" type="button" style="width:100px;height:30px;position:absolute;bottom:0;right:0;">추가하기</button>
				</div>
				<button type="button" class="btn-submit" style="height:50px;display:inline-block;line-height:50px;border-left:1px solid black;width:150px;text-align:center;background-color:rgb(33,51,87);color:white;margin-left:500px;">변경하기</button>
				<button type="submit" hidden=""></button>
			</div>
		</div>
	</form>
</div>
<script>
	var allPurchase;
	var codeL = [];
	var colorL = [];
	var sizeL = [];
	var code = $('.select').val();
	var color;
	var size;
	var i;
	var list;
	var list2;
	var index;
	var purchase;
	var img;
	$('.imageInformBox .btn-del').click(function(){
		$(this).prev().prev().removeAttr('src');
		<%-- var frm = document.getElementById('fo');
		var fileData = new FormData(frm);
		var imageNum = $(this).prev().val();
		fileData.append('img', img);
		fileData.append('imageNum', imageNum);
		fileData.append('table', 'contentimage');
		$.ajax({
		    url:"<%=request.getContextPath()%>/enrollment/deleteImage",
		    type:'POST',
		    data:fileData,
		    async:false,
		    cache:false,
		    contentType:false,
		    processData:false,
			success : function(data){
		    }
		}) --%>
		$(this).parent().remove();
	})
	$('.subThumnailBox .btn-del').click(function(){
		$(this).prev().prev().removeAttr('src');
		<%-- var frm = document.getElementById('fo');
		var fileData = new FormData(frm);
		var imageNum = $(this).prev().val();
		fileData.append('img', img);
		fileData.append('imageNum', imageNum);
		fileData.append('table', 'contentimage');
		$.ajax({
		    url:"<%=request.getContextPath()%>/enrollment/deleteImage",
		    type:'POST',
		    data:fileData,
		    async:false,
		    cache:false,
		    contentType:false,
		    processData:false,
			success : function(data){
		    }
		}) --%>
	})
	$('.update').hover(function(){
		var str = $(this).next('img').attr('src');
		if(str != null){
			var array = str.split("/");
			for(i = array.length - 2;i<array.length; i++) {
				if(i == array.length - 2){
					img = array[i] + "\\";
				}
				else
					img = img + array[i];
			}
		}
	})
	$('.thumnailBox .update').change(function(){
		var fi = $(this)[0].files[0];
		if(fi != null){
			var index = $(this).next('img');
			var frm = document.getElementById('fo');
			var fileData = new FormData(frm);
			var imageNum = $(this).next().next().val();
			fileData.append('img', img);
			fileData.append('code', code);
			fileData.append('imageNum', imageNum);
			fileData.append('table', 'thumbnail');
			fileData.append('fileData', $(this)[0].files[0]);
			$.ajax({
			    url:"<%=request.getContextPath()%>/enrollment/updateImage",
			    type:'POST',
			    data:fileData,
			    async:false,
			    cache:false,
			    contentType:false,
			    processData:false,
			    /* error:function(request,status,error){
		  		 	console.log('test');
				}, */
				success : function(data){
					index.attr('src',data['image']);
			    }
			})
		}
	})
	$('.imageInformBox .update').change(function(){
		var fi = $(this)[0].files[0];
		console.log(fi == null);
		if(fi != null){
			var index = $(this).next('img');
			var frm = document.getElementById('fo');
			var fileData = new FormData(frm);
			var imageNum = $(this).next().next().val();
			fileData.append('img', img);
			fileData.append('code', code);
			fileData.append('imageNum', imageNum);
			fileData.append('table', 'contentimage');
			fileData.append('fileData', $(this)[0].files[0]);
			$.ajax({
			    url:"<%=request.getContextPath()%>/enrollment/updateImage",
			    type:'POST',
			    data:fileData,
			    async:false,
			    cache:false,
			    contentType:false,
			    processData:false,
				success : function(data){
					index.attr('src',data['image']);
			    }
			})
		}
	})
	function delImage(obj){
		obj.change(function(){
			if(obj.val() == ""){
				obj.next('img').remove();
				obj.remove();
			}
		})
	}
	delImage($('#image'));
	function addImage(obj){
		obj.click(function(){
			$(obj).before('<input type="file" class="insert" id="image" name="contentImage" accept="image/*" ><img style="width:800px;height:800px;border:1px solid black;">');
			delImage($(this).prev().prev('input'));
			image($(this).prev().prev('input'));
		})
	}
	addImage($('.addImage'));
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
	function image(obj){
		obj.change(function(e){
			console.log($(this).val());
	        if($(this).val() != ""){
	        	var files = e.target.files;
	            var arr =Array.prototype.slice.call(files);
	            //업로드 가능 파일인지 체크
	            for(var i=0;i<files.length;i++){
	              	if(!checkExtension(files[i].name,files[i].size)){
	                	return false;
	              	}
	            }        
	            preview(arr,$(this)); 
	        }else{
	        	$(this).next('img').removeAttr('src');
			}  
		});
	    function checkExtension(fileName,fileSize){
	      	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	      	var maxSize = 20971520;  //20MB      
	      	if(fileSize >= maxSize){
	        	alert('파일 사이즈 초과');
	        	$("input[type='file']").val("");  //파일 초기화
	        	return false;
	      	}      
	      	if(regex.test(fileName)){
	       		alert('업로드 불가능한 파일이 있습니다.');
	        	$("input[type='file']").val("");  //파일 초기화
	        	return false;
	      	}
	      	return true;
	    }
	    function preview(arr,obj){
	      	arr.forEach(function(f){        
	        //파일명이 길면 파일명...으로 처리
	        	var fileName = f.name;
	        	if(fileName.length > 10){
	          		fileName = fileName.substring(0,7)+"...";
	        	}
	        	//이미지 파일 미리보기
	       		if(f.type.match('image.*')){
	         	var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	          	reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
		           	obj.next('img').attr('src',e.target.result);
	          	} 
	         	reader.readAsDataURL(f);
	        	}else{
		            obj.next('img').attr('src',e.target.result);
	        	}
	      	});//arr.forEach
	    }
	}
	image($('.insert'));
	$("form").validate({
		rules: {
			mainTitle: {
				required : true
			},
			thumbnailImage: {
				required : true
			},
			contentLength: {
				required : true
			},
			contentShoulder: {
				required : true
			},
			contentChest: {
				required : true
			},
			contentSleeve: {
				required : true
			},
			contentSizeText: {
				required : true
			},
			contentElasticity: {
				required : true
			},
			contentLining: {
				required : true
			},
			contentSeethrough: {
				required : true
			},
			contentThickness: {
				required : true
			},
			contentWeight: {
				required : true
			},
			contentDry: {
				required : true
			},
			contentRemarkText: {
				required : true
			},
			contentImage: {
				required : true
			}
		},
		messages : {
			mainTitle: {
				required : "필수 입력입니다"
			},
			thumbnailImage: {
				required : ""
			},
			contentLength: {
				required : ""
			},
			contentShoulder: {
				required : ""
			},
			contentChest: {
				required : ""
			},
			contentSleeve: {
				required : ""
			},
			contentSizeText: {
				required : ""
			},
			contentElasticity: {
				required : ""
			},
			contentLining: {
				required : ""
			},
			contentSeethrough: {
				required : ""
			},
			contentThickness: {
				required : ""
			},
			contentWeight: {
				required : ""
			},
			contentDry: {
				required : ""
			},
			contentRemarkText: {
				required : ""
			},
			contentImage: {
				required : ""
			}
		}
	});
	$.validator.addMethod(
		"regex",
		function(value, element, regexp) {
			var re = new RegExp(regexp);
			return this.optional(element) || re.test(value);
		},
		"Please check your input."
	);
</script>