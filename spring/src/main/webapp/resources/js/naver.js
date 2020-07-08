$(function(){
    var newspage = 0;
    var pressNum = 0;
    $('html').scrollTop(0,0);
    $('.close-banner-whale').click(function(e){
        e.preventDefault();
        $('.box-whale').addClass('display-none');
        // 매개변수 e에 대한 전에 있는 이벤트값을 기본으로 한다.
        // close-banner-whale는 a태그 안에 있어 누르면 a태그도 같이 실행하는 것을 방지한다.
    })
    $('.auto-search').click(function(){
        $('.auto-search-icon').toggleClass('auto-icon-change');
        $('.box-auto-search').toggleClass('display-none');
    })
    // 검색창 자동완성 on했을 때
    $('.box-auto-search-off').click(function(e){
        $('.auto-search').click();
        e.preventDefault();
    })
    // 검색창 자동완성 off했을 때
    $('.box-auto-search-off').hover(function(){
        $('.box-auto-search-on').toggleClass('display-block');
    })
    // 자동완성 끄기에 마우스 올렸을 때
    $('.menu-more').click(function(){
        $(this).addClass('display-none');
        $('.menu-more-close').addClass('display-inline-block');
        $('.box-menu-list').addClass('display-block');
        $('.set-menu-list').addClass('display-block');
        $('.menu-filter').addClass('display-none');
    })
    // 더보기를 눌렀을 때
    $('.menu-more-close').click(function(){
        $(this).removeClass('display-inline-block');
        $('.menu-more').removeClass('display-none');
        $('.box-menu-list').removeClass('display-block');
        $('.set-menu-list').removeClass('display-block');
        $('.set-menu-checklist').removeClass('display-block')
        $('.menu-filter').removeClass('display-none');
        $('.menu-list-table').removeClass('display-none');
        $('.menu-list-checktable').removeClass('display-table');
        $('.box-menu2').removeClass('display-none');
        $('.box-menu3').removeClass('display-inline-block');
    })
    // 더보기를 닫았을 때
    $('.menu-filter').click(function(){
        $('.box-menu-filter').addClass('display-block');
    })
    // 검색어 필터를 열었을 때
    $('.close-box-menu-filter').click(function(){
        $('.box-menu-filter').removeClass('display-block');
    })
    $('.set-menu').click(function(){
        $('.menu-list-table').addClass('display-none');
        $('.menu-list-checktable').addClass('display-table');
        $('.set-menu-list').removeClass('display-block');
        $('.set-menu-checklist').addClass('display-block');
        $('.box-menu2').addClass('display-none');
        $('.box-menu3').addClass('display-inline-block');
    })
    // 메뉴설정 열었을 때
   
    $('label').click(function(){
        var selMenu = $(this).text();
        if(tmpMenu.indexOf(selMenu)>=0){
            tmpMenu.splice(tmpMenu.indexOf(selMenu),1);
            $(this).find('input').prop('checked',false);
        }
        else{
            if(tmpMenu.length == 5) {
                alert('최대 5개까지 설정할 수 있습니다.');
                return;
            }
            else{
                tmpMenu.push(selMenu);
                $(this).find('input').prop('checked',true);
            }
        }
        $(this).find('.checkbox-icon').toggleClass('checkbox-icon-change');
        var cnt = 0;
        var max = 5;
        $('.box-menu-black').each(function(){
            if(cnt < tmpMenu.length){
                $(this.removeClass('box-empty'));
                $(this).find('.link-menu-black').text(tmpMenu[cnt]);
            }
            else{
                if(cnt == tmpMenu.length && cnt < max){
                    $(this).addClass('select');
                }
                else{
                    $(this).removeClass('select');
                }
                $(this).addClass('box-empty');
                $(this).find('.link-menu-black').text('');
            }
            cnt++;
        })
    })
    // 메뉴 체크
    $('.reset-checklist').click(function(){
        alert('초기설정으로 돌아갑니다.');
        $('.menu-more-close').removeClass('display-inline-block');
        $('.menu-more').removeClass('display-none');
        $('.box-menu-list').removeClass('display-block');
        $('.set-menu-list').removeClass('display-block');
        $('.set-menu-checklist').removeClass('display-block')
        $('.menu-filter').removeClass('display-none');
        $('.menu-list-table').removeClass('display-none');
        $('.menu-list-checktable').removeClass('display-table');
        $('.box-menu2').removeClass('display-none');
        $('.box-menu3').removeClass('display-inline-block');
        while(index > -1){
            $('.box-menu-check').eq(4-index).removeClass('display-none');
            index--;
            console.log(index);
        }
        index = 0;
        selMenu = [];
        $('.menu-list input').prop('checked',false);
        $('.checkbox-icon').removeClass('checkbox-icon-change');
        $('.fold').click();
    })
    // 더보기 설정 초기화
    $('.set-checklist').click(function(){
        alert('선택된 메뉴가 없습니다. 초기설정으로 돌아갑니다.');
        $('.menu-more-close').removeClass('display-inline-block');
        $('.menu-more').removeClass('display-none');
        $('.box-menu-list').removeClass('display-block');
        $('.set-menu-list').removeClass('display-block');
        $('.set-menu-checklist').removeClass('display-block')
        $('.menu-filter').removeClass('display-none');
        $('.menu-list-table').removeClass('display-none');
        $('.menu-list-checktable').removeClass('display-table');
        $('.box-menu2').removeClass('display-none');
        $('.box-menu3').removeClass('display-inline-block');
        selectMenu = tmpMenu.slice();
        $('.fold').click();
        $('.box-menu3').removeClass('box-empty select');
        var cnt = 0;
        var max = 5;
        $('.box-menu3').each(function(){
            if(selMenu.length != 0){
                if(cnt >= selectMenu.length){
                    $(this).addClass('display-none');
                }
            }
            else{
                $(this).removeClass('display-none');
                $(this).find('.link-menu-black').text(defaultMenu[cnt]);
            }
            cnt++;
        })
    })
    // 더보기 설정 저장
    $('.fold').click(function(){
        $('.box-menu3').removeClass('box-empty select');
        var cnt = 0;
        var max = 5;
        $('.box-menu3').each(function(){
            if(cnt >= selectMenu.length){
                $(this).addClass('display-none');
            }
            cnt++;
        })
    })
    setInterval(function(){
        $('.contents').first().animate({'margin-top':'-30px'},500,function(){
            var str = $('.contents').first().detach();
            $('.box-news-type').before(str).css('margin-top','0px');
            $(this).removeAttr('style');
        });
    },3000)
    // 연합뉴스 쪽본 움직이기
    $('.all-press').addClass('font-weight-bold');
    $('.box-sub-press').addClass('display-none');
    $('.sub-press').click(function(){
        $(this).addClass('font-weight-bold');
        $('.all-press').removeClass('font-weight-bold');
        $('.box-sub-press').removeClass('display-none');
        if(pressNum == 0) {
            $('.box-sub-press-no').removeClass('display-none');
            $('.box-sub-press-yes').addClass('display-none');
        }
        else{
            $('.box-sub-press-no').addClass('display-none');
            $('.box-sub-press-yes').removeClass('display-none');
        }
        $('.box-all-press').addClass('display-none');
    })
    // 구독한 언론사 있으면 yes 없으면 no
    $('.all-press').click(function(){
        $(this).addClass('font-weight-bold');
        $('.sub-press').removeClass('font-weight-bold');
        $('.box-sub-press').addClass('display-none');
        $('.box-sub-press-no').addClass('display-none');
        $('.box-sub-press-yes').removeClass('display-none');
        $('.box-all-press').removeClass('display-none');
    })
    // 전체언론사 누르면 창 바뀌기
    $('.btn-set').click(function(){
		if(!$(this).hasClass('not')){
			$('.btn-set>i').removeClass('set');
			$(this).find('i').addClass('set');
		}
	})
	$('.btn-set').hover(function(){
		$(this).find('i').toggleClass('hover');
	})
    var addRolling = setInterval(function(){
        $('.banner1>a').first().animate({'margin-top':'-135px'},300,function(){
            $('.banner1>a').first().detach().appendTo('.banner1').css('margin-top','0px');
            $(this).removeAttr('style');            
        });
    },5000)
    // 광고 움직이기
    $('.pre-side').addClass('display-none');
    function sideIcon(newspage){
        if(newspage == 0) {
            $('.pre-side').addClass('display-none');
        }else{
            $('.pre-side').removeClass('display-none');
        }
        if(newspage == 3) {
            $('.next-side').addClass('display-none');
        }else{
            $('.next-side').removeClass('display-none');
        }
    }
    $('.pre-side').click(function(){
        newspage--;
        h = -260 * newspage;
        $('.press').first().animate({'margin-top':h+'px'},1,function(){});
        sideIcon(newspage);
    })
    $('.next-side').click(function(){
        newspage++;
        sideIcon(newspage);
        h = -260 * newspage;
        $('.press').first().animate({'margin-top':h+'px'},1,function(){});
    })
    var h;
    var newsRolling = setInterval(function(){
        h = -260 * (newspage + 1);
        if(newspage < 3) {
            $('.press').first().animate({'margin-top':h +'px'},1,function(){
                newspage++;
                sideIcon(newspage);
            });
        }
    },5000)
    // 모든 언론사 움직이기
    $('.box-choice-press').addClass('display-none');
    $('.uncheck-press').addClass('display-none');
    $('.box-uncheck-press').addClass('display-none');
    $('.box-press-name').hover(function(){
        $(this).children('.press-name').toggleClass('display-none');
        $(this).children('.box-choice-press').toggleClass('display-none');
    })
    // 언론사위에 마우스를 올리면 이미지를 지우고 구독하기 버튼생성
    $('.check-press').click(function(){
        $(this).addClass('display-none');
        $(this).next().removeClass('display-none');
        $('.sub-press').click();
        $('.box-sub-press-no').addClass('display-none');
        $('.box-sub-press-yes').removeClass('display-none');
        $('.box-sub-press-yes-left').append('<div class="sub-press-list"><a href="#" class="sub-press-list-name">'+$(this).parent().prev().text() +'</a></div>');
        pressNum++;
    })
    // 구독 누르기
    $('.uncheck-press').click(function(){
        $(this).addClass('display-none');
        $('.check-press').removeClass('display-none');
        $('.box-uncheck-press').removeClass('display-none');
        $('.uncheck-press-name').text($(this).parent().prev().text());
        $('.box-uncheck-press').removeClass('display-none');
        pressNum--; 
    })
    // 구독해제 누르기
    $('.btn-close-uncheck').click(function(){
        $('.box-uncheck-press').addClass('display-none'); 
    })
    $('.uncheck-yes').click(function(){
        $('.box-uncheck-press').addClass('display-none');
    })
    $('.uncheck-no').click(function(){
        $('.box-uncheck-press').addClass('display-none');
    })
    // 구독해제시 나오는 창 닫기 x/확인/취소
    var contentRollings = contentRolling();
    $('.timesquare').hover(function(){
        // 마우스를 올릴 때
        clearInterval(contentRollings);
    },function(){
        // 마우스를 내릴 때
        contentRollings = contentRolling();
    })
    function contentRolling(){
        return setInterval(function(){
            $('.timesquare-contents-box').children().first().animate({'margin-left':'-348px'},1000,function(){
                $('.timesquare-contents-box').children().first().detach().appendTo('.timesquare-contents-box').removeAttr('style');         
            });
        },5000)
    }
    $('.left-controller').click(function(){
        if(!$('.timesquare-contents-box').children().is(':animated')){
            // 애니메이션중이면 실행하지 않는다.
            $('.timesquare-contents-box').children().last().detach().prependTo('.timesquare-contents-box').css('margin-left','-348px');
            $('.timesquare-contents-box').children().first().animate({'margin-left':'0'},1000);
        }
    })
    $('.right-controller').click(function(){
        if(!$('.timesquare-contents-box').children().is(':animated')){
            $('.timesquare-contents-box').children().first().animate({'margin-left':'-348px'},1000,function(){
                $('.timesquare-contents-box').children().first().detach().appendTo('.timesquare-contents-box').css('margin-left','696px');
                $(this).removeAttr('style');  
            });
        }
    })
    $('.low-type-nav .type-item a').click(function(e){
        e.preventDefault();
        $('.low-type-nav .type-item a').attr('aria-selected','false');
        $(this).attr('aria-selected','true');
        // attr('속성명','속성값') : 해당요소에 속성의 값을 설정
        // attr() : 해당 요소의 속성의 값을 가져옴
        // prop('속성명','속성값') : 해당요소에 속성의 값을 설정
        // prop() : 해당 요소의 속성의 값을 가져옴
        sidetype();
        themeBodyView();
    })
    sidetype();
    function sidetype(){
        $('.left-type').removeClass('display-none');
        $('.right-type').removeClass('display-none');
        if($('.theme-enter').attr('aria-selected') == 'true') {
            $('.left-type').addClass('display-none');
        }
        if($('.theme-school').attr('aria-selected') == 'true') {
            $('.right-type').addClass('display-none');
        }
    }
    $('.left-type').click(function(e){
        e.preventDefault();
        if($('.theme-JOB').attr('aria-selected') == 'true' || $('.theme-book').attr('aria-selected') == 'true' || $('.theme-perfomence').attr('aria-selected') == 'true'){
            if($('.theme-JOB').attr('aria-selected') == 'true'){
                $('.theme-JOB').attr('aria-selected','false').parents('.type-nav').prev().children().last().children().attr('aria-selected','true');
                $('.low-type-nav').animate({'margin-left':'0'},500)
            }
            if($('.theme-book').attr('aria-selected') == 'true'){
                $('.theme-book').attr('aria-selected','false').parents('.type-nav').prev().children().last().children().attr('aria-selected','true');
                $('.low-type-nav').animate({'margin-left':'-750px'},500)
            }
            if($('.theme-perfomence').attr('aria-selected') == 'true'){
                $('.theme-perfomence').attr('aria-selected','false').parents('.type-nav').prev().children().last().children().attr('aria-selected','true');
                $('.low-type-nav').animate({'margin-left':'-1500px'},500)
            }
        }else{
            $('.low-type-nav a[aria-selected=true]').attr('aria-selected','false').parent().prev().children().attr('aria-selected','true');
        }
        sidetype();
        themeBodyView();
    })
    $('.low-type-nav a').attr('aria-selected','false');
    $('.theme-enter').attr('aria-selected','true');
    $('.right-type').click(function(e){
        e.preventDefault();
        if($('.theme-movie').attr('aria-selected') == 'true' || $('.theme-marry').attr('aria-selected') == 'true' || $('.theme-FARM').attr('aria-selected') == 'true'){
            if($('.theme-movie').attr('aria-selected') == 'true'){
                $('.theme-movie').attr('aria-selected','false').parents('.type-nav').next().children().first().children().attr('aria-selected','true');
                $('.low-type-nav').animate({'margin-left':'-750px'},500)
            }
            if($('.theme-marry').attr('aria-selected') == 'true'){
                $('.theme-marry').attr('aria-selected','false').parents('.type-nav').next().children().first().children().attr('aria-selected','true');
                $('.low-type-nav').animate({'margin-left':'-1500px'},500)
            }
            if($('.theme-FARM').attr('aria-selected') == 'true'){
                $('.theme-FARM').attr('aria-selected','false').parents('.type-nav').next().children().first().children().attr('aria-selected','true');
                $('.low-type-nav').animate({'margin-left':'-2250px'},500)
            }
        }else{
            $('.low-type-nav a[aria-selected=true]').attr('aria-selected','false').parent().next().children().attr('aria-selected','true');
        }
        sidetype();
        themeBodyView();
    })
    themeBodyView();
    function themeBodyView(){
        var target = $('.low-type-nav a[aria-selected=true]').attr('data-target');
        $('.theme-type-body .theme-content').addClass('display-none');
        $('.theme-type-body>.'+target).removeClass('display-none');
    }
    $('.box-shopping-head-right>a').click(function(e){
        e.preventDefault();
        $('.box-shopping-head-right>a').removeClass('default-box-shopping-head');
        $(this).addClass('default-box-shopping-head');
    })
    $('.link-product').click(function(e){
        e.preventDefault();
        $('.box-shoppingmall-name a').removeClass('set-shoppingmall-name');
        var randomNum = Math.random();
        for(var j = 1; j <= 2; j++) {
            var str = '.shoppingmall-name'+j;
            var random1 = Math.floor(randomNum * 6);
            $(str).children('a').eq(random1).addClass('set-shoppingmall-name');
            for(var i = 0; i < 6; i++){
                randomNum = Math.random();
                var random2 = Math.floor(randomNum * 6);
                if(random1 != random2){
                    break;
                }
            }
            $(str).children('a').eq(random2).addClass('set-shoppingmall-name');
        }
    })
    $('.link-men').click(function(e){
        e.preventDefault();
        $('.box-shoppingmall-name a').removeClass('set-shoppingmall-name');
        var randomNum = Math.random();
        for(var j = 1; j <= 2; j++) {
            var str = '.shoppingmall-name'+j;
            var random1 = Math.floor(randomNum * 6);
            $(str).children('a').eq(random1).addClass('set-shoppingmall-name');
            for(var i = 0; i < 6; i++){
                randomNum = Math.random();
                var random2 = Math.floor(randomNum * 6);
                if(random1 != random2){
                    break;
                }
            }
            $(str).children('a').eq(random2).addClass('set-shoppingmall-name');
        }
    })
    $('.link-product').click(function(e){
        e.preventDefault();
        $('.all-page').text('19');
        $('.this-page').text('1');
        $('.box-shoppingmall-name').removeClass('display-none');
        $('.link-product-contents').removeClass('display-none');
        $('.product-content1').removeClass('display-none');
        $('.link-shoppingmall-contents').addClass('display-none');
        $('.link-shoppingmall-contents').children().addClass('display-none');
        $('.link-men-contents').addClass('display-none');
        $('.link-men-contents').children().addClass('display-none');
        thisPage = 1;
    })
    $('.link-shoppingmall').click(function(e){
        e.preventDefault();
        $('.all-page').text('13');
        $('.this-page').text('1');
        $('.box-shoppingmall-name').addClass('display-none');
        $('.link-shoppingmall-contents').removeClass('display-none');
        $('.shoppingmall-content1').removeClass('display-none');
        $('.link-product-contents').addClass('display-none');
        $('.link-product-contents').children().addClass('display-none');
        $('.link-men-contents').addClass('display-none');
        $('.link-men-contents').children().addClass('display-none'); 
        thisPage = 1;
    })
    $('.link-men').click(function(e){
        e.preventDefault();
        $('.all-page').text('6');
        $('.this-page').text('1');
        $('.box-shoppingmall-name').removeClass('display-none');
        $('.link-men-contents').removeClass('display-none');
        $('.men-content1').removeClass('display-none');
        $('.link-product-contents').addClass('display-none');
        $('.link-product-contents').children().addClass('display-none');
        $('.link-shoppingmall-contents').addClass('display-none');
        $('.link-shoppingmall-contents').children().addClass('display-none');
        thisPage = 1;
    })
    var thisPage = 1;
    $('.page-prev-btn').click(function(e){
        e.preventDefault();
        if($('.all-page').text() == 19){
            $('.product-content'+thisPage).addClass('display-none');
        }
        if($('.all-page').text() == 13){
            $('.shoppingmall-content'+thisPage).addClass('display-none');
        }
        if($('.all-page').text() == 6){
            $('.men-content'+thisPage).addClass('display-none');
        }
        thisPage--;
        if(thisPage < 1) {
            thisPage = $('.all-page').text();
        }
        $('.this-page').text(thisPage);
        if($('.all-page').text() == 19){
            $('.product-content'+thisPage).removeClass('display-none');
        }
        if($('.all-page').text() == 13){
            $('.shoppingmall-content'+thisPage).removeClass('display-none');
        }
        if($('.all-page').text() == 6){
            $('.men-content'+thisPage).removeClass('display-none');
        }
    })
    $('.page-next-btn').click(function(e){
        e.preventDefault();
        if($('.all-page').text() == 19){
            $('.product-content'+thisPage).addClass('display-none');
        }
        if($('.all-page').text() == 13){
            $('.shoppingmall-content'+thisPage).addClass('display-none');
        }
        if($('.all-page').text() == 6){
            $('.men-content'+thisPage).addClass('display-none');
        }
        thisPage++;
        if(thisPage > $('.all-page').text()) {
            thisPage = 1;
        }
        $('.this-page').text(thisPage);
        if($('.all-page').text() == 19){
            $('.product-content'+thisPage).removeClass('display-none');
        }
        if($('.all-page').text() == 13){
            $('.shoppingmall-content'+thisPage).removeClass('display-none');
        }
        if($('.all-page').text() == 6){
            $('.men-content'+thisPage).removeClass('display-none');
        }
    })
})