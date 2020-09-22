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
	.changePw input{
		width: 500px;
		margin-top: 10px;
	}
	.btn-pw, .btn-phone, .btn-email{
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
	.changePhone div{
		margin-top: 10px;
	}
	.changePhone div:nth-last-of-type(2)>input {
		width:124px;
	}
	.createAddress input{
		margin-bottom: 10px;
	}
</style>
<div class="account">
	<h4>계정</h4>
	<hr>
	<div class="change" style="margin-bottom:80px;">
		<a href="#" data-target=".changePw">비밀번호를 바꾸겠어요. <i class="far fa-grin-squint"></i></a>
		<a href="#" data-target=".changePhone">전화번호를 바꾸겠어요. <i class="far fa-grin-squint"></i></a>
		<a href="#" data-target=".changeAddress">기본배송지를 바꾸겠어요. <i class="far fa-grin-squint"></i></a>
		<a href="#" data-target=".changeEmail">이메일을 바꾸겠어요. <i class="far fa-grin-squint"></i></a>
		<a href="#" data-target=".deleteAccount">회원탈퇴를 하겠어요. <i class="far fa-grin-tears"></i></a>
	</div>
	<div class="changeContent" style="height:380px;width:100%;padding:40px 20px 20px 20px;text-align:center;">
		<div class="changePw content" style="position: relative;">
			<form method="post" action="<%=request.getContextPath()%>/information/account/pw">
				<input type="password" name="pw3" class="pw3" placeholder="현재 비밀번호">
				<p class="pwCheck"></p>
				<input type="password" name="pw" id="pw" placeholder="새 비밀번호">
				<input type="password" name="pw2" id="pw2" placeholder="비밀번호 재확인">
				<button class="btn-pw" type="submit">변경하기</button>
			</form>
		</div>
		<div class="changePhone content display-none">
			<form method="post" action="<%=request.getContextPath()%>/information/account/phone">
				<div>
					기존 연락처
					<input type="text" value="${user.phone}" readonly style="width:400px;text-align:center;font-size: 15px;">
				</div>
				<div>
					바꿀 연락처
					<input type="text" class="num1" name="num1" maxlength="3" >
					-
					<input type="text" class="num2" name="num2" maxlength="4">
					-
					<input type="text" class="num3" name="num3" maxlength="4">
					<input type="hidden" name="phone" class="phone">
				</div>
				<div class="certification" style="margin-top:5px;">
					<input type="text" name="num4" class="name4" disabled="disabled" placeholder="인증번호 입력" style="width: 250px;text-align:center;">
					<button class="btn-certification" type="button" style="width:130px;">인증번호 받기</button>
					<button class="btn-phone" type="submit">변경하기</button>
				</div>
			</form>
		</div>
		<div class="changeAddress content display-none" style="position:relative;width:100%;height:100%;box-shadow: 2px 2px 2px 2px;margin:0 auto;">
			<div class="viewAddress">
				<c:if test="${addressList.size() == 0}">
					<div style="line-height:340px;font-size:30px;">입력된 주소가 없습니다.</div>
				</c:if>
				<c:if test="${addressList.size() != 0}">
					<form method="post" action="<%=request.getContextPath()%>/information/account/addressOption">
						<div style="padding-top:20px;">
							<input type="radio" value="${mainAddress.num}" name="num" checked="checked">
							<input type="text" value="${mainAddress.code}" readonly style="width:100px;">
							<input type="text" value="${mainAddress.address}" readonly style="width:300px;">
							<input type="text" value="${mainAddress.detail}" readonly style="width:300px;">
      						<label for="isMain">기본배송지</label>
						</div>
						<c:forEach var="address" items="${subAddressList}">
							<div style="padding-top:20px;">
								<input type="radio" value="${address.num}" name="num" >
								<input type="text" value="${address.code}" readonly style="width:100px;">
								<input type="text" value="${address.address}" readonly style="width:300px;">
								<input type="text" value="${address.detail}" readonly style="width:300px;">
       							<label for="isMain">추가배송지</label>
							</div>
						</c:forEach>
						<c:if test="${addressList.size() < 3}">
							<button class="link-address" type="button" style="position:absolute;bottom:30px;right:50px;color:white;background-color:rgb(33,51,87)">배송지 추가하기</button>
						</c:if>
						<c:if test="${addressList.size() != 0}">
							<div style="padding-top:50px;">
								<span>옵션 : </span>
								<select class="addressOption" name="option">
									<option value="" selected>선택</option>
									<option value="newMain">기본배송지 설정</option>
									<option value="deleteAddress">배송지 삭제</option>
								</select>
								<button>확인</button>
							</div>
						</c:if>
					</form>
				</c:if>
			</div>
			<c:if test="${addressList.size() < 3}">
				<div class="createAddress display-none">
					<form method="post" action="<%=request.getContextPath()%>/information/account/address" style="margin:0;height:100%;position:relative;">
						<button class="closeCreate" type="button" style="position:absolute;right:5px;top:5px;border:none;background-color:transparent;outline:none;">X</button>
						<input type="text" id="code" name="code" placeholder="우편번호" readonly style="margin-top:80px;width:200px;">
						<input class="searchCode"type="button" value="우편번호 찾기"><br>
						<input type="text" id="address" name="address" placeholder="주소" readonly style="width:320px;;"><br>
						<input type="text" id="detail" name="detail" placeholder="상세주소" style="width:320px;"><br>
						<input type="hidden" name="isMain" value="<c:if test="${addressList.size() == 0}">Y</c:if><c:if test="${addressList.size() != 0}">N</c:if>"><br>
						<button class="btn-address" type="submit" style="background-color:rgb(33,51,87);color: white;width:320px;">생성하기</button>
					</form>
				</div>
				<c:if test="${addressList.size() == 0}">
					<button class="link-address" type="button" style="position:absolute;bottom:30px;right:50px;color:white;background-color:rgb(33,51,87)">기본배송지 생성하기</button>
				</c:if>
			</c:if>
		</div>
		<div class="changeEmail content display-none">
			<form method="post" action="<%=request.getContextPath()%>/information/account/email">
				<div style="width:500px;margin:0 auto">
					<input type="text" style="width:370px;" class="emailId" placeholder="이메일 변경하기"> @
					<select class="emailSite">
					</select>
					<input type="hidden" name="email">
					<button type="submit" class="btn-email">변경하기</button>
				</div>
			</form>
		</div>
		<div class="deleteAccount content display-none">
			<form method="get" action="<%=request.getContextPath()%>/information/account/deleteAccount">
				<div>
					<span>정말로 탈퇴를 하시겠습니까?</span><br>
					<span>탈퇴를 하려면 빨간 버튼을 취소하려면 파란 버튼을 눌러주세요.</span><br>
					<button type="submit" style="background-color: red;width:200px;height:200px;"><h1 style="opacity:0;">탈퇴</h1></button>
					<button type="button" style="background-color: blue;width:200px;height:200px;"><h1 style="opacity:0;">취소</h1></button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	var cv = 2;
</script>
<script>
        $(function(){
        	$('.deleteAccount button[type=button]').click(function(){
				alert('yeh!!!!');
           	})
           	$('.deleteAccount button[type=submit').click(function(){
				alert('시무룩');
           	})
            $('.deleteAccount button[type=submit]').hover(function(){
					$(this).animate({'opacity':'0.7'},300);
					$(this).children().animate({'opacity':'1'},300);
                },function(){
                	$(this).animate({'opacity':'1'},300);
                	$(this).children().animate({'opacity':'0'},300);
            })
            $('.deleteAccount button[type=button]').hover(function(){
					$(this).animate({'opacity':'0.7'},300);
					$(this).children().animate({'opacity':'1'},300);
                },function(){
                	$(this).animate({'opacity':'1'},300);
                	$(this).children().animate({'opacity':'0'},300);
            })
        	var emailSite = ['naver.com','kakao.com','gmail.com','yahoo.com','daum.net'];
    		for(var i = 0; i < emailSite.length; i++) {
    			$('.emailSite').append('<option value="@' + emailSite[i] + '">' + emailSite[i] +'</option>');
    		}
            $('.changePhone input').keypress(function(event){
                if(event.keyCode >= 48 && event.keyCode <= 57){
                    return true;
                }else{
                    return false;
                }
            })
            $('body').click(function(e){
            	var target = $(e.target).parents('.createAddress').length;
                if(target != 1){
                	$('.viewAddress').removeClass('display-none');
                    $('.createAddress').addClass('display-none');
                    $('.link-address').removeClass('display-none');
                }
            })
            $('.closeCreate').click(function(e){
            	$('.viewAddress').removeClass('display-none');
                $('.createAddress').addClass('display-none');
                $('.link-address').removeClass('display-none');
                e.stopPropagation();
           	})
            $('input[type=radio]').click(function(){
				$('.viewAddress input[type=radio]').prop('checked', false);
				$('.viewAddress input[type=radio]').removeAttr('checked');
				$(this).prop('checked', true);
				$(this).prop('checked', true).attr('checked','checked');
            })
            $('.link-address').click(function(e){
                $('.viewAddress').addClass('display-none');
                $('.createAddress').removeClass('display-none');
                $(this).addClass('display-none');
                e.stopPropagation();
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
                            $('#detail').val('');
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
                $('.changeContent').children().addClass('display-none');
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
                    var email = $('.emailId').val() + $('.emailSite').val();
    				$('.email').val(email);
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