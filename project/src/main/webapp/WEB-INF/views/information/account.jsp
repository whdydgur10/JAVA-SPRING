<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>내 정보</title>
<style>
	.change>a{
		color:black;
		display: block;
		margin-top:10px;
		width: 210px;
	}
	.changePw>input{
		width: 500px;
		margin-top: 10px;
	}
	.btn-pw, .btn-phone{
		background-color: rgb(33,51,87); 
		color: white;
		display: block;
		width: 500px;
		margin: 10px auto 0;
	}
	.pwCheck{
		font-size: 12px;
		color: red;
		position: absolute;
		right:170;
		margin:0;
		top:15px;
	}
	label{
		font-size:12px;
		color:red;
		display: block;
		margin:0;
	}
	.changePhone>div{
		margin-top: 10px;
	}
	.changePhone>div:nth-last-of-type(2)>input {
		width:124px;
	}
	.createAddress>input{
		margin-bottom: 10px;
	}
</style>
<div class="account">
	<h4>계정</h4>
	<div class="change" style="margin-bottom:80px;">
		<a href="#" data-target=".changePw">비밀번호를 바꾸겠어요. <i class="far fa-grin-squint"></i></a>
		<a href="#" data-target=".changePhone">전화번호를 바꾸겠어요. <i class="far fa-grin-squint"></i></a>
		<a href="#" data-target=".changeAddress">기본배송지를 바꾸겠어요. <i class="far fa-grin-squint"></i></a>
		<a href="#" data-target=".changeEmail">이메일을 바꾸겠어요. <i class="far fa-grin-squint"></i></a>
		<a href="#" data-target=".deleteAccount">회원탈퇴를 하겠어요. <i class="far fa-grin-tears"></i></a>
	</div>
	<div class="changeContent" style="height:400px;width:100%;padding:40px 20px 20px 20px;text-align:center;">
		<form method="post">
			<div class="changePw" style="position: relative;">
				<input type="password" name="pw3" class="pw3" placeholder="현재 비밀번호">
				<p class="pwCheck"></p>
				<input type="password" name="pw" id="pw" placeholder="새 비밀번호">
				<input type="password" name="pw2" id="pw2" placeholder="비밀번호 재확인">
				<button class="btn-pw" type="submit">변경하기</button>
			</div>
			<div class="changePhone display-none">
				<div>
					기존 연락처
					<input type="text" value="${user.phone}" readonly style="width:400px;text-align:center;font-size: 15px;">
				</div>
				<div>
					바꿀 연락처
					<input type="text" class="num1" name="num1">
					-
					<input type="text" class="num2" name="num2">
					-
					<input type="text" class="num3" name="num3">
					<input type="hidden" name="phone" class="phone">
				</div>
				<div class="certification" style="margin-top:5px;">
					<input type="text" name="num4" class="name4" disabled="disabled" placeholder="인증번호 입력" style="width: 250px;text-align:center;">
					<button class="btn-certification" type="button" style="width:130px;">인증번호 받기</button>
					<button class="btn-phone" type="submit">변경하기</button>
				</div>
			</div>
			<div class="changeAddress display-none" style="position:relative;width:100%;height:100%;box-shadow: 2px 2px 2px 2px;margin:0 auto;">
				<div class="viewAddress">
					<c:if test="${addressList.size() == 0}">
						<div style="line-height:340px;font-size:30px;">입력된 주소가 없습니다.</div>
					</c:if>
					<c:if test="${addressList.size() != 0}">
						<c:forEach var="address" items="${addressList}">
						
						</c:forEach>
					</c:if>
				</div>
				<div class="createAddress display-none">
					<input type="text" id="code" name="code" placeholder="우편번호" readonly style="margin-top:80px;width:200px;">
					<input class="searchCode"type="button" value="우편번호 찾기"><br>
					<input type="text" id="address" name="address" placeholder="주소" readonly style="width:320px;;"><br>
					<input type="text" id="detail" name="detail" placeholder="상세주소" style="width:320px;"><br>
					<button class="btn-address" type="submit" style="background-color:rgb(33,51,87);color: white;width:320px;">추가하기</button>
				</div>
				<button class="link-address" type="button" style="position:absolute;bottom:30px;left:350px;">주소 생성하기</button>
			</div>
			<div class="changeAddress display-none">
			
			</div>
			<div class="deleteAccount display-none">
			
			</div>
		</form>
	</div>
