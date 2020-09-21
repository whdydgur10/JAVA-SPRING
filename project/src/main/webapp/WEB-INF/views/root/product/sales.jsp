<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>매출 현황</title>

<input type="hidden" class="today" value="${today}">
<div id="salesMonth" style="height:500px;"></div>
<div style="text-align:right;margin-right:70px;">
	<select class="test" style="width:120px;">
	</select>
</div>
<div id="salesDay" style="height:500px;"></div>
<script>
	var list;
	$.ajax({
		async:true,
		type:'GET',
		url:"<%=request.getContextPath()%>/salesMonth",
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(data){
			list = data['month'];
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawVisualization);
			function drawVisualization(){
				var data = google.visualization.arrayToDataTable([
					[list, '작년매출', '작년지출', '작년수익','-------------', '매출', '지출', '수익'],
					['1월', list[0], list[1], list[2], 0, list[3], list[4], list[5]],
					['2월', list[6], list[7], list[8], 0, list[9], list[10], list[11]],
					['3월', list[12], list[13], list[14], 0, list[15], list[16], list[17]],
					['4월', list[18], list[19], list[20], 0, list[21], list[22], list[23]],
					['5월', list[24], list[25], list[26], 0, list[27], list[28], list[29]],
					['6월', list[30], list[31], list[32], 0, list[33], list[34], list[35]],
					['7월', list[36], list[37], list[38], 0, list[39], list[40], list[41]],
					['8월', list[42], list[43], list[44], 0, list[45], list[46], list[47]],
					['9월', list[48], list[49], list[50], 0, list[51], list[52], list[53]],
					['10월', list[54], list[55], list[56], 0, list[57], list[58], list[59]],
					['11월', list[60], list[61], list[62], 0, list[63], list[64], list[65]],
					['12월', list[66], list[67], list[68], 0, list[69], list[70], list[71]]
				]);
				var options = {
					title : '월별 매출 현황('+ list[72] +'년 기준)',
					vAxis : {title: '금액 기준 (천 원)'},
					hAxis : {title: '월 (작년/올해)'},
					seriesType: 'bars'/* ,
					series: {2: {type: 'line'}} 
					해당 그래프 표시방법
					*/
				};

				var chart = new google.visualization.ComboChart(document.getElementById('salesMonth'));
				chart.draw(data, options);
			}
	    }
	});
	var today = $('.today').val();
	var dayList;
    dayList = (today.split("-"));
	var date = new Date(dayList[0], dayList[1]-1, dayList[2]);
	date.setDate(date.getDate());
	var newDate = new Date(dayList[0], dayList[1]-1, dayList[2]);
	newDate.setDate(newDate.getDate() - 3);
	var i;
	for(i = 0; i < 100; i++){
		year = date.getFullYear();
		month = date.getMonth()+1;
		day = date.getDate();
		if(i == 0)
			$('.test').prepend('<option value="' + year + '-' +  month + '-' + day + '" seleted>' + year + '-' +  month + '-' + day + '</option>');
		else
			$('.test').prepend('<option value="' + year + '-' +  month + '-' + day + '">' + year + '-' +  month + '-' + day + '</option>');
		date.setDate(date.getDate() - 1);
	}
	$.ajax({
		async:true,
		type:'POST',
		data:JSON.stringify(newDate),
		url:"<%=request.getContextPath()%>/salesDay",
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(data){
			var d = data['date'];
			var s = data['day'];
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawVisualization);
			function drawVisualization(){
				var data = google.visualization.arrayToDataTable([
					[list, '작년매출', '작년지출', '작년수익','-------------', '매출', '지출', '수익'],
					[d[1], s[0], s[1], s[2], 0, s[3], s[4], s[5]],
					[d[2], s[6], s[7], s[8], 0, s[9], s[10], s[11]],
					[d[3], s[12], s[13], s[14], 0, s[15], s[16], s[17]],
					[d[4], s[18], s[19], s[20], 0, s[21], s[22], s[23]],
					[d[5], s[24], s[25], s[26], 0, s[27], s[28], s[29]],
					[d[6], s[30], s[31], s[32], 0, s[33], s[34], s[35]],
					[d[7], s[36], s[37], s[38], 0, s[39], s[40], s[41]]
				]);
				var options = {
					title : '일별 매출 현황('+ d[0] +'년 기준)',
					vAxis : {title: '금액 기준 (천 원)'},
					hAxis : {title: '일 (작년/올해)'},
					seriesType: 'bars',
					/* series: {2: {type: 'line'}} 
					해당 그래프 표시방법 */
				};
				var chart = new google.visualization.ComboChart(document.getElementById('salesDay'));
				chart.draw(data, options);
			}
	    }
	});
	$('.test').change(function(){
		dayList = ($(this).val().split("-"));
		newDate = new Date(dayList[0], dayList[1]-1, dayList[2]);
		newDate.setDate(newDate.getDate() - 3);
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(newDate),
			url:"<%=request.getContextPath()%>/salesDay",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				var d = data['date'];
				var s = data['day'];
				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(drawVisualization);
				function drawVisualization(){
					var data = google.visualization.arrayToDataTable([
						[list, '작년매출', '작년지출', '작년수익','-------------', '매출', '지출', '수익'],
						[d[1], s[0], s[1], s[2], 0, s[3], s[4], s[5]],
						[d[2], s[6], s[7], s[8], 0, s[9], s[10], s[11]],
						[d[3], s[12], s[13], s[14], 0, s[15], s[16], s[17]],
						[d[4], s[18], s[19], s[20], 0, s[21], s[22], s[23]],
						[d[5], s[24], s[25], s[26], 0, s[27], s[28], s[29]],
						[d[6], s[30], s[31], s[32], 0, s[33], s[34], s[35]],
						[d[7], s[36], s[37], s[38], 0, s[39], s[40], s[41]]
					]);
					var options = {
						title : '일별 매출 현황('+ d[0] +'년 기준)',
						vAxis : {title: '금액 기준 (천 원)'},
						hAxis : {title: '일 (작년/올해)'},
						seriesType: 'bars',
						/* series: {2: {type: 'line'}} 
						해당 그래프 표시방법 */
					};
					var chart = new google.visualization.ComboChart(document.getElementById('salesDay'));
					chart.draw(data, options);
				}
		    }
		});
	})
</script>