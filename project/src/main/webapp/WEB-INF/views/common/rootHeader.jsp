<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1 style="line-height:100px;cursor:pointer;display:inline-block;margin:0 auto;">관리자페이지입니다.</h1>
<a href="<%=request.getContextPath()%>/?mainCategory=<c:if test="${user.gender == 'M'}">M</c:if><c:if test="${user.gender == 'W'}">W</c:if><c:if test="${user == null}">MW</c:if>&middleCategory=&subCategory=&search=" style="position:absolute;top:0px;right:0px;font-size:15px;right:500px;">메인페이지</a>
<a href="<%=request.getContextPath()%>/root/page" style="position:absolute;top:0px;right:0px;font-size:15px;right:400px;">관리자페이지</a>
<script>
	$('h1').click(function(){
		location.href='<%=request.getContextPath()%>/root/page';
	})
</script>