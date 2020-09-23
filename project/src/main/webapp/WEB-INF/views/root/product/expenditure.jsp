<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="multipart/form-data; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>지출 내역</title>
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
<form id="uploadFrm" enctype="multipart/form-data">
  <p>데이터 업로드<br>엑셀파일만 업로드 가능(xls, xlsx)</p>
  <input type="file" name="upFile" id="upFile" accept=".xlsx, .xls"/>
</form>

<div class="expendifureContainer">
	<input type="hidden" class="today" value="${today}">
	<input type="hidden" class="search" value="${rri.search}">
	<div>
		<h4 style="float:left;">지출 내역<span style="font-size:12px;opacity:0.7;">(최근 12개월 정보만 나타납니다.)</span></h4>
		<form method="get" style="float:right;">
			<span>연도별</span>
			<select name="search" style="width:120px;" id="year">
				<option value="">선택</option>
			</select>
			<button class="year" hidden=""></button>
		</form>
	</div>
	<table class="table table-hover" style="text-align:center">
		<thead>
			<tr>
				<th>날짜</th>
				<th>인건비</th>
				<th>홍보비</th>
				<th>운영비</th>
				<th>원금</th>
				<th>총 지출액</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${expenditure}">
				<tr>
					<td>${list.stringDate}</td>
					<td>${list.stringLabor}</td>
					<td>${list.stringPr}</td>
					<td>${list.stringOperating}</td>
					<td>${list.stringCost}</td>
					<td>${list.stringExpend}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script>
	var today = $('.today').val();
    var search = $('.search').val();
    for(var i = 2020; i <= today; i++){
    	console.log(i);
    	console.log(search);
    	if(i == search)
    		$('#year').append('<option value="' + i + '" seleted>' + i + '년</option>');
    	else
    		$('#year').append('<option value="' + i + '">' + i + '년</option>');
    }
    $('#year').change(function(){
    	$('.year').click();
    })
	let upFile = $('#upFile')[0];
	upFile.addEventListener('change', function() {
	    let form = $('#uploadFrm')[0];
	    let frmData = new FormData(form);
	
	    $.ajax({
	        enctype: 'multipart/form-data',
	        type: 'POST',
	        url: "<%=request.getContextPath()%>/insertExpenditure",
	        processData: false,   
	        contentType: false,
	        cache: false,
	        data: frmData,
	        success: function(data) {
	            location.reload();
	        },
	        error: function(e) {
	            alert('파일업로드 실패');
	        }
	    });
	});
</script>