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
	.deleteColor, .deleteSize{
		border:none;
		background-color: transparent;
	}
</style>
<div style="width:600px;margin:30px auto;">
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
		    <label for="size">사이즈</label><span style="opacity:0.7;">(XS, S, M, L, XL, free, 240, 250...)</span><button type="button" class="addSize" style="background-color: transparent;margin-left:5px;">추가</button><br>
		    <input type="text" name="size" style="width:40px;"><button class="deleteSize">X</button>
		</div>
		<div class="form-group color">
		    <label for="color">색상</label><span style="opacity:0.7;">(black, white, blue, yellow...)</span><button type="button" class="addColor" style="background-color: transparent;margin-left:5px;">추가</button><br>
		    <input type="text" name="color" style="width:90px;"><button class="deleteColor">X</button></div>
		<button class="codeCheck" type="button" style="height:50px;display:inline-block;line-height:50px;border-left:1px solid black;width:150px;text-align:center;background-color:rgb(33,51,87);color:white;margin-left:225px;">등록하기</button>
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
		$('.codeCheck').click(function(){
			var code = $('#code').val();
			var name = $('#name').val();
			var price = $('#price').val();
			var gender = $('#gender').val();
			var list = {"code":code, "name":name, "price":price, "gender":gender};
			$.ajax({
				async:true,
				type:'POST',
				data:JSON.stringify(list),
				url:"<%=request.getContextPath()%>/root/codeCheck",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
				    if(data['codeCheck'] == true) {
					    alert('등록되었습니다.');
					    $('button[type=submit]').click();
				    }
				    else {
				        alert('이미 등록되어있는 상품코드입니다.');
				    }
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
				gender: {
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
				gender: {
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
	})
</script>