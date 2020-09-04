<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>내 정보</title>
<style>
	tbody td:nth-of-type(2) {
		text-align: left;
	}
	.table td, .table th{
		 vertical-align: baseline;
	}
	a:hover {
		text-decoration: none;
		color: black;
	}
</style>
<form method="post">
	<div class="shoppingBasket">
		<h4>장바구니<span style="opacity: 0.7;font-size:15px;">(담은 물건은 7일간만 유지됩니다.)</span></h4>
		<hr>
		<div style="width:100%;height:500px;box-shadow: 2px 2px 2px 2px;margin-top:20px;">
			<div style="width:100%;height:500px;overflow:auto;">
				<table class="table table-hover" style="text-align:center;">
					<thead>
						<tr>
							<th style="width:60px;"><input type="checkbox"></th>
							<th style="width:620px;">상품정보</th>
							<th style="width:130px;">상품가격</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${shoppingBasketList.size() == 0}">
							<tr>
								<td colspan = "4">장바구니 내역이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${shoppingBasketList.size() != 0}">
							<c:forEach var="list" items="${shoppingBasketList}" varStatus="status">
								<tr>
									<td style="width:60px;">
										<input type="checkbox" value="${list.shoppingNum}">
									</td>
									<td style="width:620px;">
										<a href="<%=request.getContextPath()%>/product/detail?mainCategory=${list.mainCategory}&productCode=${list.productCode}" style="height:50px;display:inline-block;">
										<img src="<%=request.getContextPath()%>/resources/img/${list.thumbnailImage}" style="width:50px;height:50px;">
										<span>${list.mainTitle} 옵션 : (${list.color}, ${list.size} / ${list.purchase}개)</span><br>
										</a>
										<input type="hidden" class="purchase" value="${list.purchase}">
										<input type="hidden" class="optionCode" value="${list.optionCode}">
										<input type="hidden" class="enrollNum" value="${list.enrollNum}">
									</td>
									<td style="width:130px;">${list.stringFinalPrice}원</td>
									<td ><button class="btn-del" style="border:none;background:transparent;">X</button></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	<a href="<%=request.getContextPath()%>/product/order?mainCategory=${user.gender}" class="btn-submit" style="opacity:0.5;height:50px;display:inline-block;line-height:50px;border-left:1px solid black;width:250px;text-align:center;background-color:rgb(33,51,87);color:white;margin-left:300px;margin-top:30px;cursor:default;"><span class="allPrice">0</span>원 구매하기</a>
	<span style="font-size:12px;opacity: 0.7;">(5만원 미만 주문은 배송료가 붙습니다.)</span>
	</div>
</form>
<script>
	var check;
	var list = [];
	var i;
	var index;
	var num;
	var shoppingNum = [];
	var purchase = [];
	var optionCode =[];
	var enrollNum =[];
	$('thead input[type=checkbox]').click(function(){
		check = $(this).prop('checked');
		if(check == true){
			for(i = 0; i < $('tbody input[type=checkbox]').length; i++){
				index = $('tbody input[type=checkbox]')[i];
				if($(index).prop('checked') == false){
					$(index).click();
					$(index).attr('name','shoppingNum');
				}
			}
		}	
		else if(check == false){
			for(i = 0; i < $('tbody input[type=checkbox]').length; i++){
				index = $('tbody input[type=checkbox]')[i];
				if($(index).prop('checked') == true){
					$(index).prop('checked',false);
					$(index).removeAttr('name','shoppingNum');
				}
			}
			list = [];
			shoppingNum = [];
			purchase = [];
			optionCode = [];
			enrollNum =[];
		}
	})
	$('tbody input[type=checkbox]').click(function(){
		check = $(this).prop('checked');
		num = ($(this).val());
		if(check == true){
			$(this).attr('name','shoppingNum');
			list.push(num);
			shoppingNum.push(num);
			purchase.push($(this).parents('tr').find('.purchase').val());
			optionCode.push($(this).parents('tr').find('.optionCode').val());
			enrollNum.push($(this).parents('tr').find('.enrollNum').val());
		}
			
		else if(check == false){
			$(this).removeAttr('name','shoppingNum');
			for(i = 0; i < list.length; i++){
				if(list[i] == num){
					list.splice(i, 1);
					shoppingNum.splice(i, 1);
					purchase.splice(i, 1);
					optionCode.splice(i, 1);
					enrollNum.splice(i, 1);
				}
			}
		}
		if($('tbody input[type=checkbox]').length - 1 == list.length)
			$('thead input[type=checkbox]').prop('checked',false);
		if($('tbody input[type=checkbox]').length == list.length && list.length > 0)
			$('thead input[type=checkbox]').prop('checked',true);
	})
	$('input[type=checkbox]').click(function(){
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(list),
			url:"<%=request.getContextPath()%>/shoppingBasket/allPrice",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				$('.allPrice').text(data['allPrice']);
				if(data['allPrice'] == 0)
					$('.btn-submit').css({'opacity':'0.5','cursor':'default'});
				else
					$('.btn-submit').css({'opacity':'1','cursor':'pointer'});
		    }
		});
	})
	$('.btn-submit').click(function(){
		if($('.allPrice').text() == 0)
			return false;
	})
	function delBasket(obj){
		obj.click(function(){
			$(this).parents('tr').remove();
			var num = $(this).parents('tr').children().first().children().val();
			$.ajax({
				async:true,
				type:'POST',
				data:num,
				url:"<%=request.getContextPath()%>/shoppingBasket/delete",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
			    }
			});
			for(i = 0; i < list.length; i++){
				if(list[i] == num){
					list.splice(i, 1);
					shoppingNum.splice(i, 1);
					purchase.splice(i, 1);
					optionCode.splice(i, 1);
					enrollNum.splice(i, 1);
				}
			}
			$.ajax({
				async:true,
				type:'POST',
				data:JSON.stringify(list),
				url:"<%=request.getContextPath()%>/shoppingBasket/allPrice",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
					$('.allPrice').text(data['allPrice']);
					if(data['allPrice'] == 0)
						$('.btn-submit').css({'opacity':'0.5','cursor':'default'});
					else
						$('.btn-submit').css({'opacity':'1','cursor':'pointer'});
			    }
			});
			if($('tbody input[type=checkbox]').length == 0)
				$('thead input[type=checkbox]').prop('checked',false);
		})
		
	}
	delBasket($('.btn-del'));
	$('.btn-submit').click(function(){
		console.log(optionCode);
		if($('.allPrice').text() == 0)
			return false;
		else{
			$.ajax({
				async:false,
				/*true 동시 할당, false 순차 할당  */
				type:'POST',
				url:"<%=request.getContextPath()%>/insertPurchase",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
			    }
			});
			for(i = 0; i < shoppingNum.length; i++){
				list = {"shoppingNum":shoppingNum[i], "optionCode":optionCode[i], "purchase":purchase[i], "enrollNum":enrollNum[i]};
				$.ajax({
					async:true,
					type:'POST',
					data:JSON.stringify(list),
					url:"<%=request.getContextPath()%>/insertPurchaseListShopping",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					success : function(data){
				    }
				});
			}
		}
	})
</script>