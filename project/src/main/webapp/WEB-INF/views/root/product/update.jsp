<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>상품정보 변경</title>
<style>
	.size>span{
		margin:0 10px 0 2px;
	}
	.color>span{
		margin:0 10px 0 2px;
	}
	.deleteColor, .deleteSize, .deleteOldSize, .deleteOldColor{
		border:none;
		background-color: transparent;
	}
	/* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
    
    /* Modal Content/Box */
    .modal-content {
      	position:relative;
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 30%; /* Could be more or less, depending on screen size */
        height: 120px;                     
    }
    /* The Close Button */
    .close {
       	position:absolute;
        color: #aaa;
        right:20px;
        font-size: 28px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .modal-content button{
       	width: 100px;
       	background-color: transparent;
       	position: absolute;
       	bottom:20px;
    }
	.modal-content button:hover{
		background-color: rgb(33,51,87);
		color: white;
	}
	#yes{
		left: 20%;
	}
	#no{
		right: 20%;
	}
</style>

<div style="width:600px;margin:30px auto;">
	<form method="get">
		<input class="select" type="search" name="productCode" placeholder="제품코드" style="width:300px;">
		<button>검색</button>
	</form>
	<form method="post">
		<div class="form-group">
		    <label for="code">상품코드</label>
		    <input type="text" class="form-control" id="code" name="code" value="${product.code}" readonly>
		</div>
		<div class="form-group">
		    <label for="name">상품이름</label>
		    <input type="text" class="form-control" id="name" name="name" value="${product.name}">
		</div>
		<div class="form-group">
		    <label for="price">상품가격</label>
		    <input type="text" class="form-control" id="price" name="price" value="${product.price}">
		</div>
		<div class="form-group">
		    <label for="gender">성별</label>
		    <select class="form-control" id="gender" name="gender">
		    	<option value="" selected>선택</option>
		    	<option value="M" <c:if test="${product.gender == 'M'}">selected</c:if>>남성</option>
		    	<option value="W" <c:if test="${product.gender == 'W'}">selected></c:if>>여성</option>
		    	<option value="MW" <c:if test="${product.gender == 'MW'}">selected></c:if>>공용</option>
		    </select>
		</div>
		<div class="form-group size">
		    <label for="size">사이즈</label><span style="opacity:0.7;">(XS, S, M, L, XL, free, 240, 250...)</span><button type="button" class="addSize" style="background-color: transparent;margin-left:5px;">추가</button><br>
		    <c:forEach var="list" items="${size}">
		    	<input type="text" name="size" style="width:40px;" value="${list.size}" class="${list.size}">
		    	<input type="hidden" value="${list.optionCode}" id="${list.size}">
		    	<button type="button" class="deleteOldSize">X</button>
		    </c:forEach>
		</div>
		<div class="form-group color">
		    <label for="color">색상</label><span style="opacity:0.7;">(black, white, blue, yellow...)</span><button type="button" class="addColor" style="background-color: transparent;margin-left:5px;">추가</button><br>
		    <c:forEach var="list" items="${color}">
		    	<input type="text" name="color" style="width:90px;" value="${list.color}" class="${list.color}">
		    	<input type="hidden" value="${list.productCode}" id="${list.color}">
		    	<button type="button" class="deleteOldColor" id="${list.color}">X</button>
		    </c:forEach>
		</div>
		<button class="codeCheck" style="height:50px;display:inline-block;line-height:50px;border-top:1px solid black;border-left:1px solid black;width:150px;text-align:center;background-color:rgb(33,51,87);color:white;margin-left:225px;">재등록하기</button>
	</form>
</div>
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close" onclick="close()">&times;</span>                                                               
        <p>삭제하시겠습니까?</p>
        <button type="button" id="yes">예</button>
        <button type="button" id="no">아니오</button>
      </div>
    </div>
<script>	
		var color;
		var size;
		// Get the modal
        var modal = document.getElementById('myModal');
 
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];                                          
 
        // When the user clicks on the button, open the modal 
   		
        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }

		function modal_size(obj){
			obj.click(function(){
				modal.style.display = "block";
				size = $(this).prev().prev().val();
			})
		}

		function modal_color(obj){
			obj.click(function(){
				modal.style.display = "block";
				color = $(this).prev().prev().val();
			})
		}
        
        function no_close(obj){
        	obj.click(function(){
        		modal.style.display = "none";
            })
		}

		function size_close(obj){
			obj.click(function(){
				modal.style.display = "none";
				sizeClass = '.' + size;
				sizeId = '#' + size;
				productCode = $('#code').val();
				$(sizeClass).remove();
				$(sizeId).next().remove();
				$(sizeId).remove();

				var list = {"size":size, "productCode":productCode};
				$.ajax({
					async:true,
					type:'POST',
					data:JSON.stringify(list),
					url:"<%=request.getContextPath()%>/deleteSize",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					success : function(data){
					    
				    }
				});
			})
		}

		function color_close(obj){
			obj.click(function(){
				modal.style.display = "none";
				colorClass = '.' + color;
				colorId = '#' + color;
				productCode = $('#code').val();
				$(colorClass).remove();
				$(colorId).next().remove();
				$(colorId).remove();
				alert(color);
				alert(productCode);
				var list = {"color":color, "productCode":productCode};
				$.ajax({
					async:true,
					type:'POST',
					data:JSON.stringify(list),
					url:"<%=request.getContextPath()%>/deleteColor",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					success : function(data){
					    
				    }
				});
			})
		}
 		
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

		modal_size($('.deleteOldSize'));
		modal_color($('.deleteOldColor'));
		no_close($('#no'));
		size_close($('#yes'));
		color_close($('#yes'));
        
        function dColor(obj){
			obj.click(function(){
				$(this).prev().remove();
				$(this).remove();
			})
		}
		dColor($('.deleteColor'));
		$('.addColor').click(function(){
			$(this).parent().append('<input type="text" name="color" style="width:90px;"><button class="deleteColor">X</button>');
			dColor($(this).parent().children().last());
		})
		function dSize(obj){
			obj.click(function(){
				$(this).prev().remove();
				$(this).remove();
			})
		}
		dSize($('.deleteSize'));
		$('.addSize').click(function(){
			$(this).parent().append('<input type="text" name="size" style="width:40px;"><button class="deleteSize">X</button>');
			dSize($(this).parent().children().last());
		})
		
</script>