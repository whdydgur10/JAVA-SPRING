$(function(){
	var startYear = 1950;
	var endYear = 2100;
    var month = 12;
    var day;
    for(var i = startYear; i <= endYear; i++){
		$('#year').append('<option value="'+i+'">'+i+'</option>');
	}
	for(var i = 1; i <= month; i++){
		$('#month').append('<option value="'+i+'">'+i+'</option>');
	}
	$('#month').click(function(){
        if($('#month').val() == 1 || $('#month').val() == 3 || $('#month').val() == 5 || $('#month').val() == 7 || $('#month').val() == 8 || $('#month').val() == 10 || $('#month').val() == 12)
            day = 31;
        if($('#month').val() == 2)
            day = 28;
        if($('#month').val() == 4 || $('#month').val() == 6 || $('#month').val() == 9 || $('#month').val() == 11)
            day = 30;
        $('#day').empty();
        $('#day').append('<option value="" selected>일</option>');
		for(var i = 1; i <= day; i++){
            $('#day').append('<option value="'+i+'">'+i+'</option>');
        }
     })
})