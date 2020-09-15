<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>후기 작성</title>

<style>
	#fileBox:after, #fileGroup:after {
		clear: both;
		content: '';
		display: block;
	}
	.error{
		font-size: 1rem;
	}
	.fas{
		color: red;
	}
</style>
<div class="reviewRegister" style="width:1100px;margin:20px auto;">
	<form method="post" enctype="multipart/form-data">
		<label for="enrollGroup">상품</label>
		<input type="hidden" value="" class="enrollNum">
		<c:forEach var="list" items="${list}">
			<input type="hidden" value="${list.enrollNum}" class="enrollNum">
		</c:forEach>
		<input type="hidden" name="enrollNum" id="enrollNum">
		<select id="enrollGroup" class="form-control form-group" name="listNum">
			<option value="" selected>상품 선택</option>
			<c:forEach var="list" items="${list}">
				<option value="${list.listNum}">${list.mainTitle}</option>
			</c:forEach>
		</select>
		<div class="form-group">
		    <label for="title">후기제목</label>
		    <input type="text" class="form-control" id="title" name="title">
		</div>
		<label for="fileGroup">첨부이미지</label>
		<button type="button" class="addImage">추가</button>
		<div class="form-group" id="fileGroup">
		</div>
		<label for="gradeGroup">별점</label>
		<div class="form-group" id="gradeGroup">
			<i class="fas fa-star"><input type="hidden" value="1"></i>
			<i class="fas fa-star"><input type="hidden" value="2"></i>
			<i class="fas fa-star"><input type="hidden" value="3"></i>
			<i class="fas fa-star"><input type="hidden" value="4"></i>
			<i class="fas fa-star"><input type="hidden" value="5"></i>
			<input type="hidden" name="grade" class="grade" value="5">
		</div>
		<div class="form-group">
		    <label for="content">후기 내용</label>
		    <textarea class="form-control" id="content" style="resize:none;height:300px;overflow:auto" name="content" placeholder="기재 안할시 제목과 동일"></textarea>
		</div>
		<div style="text-align:right;">
			<button type="submit" style="height:50px;display:inline-block;line-height:50px;border-top:1px solid black;border-left:1px solid black;width:150px;text-align:center;background-color:rgb(33,51,87);color:white;">작성완료</button>
		</div>
	</form>
</div>
<c:if test="${list.size() == 0}">
	<script>
		alert('모든 후기가 작성되었습니다.');
		window.history.back();
	</script>
</c:if>
<script>
	$('#enrollGroup').change(function(){
		var index = $(this).val();
		for(var i = 0; i < $('#enrollGroup>option').length; i++){
			var option = $('#enrollGroup option')[i];
			if(index ==  $(option).val()){
				var enrollIndex = $('.enrollNum')[i];
				$('#enrollNum').val($(enrollIndex).val());
			}
		}
	})
	var grade;
	$('#gradeGroup i').click(function(){
		$(this).prevAll().removeClass('far').addClass('fas');
		$(this).removeClass('far').addClass('fas');
		$(this).nextAll().removeClass('fas').addClass('far');
		$('.grade').val($(this).children().val()); 
	})
	var target;
	$('.addImage').click(function(){
		if($('#fileGroup>div').length == 5){
			alert('이미지는 최대 5개까지 첨부 가능합니다.');
			return false;
		}
		else{
			$('#fileGroup').append('<div id="fileBox" style="height:130px;width:100px;float:left;margin-right:10px;"><input type="file" id="file" name="file" style="float:left;width:86px;margin-left:7px;"><img style="width:100px;height:100px;border:1px solid black;float:left;"></div>');
			image($(this).next().children().last().children('input[type=file]'));
			changeImage($(this).next().children().last().children('input[type=file]'));
		}
	})
	function changeImage(obj){
		obj.change(function(){
			if($(this).val() == ''){
				$(this).parent().remove();
			}
		})
	}
	changeImage($('#file'));
	image($("input[type=file]"));
	function image(obj){
		obj.change(function(e){
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
	$("form").validate({
	    rules: {
	    	title: {
	            required : true
	    	}
	    },
	    messages : {
	        title: {
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