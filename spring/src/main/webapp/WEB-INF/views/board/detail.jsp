<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/detail.css">
</head>
<body>
	<div class="container detail">
		<form action="<%=request.getContextPath() %>/board/register" method="POST">
			<div class="detailHead">
				<div class="detailNum">
					<p class="textNum">게시글번호</p>
					<p class="dataNum">${board.num}</p>
					<input class="num" type="hidden" value="${board.num}">
				</div>
				<div class="detailTitle">
					<p class="textTitle">제목</p>
					<p class="dataTitle">${board.title}</p>	
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
					<input class="dataCommend" name="commend" value="${board.commend}" readonly>
					<p class="textDeprecated">비추천</p>
					<input class="dataDeprecated" name="deprecated" value="${board.deprecated}" readonly>
				</div>
				<c:if test="${board.file != null}">
				<div class="datailFile">
					<p class="textFile">첨부파일</p>
					<a href="<%=request.getContextPath() %>/board/download?fileName=${board.file}" class="dataFile">${board.orifile}</a>
				</div>
			</c:if>
			</div>
			<div class="detailBody">
				<div class="dataContent" <c:if test="${board.file != null}">style="height: 555px;"</c:if> <c:if test="${board.file == null}">style="height: 585px;"</c:if>>${board.content}</div>
			</div>
			
		</form>
		<div class="datailFooter">
			<a href="<%=request.getContextPath() %>/board/list?page=${cri.page}&type=${cri.type}&search=${cri.search}">목록</a>
			<c:if test="${board.writer == user.id && user != null}">
				<a href="<%=request.getContextPath() %>/board/modify?num=${board.num}">수정</a>
				<a href="<%=request.getContextPath() %>/board/delete?num=${board.num}">삭제</a>
			</c:if>
		</div>
	</div>
<c:if test="${user != null}">
	<script>
		$(function(){
			var type;
			$('.textCommend').click(function(){
				type = 'commend';
				count(type);
			})
			$('.textDeprecated').click(function(){
				type = 'deprecated';
				count(type);
			})
			function count(type) {
				var num = $('.num').val();
				if(type == 'commend'){	
					$.ajax({
						async:true,
						type:'POST',
						data:{"num":num,"type":type}
						url:"<%=request.getContextPath()%>/board/commend",
						dataType:"json",
						contentType:"application/json; charset=UTF-8",
						success : function(data){
							if(data['commend']==-1){
								alert("이미 추천된 글입니다..");
							}else{
								$('input[name="commend"]').val(data['commend']);
							}
						}
					});
				}
			}
		})
	</script>
</c:if>
</body>
</html>