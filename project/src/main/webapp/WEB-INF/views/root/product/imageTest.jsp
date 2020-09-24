<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>이미지 생성</title>
<style>
	table th{
		border-top: 2px solid #dee2e6;
		border-bottom: 2px solid #dee2e6;
		font-size: 20px;
	}
	table th, table td{
		padding: .75rem;
		border-bottom: 1px solid #dee2e6;
	}
	table input{
		text-align: center;
	}
	textarea{
		resize: none;
		overflow-y: hidden;
	}
</style>
<div class="imageContainer">
	<div class="card card-default pb-5">
	  	<div id="sizeTable" style="width:800px;margin:0 auto;">
	  		
	    	<canvas id="bar2" style="width:0;height:0;">
	    	</canvas>
	  	</div>
	  	
	</div>
	<div class="save_btn" style="text-align: right;">
		<div>
			<label for="size">행의 수</label>
			<input type="text" id="size" style="width:50px;" value="0">
			<label for="option">열의 수</label>
			<input type="text" id="option" style="width:50px;" value="0" >
			<button type="button" class="mkTable">테이블 생성</button>
			<button type="button" class="mkRemark">참고사항 추가</button>
		</div>
		<a class="hover" href='javascript:void(0);' onclick="PrintDiv($('#sizeTable'));">이미지로 저장</a>
	</div>
</div>

<script>
	var i = 0;
	var width;
	var table;
	$('.mkTable').click(function(){
		var str = '';
		var column = '';
		var row = '';
		$('#sizeTable').empty();
		if($('#size').val() != 0 && $('#size').val() != '' && $('#option').val() != 0 && $('#option').val() != ''){
			str = '<h3>사이즈</h3><table><thead><tr>';
			width = 600/$('#option').val();
			for(i = 0; i < $('#option').val();i++){
				column = column + '<th><input type="text" style="width:' + width + '"></th>';
			}
			str = str + column + '</tr></thead><tbody>';
			for(i = 0; i < $('#size').val()-1;i++){
				row = row + '<tr>' + column + '</tr>';
			}
			console.log(str);
			str = str + row + '<tr><td colspan="' + $('#option').val() + '" style="border:none;"><input type="text" style="border:none;text-align:right;width:100%;" placeholder="ex) 단위 : cm"></td></tr></tbody></table><canvas id="bar2" style="display:none;"></canvas>';
			console.log(str);
			$('#sizeTable').prepend(str);
			table = $('#sizeTable table').css('width');
			removeBorder($('table input'));
		}
	})
	
	$('.mkRemark').click(function(){
		$('#sizeTable').append('<input type="text" style="width:' + table + '">');
		removeBorder($('#sizeTable input'));
	})
	/* onkeydown="resize(this)" onkeyup="resize(this)
		function resize(obj) {
    	obj.style.height = "1px";
	    obj.style.height = (12 + obj.scrollHeight) + "px";
	    
	} */
    
	function removeBorder(obj){
		obj.keyup(function(){
			if($(this).val() != '')
				$(this).css('border','none');
			else
				$(this).css('border','1px solid black');
		});
	}
	function PrintDiv(div){
		div = div[0]
		html2canvas(div).then(function(canvas){
			var myImage = canvas.toDataURL();
			downloadURI(myImage, "size.png") 
		});
	}
	
	function downloadURI(uri, name){
		var link = document.createElement("a")
		link.download = name;
		link.href = uri;
		document.body.appendChild(link);
		link.click();
	}
</script>