<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
<style>
	
</style>
<div class="head">
	<div class="logo" style="text-align: center;width:1400px;margin:0 auto;position: relative;">
		<a href="<%=request.getContextPath()%>/?mainCategory=<c:if test="${user.gender == 'M'}">M</c:if><c:if test="${user.gender == 'W'}">W</c:if><c:if test="${user == null}">MW</c:if>&middleCategory=&subCategory=&search=" style="color:rgb(33,51,87);font-size:80px;"><img src="<%=request.getContextPath()%>/resources/img/logo.jpg" style="height:106;position:absolute;left:500px;top:10px;"> 빠숑</a>
			<div class="use" style="position: absolute;right:0;top:0;">
			<c:if test="${user == null}"><a href="<%=request.getContextPath()%>/root/page">관리자페이지 | </a></c:if>
			<c:if test="${user == null}"><a href="<%=request.getContextPath()%>/user/signin">로그인</a></c:if><c:if test="${user != null}"><a href="<%=request.getContextPath()%>/user/signout">로그아웃</a></c:if> 
			| <c:if test="${user == null}"><a href="<%=request.getContextPath()%>/user/signup">회원가입</a></c:if><c:if test="${user != null}"><a href="<%=request.getContextPath()%>/information/all">내 정보</a></c:if> 
			| <a href="<%=request.getContextPath()%>/vaginal/list">문의사항</a>
		</div>
	</div>
</div>