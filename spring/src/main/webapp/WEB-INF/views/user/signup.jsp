<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/detail.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/user/signup.css">
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery-ui.js"></script>
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
	            <c:if test="${userId}">사용가능한 아이디입니다.</c:if>
	            <c:if test="${userId}">중복된 아이디입니다.</c:if>
	            <button type="button" class="currect">중복확인</button>
	        </div>
	        <div class="pwContainer1">
	            비밀번호
	            <div class="pwbox">
	                <input type="password" name="pw" class="pw" id="pw1">
	            </div>
	        </div>
	        <div class="pwContainer2">
            	비밀번호 재확인
            	<div class="pwbox">
                	<input type="password" id="pw2" class="pw">
            	</div>
            	<p id="success" class="display-none">비밀번호가 일치합니다.</p>
            	<p id="danger" class="display-none">비밀번호가 일치하지 않습니다.</p>
        	</div>
	        <div class="emailContainer">
	            본인확인 이메일
	            <div class="emailbox">
	                <input type="text" name="email" id="email">
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
        var isPw = false;
    	$('.pw').focusout(function () {
            var pwd1 = $("#pw1").val();
            var pwd2 = $("#pw2").val();
            if ( pwd1 != '' && pwd2 == '' ) {
                null;
            } else if (pwd1 != "" || pwd2 != "") {
                if (pwd1 == pwd2) {
                    $("#success").removeClass('display-none');
                    $("#danger").addClass('display-none');
                    isPw = true;
                } else {
                    $("#success").addClass('display-none');
                    $("#danger").removeClass('display-none');
                    isPw = false;
                }
            }
        })
		$('form').submit(function(){
			if($('.id').val() == ''){
				alert('아이디를 입력하세요.');
				return false;
			}
			if($('.pw').val() == ''){
				alert('비밀번호를 입력하세요.');
				return false;
			}
			if(isPw == false){
				alert('비밀번호를 확인하세요.');
				return false;
			}
			if($('.email').val() == '' || $('.email option:selected').val() == ''){
				alert('이메일을 확인하세요.');
				return false;
			}
			if($('.gender').val() == ''){
				alert('성별을 입력하세요.');
				return false;
			}
			if($('.year option:selected').val() == '' || $('.month option:selected').val() == '' || $('.day option:selected').val() == ''){
				alert('생년월일을 확인하세요.');
				return false;
			}
			if($('.num1').val() == '' || $('.num2').val() == '' || $('.num3').val() == ''){
				alert('전화번호를 확인하세요.');
				return false;
			}
		})
    })
</script>
</body>
</html>