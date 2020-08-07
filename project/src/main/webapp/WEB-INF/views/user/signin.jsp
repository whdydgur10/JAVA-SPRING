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
			<input type="text" class="id" placeholder="아이디" name="id" style="width:300px;">
			<input type="password" class="pw" placeholder="비밀번호" name="pw" style="width:300px;">
			<button type="submit" style="width:300px;background-color:rgb(33,51,87);color:white;">로그인하기</button>
			<span class="remark">아직 회원가입을 안하셨나요?</span>
			<a href="<%=request.getContextPath()%>/user/signup" style="width:100%;color:black;display:inline-block;">회원가입하러 가기</a>
			<span class="remark">혹시 가입하셨는데 아이디나 비밀번호를 잃어버리셨나요?</span>
			<a href="<%=request.getContextPath()%>/user/signup" style="width:100%;color:black;display:inline-block;">아이디 찾으러 가기</a>
			<a href="<%=request.getContextPath()%>/user/signup" style="width:100%;color:black;display:inline-block;">비밀번호 찾으러 가기</a>
		</div>
	</form>
</div>
<script>
	$(function(){
		$('form').submit(function(){ 
			if($('.id').val() == ''){ 
				alert('아이디를 입력하세요.'); 
				return false; 
			} 
			if($('.pw').val() == ''){ 
				alert('비밀번호를 입력하세요.'); 
				return false; 
			} 
		}) 
	})
</script>