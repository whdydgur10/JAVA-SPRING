<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/signup.css">
<script src="<%=request.getContextPath() %>/resources/js/signup.js"></script>
<title>회원가입</title>
<div class="signupContainer">
	<form method="Post">
		<div class="header">
			<h1>회원가입</h1>
		</div>
		<div class="body">
			<div class="idBox box">
				<h4>아이디</h4>
				<input type="text" name="id" class="id" id="id">
				<label for="id" id="id-check" class="check"></label>
				<label for="id" id="id-error" class="error"></label>
				<button type="button" class="idCheck">중복 체크</button>
			</div>
			<div class="pwBox box">
				<h4>비밀번호</h4>
				<input type="password" name="pw" class="pw" id="pw">
				<label for="pw" id="pw-error" class="error"></label>
			</div>
			<div class="pw2Box box">
				<h4>비밀번호 확인</h4>
				<input type="password" name="pw2" class="pw2" id="pw2">
				<label for="pw2" id="pw2-error" class="error"></label>
			</div>
			<div class="nameBox box">
				<h4>이름</h4>
				<input type="text" name="name" class="name" id="name">
				<label for="name" id="name-error" class="error"></label>
			</div>
			<div class="genderBox box">
				<h4>성별</h4>
				<select name="gender" class="gender" id="gender">
					<option value="" selected>선택</option>
					<option value="male">남성</option>
					<option value="female">여성</option>
				</select>
				<label for="gender" id="gender-error" class="error"></label>
			</div>
			<div class="birthdayBox box">
				<h4>생년월일</h4>
				<select class="year" name="year" id="year">
					<option value="" selected>년</option>
				</select>
				년
				<select class="month" name="month" id="month">
					<option value="" selected>월</option>
				</select>
				월
				<select class="day" name="day" id="day">
					<option value="" selected>일</option>
				</select>
				일
				<input type="hidden" name="birthday" class="birthday">
				<label for="year" id="year-error" class="error"></label>
				<label for="month" id="month-error" class="error"></label>
				<label for="day" id="day-error" class="error"></label>
			</div>
			<div class="phoneBox box">
				<h4>전화번호</h4>
				<input type="text" class="num1" name="num1">
				-
				<input type="text" class="num2" name="num2">
				-
				<input type="text" class="num3" name="num3">
				<input type="hidden" name="phone" class="phone">
				<label for="num1" id="num1-error" class="error"></label>
				<label for="num2" id="num2-error" class="error"></label>
				<label for="num3" id="num3-error" class="error"></label>
				<div class="certification" style="margin-top:5px;">
					<input type="text" name="num4" class="name4" disabled="disabled" placeholder="인증번호 입력" style="width: 250px;text-align:center;">
					<button class="btn-certification" type="button" style="float:right;width:130px;">인증번호 받기</button>
				</div>
			</div>
			<div class="emailBox">
				<h4>이메일</h4><h4 style="opacity: 0.7;font-size:15px;">(선택)</h4>
				<div class="emailBox2">
					<input type="text" name="emailId" class="emailId">@
					<select name="emailSite" class="emailSite">
						<option value="" selected>선택</option>
					</select>
				</div>
				<input type="hidden" name="email" class="email">
			</div>
		</div>
		<div class="footer">
			<button class="btn-signup" type="submit" disabled="disabled" ><h3>가입하기</h3></button>
		</div>
	</form>
</div>
<script>
	$(function(){
		var id;
		var yesId;
		$('.idCheck').click(function(){
			id = $('.id').val();
			$.ajax({
			    async:true,
			    type:'POST',
			    data:id,
			    url:"<%=request.getContextPath()%>/idCheck",
			    dataType:"json",
			    contentType:"application/json; charset=UTF-8",
			    success : function(data){
			        if(data['idCheck'] == true) {
				        $('#id-check').html('<p style="color:red;font-size:12px;">이미 가입중이거나 탈퇴된 아이디입니다</p>');
				        $('button[type=submit]').attr('disabled','disabled');
			        }
			        else {
			            $('#id-check').html('<p style="color:green;font-size:12px;">가입 가능한 아이디입니다</p>');
			            $('button[type=submit]').removeAttr('disabled');
			            yesId = id;
			        }
			    }
			});
		})
		$('.id').change(function(){
			id = $('.id').val();
			if(id == ''){
				$('#id-check').html('');
				$('button[type=submit]').attr('disabled','disabled');
			}else if(yesId != id)
				$('button[type=submit]').attr('disabled','disabled');
		})
				
	})
	
</script>
