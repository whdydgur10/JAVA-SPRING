<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>판매글 작성</title>
<div style="width:600px;margin:30px auto;">
	<form method="get">
		<input class="select" type="search" name="productCode" placeholder="제품코드" style="width:300px;">
		<button type="button" class="search">검색</button>
		<button hidden="" class="getSubmit">검색</button>
	</form>
	<form method="post">
		<div class="form-group">
		    <label for="code">상품코드</label>
		    <input type="text" class="form-control" id="code" name="productCode" value="${product.code}" readonly>
		</div>
		<div class="form-group">
		    <label for="name">상품이름</label>
		    <input type="text" class="form-control" id="name" value="${product.name}">
		</div>
		<div class="form-group">
		    <label for="price">상품가격</label>
		    <input type="text" class="form-control" id="price" value="${product.price}">
		</div>
		<div class="form-group">
		    <label for="mainCategory">성별카테고리</label>
		    <input type="text" class="form-control" id="mainCategory" name="mainCategory" value="${product.gender}">
		</div>
		<div class="form-group">
		    <label for="middleCategory">상위카테고리</label>
		    <c:if test="${product.gender == 'M' }">
		    	<select class="form-control" id="mMiddleCategory" name="middleCategory">
		    		<option value="아우터" selected>아우터</option>
			    	<option value="상의">상의</option>
			    	<option value="하의">하의</option>
			    	<option value="신발">신발</option>
			    	<option value="etc">etc</option>
			    </select>
		    </c:if>
		    <c:if test="${product.gender == 'W' }">
		    	<select class="form-control" id="wMiddleCategory" name="middleCategory">
		    		<option value="아우터" selected>아우터</option>
		    		<option value="원피스">원피스</option>
			    	<option value="상의">상의</option>
			    	<option value="하의">하의</option>
			    	<option value="스커트">스커트</option>
			    	<option value="신발">신발</option>
			    	<option value="etc">etc</option>
			    </select>	
		    </c:if>
		    <c:if test="${product.gender == 'MW' }">
		    	<select class="form-control" id="mwMiddleCategory" name="middleCategory">
		    		<option value="아우터" selected>아우터</option>
			    	<option value="상의">상의</option>
			    	<option value="하의">하의</option>
			    	<option value="신발">신발</option>
			    	<option value="etc">etc</option>
		    	</select>
		    </c:if>
		</div>
		<div class="form-group">
		    <label for="subCategory">하위카테고리</label>
		    <select class="form-control" id="subCategory" name="subCategory">
		    	
		    </select>
		</div>
		<button class="codeCheck" style="height:50px;display:inline-block;line-height:50px;border-top:1px solid black;border-left:1px solid black;width:150px;text-align:center;background-color:rgb(33,51,87);color:white;margin-left:225px;">재등록하기</button>
	</form>
</div>
<script>
var mo = ['코트', '점퍼', '자켓', '패딩', '다운', '무스탕', '블루종', '항공점퍼', '가디건']
var mt = ['반팔티', '긴팔티', '셔츠/남방', '맨투맨', '후드티/아노락', '후드집업', '니트/스웨터', '민소매/나시', '트레이닝복'];
var mb = ['반바지', '청바지', '슬랙스', '면바지', '트레이닝복'];
var ms = ['슬립온', '스니커즈', '운동화', '워커', '부츠', '로퍼', '보트화', '구두', '슬리퍼', '샌들'];
var me = ['가방', '시계', '지갑', '벨트', '장갑', '양말', '모자', '목도리', '안경', '머플러'];
var wo = ['코트', '점퍼', '자켓', '패딩', '가디건'];
var wc = ['미니원피스', '롱원피스'];
var wt = ['반팔티', '긴팔티', '블라우스', '셔츠/남방', '맨투맨', '후드티/아노락', '후드집업', '니트/스웨터', '민소매/나시', '트레이닝복'];
var wb = ['반바지', '청바지', '슬랙스', '와이드팬츠', '면바지', '트레이닝복'];
var wk = ['미니스커트', '미디스커트', '롱스커트'];
var ws = ['단화', '스니커즈', '부츠', '힐', '구두', '샌들'];
var we = ['가방', '시계', '지갑', '지갑', '벨트', '장갑', '양말', '모자', '목도리', '안경', '머플러', '귀걸이', '목걸이', '헤어', '반지', '초커', '팔찌', '발찌', '파우치', '클러치', '스타킹', '타이즈'];
var mwo = ['코트', '점퍼', '자켓', '패딩', '가디건'];
var mwt = ['반팔티', '긴팔티', '셔츠/남방', '맨투맨', '후드티/아노락', '후드집업', '니트/스웨터', '민소매/나시', '트레이닝복'];
var mwb = ['반바지', '청바지', '슬랙스', '면바지', '트레이닝복'];
var mws = ['스니커즈', '부츠', '구두', '샌들'];
var mwe = ['가방', '시계', '지갑', '벨트', '장갑', '양말', '모자', '목도리', '안경', '머플러'];
$('#mMiddleCategory').change(function(){
	if($(this).val == '아우터'){
		$('#subCategory').empty();
		$('#subCategory').append('<option value="'+ mo[0] +'" selected>'+ mo[0] +'</option>');
		for(var i = 1; i < mo.length; i++){
			$('#subCategory').append('<option value="'+ mo[i] +'" selected>'+ mo[i] +'</option>');
		}
	}
})
$('#wMiddleCategory').change(function(){
	alert($('#wMiddleCategory').val() == '아우터');
	if($(this).val == '아우터'){
		alert('2');
		$('#subCategory').empty();
		$('#subCategory').append('<option value="'+ wo[0] +'" selected>'+ wo[0] +'</option>');
		for(var i = 1; i < mo.length; i++){
			$('#subCategory').append('<option value="'+ wo[i] +'" selected>'+ wo[i] +'</option>');
		}
	}
})
$('#mwMiddleCategory').change(function(){
	alert($(this).val());
})
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
</script>