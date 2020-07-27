<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시글 수정</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/global.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/modify.css">
</head>
<body>
	<c:if test="${board.num eq null}">
			<h1>해당 게시물은 없는 게시물입니다.</h1>
		</c:if>
		<c:if test="${board.num ne null}">
			<c:if test="${board.isDel == 'Y'.charAt(0)}">
				<h1>해당 게시물은 삭제되었습니다.</h1>
			</c:if>
			<c:if test="${board.isDel == 'N'.charAt(0)}">
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
							<input type="hidden" class="writer" name="writer" value="${board.writer}">
						</div>
						<div class="detailDate">
							<p class="textDate">작성일</p>
							<p class="dataDate">${board.registerDate}</p>
						</div>
						<div class="detailCommend">
						<p class="textCommend">추천</p>
						<p class="dataCommend" >${board.commend}</p>
						<p class="textDeprecated">비추천</p>
						<p class="dataDeprecated">${board.deprecated}</p>
					</div>
					
					</div>
					<div class="detailBody">
						<textarea class="setDataContent" name="content">${board.content}</textarea>
						<c:if test="${board.file != null}">
							<div class="detailFile">
								<p class="textFile">첨부파일</p>
								<p class="dataFile">${board.orifile}</p>
								<input type="hidden" class="hiddenFile" value="${board.file}" name="file">
								<button class="deleteFile" type="button">X</button>
							</div>
						</c:if>
						<div class="registerFile">
							<p class="textFile">첨부파일</p>
							<input type="file" class="newFile" name="file2">
						</div>
					</div>
					<a href="<%=request.getContextPath() %>/board/modify?num=${board.num}"><button>등록</button></a>
					<a href="<%=request.getContextPath() %>/board/modify?num=${board.num}"><button type="button">초기화</button></a>
					<a href="<%=request.getContextPath() %>/board/detail?num=${board.num}"><button>취소</button></a>
				</form>
			</div>
		</c:if>
	</c:if>
	<script>
		$(function(){
			if($('.hiddenFile').val == null)
				$('.registerFile').css('display','none');
			$('.deleteFile').click(function(){
				$('.detailFile').css('display','none');
				$('.hiddenFile').val('');
				$('.registerFile').css('display','block');
			})
		})
	</script>
</body>
</html>