<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>아이디 찾기</title>
<div class="lostidContainer" style="width:1100px;margin:20px auto;">
	<div class="form-group">
		<input class="email" type="text" placeholder="가입한 이메일주소">
		<p class="noEmail" style="color:red;font-size:12px;"></p>
		<input class="findId" type="text" placeholder="찾은 아이디" readOnly>
	</div>
<button type="button" class="btn">아이디 찾기</button>
</div>
<script>
	$(function(){
		$('.btn').click(function(){
			email = $('.email').val();
			$.ajax({
				async:true,
				type:'POST',
				data:email,
				url:"<%=request.getContextPath()%>/getId",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
				    if(data['getId'] == true) {
					    $('.findId').val(data['id']);
					    $('.noEmail').text("");
				    }
				    else {
				       $('.noEmail').text('등록되지 않은 이메일입니다.');
				    }
			    }
			});
		})
	})
</script>
