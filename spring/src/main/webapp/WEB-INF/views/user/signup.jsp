<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/detail.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/user/signup.css">
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
	                <input type="text" name="id" class="id">
	                <input type="text" name="defalutEmail" readonly placeholder="@naver.com">
	            </div>
	            <div class="dup-fail-msg display-none">이미 사용중이거나 탈퇴한 아이디입니다.</div>
	            <div class="dup-success-msg display-none">가능한 아이디입니다.</div>
	        </div>
	        <div class="pwContainer1">
	            비밀번호
	            <div class="pwbox">
	                <input type="password" name="pw" class="pw" id="pw">
	            </div>
	        </div>
	        <div class="pwContainer2">
            	비밀번호 재확인
            	<div class="pwbox">
                	<input type="password" id="pw2" class="pw" name="pw2">
            	</div>
        	</div>
	        <div class="emailContainer">
	            본인확인 이메일
	            <div class="emailbox">
	                <input type="text" name="emailId" id="emailId">
	                <p>@</p>
	                <select name="selectEmail" id="selectEmail">
	                    <option value="naver.com" selected>naver.com</option>
	                    <option value="gmail.com">gmail.com</option>
	                    <option value="kakaocorn.com">kakaocorn.com</option>
	                </select>  
	            </div>
	        </div>
	        <div class="genderContainer">
	            성별
	            <div class="genderbox">
	                <select name="gender" id='gender'>
	                    <option value="" selected>성별</option>
	                    <option value="male">남자</option>
	                    <option value="female">여자</option>
	                </select>
	            </div>
	        </div>
	        <div class="nameContainer">
	            이름
	            <div class="namebox">
	                <input type="text" name="name">
	            </div>
	        </div>
	        <div class="birthdayContainer">
	            생년월일
	            <div class="birthdaybox">
	                <select name="year" id="year">
	                    <option value="" selected>년</option>
	                    
	                </select>
	                년
	                <select name="month" id="month">
	                    <option value="" selected>월</option>
	                </select>
	                월
	                <select name="day" id="day">
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
			$('.id-null').addClass('display-none');
			var id = $(this).val();
			if(id.length >= 4) 
				$.ajax({
					async:true,
				    type:'POST',
				    data:id,
				    url:"<%=request.getContextPath()%>/idCheck",
				    dataType:"json",
				    contentType:"application/json; charset=UTF-8",
				    success : function(data){
					    if(data['check']){
							$('.dup-success-msg').removeClass('display-none');
							$('.dup-fail-msg').addClass('display-none');
						}else{
							$('.dup-success-msg').addClass('display-none');
							$('.dup-fail-msg').removeClass('display-none');
						}
				        console.log(data);
				    }
				});
			else{
				$('.dup-fail-msg').addClass('display-none');
				$('.dup-success-msg').addClass('display-none');
			}
		})
		$("form").validate({
			 submitHandler: function(form) {
		    	//이메일을 아이디를 인풋으로 사이트를 셀렉트로 할 경우 이 곳에서 각자의 값을 가져와 합쳐줄 수 있다. 연락처나 생년월일 동일
		    	//<input type="hidden" name="email">으로 합친 값을 보내준다.
		   		$(form).submit();
		   	}
	        rules: {
	            id: {
	                required : true,
	                minlength : 4
	            },
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
	                required : true,
	                minlength : 2
	            },
	            emailId: {
	                required : true,
	                email : true
	            },
	            gender: {
	                required : true,
	            }
	        },
	        //규칙체크 실패시 출력될 메시지
	        messages : {
	            id: {
	                required : "필수로입력하세요",
	                minlength : "최소 {0}글자이상이어야 합니다"
	            },
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
	                required : "필수로입력하세요",
	                minlength : "최소 {0}글자이상이어야 합니다"
	            },
	            email: {
	                required : "필수로입력하세요",
	                email : "메일규칙에 어긋납니다"
	            },
	            gender: {
	                required : "필수로입력하세요",
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