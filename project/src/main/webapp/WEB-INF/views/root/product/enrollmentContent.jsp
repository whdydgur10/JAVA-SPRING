<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>판매글 작성</title>
<style>
	.mainBox:after, .subThumnailBox:after {
		clear: both;
		content: '';
		display: block;
	}
	.subThumnailBox>img{
		width:150px;
		height:150px;
		float:left;
	}
	.setProductBoxHead{
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
</style>
${enrollment}
${product}
<div class="mainBox" style="width:1100px;">
	<h1>${enrollment.mainTitle}</h1>
	<hr>
	<hr>
	<div class="thumnailBox" style="width:600px;float:left">
		<img style="width:600px;height:600px;">
		<div class="subThumnailBox" style="width:100%;">
			<img>
			<img>
			<img>
			<img>
		</div>
	</div>
	<div class="setProductBox" style="width:500px;height:750px;float:left;padding-left:100px;">
		<div class="setProductBoxHead"><br>
			<c:if test="${enrollment.subTitle != null }"><input type="text" value="${enrollment.subTitle}"><input type="text" id="code" value="${product.code}"></c:if>
			<c:if test="${enrollment.subTitle == null }"><input type="text" value="${product.name}"><input type="text" id="code" value="${product.code}"></c:if>
			<hr><br>
			<c:if test="${enrollment.discount == 0}"><span style="color:red;">${product.stringPrice}원</span></c:if>
			<c:if test="${enrollment.discount != 0}"><span style="color:red;">${enrollment.stringFinalPrice}원</span><span style="color:gray;text-decoration:line-through;margin-left:10px;">${product.stringPrice}원</span></c:if>
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
		</div>
	</div>
</div>
<script>
	$('#color').change(function(){
		var code = $('#code').val();
		var color = $('#color').val();
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
					if(data['yes'].length > 1)
						for(int i = 0; i < data['yes'].length; i++) {
							$('#size').append('<option value="' + data['yes'][i] + '">' + data['yes'][i] + '</option>');
						}
					else
						$('#size').append('<option value="' + data['yes'] + '">' + data['yes'] + '</option>');
					if(data['no'])
						for(int i = 0; i < data['no'].length; i++) {
							$('#size').append('<option value="' + data['no'][i] + '"disabled="disabled">' + data['no'][i] + '(품절)</option>');
						}	
			    }
			});
		}else
			$('#size').attr('disabled','disbaled');
	})
</script>