<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/signup.css">
<script src="<%=request.getContextPath() %>/resources/js/user/signup.js"></script>
</head>
<body>
	<form method="POST">
		<thead>
	        <div class="title">
	            회원가입
	        </div>
	    </thead>
	    <tbody>
	        <div class="idContainer">
	            아이디
	            <div class="idbox">
	                <input type="text" name="id" class="id" id="id">
	                <input type="text" name="defalutEmail" readonly placeholder="@naver.com">
	            </div>
	            <label for="id" id="id-error" class="error"></label>
	        </div>
	        <div class="pwContainer1">
	            비밀번호
	            <div class="pwbox">
	                <input type="password" name="pw" class="pw" id="pw">
	            </div>
	            <label for="pw" id="pw-error" class="error"></label>
	        </div>
	        <div class="pwContainer2">
            	비밀번호 재확인
            	<div class="pwbox">
                	<input type="password" id="pw2" class="pw2">
            	</div>
            	<label for="pw2" id="pw2-error" class="error"></label>
        	</div>
        	<div class="nameContainer">
        	이름
        		<div class="namebox">
        			<input type="text" name="name" class="name" id="name">
        		</div>
        		<label for="name" id="name-error" class="error"></label>
        	</div>
	        <div class="emailContainer">
	            본인확인 이메일
	            <div class="emailbox">
	                <input type="text" name="emailId" class="emailId" id="emailId">
	                <p>@</p>
	                <select name="emailSite" class="emailSite">
	                    <option value="naver.com" selected>naver.com</option>
	                    <option value="gmail.com">gmail.com</option>
	                    <option value="kakaocorn.com">kakaocorn.com</option>
	                </select>
	            </div>
	            <label for="emailId" id="emailId-error" class="error"></label>
	        </div>
	        <div class="genderContainer">
	            성별
	            <div class="genderbox">
	                <select name="gender" class='gender' id="gender">
	                    <option value="" selected>성별</option>
	                    <option value="male">남자</option>
	                    <option value="female">여자</option>
	                </select>
	            </div>
	            <label for="gender" id="gender-error" class="error"></label>
	        </div>
	        <div class="birthdayContainer">
	            생년월일
	            <div class="birthdaybox">
	                <select name="year" class="year">
	                    <option value="" selected>년</option>
	                    
	                </select>
	                년
	                <select name="month" class="month">
	                    <option value="" selected>월</option>
	                </select>
	                월
	                <select name="day" class="day">
	                    <option value="" selected>일</option>
	                </select>
	                일
	            </div>
	        </div>
	        <div class="phoneContainer">
	            휴대전화
	            <div class="phonebox">
	                <input type="text" name="num1" class="num1">
	                <p>-</p> <input type="text" name="num2" class="num2">
	                <p>-</p> <input type="text" name="num3" class="num3">
	            </div>
	            <div class="number">
	                <input type="text" name="number" disabled placeholder="인증번호 입력">
	                <button type="button" >인증번호 받기</button>
	            </div>
	        </div>
	    </tbody>
	     <tfoot>
	        <div class="complete">
	            <button type="submit">가입하기</button>
	        </div>
	    </tfoot>
    </form>
	<script>
		$(function(){
			$('.id').keyup(function(){
				var id = $('.id').val();
				var str;
				if(id.length >= 3) {
					$.ajax({
					    async:true,
					    type:'POST',
					    data:id,
					    url:"<%=request.getContextPath()%>/idCheck",
					    dataType:"json",
					    contentType:"application/json; charset=UTF-8",
					    success : function(data){
					        if(data['idCheck']){
								str = '<p style="color:green;font-size:12px;">사용 가능한 아이디입니다.</p>'
							}
					        else{
					            str = '<p style="color:red;font-size:12px;">이미 사용중인 아이디거나 탈퇴한 아이디입니다.</p>'
							}
							$('#id-error').html(str);
					    }
					});
				}else{
					if(id.length == 0)
						$('#id-error').html('필수 항목입니다.');
					else
						$('#id-error').html('아이디는 세글자 이상이어야 합니다.')
				}
			})
			var startYear = 1950;
	    	var endYear = 2100;
	        var month = 12;
	        var day;
	        for(var i = startYear; i <= endYear; i++){
	    		$('.year').append('<option value="'+i+'">'+i+'</option>');
	    	}
	    	for(var i = 1; i <= month; i++){
	    		$('.month').append('<option value="'+i+'">'+i+'</option>');
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
	                $('.day').append('<option value="'+i+'">'+i+'</option>');
	            }
	         })
	         $("form").validate({
				 
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
		            emailId: {
		                required : true,
		            },
		            gender: {
		                required : true
		            }
		        },
		        //규칙체크 실패시 출력될 메시지
		        messages : {
		            pw: {
		                required : "필수로입력하세요",
		                minlength : "최소 {0}글자이상이어야 합니다",
		                minlength : "최대 {0}글자이하이어야 합니다",
		                regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
		            },
		            pw2: {
		                required : "필수로입력하세요",
		                equalTo : "비밀번호가 일치하지 않습니다."
		            },
		            name: {
		                required : "필수로입력하세요"
		            },
		            emailId: {
		                required : "필수로입력하세요"
		            },
		            gender: {
		                required : "필수로입력하세요"
		            }
		        }
		    });
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
</body>
</html>