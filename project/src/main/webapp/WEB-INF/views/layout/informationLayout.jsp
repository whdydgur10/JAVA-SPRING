<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
<head>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/information.css">
</head>
<body>
    <tiles:insertAttribute name="header"/>
    <div class="middleContainer" style="width:1400px;border:1px solid black;height:700px;margin:20px auto;">
	<div class="leftContainer" style="width:200px;height:100%;float:left;background-color:rgb(33,51,87);">
		<ul style="list-style:none;text-align:center;margin:0;padding:0;">
			<li><a href="<%=request.getContextPath()%>/information/all" class="information <c:if test="${menu == 'all'}">select</c:if>" data-target=".all">내 정보</a></li>
			<li><a href="<%=request.getContextPath()%>/information/account" class="information <c:if test="${menu == 'account'}">select</c:if>" data-target=".account">계정</a></li>
			<li><a href="<%=request.getContextPath()%>/information/level" class="information <c:if test="${menu == 'level'}">select</c:if>">레벨</a></li>
			<li><a href="<%=request.getContextPath()%>/information/coupon" class="information <c:if test="${menu == 'coupon'}">select</c:if>">쿠폰</a></li>
			<li><a href="<%=request.getContextPath()%>/information/point" class="information <c:if test="${menu == 'point'}">select</c:if>">적립금</a></li>
			<li><a href="<%=request.getContextPath()%>/information/purchaseList" class="information <c:if test="${menu == 'purchaseList'}">select</c:if>">주문내역</a></li>
			<li><a href="<%=request.getContextPath()%>/information/vaginal" class="information <c:if test="${menu == 'vaginal'}">select</c:if>">문의내역</a></li>
			<li><a href="<%=request.getContextPath()%>/information/shoppingBasket" class="information <c:if test="${menu == 'shoppingBasket'}">select</c:if>">장바구니</a></li>
			<li><a href="<%=request.getContextPath()%>/information/review" class="information <c:if test="${menu == 'review'}">select</c:if>">후기</a></li>
		</ul>
	</div>
	<div class="centerContainer" style="width:900px;height:100%;border-right:1px solid black;border-left:1px solid black;box-sizing:border-box;float:left;padding:20px;">
		<tiles:insertAttribute name="body" />
	</div>
	<div class="rightContainer" style="width:297px;height:100%;float:left;">
	
	</div>
</div>
	<tiles:insertAttribute name="footer" />
<script>
	
</script>
</body>
</html>