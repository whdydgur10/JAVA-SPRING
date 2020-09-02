<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	input{
		text-align:center;
		border:none;
	}
	.input, .select{
		border:1px solid black;
	}
</style>
<title>재고관리</title>
<form style="width:550px;margin:30px auto;text-align:center;margin-bottom:20px;" method="get">
	<select name="group" class="group">
		<option value="code" <c:if test="${group == 'code'}">selected</c:if>>코드순</option>
		<option value="name" <c:if test="${group == 'name'}">selected</c:if>>이름순</option>
		<option value="size" <c:if test="${group == 'size'}">selected</c:if>>사이즈순</option>
		<option value="color" <c:if test="${group == 'color'}">selected</c:if>>색상순</option>
		<option value="amount" <c:if test="${group == 'amount'}">selected</c:if>>재고량순</option>
		<option value="purchase" <c:if test="${group == 'purchase'}">selected</c:if>>판매량순</option>
	</select>
	<select name="order" class="order">
		<option value="down" <c:if test="${order == 'down'}">selected</c:if>>높은순</option>
		<option value="up" <c:if test="${order == 'up'}">selected</c:if>>낮은순</option>
	</select>
	<input type="hidden" name="type" class="type" value="${rootPage.rootCri.type}">
	<input class="select" type="text" name="productCode" placeholder="상품코드" style="width:300px;" value="${productCode}">
	<button>검색</button>
</form>
<div>
	<form method="post">
		<table class="table" style="text-align:center">
			<thead>
				<tr>
					<th>코드</th>
					<th>이름</th>
					<th>사이즈</th>
					<th>색상</th>
					<th>현재고량</th>
					<th>판매량</th>
					<th>추가재고량</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${productList.size() == 0}">
					<tr>
						<td colspan="7">등록되지 않은상품</td>
					</tr>
				</c:if>
				<c:if test="${productList.size() != 0}">
					<c:forEach var="list" items="${productList}">
						<tr>
							<td><input type="text" value="${list.code}" readonly></td>
							<td><input type="text" value="${list.name}" readonly></td>
							<td><input type="text" value="${list.size}" readonly></td>
							<td><input type="text" value="${list.color}" readonly></td>
							<td><input type="text" class="amount1" value="${list.amount}" readonly></td>
							<td><input type="text" value="${list.purchase}" readonly></td>
							<td><input class="input" type="text"></td>
							<td><input type="hidden" name="amount" value="0"></td>
							<td><input type="hidden" name="optionCode" value="${list.optionCode}"></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<button style="float:right;background-color:rgb(33,51,87);color:white;width:100px;">변경완료</button>
	</form>
	<ul class="pagination justify-content-center">
		<c:if test="${rootPage.rootCri.page != 1}">
			<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/root/product/amount?page=${rootPage.rootCri.page - 1}&group=${group}&order=${order}&type=${rootPage.rootCri.type}&productCode=${productCode}">이전</a></li>
		</c:if>
	  	<c:forEach var="index" begin="${rootPage.startPage}" end="${rootPage.endPage}">
	  		<li class="page-item <c:if test="${rootPage.rootCri.page == index}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/root/product/amount?page=${index}&group=${group}&order=${order}&type=${rootPage.rootCri.type}&productCode=${productCode}">${index}</a></li>
	  	</c:forEach>
	  	<c:if test="${rootPage.endPage != rootPage.rootCri.page}">
	  		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/root/product/amount?page=${rootPage.rootCri.page + 1}&group=${group}&order=${order}&type=${rootPage.rootCri.type}&productCode=${productCode}">다음</a></li>
	  	</c:if>
	</ul>
</div>
<script>
	$(function(){
		$('.input').keypress(function(event){
            if(event.keyCode >= 48 && event.keyCode <= 57){
                return true;
            }else{
                return false;
            }
        })
		$('.input').change(function(){
			var amount = parseInt($(this).parents('tr').find('.amount1').val()) + parseInt($(this).val());
			$(this).parents('tr').find('input[name=amount]').val(amount);
		})
		$('.group').change(function(){
			var type = $(this).val() + $('.order').val();
			$('.type').val(type);
		})
		$('.order').change(function(){
			var type =  $('.group').val() + $(this).val();
			$('.type').val(type);
		})
	})
</script>