</div>
${adjust }
<c:if test="${adjust == true}">
	<script>
		$(function(){
			alert('성공적으로 변경했습니다.');
		})
	</script>
</c:if>		
<script>
        $(function(){
            $('.link-address').click(function(){
                $('.viewAddress').addClass('display-none');
                $('.createAddress').removeClass('display-none');
                $(this).addClass('display-none');
            })
            $('.searchCode').click(function(){
                getPost();
            })
            function getPost() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수
                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }
                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if(data.userSelectedType === 'R'){
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraAddr !== ''){
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            $('#detail').val(extraAddr);
                            
                        
                        } else {
                            $('#detail').value('');
                        }
                        
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        $('#code').val(data.zonecode);
                        $('#address').val(addr);
                        // 커서를 상세주소 필드로 이동한다.
                        $('#detail').focus();
                    }
                }).open();
            }
            $('.change>a').click(function(){
                var target = $(this).attr('data-target');
                $('.changeContent').children().children().addClass('display-none');
                $(target).removeClass('display-none');
            }) 
            $('.pw3').change(function(){
                pw = $('.pw3').val();
                $.ajax({
                    async:true,
                    type:'POST',
                    data:pw,
                    url:"<%=request.getContextPath()%>/pwCheck",
                    dataType:"json",
                    contentType:"application/json; charset=UTF-8",
                    success : function(data){
                        if(!data['pwCheck'])
                            $('.pwCheck').html('현재 비밀번호가 다릅니다.');
                        else
                             $('.pwCheck').html('');
                    }
                });
            })
            $('#pw').change(function(){
                pw = $('#pw').val();
                $.ajax({
                    async:true,
                    type:'POST',
                    data:pw,
                    url:"<%=request.getContextPath()%>/pwCompare",
                    dataType:"json",
                    contentType:"application/json; charset=UTF-8",
                    success : function(data){
                        if(!data['pwCompare'])
                            $('.btn-pw').attr('disabled','disabled');
                        else
                            $('.btn-pw').removeAttr('disabled');
                    }
                })
            });
            $("form").validate({
                submitHandler: function(form) {
                    var phone = $('.num1').val() + '-' + $('.num2').val() + '-' + $('.num3').val();
                    $('.phone').val(phone);
                       $(form).submit();
                },
                rules: {
                    pw: {
                        required : true,
                        minlength : 8,
                        maxlength : 20,
                        regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/
                    },
                    pw2: {
                        required : true,
                        equalTo : pw
                    },
                    num1: {
                        required : true,
                    },
                    num2: {
                        required : true,
                    },
                    num3: {
                        required : true,
                    }
                },
                messages : {
                    pw: {
                        required : "필수 입력입니다",
                        minlength : "최소 {0}글자이상이어야 합니다",
                        maxlength : "최대 {0}글자이하이어야 합니다",
                        regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
                    },
                    pw2: {
                        required : "필수 입력입니다",
                        equalTo : "비밀번호가 일치하지 않습니다."
                    },
                    num1: {
                        required : "필수 입력입니다"
                    },
                    num2: {
                        required : "필수 입력입니다"
                    },
                    num3: {
                        required : "필수 입력입니다"
                    }
                }
            });
        })
        $.validator.addMethod(
            "regex",
            function(value, element, regexp) {
                var re = new RegExp(regexp);
                return this.optional(element) || re.test(value);
            },
            "Please check your input."
        );
    </script>