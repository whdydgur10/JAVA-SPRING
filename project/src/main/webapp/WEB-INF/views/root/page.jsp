<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.linkBox{
		width:200px;
		height:100px;
		border:1px solid black;
		font-size:20px;
		text-align:center;
		line-height:100px;
		float:left;
		background-color:rgb(33,51,87);
		opacity: 0.7;
	}
	.rootPage a{
		display:inline-block;
		width:100%;
		height:100%;
		color:white;
	}
	.rootPage a:hover{
		text-decoration: none;
		color:white;
	}
	.linkBox:hover{
		opacity: 1;
	}
	.rootPage button{
		border:none;
		background: transparent;
		width:100%;
		height:100%;
		color:white;
	}
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
    .modal-content {
      	position:relative;
        background-color: #fefefe;
        margin: 10% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 30%; /* Could be more or less, depending on screen size */
        min-height: 200px;                     
    }
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
	.modal button{
		background-color: rgb(33,51,87);
		color: white;
	}
	#yes, #no{
		width: 100px;
		position: absolute;
       	bottom:20px;
	}
	#yes{
		left: 20%;
	}
	#no{
		right: 20%;
	}
	.search{
		width: 20%;
	}
	.enrollmentInform>label, .enrollmentInform>span{
		display:inline-block;
		width:100%;
		margin-bottom: 0;
		margin-top:5px;
	}
	.enrollmentInform>span{
		border:1px solid black;
		padding-left:5px;
	}
</style>
<title>관리자페이지</title>
<div class="rootPage" style="margin:0 auto;width:1200px;">
	<div class="linkBox">
		<a href="<%=request.getContextPath()%>/root/product/register">신상품 등록</a>
	</div>
	<div class="linkBox">
		<a href="<%=request.getContextPath()%>/root/product/amount">상품 재고관리</a>
	</div>
	<div class="linkBox">
		<a href="<%=request.getContextPath()%>/root/product/update">상품정보 재등록</a>
	</div>
	<div class="linkBox">
		<a href="<%=request.getContextPath()%>/root/product/enrollment">판매글 작성</a>
	</div>
	<div class="linkBox">
		<a href="<%=request.getContextPath()%>/root/product/enrollmentUpdate">판매글 수정</a>
	</div>
	<div class="linkBox">
		<button type="button" class="enrollmentDelete">판매글 내리기</button>
	</div>
</div>
<div id="myModal" class="modal"> 
	<div class="modal-content">
		<span class="close" onclick="close()">&times;</span><br>
		<div>
			<label for="productCode">상품코드</label><br>                                                   
			<input type="text" id="productCode" style="width:75%;margin-right:5%;padding-left:5px;"><button type="button" class="search">검색</button>
		</div>
		<div class="enrollmentInform" style="margin-bottom:50px;"></div>
		<button type="button" id="yes">예</button>
		<button type="button" id="no">아니오</button>
	</div>
</div>
<script>
	var enrollNum
	var modal = document.getElementById('myModal');
	var span = document.getElementsByClassName("close")[0];          
	span.onclick = function() {
	    modal.style.display = "none";
	    $('.enrollmentInform').empty();
	    $('#productCode').val('');
	}
	
	function yes_close(obj){
	    obj.click(function(){
	    	modal.style.display = "none";
	    	$('.enrollmentInform').empty();
	    	$('#productCode').val('');
	    	console.log(enrollNum);
	    	$.ajax({
				async:true,
				type:'POST',
				data:enrollNum,
				url:"<%=request.getContextPath()%>/root/deleteEnroll",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
					alert('글을 내렸습니다. 판매글 수정을 통해 재등록 가능합니다.')
			    }
			});
	    })
	}
	
	function no_close(obj){
	    obj.click(function(){
	    	modal.style.display = "none";
	    	$('.enrollmentInform').empty();
	    	$('#productCode').val('');
	    })
	}
	
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	        $('.enrollmentInform').empty();
	        $('#productCode').val('');
	    }
	}

	$('.enrollmentDelete').click(function(){
		modal.style.display = "block";
	})
	yes_close($('#yes'));
	no_close($('#no'));

	$('.search').click(function(){
		var productCode = $('#productCode').val();
		$('.enrollmentInform').empty();
		if(productCode == '')
			alert('상품코드를 입력해주세요.');
		else
			$.ajax({
				async:true,
				type:'POST',
				data:productCode,
				url:"<%=request.getContextPath()%>/root/enrollCheck",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
					if(data['inform'] != null){
						$('.enrollmentInform').append(data['inform']);
						enrollNum = $('#enrollNum').val();	
					}
					else if(data['inform'] == null)
						alert('등록된 상품은 이미내렸거나 없습니다.');
			    }
			});
	})
</script>