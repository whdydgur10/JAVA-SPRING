$(function(){
	var startYear = 1930;
	var endYear = 2020;
	var month = 12;
	var day;
	for(var i = startYear; i <= endYear; i++) {
		$('.year').append('<option value="'+ i +'">' + i + '</option>');
	}
	for(var i = 1; i <= month; i++) {
		$('.month').append('<option value="'+ i +'">' + i + '</option>');
	}
	$('.month').click(function(){
		if($('.month').val() == 1 || $('.month').val() == 3 || $('.month').val() == 5 || $('.month').val() == 7 || $('.month').val() == 8 || $('.month').val() == 10 || $('.month').val() == 12)
	        day = 31;
	    if($('.month').val() == 2)
	        day = 28;
	    if($('.month').val() == 4 || $('.month').val() == 6 || $('.month').val() == 9 || $('.month').val() == 11)
	        day = 30;
	    $('.day').empty();
	    $('.day').append('<option value="" selected>일</option>');
		for(var i = 1; i <= day; i++){
	        $('.day').append('<option value="'+i+'">'+i+'</option>');
	    }
	})
	var emailSite = ['naver.com','kakao.com'];
	for(var i = 0; i < emailSite.length; i++) {
		$('.emailSite').append('<option value="@' + emailSite[i] + '">' + emailSite[i] +'</option>');
	}
	$('.btn-certification').click(function(){
		$(this).prev().removeAttr('disabled');
	})
	$("form").validate({
		submitHandler: function(form) {
			var email = $('.emailId').val() + $('.emailSite').val();
			$('.email').val(email);
			var birthday = $('.year').val() + $('.month').val() + $('.day').val();
			$('.birthday').val(birthday);
			var phone = $('.num1').val() + '-' + $('.num2').val() + '-' + $('.num3').val();
			$('.phone').val(phone);
		   	$(form).submit();
		},
	    rules: {
	        id: {
	            required : true
	        },
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
	        name: {
	            required : true
	        },
	        gender: {
	            required : true
	        },
	        year: {
	            required : true
		    },
		    month: {
	            required : true
		    },
		    day: {
	            required : true
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
	    //규칙체크 실패시 출력될 메시지
	    messages : {
	        id: {
	            required : "필수 입력입니다"
	        },
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
	        name: {
	            required : "필수 입력입니다"
	        },
	        gender: {
	       		required : "필수 입력입니다"
	        },
	        year: {
	        	required : "필수 입력입니다"
		    },
		    month: {
	        	required : "필수 입력입니다"
		    },
		    day: {
	        	required : "필수 입력입니다"
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