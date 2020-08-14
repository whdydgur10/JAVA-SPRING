<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
<head>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<body>
	<div style="width:1400px;height:100px;margin:0 auto;text-align:center;position:relative;">
    	<tiles:insertAttribute name="header"/>
    </div>
    <div class="body" style="width:1400px;min-height:500px;margin:0 auto;">
    	<tiles:insertAttribute name="body" />
    </div>
	<tiles:insertAttribute name="footer" />
</body>
</html>