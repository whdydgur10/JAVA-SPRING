<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>게시글수정</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/detail.css">
<div class="detailContainer">
	<form method="post" enctype="multipart/form-data">
		<div class="header">
			<div class="numBox box">
				<p class="textNum text">게시글 번호</p>
				<p class="dataNum data">${board.num}</p>
			</div>
			<div class="titleBox box">
				<p class="textTitle text">제목</p>
				<input class="dataTitle data" value="${board.title}" name="title">
			</div>
			<div class="viewsBox box">
				<p class="textViews text">조회 수</p>
				<p class="dataViews data">${board.views}</p>
			</div>
			<div class="writerBox box">
				<p class="textWriter text">작성자</p>
				<p class="dataWriter data">${board.writer}</p>
			</div>
			<div class="registerDateBox box">
				<p class="textRegisterDate text"><c:if test="${board.modify == 'Y'.charAt(0)}">최근 수정일</c:if><c:if test="${board.modify != 'Y'.charAt(0)}">작성일<</c:if></p>
				<p class="dataRegisterDate data"><c:if test="${board.modify == 'Y'.charAt(0)}">${board.modifyDate}</c:if><c:if test="${board.modify != 'Y'.charAt(0)}">${board.registerDate}</c:if></p>
			</div>
			<div class="commendBox box">
				<p class="textCommend text">추천</p>
				<p class="dataCommend data">${board.commend}</p>
				<p class="textDeprecated text">비추천</p>
				<p class="dataDeprecated data">${board.deprecated}</p>
			</div>
		</div>
		<div class="fileBox box">
			<p class="textFile">첨부파일</p>
			<div>
				<c:forEach var="file" items="${list}">
					<p class="dataFile">${file.orifile}</p><button type="button" class="deleteDataFile">X</button><input type="hidden" name="file2" value="${file.name}">
				</c:forEach> 
				<button type="button" class="addFile">추가</button>
				<input type="hidden" value="${list.size()}" class="listSize">
			</div>
		</div>
		<div class="body">
			<textarea class="dataContent" name="content" >${board.content}</textarea>
		</div>
		<div class="footer">
			<button type="submit">수정완료</button>
			<a href="<%=request.getContextPath()%>/board/modify?num=${board.num}">초기화</a>
			<a href="<%=request.getContextPath()%>/board/detail?num=${board.num}">취소</a>
		</div>
	</form>
</div>
<script>
	$(function(){
		var fileNum = $('.listSize').val();
		$('.addFile').click(function(){
			if(fileNum < 5){
				$(this).before('<input type="file" name="file" class="file"><button type="button" class="deleteFile">삭제</button>');
				deleteFile($(this).prev())
				fileNum++;
			}
		})
		$('.deleteDataFile').click(function(){
			$(this).prev().remove();
			$(this).next().val('');
			$(this).remove();
			fileNum--;
			console.log(fileNum);
		})
		function deleteFile(obj){
			$(obj).click(function(){
				$(this).prev().remove();
				$(this).remove();
				fileNum--;
			})
		}
	})
</script>