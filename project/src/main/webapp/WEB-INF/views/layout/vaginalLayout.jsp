<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
<head>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<body>
    <tiles:insertAttribute name="header"/>
    <div class="vaginalContainer" style="width:1400px;min-height:600px;margin:20px auto 50px;">
    	<tiles:insertAttribute name="body" />
    </div>                                       
	<tiles:insertAttribute name="footer" />
</body>
</html>