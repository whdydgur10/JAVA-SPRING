<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	th{
		background-color: rgb(33,51,87) !important;
		color:white !important;
	}
	table input{
		border: none;
		border-bottom: 1px solid black;
	}
</style>
<div class="consumerContainer">
	<div>
		<h4 style="float:left;">고객리스트</h4>
		<form method="get" style="float:right;">
			<input type="text" class="search" value="${rri.search}" name="search" style="width:250px;">
			<button>검색</button>
		</form>
	</div>
	<table class="table table-hover" style="text-align:center">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>이메일</th>
				<th>포인트</th>
				<th>삭제여부</th>
				<th>삭제일</th>
				<th>특이사항</th>
			</tr>
		</thead>
		<tbody class="ll">
			<c:forEach var="list" items="${userList}">
				<c:if test="${list.auth != 1}">
					<tr>
						<td><a class="id">${list.id}</a></td>
						<td>${list.name}</td>
						<td>${list.phone}</td>
						<td>${list.birthday}</td>
						<td>${list.gender}</td>
						<td>${list.email}</td>
						<td>${list.point}</td>
						<td>
							<select class="isDel">
								<option selected>${list.isDel}</option>
								<c:if test="${list.isDel == 'Y'}"><option>N</option></c:if>
								<c:if test="${list.isDel == 'N'}"><option>Y</option></c:if>
							</select>
						</td>
						<td><c:if test="${list.isDel == 'Y'}">${list.isDelDate}</c:if></td>
						<td><input type="text" class="comment" value="${list.comment}"></td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>
<script>
	var num = 'desc';
	var text;
	var list;
	$('th').click(function(){
		if(text == $(this).text())
			if(num == 'asc')
				num = 'desc';
			else if(num == 'desc')
				num = 'asc';
		text = $(this).text();
		list = {"type":text+num, "search":$('.search').val()}
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(list),
			url:"<%=request.getContextPath()%>/consumerList",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
			    if(data['list'] != null){
					$('.ll').empty();
					for(var i = 0; i < data['list'].length; i++)
						$('.ll').append(data['list'][i]);
				}
		    }
		});
	})
	$('.isDel').change(function(){
		list = {"id":$(this).parents('tr').find('.id').text(), "isDel":$(this).val()};
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(list),
			url:"<%=request.getContextPath()%>/changeConsumer",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
			    if(data['list'] != null){
					$('.ll').empty();
					for(var i = 0; i < data['list'].length; i++)
						$('.ll').append(data['list'][i]);
				}
		    }
		});
	})
	$('.comment').change(function(){
		list = {"id":$(this).parents('tr').find('.id').text(), "comment":$(this).val()};
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(list),
			url:"<%=request.getContextPath()%>/changeConsumer",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
			    if(data['list'] != null){
					$('.ll').empty();
					for(var i = 0; i < data['list'].length; i++)
						$('.ll').append(data['list'][i]);
				}
		    }
		});
	})
</script>