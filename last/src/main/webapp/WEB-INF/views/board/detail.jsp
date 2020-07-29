<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>게시글${board.num}</title>
<style>
	.detailContainer{
		width: 1100px;
		border: 1px solid black;
		margin: 20px auto;
		height: 800px;
	}
	.box{
		border-bottom: 1px solid black;
		float: left;
	}
	.box>p{
		float: left;
		line-height: 30px;
		height: 30px;
		text-align: center;
		border-right: 1px solid black;
		box-sizing: border-box;
		margin: 0;
	}
	.text{
		width: 40%;
	}
	.numBox, .viewsBox{
		width: 20%;
	}
	.titleBox{
		width: 60%;
	}
	.data{
		width: 60%;
	}
	.dataViews, .dataDeprecated{
		border: none !important;
	}
	.textNum{
		width: 50%
	}
	.dataNum{
		width: 50%;
	}
	.textTitle{
		width: 20%;
	}
	.dataTitle{
		width: 80%;
	}
	.writerBox, .commendBox{
		width: 30%;
	}
	.registerDateBox{
		width: 40%;
	}
	.textCommend, .textDeprecated{
		width: 20%;
	}
	.dataCommend, .dataDeprecated{
		width: 30%;
	}
	.dataContent{
		width: 100%;
		height: 700px;
		border: none;
		border-bottom: 1px solid black;
		resize: none;
		outline: none;
		padding: 10px;
	}
	.footer>a{
		float: left;
		height: 36px;
		color: black;
		line-height: 36px;
		text-align: center;
		padding: 0 10px;
		border-right: 1px solid black;
		display: inline-block;
	}
</style>
<div class="detailContainer">
	<div class="header">
		<div class="numBox box">
			<p class="textNum text">게시글 번호</p>
			<p class="dataNum data">${board.num}</p>
		</div>
		<div class="titleBox box">
			<p class="textTitle text">제목</p>
			<p class="dataTitle data">${board.title}</p>
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
			<p class="textRegisterDate text">작성일</p>
			<p class="dataRegisterDate data">${board.registerDate}</p>
		</div>
		<div class="commendBox box">
			<p class="textCommend text">추천</p>
			<p class="dataCommend data">${board.commend}</p>
			<p class="textDeprecated text">비추천</p>
			<p class="dataDeprecated data">${board.deprecated}</p>
		</div>
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
			<a href="#">수정하기</a>
			<a href="#">삭제하기</a>
		</c:if>
	</div>
</div>