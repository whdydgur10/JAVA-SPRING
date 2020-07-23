<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <title>로그인</title>
<c:if test="${user == null}">
	<div style="height: 800px">
		<h1>
			로그인  
		</h1>
		<form action="#" method="POST">
			<div>
				아이디
				<input type="text" name=id>
			</div>
			<div>
				비밀번호
				<input type="password" name=pw>
			</div>
			<button type="submit">로그인</button>
		</form>
	</div>
</c:if>
<button id="ajax">버튼</button>
<script>
	$(function(){
		$('#ajax').click(function(){
			$.ajax({
				async:true,
			    type:'POST',
			    data:JSON.stringify({"id":"123","num":"443"}),
			    url:"<%=request.getContextPath()%>/test",
			    dataType:"json",
			    contentType:"application/json; charset=UTF-8",
			    success : function(data){
			        console.log(data['res']);
			    }
			});
		})
	})
</script>