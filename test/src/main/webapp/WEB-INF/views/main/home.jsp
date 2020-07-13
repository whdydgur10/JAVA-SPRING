<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="height: 800px">
	<h1>
		Hello world!  
	</h1>
	<form action="#" method="POST">
		<div>
			아이디 : 
			<input type="text" name="id">
		</div>
		<div>
			비밀번호 :
			<input type="password" name="pw">
		</div>
		<button>로그인</button>
	</form>
	<input type="hidden" value=${isLogin} id="isLogin">
	<input type="hidden" value=${id} id="id">
	<script type="text/javascript">
		$(function(){
			$('button').click(function(){
				var id = $('#id').val();
				var isLogin = $('#isLogin').val();
				if(isLogin == 'false' && id != ''){
					alert(id+'가 없거나 비밀번호가 잘못 되었습니다.')
				}
			})
			
		})
	</script>
</div>

