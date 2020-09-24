<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>회원가입</title>
<style>
	input, select{
		autocomplete="off"
	}
	form>div{
		width: 400px;
		margin: 15px auto;
	}
	.id{
		width: 400px;
	}
	.idCheck{
		margin-top: 10px;
		float: right;
		width: 90px;
	}
	.pw, .pw2, .name, .gender{
		width: 400px;
	}
	.year, .month, .day{
		width: 108px;
	}
	.num1, .num2, .num3{
		width: 119px;
	}
	.emailBox>h4{
		display: inline-block;
	}
	.emailId{
		width: 250px;
	}
	.emailSite{
		width: 130px;
	}
	h3{
		margin:0;
	}
	.vali{
		color:red;
	}
</style>
<div style="background-color:rgb(33,51,87)">
	<div style="text-align:center;width:1200px;font-size:50px;margin:0 auto;font-weight:bold;color:white;">빠숑 회원가입 하기!<span style="font-size:40px">!</span><span style="font-size:30px">!</span></div>
</div>
<hr style="width:100%;border-top-width:7px;">
<div class="signupContainer" style="width:1200px;min-height:800px;margin:0 auto 20px;">
	<form method="post">
		<div class="idBox box">
			<h4><span class="vali">*</span>아이디</h4>
			<input type="text" name="id" class="id" id="id">
			<label for="id" id="id-check" class="check"></label>
			<button type="button" class="idCheck">중복 체크</button>
		</div>
		<div class="pwBox box">
			<h4><span class="vali">*</span>비밀번호</h4>
			<input type="password" name="pw" class="pw" id="pw">
		</div>
		<div class="pw2Box box">
			<h4><span class="vali">*</span>비밀번호 확인</h4>
			<input type="password" name="pw2" class="pw2" id="pw2">
		</div>
		<div class="nameBox box">
			<h4><span class="vali">*</span>이름</h4>
			<input type="text" name="name" class="name" id="name">
		</div>
		<div class="genderBox box">
			<h4>성별</h4>
			<select name="gender" class="gender" id="gender">
				<option value="" selected>선택</option>
				<option value="M">남성</option>
				<option value="W">여성</option>
			</select>
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
		</div>
		<div class="phoneBox box">
			<h4><span class="vali">*</span>전화번호</h4>
			<input type="text" class="num1" maxlength="3">
			-
			<input type="text" class="num2" maxlength="4">
			-
			<input type="text" class="num3" maxlength="4">
			<input type="hidden" name="phone" id="phone" class="phone">
			<div class="certification" style="margin-top:5px;">
				<input type="text" class="num4" name="num4" disabled="disabled" placeholder="인증번호 입력" style="width: 250px;text-align:center;">
				<input type="hidden" class="num5" name="num5" id="num5" >
				<button class="btn-certification" type="button" style="float:right;width:130px;">인증번호 받기</button>
			</div>
		</div>
		<div class="emailBox">
			<h4><span class="vali">*</span>이메일</h4>
			<div class="emailBox2">
				<input type="text" name="emailId" class="emailId">@
				<select name="emailSite" class="emailSite">
					<option value="" selected>선택</option>
				</select>
			</div>
			<input type="hidden" name="email" class="email" id="email">
		</div>
		<div class="footer" style="text-align:center;">
			<button class="btn-signup" type="button" disabled="disabled" style="margin-right:15px;"><h3>가입하기</h3></button>
			<a href="<%=request.getContextPath()%>/" style="margin-left:15px;"><button type="button"><h3>취소할래</h3></button></a>
			<button type="submit" class="submit-signup" hidden=""></button>
		</div>
	</form>
