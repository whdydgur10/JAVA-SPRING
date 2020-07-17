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
<script src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
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
	    <tfoot>
	        <div class="complete">
	            <button type="submit">가입하기</button>
	        </div>
	    </tfoot>
	    <tbody>
	        <div class="id">
	            아이디
	            <div class="idbox">
	                <input type="text" name="id">
	                <input type="text" name="defalutEmail" readonly placeholder="@naver.com">
	            </div>
	            <c:if test="${userId}">사용가능한 아이디입니다.</c:if>
	            <c:if test="${userId}">중복된 아이디입니다.</c:if>
	            <button class="currect">중복확인</button>
	        </div>
	        <div class="pw">
	            비밀번호
	            <div class="pwbox">
	                <input type="password" name="pw">
	            </div>
	        </div>
	        <div class="email">
	            본인확인 이메일
	            <div class="emailbox">
	                <input type="text" name="email">
	                @
	                <select name="selectEmail">
	                    <option value="naver.com" selected>naver.com</option>
	                    <option value="gmail.com">gmail.com</option>
	                    <option value="kakaocorn.com">kakaocorn.com</option>
	                </select>
	            </div>
	        </div>
	        <div class="gender">
	            성별
	            <div class="genderbox">
	                <select name="gender" >
	                    <option value="" selected>성별</option>
	                    <option value="male">남자</option>
	                    <option value="female">여자</option>
	                </select>
	            </div>
	        </div>
	        <div class="name">
	            이름
	            <div class="namebox">
	                <input type="text" name="name">
	            </div>
	        </div>
	        <div class="birthday">
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
	        <div class="phone">
	            휴대전화
	            <div class="phonebox">
	                <input type="text">
	                - <input type="text">
	                - <input type="text">
	            </div>
	            <div class="number">
	                <input type="text" name="number" disabled placeholder="인증번호 입력">
	                <button type="submit" >인증번호 받기</button>
	            </div>
	        </div>
	    </tbody>
    </form>
</body>
</html>