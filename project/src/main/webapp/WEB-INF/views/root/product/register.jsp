<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>상품등록</title>
<style>
	.size>span{
		margin:0 10px 0 2px;
	}
	.color>span{
		margin:0 10px 0 2px;
	}
</style>
<div style="width:600px;height:800px;margin:0 auto;">
	<div style="font-size:50px;text-align:center;position:relative;">상품등록<a href="<%=request.getContextPath()%>/" style="position:absolute;top:0px;right:0px;font-size:15px;">홈으로</a></div>
	<form method="post">
		<div class="form-group">
		    <label for="code">상품코드</label>
		    <input type="text" class="form-control" id="code" name="code">
		</div>
		<div class="form-group">
		    <label for="name">상품이름</label>
		    <input type="text" class="form-control" id="name" name="name">
		</div>
		<div class="form-group">
		    <label for="price">상품가격</label>
		    <input type="text" class="form-control" id="price" name="price">
		</div>
		<div class="form-group">
		    <label for="gender">성별</label>
		    <select class="form-control" id="gender" name="gender">
		    	<option value="" selected>선택</option>
		    	<option value="M">남성</option>
		    	<option value="W">여성</option>
		    	<option value="MW">공용</option>
		    </select>
		</div>
		<div class="form-group size">
		    <label for="size">사이즈</label><br>
		</div>
		<div class="form-group color">
		    <label for="color">색상</label><br>
		</div>
		<button type="submit" style="height:50px;display:inline-block;line-height:50px;border-top:1px solid black;border-left:1px solid black;width:150px;text-align:center;background-color:rgb(33,51,87);color:white;margin-left:225px;">등록하기</button>
	</form>
</div>
<script>
	$(function(){
		var size = ['XS', 'S', 'M', 'L', 'XL', '2XL', 'free'];
		for(var i = 0; i < size.length; i++){
			$('.size').append('<input type="checkbox" id="size" name="size" value="'+ size[i] +'"><span>'+ size[i]+'</span>')
		}
		var color = ['화이트','아이보리','베이지','옐로우','머스타드','오렌지','레드','레드와인','핑크','코랄','핫핑크','퍼플','바이올렛','퍼플와인','블루','스카이블루',
			'네이비','코발트블루','그린','라이트그린','민트','브라운','모카','그레이','다크그레이','실버','블랙','챠콜']
		for(var i = 0; i < color.length; i++){
			if(i % 5 == 0 && i > 0)
				$('.color').append('<input type="checkbox" id="color" name="color" value="'+ color[i] +'"><span>'+ color[i]+'</span><br>')
			else
				$('.color').append('<input type="checkbox" id="color" name="color" value="'+ color[i] +'"><span>'+ color[i]+'</span>')
		}
	})
</script>