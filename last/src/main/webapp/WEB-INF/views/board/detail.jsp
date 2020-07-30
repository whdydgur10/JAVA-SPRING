<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>게시글${board.num}</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/detail.css">
<div class="detailContainer">
	<div class="header">
		<div class="numBox box">
			<p class="textNum text">게시글 번호</p>
			<p class="dataNum data">${board.num}</p>
			<input type="hidden" class="hiddenNum" value="${board.num}">
		</div>
		<div class="titleBox box">
			<p class="textTitle text">제목</p>
			<p class="dataTitle data">${board.title}<c:if test="${board.modify == 'Y'.charAt(0)}">(수정)</c:if></p>
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
			<input type="text" class="dataCommend data" value="${board.commend}" readonly>
			<p class="textDeprecated text">비추천</p>
			<input type="text" class="dataDeprecated data" value="${board.deprecated}" readonly>
		</div>
		<c:if test="${list.size() != 0}">
			<div class="fileBox box">
				<p class="textFile">첨부파일</p>
				<c:forEach var="file" items="${list}">
					<a href="<%=request.getContextPath()%>/board/download?fileName=${file.name}">${file.orifile}</a>
				</c:forEach> 
			</div>
		</c:if>
	</div>
	<div class="body">
		<textarea class="dataContent" readonly>${board.content}</textarea>
	</div>
	<div class="footer">
		<a href="<%=request.getContextPath()%>/board/list">게시판가기</a>
		<c:if test="${user != null}">
			<a href="<%=request.getContextPath()%>/board/register">작성하기</a>
		</c:if>
		<c:if test="${user.id == board.writer}">
			<a href="<%=request.getContextPath()%>/board/modify?num=${board.num}">수정하기</a>
			<a href="<%=request.getContextPath()%>/board/delete?num=${board.num}">삭제하기</a>
		</c:if>
	</div>
</div>
<c:if test="${user != null}">
	<script>
		$(function(){
			$('.textCommend').click(function(){
				var num = $('.hiddenNum').val();
				$.ajax({
					async:true,
					type:'POST',
					data:num,
					url:"<%=request.getContextPath()%>/commend",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					success : function(data){
					   if(data['isCommend'] == false)
						   alert('추천은 한번만 가능합니다.')
						else{
							$('.dataCommend').val(data['commend']);
							$('.dataDeprecated').val(data['deprecated']);
						}
				    }
				});
			})
			$('.textDeprecated').click(function(){
				var num = $('.hiddenNum').val();
				$.ajax({
					async:true,
					type:'POST',
					data:num,
					url:"<%=request.getContextPath()%>/deprecated",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					success : function(data){
					   if(data['isCommend'] == false)
						   alert('비추천은 한번만 가능합니다.')
						else{
							$('.dataCommend').val(data['commend']);
							$('.dataDeprecated').val(data['deprecated']);
						}
				    }
				});
			})
		})
	</script>
</c:if>
<c:if test="${user == null}">
	<script>
		$(function(){
			$('.textCommend').click(function(){
				alert('로그인 후 이용해주세요');
			})
			$('.textDeprecated').click(function(){
				alert('로그인 후 이용해주세요');
			})
		})
	</script>
</c:if>
