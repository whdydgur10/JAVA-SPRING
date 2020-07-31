<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>게시글작성</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/register.css">
<div class="registerContainer">
	<form method="post" enctype="multipart/form-data">
		<div class="titleBox box">
			<h4>제목</h4>
			<input type="text" name="title" class="title">
		</div>
		<div class="fileBox box">
			<h4>첨부파일</h4>
			<div>
				<input type="file" name="file" class="file"><button type="button" class="deleteFile">삭제</button>
			</div>
		</div>
		<button type="button" class="addFile">추가</button>
		<div class="titleBox box">
			<h4>내용</h4>
			<textarea class="content" name="content"></textarea>
		</div>
		<button type="submit">등록하기</button>
	</form>
</div>
<script>
	$(function(){
		var fileCnt = 1;
		$('.addFile').click(function(){
			if(fileCnt <= 4){
				$('.fileBox').append('<div><input type="file" name="file" class="file"><button type="button" class="deleteFile">삭제</button></div>');
				fileCnt++;
				deleteFile($('.fileBox').last().children().find('.deleteFile'));
			}	
		})
		function deleteFile(obj){
			$(obj).click(function(){
				$(this).parent().remove();
				fileCnt--;
			})
		}
		deleteFile($('.deleteFile'));
	})
</script>