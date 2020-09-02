<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title><c:if test="${vaginal.auth == 1}">공지사항</c:if><c:if test="${vaginal.auth == 0}">문의글${vaginal.registerNum}</c:if></title>
<div class="form-group">
    <label for="title"><c:if test="${vaginal.auth == 1}">공지제목</c:if><c:if test="${vaginal.auth == 0}">문의제목</c:if></label>
    <input type="text" class="form-control" id="title" value="${vaginal.title}" readonly>
</div>
<div class="form-group">
    <label for="name">작성자</label>
    <input type="text" class="form-control" id="name" value="${vaginal.name}" readonly>
</div>
<div class="form-group">
    <label for="file">첨부파일</label>
    <input type="text" class="form-control" id="file" value="" readonly>
</div>
<div class="form-group">
    <label for="content"><c:if test="${vaginal.auth == 1}">공지내용</c:if><c:if test="${vaginal.auth == 0}">문의내용</c:if></label>
    <textarea readonly class="form-control" id="content" style="resize:none;height:300px;overflow:auto">${vaginal.content}</textarea>
</div>
<c:if test="${answer != null}">
	<div class="form-group">
	    <label for="answerContent">답변내용</label>
	    <textarea readonly class="form-control" id="answerContent" style="resize:none;height:300px;overflow:auto">${answer.content}</textarea>
	</div>
</c:if>
<c:if test="${answer == null && user.auth == 1}">
	<form>
		<div class="form-group">
		    <label for="content">답변내용</label>
		    <textarea class="form-control" id="answerContent" style="resize:none;height:300px;overflow:auto" name="content"></textarea>
		</div>
	</form>
</c:if>