</div>
<script>
	$(function(){
		$('.btn-certification').hover(function(){
			var num1 = $('.num1').val();
			var num2 = $('.num2').val();
			var num3 = $('.num3').val();
			if(num1 != '' && num2 != '' && num3 != '')
				$('.phone').val(num1 + num2 + num3);
		})
		
		$('.btn-certification').click(function(){
			$(this).prev().prev().removeAttr('disabled');
			var phone = $('.phone').val();
			$.ajax({
				async:true,
				type:'POST',
				data:phone,
				url:"<%=request.getContextPath()%>/phoneCheck",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
				    $('.num5').val(data['num']);
			    }
			});
		})
		
		$('.num4').change(function(){
			if($('.num5').val() != $(this).val())
				alert('인증번호가 일치하지 않습니다.');
		})
		
		$('.btn-signup').hover(function(){
			var email = $('.emailId').val() + $('.emailSite').val();
			$('.email').val(email);
		})
		
		$('.btn-signup').click(function(){
			if($('.phone').val() != '' && $('.email').val() != '' && $('.num5').val() == $('.num4').val() && $('.num4').val() != '')
				$('.submit-signup').click();
		})
		
		$('.phoneBox input').keypress(function(event){
            if(event.keyCode >= 48 && event.keyCode <= 57){
                return true;
            }else{
                return false;
            }
        })
        
		var startYear = 1930;
		var endYear = 2020;
		var month = 12;
		var day;
		for(var i = startYear; i <= endYear; i++) {
			$('.year').append('<option value="'+ i +'">' + i + '</option>');
		}
		for(var i = 1; i <= month; i++) {
			if(i < 10)
				$('.month').append('<option value="0'+ i +'">' + i + '</option>');
			else
				$('.month').append('<option value="'+ i +'">' + i + '</option>');
		}
		
		$('.month').click(function(){
			if($('.month').val() == 1 || $('.month').val() == 3 || $('.month').val() == 5 || $('.month').val() == 7 || $('.month').val() == 8 || $('.month').val() == 10 || $('.month').val() == 12)
		        day = 31;
		    if($('.month').val() == 2)
		        day = 28;
		    if($('.month').val() == 4 || $('.month').val() == 6 || $('.month').val() == 9 || $('.month').val() == 11)
		        day = 30;
		    $('.day').empty();
		    $('.day').append('<option value="" selected>일</option>');
			for(var i = 1; i <= day; i++){
				if(i < 10)
					$('.day').append('<option value="0'+i+'">'+i+'</option>');
				else
		        	$('.day').append('<option value="'+i+'">'+i+'</option>');
		    }
		})
		
		var emailSite = ['naver.com','kakao.com','gmail.com','yahoo.com','daum.net'];
		for(var i = 0; i < emailSite.length; i++) {
			$('.emailSite').append('<option value="@' + emailSite[i] + '">' + emailSite[i] +'</option>');
		}
		
		$("form").validate({
			submitHandler: function(form) {
				var birthday = $('.year').val() + $('.month').val() + $('.day').val();
				$('.birthday').val(birthday);
			   	$(form).submit();
			},
		    rules: {
		        pw: {
		            required : true,
		            minlength : 8,
		            maxlength : 20,
		            regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/
		        },
		        pw2: {
		            required : true,
		            equalTo : pw
		        },
		        name: {
		            required : true
		        },
		        num4: {
		            required : true,
		            equalTo : num5
		        },
		        email: {
		            required : true
		        }
		    },
		    messages : {
		        pw: {
		            required : "필수 입력입니다",
		            minlength : "최소 {0}글자이상이어야 합니다",
		            maxlength : "최대 {0}글자이하이어야 합니다",
		            regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
		        },
		        pw2: {
		            required : "필수 입력입니다",
		            equalTo : "비밀번호가 일치하지 않습니다."
		        },
		        name: {
		            required : "필수 입력입니다"
		        },
		        num4: {
		            required : "전화번호 인증이 필요합니다.",
		            equalTo : "인증번호가 일치하지 않습니다."
		        },
		        email: {
		            required : "필수 입력입니다"
		        }
		    }
		});
		
		var id;
		var yesId = null;
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
				$('#id-check').html('<p style="color:red;font-size:12px;">필수 입력입니다</p>');
				$('button[type=submit]').attr('disabled','disabled');
			}else if(yesId != id)
				$('button[type=submit]').attr('disabled','disabled');
		})
	})
	
	$.validator.addMethod(
		"regex",
		function(value, element, regexp) {
		    var re = new RegExp(regexp);
		    return this.optional(element) || re.test(value);
		},
		"Please check your input."
	);
</script>