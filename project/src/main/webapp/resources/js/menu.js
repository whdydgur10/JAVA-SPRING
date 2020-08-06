$(function(){
	function changeGender(obj){
		$(obj).click(function(){
			$(this).parent().children().removeClass('select');
			$(this).addClass('select');
			var target = $('.btn-gender>.select').attr('data-target');
			$('.navContainer nav').addClass('display-none');
			$(target).removeClass('display-none');
		})
	}
	changeGender($('.btn-gender').children());
	$('.navContainer a').hover(function(){
		var target = $(this).attr('data-target');
		$(target).parent().children().addClass('display-none');
		$(target).removeClass('display-none');
	},function(){
		$('.subContainer').children().addClass('display-none');
	})
	$('.subMenu').hover(function(){
		$(this).removeClass('display-none');
	},function(){
		$(this).addClass('display-none');
	})
})