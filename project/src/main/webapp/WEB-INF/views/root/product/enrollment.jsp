<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>판매글 작성</title>
<div style="width:600px;margin:30px auto;">
	<form method="get">
		<input class="search" type="search" name="productCode" placeholder="제품코드" style="width:300px;">
		<button type="button" class="btn-search">검색</button>
	</form>
	<form method="post">
		<div class="form-group">
		    <label for="code">상품코드</label>
		    <input type="text" class="form-control code" id="code" name="productCode" value="${product.code}" readonly>
		</div>
		<div class="form-group">
		    <label for="name">상품이름</label>
		    <input type="text" class="form-control name" id="name" value="${product.name}" readonly>
		</div>
		<div class="form-group">
		    <label for="price">상품가격</label>
		    <input type="text" class="form-control price" id="price" value="${product.price}" readonly>
		</div>
		<div class="form-group">
		    <label for="price">할인</label>
		    <input type="text" class="form-control discount" id="discount" value="0" name="discount">
		</div>
		<div class="form-group">
		    <label for="mainCategory">성별카테고리</label>
		    <input type="text" class="form-control mainCategory" id="mainCategory" name="mainCategory" value="${product.gender}" readonly>
		</div>
		<div class="form-group">
		    <label for="middleCategory">상위카테고리</label>
		    <select class="form-control middleCategory" id="middleCategory" name="middleCategory">
		    	<option value="" selected>선택</option>
			</select>
		</div>
		<div class="form-group">
		    <label for="subCategory">하위카테고리</label>
		    <select class="form-control subCategory" id="subCategory" name="subCategory">
		    	<option value="" selected>선택</option>
		    </select>
		</div>
		<input type="hidden" name="categoryNum" class="categoryNum" id="categoryNum">
		<input type="hidden"  name="subTitle" value="${product.name}">
		<button type="button" class="link" style="height:50px;display:inline-block;line-height:50px;border-top:1px solid black;border-left:1px solid black;width:150px;text-align:center;background-color:rgb(33,51,87);color:white;margin-left:225px;">내용 작성하기</button>
	</form>
</div>
<script>
	$('.search').click(function(){
		var code = $('.select').val();
		$.ajax({
			async:true,
			type:'POST',
			data:code,
			url:"<%=request.getContextPath()%>/enrollment/codeCheck",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
			    if(data['codeCheck'] == 1) {
				    alert('등록되지 않은 상품코드입니다.');
			    }
			    else if(data['codeCheck'] == 0) {
			        alert('이미 등록되어있는 상품코드입니다.');
			    }
			    else if(data['codeCheck'] == 2){
					$('.getSubmit').click();
				}
	 
		    }
		});
	})
	$('.search').hover(function(){
		var mainCategory = $('#mainCategory').val();
		if(mainCategory != "")
			$.ajax({
				async:true,
				type:'POST',
				data:mainCategory,
				url:"<%=request.getContextPath()%>/enrollment/middleCategory",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
					$('#middleCategory').empty();
					$('#middleCategory').append('<option value="" selected>선택</option>');
				    for(var i = 0; i < data['middleCategory'].length; i++){
					    $('#middleCategory').append('<option value="' + data['middleCategory'][i] + '">' + data['middleCategory'][i] + '</option>');
					}
			    }
			});
	})
	$('.btn-search').hover(function(){
		var mainCategory = $('#mainCategory').val();
		if(mainCategory != "")
			$.ajax({
				async:true,
				type:'POST',
				data:mainCategory,
				url:"<%=request.getContextPath()%>/enrollment/middleCategory",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
					$('#middleCategory').empty();
					$('#middleCategory').append('<option value="" selected>선택</option>');
				    for(var i = 0; i < data['middleCategory'].length; i++){
					    $('#middleCategory').append('<option value="' + data['middleCategory'][i] + '">' + data['middleCategory'][i] + '</option>');
					}
			    }
			});
	})
	$('#middleCategory').click(function(){
		var mainCategory = $('#mainCategory').val();
		var middleCategory = $('#middleCategory').val();
		var list = {"mainCategory":mainCategory, "middleCategory":middleCategory};
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(list),
			url:"<%=request.getContextPath()%>/enrollment/subCategory",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				$('#subCategory').empty();
				$('#subCategory').append('<option value="" selected>선택</option>');
			    for(var i = 0; i < data['subCategory'].length; i++){
				    $('#subCategory').append('<option value="' + data['subCategory'][i] + '">' + data['subCategory'][i] + '</option>');
				}
		    }
		});
	})
	$('#subCategory').change(function(){
		var mainCategory = $('#mainCategory').val();
		var middleCategory = $('#middleCategory').val();
		var subCategory = $('#subCategory').val();
		var list = {"mainCategory":mainCategory, "middleCategory":middleCategory, "subCategory":subCategory};
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(list),
			url:"<%=request.getContextPath()%>/enrollment/categoryNum",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				$('.categoryNum').val(data['categoryNum']);
		    }
		});
	})
	$('.link').click(function(){
		var productCode = $('#code').val();
		var discount = $('#discount').val();
		var categoryNum = $('#categoryNum').val();
		var subTitle = $('#subTitle').val();
		var finalPrice = $('#price').val() - $('#discount').val();
		var list = {"productCode":productCode, "discount":discount, "categoryNum":categoryNum, "subTitle":subTitle, "finalPrice":finalPrice};
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(list),
			url:"<%=request.getContextPath()%>/enrollment/register",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				alert('본문을 작성해주세요');
				location.href="<%=request.getContextPath()%>/root/product/enrollmentContent?productCode=${product.code}";
		    }
		});
	})
	$("form").validate({
		rules: {
			code: {
				required : true
			},
			name: {
				required : true
			},
			price: {
				required : true
			},
			mainCategory: {
				required : true
			},
			middleCategory: {
				required : true
			},
			subCategory: {
				required : true
			}
		},
		messages : {
			code: {
				required : "필수 입력입니다"
			},
			name: {
				required : "필수 입력입니다"
			},
			price: {
				required : "필수 입력입니다"
			},
			mainCategory: {
			    required : "필수 입력입니다"
			},
			middleCategory: {
				required : "필수 입력입니다"
			},
			subCategory: {
				required : "필수 입력입니다"
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