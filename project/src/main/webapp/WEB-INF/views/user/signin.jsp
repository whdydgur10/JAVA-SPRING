<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>빠숑 로그인</title>
<style>
	.cross1, .cross2{
		position:absolute;
		top:74px;
		left:0;
	}
	.cross2{
		top:91px;
	}
	.remark{
		opacity:0.7;
		float:left;
		margin-top: 20px;
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
	#idBtn, .no, #pwBtn{
		width: 100px;
	}
	.no{
		margin-left: 40px;
	}
	.search{
		color:black;
		display:inline-block;
		background-color:transparent;
		border:none;
	}
	.search:hover{
		text-decoration: underline;
	}
	.modal label{
		width:80px;
	}
	.modal input{
		width:70%;
		margin-right:5%;
		padding-left:5px;
	}
</style>
<div style="width:800px;height:700px;margin:30px auto;text-align:center;position:relative;">
	<h1 style="color:white;background-color:rgb(33,51,87);margin:0;height:80px;line-height:80px;">빠숑 로그인하는 곳</h1>
	<a href="<%=request.getContextPath()%>/" style="position:absolute;top:30px;right:10px;color:white;">안하고 돌아가기</a>
	<span class="cross1">////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////</span>
	<span class="cross1">\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\</span>
	<span class="cross2">////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////</span>
	<span class="cross2">\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\</span>
	<hr>
	<hr>
	<form method="post">
		<div style="width:300px;margin:100px auto 0;">
			<span class="remark">아이디와 비밀번호를 입력해주세요.</span>
			<input type="text" class="id" placeholder="아이디" name="id" style="width:300px;" autocomplete="id">
			<input type="password" class="pw" placeholder="비밀번호" name="pw" style="width:300px;" autocomplete="current-password">
			<button type="button" class="button" style="width:300px;background-color:rgb(33,51,87);color:white;">로그인하기</button>
			<button type="submit" class="submitBtn" hidden=""></button>
			<span class="remark">아직 회원가입을 안하셨나요?</span>
			<a href="<%=request.getContextPath()%>/user/signup" style="width:100%;color:black;display:inline-block;">회원가입하러 가기</a>
			<span class="remark">혹시 가입하셨는데 아이디나 비밀번호를 잃어버리셨나요?</span>
			<button class="search searchId" type="button" >아이디 찾기</button>
			<button class="search searchPw" type="button" >비밀번호 찾기</button>
		</div>
	</form>
</div>
<div class="modal" id="searchId"> 
	<div class="modal-content">
		<h4>아이디 찾기</h4>
		<span class="close">&times;</span>
		<div>
			<label for="name">이름</label>                                                
			<input type="text" id="name" style="">
		</div>
		<div>
			<label for="phone">전화번호</label>                                                  
			<input type="text" id="phone">
		</div>
		<div style="margin:0 auto">
			<button type="button" id="idBtn">확인</button>
			<button type="button" class="no">닫기</button>
		</div>
	</div>
</div>
<div class="modal" id="searchPw"> 
	<div class="modal-content">
		<h4>비밀번호 찾기</h4>
		<span class="close">&times;</span>
		<div style="margin-bottom:20px;">
			<label for="id">아이디</label>                                                 
			<input type="text" id="id" ><br>
			<span style="opacity:0.7;font-size:12px;">※아이디에 저장된 이메일로 임시 비밀번호를 발송합니다.</span>
		</div>
		<div style="margin:0 auto">
			<button type="button" id="pwBtn">확인</button>
			<button type="button" class="no">닫기</button>
		</div>
	</div>
</div>
<script>
	var list;
	$('#idBtn').click(function(){
		list = {"name":$('#name').val(), "phone":$('#phone').val()}
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(list),
			url:"<%=request.getContextPath()%>/searchId",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
			    if(data['user']==null)
				    alert('가입하신 정보가 없습니다. 입력을 확인해주세요.');
			    else{
				    $('.id').val(data['id']);
				    $('.pw').focus();
			    	$('#searchId').css('display','none');
				}
		    }
		});
	})
	$('#pwBtn').click(function(){
		list = $('#id').val();
		$.ajax({
			async:true,
			type:'POST',
			data:list,
			url:"<%=request.getContextPath()%>/searchPw",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
			    if(data['id'] == false)
				    alert('입력하신 아이디는 없는 아이디입니다.');
			    else{
			    	alert('임시 비밀번호가 발송되었습니다.');
			    	$('.id').val(list);
			    	$('.pw').focus();
			    	$('#searchPw').css('display','none');
				}
				    
		    }
		});
	})
	$('#phone').keypress(function(event){
            if(event.keyCode >= 48 && event.keyCode <= 57){
                return true;
            }else{
                return false;
            }
        })
	$('.searchId').click(function(e){
		$('#searchId').css('display','block');
		e.stopPropagation();
	})
	$('.searchPw').click(function(e){
		$('#searchPw').css('display','block');
		e.stopPropagation();
	})
	function close(obj){
		obj.click(function(){
			$('.modal').css('display','none');
			$('#id').val('');
			$('#name').val('');
			$('#phone').val('');
			$('.id').focus();
		})
	}
	$('body').click(function(e){
		var target = $(e.target).parents('.modal').length;
		if(target == 0){
			$('#id').val('');
			$('#name').val('');
			$('#phone').val('');
			$('#searchId').css('display','none');
			$('#searchPw').css('display','none');
		}
	})
	close($('.close'));
	close($('.no'));
	/* id는 여러개를 적어도 하나만 적용 */
	$('.button').click(function(){
		if($('.id').val() == ''){ 
			alert('아이디를 입력하세요.'); 
			return false; 
		} 
		if($('.pw').val() == ''){ 
			alert('비밀번호를 입력하세요.'); 
			return false; 
		} 
		list = {"id":$('.id').val(), "pw":$('.pw').val()};
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(list),
			url:"<%=request.getContextPath()%>/signin",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
			    if(data['id'] == false){
			    	alert('가입되지 않은 아이디입니다.');
			    	$('.id').val('');
			    	$('.pw').val('');
				}
			    if(data['pw'] == false){
			    	alert('비밀번호가 틀렸습니다.');
			    	$('.pw').val('');
				}
			    if(data['pw'] == true){
				    alert('로그인 되었습니다.');
				    $('.submitBtn').click();
				}
		    }
		});
	})
</script>