<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>상품정보 변경</title>
<style>
	.size>span{
		margin:0 10px 0 2px;
	}
	.color>span{
		margin:0 10px 0 2px;
	}
	.deleteColor, .deleteSize{
		border:none;
		background-color: transparent;
	}
</style>

<div style="width:600px;margin:30px auto;">
	<form method="get">
		<input class="select" type="text" name="productCode" placeholder="제품코드" style="width:300px;">
		<button>검색</button>
	</form>
	<form method="post">
		<div class="form-group">
		    <label for="code">상품코드</label>
		    <input type="text" class="form-control" id="code" name="code" value="${product.code}" readonly>
		</div>
		<div class="form-group">
		    <label for="name">상품이름</label>
		    <input type="text" class="form-control" id="name" name="name" value="${product.name}">
		</div>
		<div class="form-group">
		    <label for="price">상품가격</label>
		    <input type="text" class="form-control" id="price" name="price" value="${product.price}">
		</div>
		<div class="form-group">
		    <label for="gender">성별</label>
		    <select class="form-control" id="gender" name="gender">
		    	<option value="" selected>선택</option>
		    	<option value="M" <c:if test="${product.gender == 'M'}">selected</c:if>>남성</option>
		    	<option value="W" <c:if test="${product.gender == 'W'}">selected></c:if>>여성</option>
		    	<option value="MW" <c:if test="${product.gender == 'MW'}">selected></c:if>>공용</option>
		    </select>
		</div>
		<div class="form-group size">
		    <label for="size">사이즈</label><button type="button" class="addSize" style="background-color: transparent;margin-left:5px;">추가</button><br>
		    <c:forEach var="list" items="${size}">
		    	<input type="text" name="size" style="width:40px;" value="${list.size}"><button class="deleteSize">X</button>
		    </c:forEach>
		</div>
		<div class="form-group color">
		    <label for="color">색상</label><button type="button" class="addColor" style="background-color: transparent;margin-left:5px;">추가</button><br>
		    <c:forEach var="list" items="${color}">
		    	<input type="text" name="color" style="width:90px;" value="${list.color}"><button class="deleteColor">X</button>
		    </c:forEach>
		</div>
		<button class="codeCheck" type="button" style="height:50px;display:inline-block;line-height:50px;border-top:1px solid black;border-left:1px solid black;width:150px;text-align:center;background-color:rgb(33,51,87);color:white;margin-left:225px;">재등록하기</button>
		<button type="submit" hidden=""></button>
	</form>
</div>
<script>
	$(function(){
		function dColor(obj){
			obj.click(function(){
				$(this).prev().remove();
				$(this).remove();
			})
		}
		dColor($('.deleteColor'));
		$('.addColor').click(function(){
			$(this).parent().append('<input type="text" name="color" style="width:90px;"><button class="deleteColor">X</button>');
			dColor($(this).parent().children().last());
		})
		function dSize(obj){
			obj.click(function(){
				$(this).prev().remove();
				$(this).remove();
			})
		}
		dSize($('.deleteSize'));
		$('.addSize').click(function(){
			$(this).parent().append('<input type="text" name="size" style="width:40px;"><button class="deleteSize">X</button>');
			dSize($(this).parent().children().last());
		})
	})
</script>