<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/global.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/detail.css">
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
				<div class="detailHead">
					<div class="detailNum">
						<p class="textNum">게시글번호</p>
						<input type="text" class="dataNum" readonly value="${board.num}">		
					</div>
					<div class="detailTitle">
						<p class="textTitle">제목</p>
						<input type="text" class="dataTitle" readonly value="${board.title}">
					</div>
					<div class="detailViews">
						<p class="textViews">조회수</p>
						<input type="text" class="dataViews" readonly value="${board.views}">
					</div>
					<div class="detailWriter">
						<p class="textWriter">작성자</p>
						<input type="text" class="dataWriter" readonly value="${board.writer}">
					</div>
					<div class="detailDate">
						<p class="textDate">작성일</p>
						<input type="text" class="dataDate" readonly value="${board.registerDate}">
					</div>
					<div class="detailCommend">
						<p class="textCommend">추천</p>
						<input type="text" class="dataCommend" readonly value="${board.commend}">
						<p class="textDeprecated">비추천</p>
						<input type="text" class="dataDeprecated" readonly value="${board.deprecated}">
					</div>
					<c:if test="${board.file != null}">
						<div class="detailFile">
							<p class="textFile">첨부파일</p>
							<a href="<%=request.getContextPath()%>/board/download?fileName=${board.file}" class="dataFile">${board.orifile}</a>
						</div>
					</c:if>
				</div>
				<div class="detailBody">
					<div class="dataContent" <c:if test="${board.file != null}">style="height: 605px;"</c:if> >${board.content}</div>
				</div>
				<a href="<%=request.getContextPath() %>/board/list"><button>목록</button></a>
				<c:if test="${user != null}">
					<a href="<%=request.getContextPath() %>/board/register"><button>글쓰기</button></a>
				</c:if>
				<c:if test="${user.id == board.writer}">
					<a href="<%=request.getContextPath() %>/board/modify?num=${board.num}"><button>수정</button></a>
					<a href="<%=request.getContextPath() %>/board/delete?num=${board.num}"><button>삭제</button></a>
				</c:if>
			</div>
		</c:if>
	</c:if>
	<c:if test="${user != null}">
		<script>
			$(function(){
				var boardNum;
				$('.textCommend').click(function(){
					boardNum = $('.dataNum').val();
					$.ajax({
				        async:true,
				        type:'POST',
				        data:boardNum,
				        url:"<%=request.getContextPath()%>/commend",
				        dataType:"json",
				        contentType:"application/json; charset=UTF-8",
				        success : function(data){
						    if(!data['success'])
								alert('한번만 적용됩니다.');
						    else{
								$('.dataCommend').val(data['commend']);
								$('.dataDeprecated').val(data['deprecated']);
							}						     
						}
				    });
				})
				$('.textDeprecated').click(function(){
					boardNum = $('.dataNum').val();
					$.ajax({
				        async:true,
				        type:'POST',
				        data:boardNum,
				        url:"<%=request.getContextPath()%>/deprecated",
				        dataType:"json",
				        contentType:"application/json; charset=UTF-8",
				        success : function(data){
				        	if(!data['success'])
								alert('한번만 적용됩니다.');
				        	else {
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
					alert('로그인 후 이용해주세요.');
				})
				$('.textDeprecated').click(function(){
					alert('로그인 후 이용해주세요.');
				})
			})
		</script>
	</c:if>
</body>
</html>