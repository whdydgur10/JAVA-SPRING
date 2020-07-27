<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시글${board.num}수정</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/modify.css">
</head>
<body>
	<div class="container detail">
		<form action="<%=request.getContextPath() %>/board/modify" method="POST" enctype="multipart/form-data">
			<div class="detailHead">
				<div class="detailNum">
					<p class="textNum">게시글번호</p>
					<p class="dataNum">${board.num}</p>
					<input type="hidden" name="num" value="${board.num}">
				</div>
				<div class="detailTitle">
					<p class="textTitle">제목</p>
					<input type="text" class="setDataTitle" name="title" value="${board.title}">	
				</div>
				<div class="detailViews">
					<p class="textViews">조회수</p>
					<p class="dataViews">${board.views}</p>
				</div>
				<div class="detailWriter">
					<p class="textWriter">작성자</p>
					<p class="dataWriter">${board.writer}</p>
				</div>
				<div class="detailDate">
					<p class="textDate">작성일</p>
					<p class="dataDate">${board.registerDate}</p>
				</div>
				<div class="detailCommend">
					<p class="textCommend">추천</p>
					<p class="dataCommend">${board.commend}</p>
					<p class="textDeprecated">비추천</p>
					<p class="dataDeprecated">${board.deprecated}</p>
				</div>
				<c:if test="${board.file != null}">
					<div class="detailFile">
							<p class="textFile">첨부파일</p>
							<span>${board.orifile}</span>
							<button type="button" class="btn-del"><i class="fas fa-times"></i></button>
						<input type="hidden" name="file" value="${board.file}" class="display-none">
					</div>
				</c:if>
			</div>
			<div class="detailBody">
				<div class="textContent">내용</div>
				<textarea class="setDataContent" name="content" <c:if test="${board.file == null}">style="height: 585px;"</c:if>>${board.content}</textarea>
				<div class="form-group">
		        	<label>파일</label>
		        	<input type="file" class="form-control" name="file2">
		    	</div>
			</div>
			
			<a href="<%=request.getContextPath() %>/board/modify?num=${board.num}"><button>등록</button></a>
		</form>
	</div>
	<script >
		$(function(){
			$('.btn-del').click(function(){
				$('.detailFile').css('display','none');
				$('input[name=file]').val('');
				$('.detailFile2').css('display','block');
				$('.setDataContent').css('height','585px')
			})
			$('input[name=file2]').change(function(){
				if($('input[name=file]').val() != '') {
					$(this).val('')
					alert('첨부파일을 추가하려면 기존 첨부파일을 삭제하세요.');
				}
			})
		})
	</script>
</body>
</html>