<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title><c:if test="${user.auth == 1}">공지사항 작성하기</c:if><c:if test="${user.auth == 0}">문의글 작성하기</c:if></title>
<form method="post">
	<c:if test="${user.auth == 0}">
		<div class="form-group">
			<label for="secret">공개글</label>
			<input type="radio" id="secret" name="isSecret" value="Y" checked>
			<label for="secret">비밀글</label>
			<input type="radio" id="secret" name="isSecret" value="Y">
		</div>
	</c:if>
	<div class="form-group">
	    <label for="title"><c:if test="${user.auth == 1}">공지제목<input type="hidden" name="isSecret" value="N"></c:if><c:if test="${user.auth == 0}">문의제목</c:if></label>
	    <input type="text" class="form-control" id="title" name="title" placeholder="기재 안할시 제목없음">
	</div>
	<div class="form-group">
	    <label for="file">첨부파일</label>
	    <input type="text" class="form-control" id="file" name="file">
	</div>
	<div class="form-group">
	    <label for="content"><c:if test="${user.auth == 1}">공지내용</c:if><c:if test="${user.auth == 0}">문의내용</c:if></label>
	    <textarea class="form-control" id="content" style="resize:none;height:300px;overflow:auto" name="content" placeholder="기재 안할시 제목과 동일"></textarea>
	</div>
	<button type="submit" style="height:50px;display:inline-block;line-height:50px;border-top:1px solid black;border-left:1px solid black;width:150px;text-align:center;float:right;background-color:rgb(33,51,87);color:white;">작성완료</button>
</form>
