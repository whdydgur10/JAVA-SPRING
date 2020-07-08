<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NAVAR</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/default.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/whale.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/search.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/menu.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/class.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainleft.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainright.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/footer.css">
    <script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/naver.js"></script>
</head>
<body>
    <div class="box-whale">
        <div class="container">
            <a href="https://whale.naver.com/ko/?=main" class="link-whale">
                <i class="icon-whale bg-44265f"></i>
                <img class="img-banner-whale" width="150px" height="auto" src="https://s.pstatic.net/static/www/img/uit/2020/img_whale_banner.483e9e.png" alt="">
                <p class="text-banner-whale">인터넷의 새로운 시작! <strong>네이버 웨일</strong>로 차원이 다른 웹서핑을 경험해보세요!
                    <button class="down-banner-whale">다운로드</button>
                </p>
                <button class="close-banner-whale">3일 동안 보지 않기
                </button>
            </a>
        </div>
    </div>
    <div class="box-container-search">
        <div class="container">
            <a href="//naver.com" class="logo bg-44265f" target="_blank" ></a>
            <div class="box-search">
                <form action="#" method="get"></form>
                    <input type="text" class="text-search" title="검색어 입력">
                    <a href="#" class="v-keyboard">
                        <i class="v-keyboard-icon bg-44265f"></i>
                        <i class="v-keyboard-icon-msg bg-44265f"></i>
                    </a>
                    <a href="#" class="auto-search">
                        <i class="auto-search-icon bg-44265f"></i>
                    </a>
                    <button class="box-search-btn" title="검색">
                        <i class="box-search-icon bg-44265f"></i>                      
                    </button>
                </form>
                <div class="box-auto-search display-none">
                    <div class="box-auto-search-text">현재 자동완성 기능을 사용하고 계십니다.</div>
                    <div class="box-auto-search-menu">
                        <a href="#" class="help">도움말</a>
                        <span class="auto-bar"> | </span>
                        <a href="#" class="report">신고</a>
                        <button class="box-auto-search-off">자동완성 끄기</button>
                        <div class="box-auto-search-on">기능을 다시 켤 때는 <img src="../image/검색창.png" alt="">을 클릭하세요</div>
                    </div>
                </div>
            </div>
            <div class="box-service">
                <a href="#" class="set-homepage">네이버를 시작페이지로</a>
                <span class="service-bar"> | </span>
                <a href="https://jr.naver.com/" class="link-jrnaver bg-44265f"></a>
                <a href="https://happybean.naver.com/" class="link-happybean bg-44265f"></a>
            </div>
        </div>
    </div>
    <div class="box-container-menu">
        <div class="container">
            <div class="box-menu">
                <div class="box-menu1">
                    <a href=""><i class="box-menu-mail bg-44265f"></i>메일</a>
                    <a href="">카페</a>
                    <a href="">블로그</a>
                    <a href="">지식iN</a>
                    <a href="">쇼핑</a>
                    <a href="">Pay</a>
                    <a href=""><i class="box-menu-tv bg-44265f"></i>TV</a>
                </div>
                <div class="box-menu2">
                    <a href="">사전</a>
                    <a href="">뉴스</a>
                    <a href="">증권</a>
                    <a href="">부동산</a>
                    <a href="">지도</a>
                    <a href="">영화</a>
                    <a href="">뮤직</a>
                    <a href="">책</a>
                    <a href="">웹툰</a>
                </div>
                <div class="box-menu3">
                    <div class="box-menu-check"></div>
                    <div class="box-menu-check"></div>
                    <div class="box-menu-check"></div>
                    <div class="box-menu-check"></div>
                    <div class="box-menu-check"></div>
                </div>
                <button class="menu-more">더보기<i class="menu-more-icon bg-44265f"></i></button>
                <button class="menu-more-close">접기<i class="menu-more-close-icon bg-44265f"></i></button>
            </div>
            <div class="set-menu-list">
                <a class="all-menu-list" href="https://www.naver.com/more.html">서비스 전체보기</a>
                <button class="set-menu">메뉴설정</button>
            </div>
            <div class="set-menu-checklist">
                <button class="reset-checklist">초기화</button>
                <button class="set-checklist">저장</button>
            </div>
            <button class="menu-filter"><i class="menu-filter-icon1 bg-44265f"></i>검색어 필터 설정이 필요합니다<i class="menu-filter-icon2 bg-44265f"></i></button>
            <div class="box-menu-filter">
                <div class="box-menu-filter-head">
                    <h3>급상승검색어</h3>
                    <p>관심사/연령대별 나만의 차트를 설정할 수 있어요.</p>
                    <button class="close-box-menu-filter"></button>
                </div>
                <div class="box-menu-filter-left">

                </div>
                <div class="box-menu-filter-right">
                    <div class="box-menu-filter-right-head"><strong>검색어 필터를 먼저 설정해주세요!</strong></div>
                    <div class="box-menu-filter-right-body"><p>관심사/연령대 설정이 완료되면, 검색어 차트가 노출됩니다.</p></div>
                    <button class="box-menu-filter-right-footer">설정완료</button>
                </div>
                <div class="box-menu-filter-footer">

                </div>
            </div>
        </div>
        <div class="box-menu-list">
            <div class="menu-list-table">
                <dl class="menu-list">
                    <dt>ㄱ-ㄷ</dt>
                    <dd><a href="#">그라폴리오</a></dd>
                    <dd><a href="#">날씨</a></dd>
                    <dd><a href="#">네이버 예약</a></dd>
                    <dd><a href="#">네이버 클라우드</a></dd>
                    <dd><a href="#">네이버 포스트</a></dd>
                    <dd><a href="#">뉴스</a></dd>
                    <dd><a href="#">데이터랩</a></dd>
                </dl>
                <dl class="menu-list">
                    <dt>ㄹ-ㅅ</dt>
                    <dd><a href="#">만화/웹툰</a></dd>
                    <dd><a href="#">메모</a></dd>
                    <dd><a href="#">뮤직</a></dd>
                    <dd><a href="#">밴드</a></dd>
                    <dd><a href="#">부동산</a></dd>
                    <dd><a href="#">북마크</a></dd>
                    <dd><a href="#">소프트웨어</a></dd>
                    <dd><a href="#">스포츠</a></dd>
                    <dd><a href="#">시리즈</a></dd>
                    <dd><a href="#">시리즈on</a></dd>
                </dl>
                <dl class="menu-list">
                    <dt>ㅇ-ㅈ</dt>
                    <dd><a href="#">영화</a></dd>
                    <dd><a href="#">오디오클립</a></dd>
                    <dd><a href="#">오피스</a></dd>
                    <dd><a href="#">웹소설</a></dd>
                    <dd><a href="#">자동차</a></dd>
                    <dd><a href="#">주소록</a></dd>
                    <dd><a href="#">증권(금융)</a></dd>
                    <dd><a href="#">지도</a></dd>
                    <dd><a href="#">지식백과</a></dd>
                </dl>
                <dl class="menu-list">
                    <dt>ㅊ-ㅎ</dt>
                    <dd><a href="#">책</a></dd>
                    <dd><a href="#">캘린더</a></dd>
                    <dd><a href="#">학습정보</a></dd>
                    <dd><a href="#">항공권</a></dd>
                    <dd><a href="#">호텔</a></dd>
                </dl>
                <dl class="menu-list">
                    <dt>A-Z</dt>
                    <dd><a href="#">modoo![모두]</a></dd>
                    <dd><a href="#">MY구독</a></dd>
                    <dd><a href="#">PC게임</a></dd>
                    <dd><a href="#">TV연예</a></dd>
                    <dd><a href="#">V LIVE</a></dd>
                </dl>
                <dl class="menu-list">
                    <dt>사전</dt>
                    <dd><a href="#">사전</a></dd>
                    <dd><a href="#">국어사전</a></dd>
                    <dd><a href="#">영어/영영사전</a></dd>
                    <dd><a href="#">일본어사전</a></dd>
                    <dd><a href="#">중국어사전</a></dd>
                    <dd><a href="#">한자사전</a></dd>
                    <dd><a href="#">사전 더보기</a></dd>
                </dl>
                <dl class="menu-list">
                    <dt>인기/신규 서비스</dt>
                    <dd><a href="#">네이버플러스 멤버십</a></dd>
                    <dd><a href="#">클로바더빙</a></dd>
                    <dd><a href="#">인플루언서 검색</a></dd>
                    <dd><a href="#">Keep</a></dd>
                    <dd><a href="#">VIBE</a></dd>
                    <dd><a href="#">웨일</a></dd>
                    <dd><a href="#">파파고</a></dd>
                </dl>
            </div>
            <div class="menu-list-checktable">
                <dl class="menu-list">
                    <dt>ㄱ-ㄷ</dt>
                    <dd><label for="grafolio"><i class="checkbox-icon bg-44265f"></i>그라폴리오</label><input type="checkbox" name="grafolio" value="grafolio" id="grafolio"></dd>
                    <dd><label for="weather"><i class="checkbox-icon bg-44265f"></i>날씨</label><input type="checkbox" name="weather" value="weather" id="weather"></dd>
                    <dd><label for="booking"><i class="checkbox-icon bg-44265f"></i>네이버 예약</label><input type="checkbox" name="booking" value="booking" id="booking"></dd>
                    <dd><label for="ndrive"><i class="checkbox-icon bg-44265f"></i>네이버 클라우드</label><input type="checkbox" name="ndrive" value="ndrive" id="ndrive"></dd>
                    <dd><label for="post"><i class="checkbox-icon bg-44265f"></i>네이버 포스트</label><input type="checkbox" name="post" value="post" id="post"></dd>
                    <dd><label for="news"><i class="checkbox-icon bg-44265f"></i>뉴스</label><input type="checkbox" name="news" value="news" id="news"></dd>
                    <dd><label for="datalab"><i class="checkbox-icon bg-44265f"></i>데이터랩</label><input type="checkbox" name="datalab" value="datalab" id="datalab"></dd>
                </dl>
                <dl class="menu-list">
                    <dt>ㄹ-ㅅ</dt>
                    <dd><label for="comic"><i class="checkbox-icon bg-44265f"></i>만화/웹툰</label><input type="checkbox" name="comic" value="comic" id="comic"></dd>
                    <dd><label for="memo"><i class="checkbox-icon bg-44265f"></i>메모</label><input type="checkbox" name="memo" value="memo" id="memo"></dd>
                    <dd><label for="music"><i class="checkbox-icon bg-44265f"></i>뮤직</label><input type="checkbox" name="music" value="music" id="music"></dd>
                    <dd><label for="band"><i class="checkbox-icon bg-44265f"></i>밴드</label><input type="checkbox" name="band" value="band" id="band"></dd>
                    <dd><label for="land"><i class="checkbox-icon bg-44265f"></i>부동산</label><input type="checkbox" name="land" value="land" id="land"></dd>
                    <dd><label for="bookmark"><i class="checkbox-icon bg-44265f"></i>북마크</label><input type="checkbox" name="bookmark" value="bookmark" id="bookmark"></dd>
                    <dd><label for="software"><i class="checkbox-icon bg-44265f"></i>소프트웨어</label><input type="checkbox" name="software" value="software" id="software"></dd>
                    <dd><label for="sports"><i class="checkbox-icon bg-44265f"></i>스포츠</label><input type="checkbox" name="sports" value="sports" id="sports"></dd>
                    <dd><label for="nstore"><i class="checkbox-icon bg-44265f"></i>시리즈</label><input type="checkbox" name="nstore" value="nstore" id="nstore"></dd>
                    <dd><label for="nstoreon"><i class="checkbox-icon bg-44265f"></i>시리즈on</label><input type="checkbox" name="nstoreon" value="nstoreon" id="nstoreon"></dd>
                </dl>
                <dl class="menu-list">
                    <dt>ㅇ-ㅈ</dt>
                    <dd><label for="movie"><i class="checkbox-icon bg-44265f"></i>영화</label><input type="checkbox" name="movie" value="movie" id="movie"></dd>
                    <dd><label for="audioclip"><i class="checkbox-icon bg-44265f"></i>오디오클립</label><input type="checkbox" name="audioclip" value="audioclip" id="audioclip"></dd>
                    <dd><label for="office"><i class="checkbox-icon bg-44265f"></i>오피스</label><input type="checkbox" name="office" value="office" id="office"></dd>
                    <dd><label for="webnovel"><i class="checkbox-icon bg-44265f"></i>웹소설</label><input type="checkbox" name="webnovel" value="webnovel" id="webnovel"></dd>
                    <dd><label for="auto"><i class="checkbox-icon bg-44265f"></i>자동차</label><input type="checkbox" name="auto" value="auto" id="auto"></dd>
                    <dd><label for="contact"><i class="checkbox-icon bg-44265f"></i>주소록</label><input type="checkbox" name="contact" value="contact" id="contact"></dd>
                    <dd><label for="stock"><i class="checkbox-icon bg-44265f"></i>증권(금융)</label><input type="checkbox" name="stock" value="stock" id="stock"></dd>
                    <dd><label for="map"><i class="checkbox-icon bg-44265f"></i>지도</label><input type="checkbox" name="map" value="map" id="map"></dd>
                    <dd><label for="terms"><i class="checkbox-icon bg-44265f"></i>지식백과</label><input type="checkbox" name="terms" value="terms" id="terms"></dd>
                </dl>
                <dl class="menu-list">
                    <dt>ㅊ-ㅎ</dt>
                    <dd><label for="book"><i class="checkbox-icon bg-44265f"></i>책</label><input type="checkbox" name="book" value="book" id="book"></dd>
                    <dd><label for="calendar"><i class="checkbox-icon bg-44265f"></i>캘린더</label><input type="checkbox" name="calendar" value="calendar" id="calendar"></dd>
                    <dd><label for="academic"><i class="checkbox-icon bg-44265f"></i>학술정보</label><input type="checkbox" name="academic" value="academic" id="academic"></dd>
                    <dd><label for="airticket"><i class="checkbox-icon bg-44265f"></i>항공권</label><input type="checkbox" name="airticket" value="airticket" id="airticket"></dd>
                    <dd><label for="hotel"><i class="checkbox-icon bg-44265f"></i>호텔</label><input type="checkbox" name="hotel" value="hotel" id="hotel"></dd>
                </dl>
                <dl class="menu-list">
                    <dt>A-Z</dt>
                    <dd><label for="modoo"><i class="checkbox-icon bg-44265f"></i>modoo![모두]</label><input type="checkbox" name="modoo" value="modoo" id="modoo"></dd>
                    <dd><label for="myfeed"><i class="checkbox-icon bg-44265f"></i>MY구독</label><input type="checkbox" name="myfeed" value="myfeed" id="myfeed"></dd>
                    <dd><label for="ngame"><i class="checkbox-icon bg-44265f"></i>PC게임</label><input type="checkbox" name="ngame" value="ngame" id="ngame"></dd>
                    <dd><label for="entertain"><i class="checkbox-icon bg-44265f"></i>TV연예</label><input type="checkbox" name="entertain" value="entertain" id="entertain"></dd>
                    <dd><label for="v"><i class="checkbox-icon bg-44265f"></i>v LIVE</label><input type="checkbox" name="v" value="v" id="v"></dd>
                </dl>
                <dl class="menu-list">
                    <dt>사전</dt>
                    <dd><label for="dic"><i class="checkbox-icon bg-44265f"></i>사전</label><input type="checkbox" name="dic" value="dic" id="dic"></dd>
                    <dd><label for="krdic"><i class="checkbox-icon bg-44265f"></i>국어사전</label><input type="checkbox" name="krdic" value="krdic" id="krdic"></dd>
                    <dd><label for="endic"><i class="checkbox-icon bg-44265f"></i>영어/영영사전</label><input type="checkbox" name="endic" value="endic" id="endic"></dd>
                    <dd><label for="jpdic"><i class="checkbox-icon bg-44265f"></i>일본어사전</label><input type="checkbox" name="jpdic" value="jpdic" id="jpdic"></dd>
                    <dd><label for="cndic"><i class="checkbox-icon bg-44265f"></i>중국어사전</label><input type="checkbox" name="cndic" value="cndic" id="cndic"></dd>
                    <dd><label for="hanja"><i class="checkbox-icon bg-44265f"></i>한자사전</label><input type="checkbox" name="hanja" value="hanja" id="hanja"></dd>
                </dl>
                <dl class="menu-list">
                    <dt>인기/신규 서비스</dt>
                    <dd><label for="plus"><i class="checkbox-icon bg-44265f"></i>네이버 플러스</label><input type="checkbox" name="plus" value="plus" id="plus"></dd>
                    <dd><label for="dubbing"><i class="checkbox-icon bg-44265f"></i>클로바더빙</label><input type="checkbox" name="dubbing" value="dubbing" id="dubbing"></dd>
                    <dd><label for="influencer"><i class="checkbox-icon bg-44265f"></i>인플루언서 검색</label><input type="checkbox" name="influencer" value="influencer" id="influencer"></dd>
                    <dd><label for="keep"><i class="checkbox-icon bg-44265f"></i>keep</label><input type="checkbox" name="keep" value="keep" id="keep"></dd>
                    <dd><label for="vibe"><i class="checkbox-icon bg-44265f"></i>VIBE</label><input type="checkbox" name="vibe" value="vibe" id="vibe"></dd>
                    <dd><label for="whale"><i class="checkbox-icon bg-44265f"></i>웨일</label><input type="checkbox" name="whale" value="whale" id="whale"></dd>
                    <dd><label for="papago"><i class="checkbox-icon bg-44265f"></i>파파고</label><input type="checkbox" name="papago" value="papago" id="papago"></dd>
                </dl>
            </div>
        </div>
    </div>
    <div class="box-container-main">
        <div class="container letter-spacing">
            <div class="box-left-main">
                <div class="banner1">
                    <a href="#" target="_blank"><img src="https://ssl.pstatic.net/tveta/libs/1282/1282740/b7de4ced147a82421056_20200618185424423.jpg" alt=""></a>
                    <a href="#" target="_blank"><img src="https://ssl.pstatic.net/tveta/libs/1276/1276273/fd0519856f3f9a92ef34_20200619145456880_1.png" alt=""></a>
                    <a href="#" target="_blank"><img src="https://ssl.pstatic.net/tveta/libs/1282/1282632/3e1512f09fe372577f5e_20200622094720733.jpg" alt=""></a>
                    <a href="#" target="_blank"><img src="https://ssl.pstatic.net/tveta/libs/1282/1282632/f5d52b67356d647d98f6_20200622094726737.jpg" alt=""></a>
                </div>
                <div class="box-news">
                    <div class="box-news-auto">
                        <a href="#" class="box-news-title">연합뉴스</a>
                        <div class="contents"><a href="https://news.naver.com/main/list.nhn?mode=LPOD&mid=sec&sid1=001&sid2=140&oid=001&isYeonhapFlash=Y&aid=0011697519" class="box-news-content">'갓갓' 공범 안승진 얼굴 드러내…작은 체구에 안경 착용</a></div>
                        <div class="contents"><a href="https://news.naver.com/main/list.nhn?mode=LPOD&mid=sec&sid1=001&sid2=140&oid=001&isYeonhapFlash=Y&aid=0011697465" class="box-news-content">'음주운전 사고' 강정호 "4년째 금주하고 있다…속죄하겠다"</a></div>
                        <div class="contents"><a href="https://news.naver.com/main/list.nhn?mode=LPOD&mid=sec&sid1=001&sid2=140&oid=001&isYeonhapFlash=Y&aid=0011697320" class="box-news-content">토지거래허가제 시행에…대치동·잠실동 등 거래도·문의도 '뚝'</a></div>
                        <div class="contents"><a href="https://news.naver.com/main/list.nhn?mode=LPOD&mid=sec&sid1=001&sid2=140&oid=001&isYeonhapFlash=Y&aid=0011697604" class="box-news-content">55→61→92…부산항 확진 러 선원 밀접접촉자 계속 늘어</a></div>
                        <div class="contents"><a href="https://news.naver.com/main/list.nhn?mode=LPOD&mid=sec&sid1=001&sid2=140&oid=001&isYeonhapFlash=Y&aid=0011697523" class="box-news-content">대전 방문판매업체 확진 8명 늘어 총 57명…"집단감염 지속"</a></div>
                        <div class="contents"><a href="https://news.naver.com/main/list.nhn?mode=LPOD&mid=sec&sid1=001&sid2=140&oid=001&isYeonhapFlash=Y&aid=0011697642" class="box-news-content">트럼프 "볼턴 왜곡" 청와대發 연합뉴스 기사 리트윗하며 "봤지?"</a></div>
                        <div class="contents"><a href="https://news.naver.com/main/list.nhn?mode=LPOD&mid=sec&sid1=001&sid2=140&oid=001&isYeonhapFlash=Y&aid=0011697677" class="box-news-content">통일부 "대북전단 살포 시도에 깊은 유감…엄정 조치할 것"</a></div>
                        <div class="contents"><a href="https://news.naver.com/main/list.nhn?mode=LPOD&mid=sec&sid1=001&sid2=140&oid=001&isYeonhapFlash=Y&aid=0011697645" class="box-news-content">이달 30일부터 '병역거부자 대체복무' 신청받는다…심사위 구성</a></div>
                        <div class="contents"><a href="https://news.naver.com/main/list.nhn?mode=LPOD&mid=sec&sid1=001&sid2=140&oid=001&isYeonhapFlash=Y&aid=0011696987" class="box-news-content">나홀로가구 600만 시대…1인 가구 40%는 미취업</a></div>
                        <div class="contents"><a href="https://news.naver.com/main/list.nhn?mode=LPOD&mid=sec&sid1=001&sid2=140&oid=001&isYeonhapFlash=Y&aid=0011697403" class="box-news-content">강남 토지거래허가구역에서 전세 '품귀'…전셋값 급등 우려</a></div>
                        <div class="box-news-type">
                            <a href="#" class="navernews">네이버뉴스</a>
                            <a href="#">연예</a>
                            <a href="#">스포츠</a>
                            <a href="#">경제</a>
                        </div>
                    </div>
                    <div class="box-newstand">
                        <a href="https://newsstand.naver.com/" target="_black" class="box-newstand-title">뉴스스탠드</a>
                        <a href="#" class="sub-press">구독한 언론사</a>
                        <a href="#" class="all-press">전체언론사</a>
                        <div class="set-press">
                            <a href="#" class="btn-set"><i class="set-press-one bg-44265f"></i></a>
                            <a href="#" class="btn-set"><i class="set-press-two bg-44265f set"></i></a>
                            <a href="#" class="btn-set not"><i class="set-press-three bg-44265f"></i></a>
                        </div>
                    </div>
                    <div class="box-sub-press">
                        <div class="box-sub-press-no display-none">
                            <strong class="box-sub-press-no-head">구독한 언론사가 없습니다.</strong>
                            <p class="box-sub-press-no-body">언론사 구독 설정에서 관심있는 언론사를 구독하시면<br>
                                언론사가 직접 편집한 뉴스들을 네이버 홈에서 바로 보실 수 있습니다.</p>
                            <a href="#" class="box-sub-press-no-footer">언론사 구독 설정하기</a>
                        </div>
                        <div class="box-sub-press-yes display: none">
                            <div class="box-sub-press-yes-left">
                                
                            </div>
                            <div class="box-sub-press-yes-right">

                            </div>
                        </div>
                    </div>
                    <div class="box-all-press">
                        <a href="#" class="pre-side"><i class="icon-pre-side bg-44265f"></i></a>
                        <a href="#" class="next-side"><i class="icon-next-side bg-44265f"></i></a>
                        <div class="box-press">
                            <div class="press">
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/038.png" alt="한국일보">한국일보</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=&pcode=038" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                    <div class="box-uncheck-press">
                                        <div class="btn-close-uncheck">
                                            <i class="icon-close-uncheck bg-44265f"></i>
                                        </div>
                                        <p><strong class="uncheck-press-name"></strong><strong>을(를)</strong><br>
                                        구독해지 하시겠습니까?</p>
                                        <a href="#" class="uncheck-yes">확인</a>
                                        <a href="#" class="uncheck-no">취소</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/009.png" alt="매일경제">매일경제</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=009" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/021.png" alt="문화일보">문화일보</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=021" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/023.png" alt="조선일보">조선일보</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=023" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/047.png" alt="오마이뉴스">오마이뉴스</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=047" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/904.png" alt="JTBC">JTBC</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=904" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/002.png" alt="프레시안">프레시안</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=002" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/092.png" alt="지디넷코리아">지디넷코리아</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/056.png" alt="KBS">KBS</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/073.png" alt="스포츠서울">스포츠서울</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/368.png" alt="데일리안">데일리안</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/016.png" alt="헤럴드경제">헤럴드경제</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=016" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/139.png" alt="스포탈코리아">스포탈코리아</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=139" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/015.png" alt="한국경제">한국경제</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/020.png" alt="동아일보">동아일보</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=020" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/968.png" alt="한국금융신문">한국금융신문</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/802.png" alt="스포츠Q">스포츠Q</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/979.png" alt="약사공론">약사공론</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/923.png" alt="인민망">인민망</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/384.png" alt="한국대학신문">한국대학신문</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=384" target="_blank" class="go-press">기사보기</a>
                                    </div>  
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/340.png" alt="OBS">OBS</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/915.png" alt="르몽드 디폴르마티크">르몽드 디폴르마티크</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/356.png" alt="게임메카">게임메카</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/094.png" alt="월간산">월간산</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=094" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="press">
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/422.png" alt="연합뉴스TV">연합뉴스TV</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/308.png" alt="시사인">시사인</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/003.png" alt="뉴시스">뉴시스</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/032.png" alt="경향신문">경향신문</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/up/2020/0610/nsd151458769.png" alt="OSEN">OSEN</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/312.png" alt="텐아시아">텐아시아</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/362.png" alt="자동차생활">자동차생활</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/807.png" alt="인사이트코리아">인사이트코리아</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/040.png" alt="코리아타임스"">코리아타임스</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/981.png" alt="TBS교통방송">TBS교통방송</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/902.png" alt="TV조선">TV조선</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/944.png" alt="나우뉴스">나우뉴스</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/977.png" alt="헬로디디"">헬로디디</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/028.png" alt="한겨레">한겨레</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=948" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/440.png" alt="티브이데일리">티브이데일리</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/327.png" alt="뉴데일리">뉴데일리</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/006.png" alt="미디어오늘">미디어오늘</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/376.png" alt="지지통신">지지통신</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/214.png" alt="MBC">MBC</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=&pcode=214" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/030.png" alt="전자신문">전자신문</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>  
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/014.png" alt="파이낸셜뉴스">파이낸셜뉴스</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/052.png" alt="YTN">YTN</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/117.png" alt="마이데일리">마이데일리</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/314.png" alt="스포츠동아">스포츠동아</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=016" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="press">
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/005.png" alt="국민일보">국민일보</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/293.png" alt="블로터">블로터</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=016" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/982.png" alt="이코노미조선">이코노미조선</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/355.png" alt="사이언스타일즈">사이언스타일즈</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/075.png" alt="맥스무비">맥스무비</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/911.png" alt="농민신문">농민신문</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>  
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/076.png" alt="스포츠조선">스포츠조선</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/921.png" alt="아주경제">아주경제</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/990.png" alt="주간조선">주간조선</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/346.png" alt="헬스조선">헬스조선</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=346" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/988.png" alt="이웃집과학자">이웃집과학자</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/965.png" alt="전기신문">전기신문</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=965" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/939.png" alt="브릿지경제">브릿지경제</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/396.png" alt="스포츠월드">스포츠월드</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/143.png" alt="쿠키뉴스">쿠키뉴스</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/815.png" alt="법률방송뉴스">법률방송뉴스</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=815" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/925.png" alt="일요신문">일요신문</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/144.png" alt="스포츠경향">스포츠경향</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/993.png" alt="허프포스트코리아">허프포스트코리아</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/932.png" alt="CEO스코어데일리">CEO스코어데일리</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/972.png" alt="PD저널">PD저널</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/277.png" alt="아시아경제">아시아경제</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=016" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>  
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/108.png" alt="스타뉴스">스타뉴스"</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/941.png" alt="초이스경제">초이스경제</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                </div>
                                <div class="press">
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/816.png" alt="시사오늘">시사오늘</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/416.png" alt="SBS연예스포츠">SBS연예스포츠</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/122.png" alt="법률신문">법률신문</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/934.png" alt="아리랑TV">아리랑TV</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/243.png" alt="이코노미스트">이코노미스트</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/814.png" alt="미주한국일보">미주한국일보</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=814" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/938.png" alt="그린포스트코리아">그린포스트코리아</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/989.png" alt="TBC">TBC</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/120.png" alt="EBN">EBN</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/903.png" alt="채널에이">채널에이</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/241.png" alt="월간스포츠">월간스포츠</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/404.png" alt="enews24">enews24</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/960.png" alt="건설경제신문">건설경제신문</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="https://newsstand.naver.com/?list=ct1&pcode=960" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/539.png" alt="위키트리">위키트리</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/042.png" alt="데일리한국">데일리한국</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/951.png" alt="포브스코리아">포브스코리아</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/140.png" alt="씨네21">씨네21</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/811.png" alt="한국농어촌방송">한국농어촌방송</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/991.png" alt="데일리NK">데일리NK</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/906.png" alt="KNN">KNN</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/922.png" alt="이투데이">이투데이</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/810.png" alt="신아일보">신아일보</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/311.png" alt="엑스포츠뉴스">엑스포츠뉴스</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                                <div class="box-press-name"><a href="#" class="press-name"><img src="https://s.pstatic.net/static/newsstand/2020/logo/light/0604/966.png" alt="정신의학신문">정신의학신문</a>
                                    <div class="box-choice-press">
                                        <a href="#" class="check-press">구독</a>
                                        <a href="#" class="uncheck-press">해지</a>
                                        <a href="" target="_blank" class="go-press">기사보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="theme-type">
                    <div class="theme-type-head">
                        <div class="theme-type-title">
                            <div class="left-title">
                                <strong>오늘 읽을만한 글</strong>
                                <span>주제별로 분류된 다양한 글 모음</span> 
                            </div>
                            <div class="right-title">
                                <strong>2,185</strong>
                                <span>개의 글</span>
                                <a href="" class="set-theme">관심주제 설정</a>
                            </div>
                        </div>
                        <div class="theme-type-nav">
                            <a href="#" class="left-type"><i class="icon-left-type bg-44265f"></i></a>
                            <a href="#" class="right-type"><i class="icon-right-type bg-44265f"></i></a>
                            <div class="hide-type-nav">
                                <div class="low-type-nav">
                                    <ul class="type-nav">
                                        <li class="type-item">
                                            <a href="#" class="theme-enter" data-target="enter">엔터</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-sports" data-target="sports">스포츠</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-car" data-target="car">자동차</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-cartoon" data-target="cartoon">웹툰</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-finance" data-target="finance">경제M</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-food" data-target="food">푸드</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-game" data-target="game">게임</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-movie" data-target="movie">영화</a>
                                        </li>
                                    </ul>
                                    <ul class="type-nav">
                                        <li class="type-item">
                                            <a href="#" class="theme-JOB">JOB&</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-tech">테크</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-travel">여행+</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-science">과학</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-living">리빙</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-health">건강</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-busness">비즈니스</a>
                                        </li>
                                        <li class="type-item"><a href="#" class="theme-marry">연애·결혼</a></li>
                                    </ul>
                                    <ul class="type-nav">
                                        <li class="type-item">
                                            <a href="#" class="theme-book">책문화</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-parent">부모i</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-law">법률</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-beauty">패션뷰티</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-animal">동물공감</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-design">디자인</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-china">중국</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-FARM FARM">FARM</a>
                                        </li>
                                    </ul>
                                    <ul class="type-nav">
                                        <li class="type-item">
                                            <a href="#" class="theme-perfomence">공연전시</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-with">함께N</a>
                                        </li>
                                        <li class="type-item">
                                            <a href="#" class="theme-school">스쿨잼</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="theme-type-body">
                        <div class="theme-content enter">엔터</div>
                        <div class="theme-content sports">스포츠</div>
                        <div class="theme-content car">자동차</div>
                        <div class="theme-content cartoon">웹툰</div>
                        <div class="theme-content finance">경제M</div>
                        <div class="theme-content food">푸드</div>
                        <div class="theme-content game">게임</div>
                        <div class="theme-content movie">영화</div>
                    </div>
                </div>
            </div>  
            <div class="box-right-main">
                <div class="box-login">
                    <p class="login-head">네이버를 더 안전하고 편리하게 이용하세요</p>
                    <a href="#" class="login-body"><i class="icon-login bg-44265f"></i>로그인</a>
                    <div class="login-footer">
                        <div class="find">
                            <a href="#" class="find-id">아이디</a>
                            <a href="#" class="find-pw">비밀번호찾기</a>
                        </div>
                        <a href="#" class="make-id">회원가입</a>
                    </div>
                </div>
                <div class="timesquare">
                    <div class="timesquare-view">
                        <div class="timesquare-contents-box">
                            <a href="https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=%EC%BD%94%EB%A1%9C%EB%82%9819" class="timesquare-content1">
                                <i class="badge-news">이슈</i>
                                <span class="text-news">코로나바이러스감염증19 현황</span> 
                            </a>
                            <a href="https://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=09650108" class="timesquare-content2">
                                <div class="box-current">
                                    <strong class="text-current">23.2°</strong>
                                    <strong class="text-state">흐림</strong>
                                </div>
                                <div class="box-dgree">
                                    <span class="text-dgree-max">25.0°</span>
                                    <span class="text-dgree-min">21.0°</span>
                                </div>
                                <div class="box-location">서초동</div> 
                            </a>
                            
                        </div>
                    </div>
                    <div class="timesquare-controller">
                        <div class="controller-box">
                            <a href="#" class="left-controller"><i class="icon-left-controller bg-44265f"></i></a>
                            <a href="#" class="right-controller"><i class="icon-right-controller bg-44265f"></i></a>
                        </div>
                    </div>
                </div>
                <div class="banner2">
                    <a href="https://lineagem.plaync.com/preorder/record/200624/index?LM=09020102" class="link=banner2"><img src="https://ssl.pstatic.net/tveta/libs/1284/1284971/6f14f180165caf8464a7_20200624103218507.jpg" alt="" class="image-banner2"></a>
                </div>
                <div class="box-shopping">
                    <div class="box-shopping-head">
                        <div class="box-shopping-head-left">
                            <a href="https://shopping.naver.com/" class="link-shopping">쇼핑</a>
                        </div>
                        <div class="box-shopping-head-right">
                            <a href="" class="link-product default-box-shopping-head" title="상품은 광고영역입니다.">상품</a>
                            <a href="" class="link-shoppingmall" title="쇼핑몰은 광고영역입니다.">쇼핑몰</a>
                            <a href="" class="link-men" title="MEN은 광고영역입니다.">MEN</a>
                        </div>
                    </div>
                    <div class="box-shopping-body">
                        <div class="box-shoppingmall-name">
                            <div class="shoppingmall-name1">
                                <a href="" class="link-shoppingmalls set-shoppingmall-name">G마켓</a>
                                <span></span>
                                <a href="" class="link-shoppingmalls">옥션</a>
                                <span></span>
                                <a href="" class="link-shoppingmalls">11번가</a>
                                <span></span>
                                <a href="" class="link-shoppingmalls set-shoppingmall-name">위메프</a>
                                <span></span>
                                <a href="" class="link-shoppingmalls">티몬</a>
                                <span></span>
                                <a href="" class="link-shoppingmalls">이마트몰</a>
                            </div>
                            <div class="shoppingmall-name2">
                                <a href="" class="link-shoppingmalls">올리브영</a>
                                <span></span>
                                <a href="" class="link-shoppingmalls set-shoppingmall-name">GS샵</a>
                                <span></span>
                                <a href="" class="link-shoppingmalls">롯데i몰</a>
                                <span></span>
                                <a href="" class="link-shoppingmalls">CJmall</a>
                                <span></span>
                                <a href="" class="link-shoppingmalls set-shoppingmall-name">신세계몰</a>
                                <span></span>
                                <a href="" class="link-shoppingmalls">롯데ON</a>
                            </div>
                        </div>
                        <div class="box-shopping-contents">
                            <div class="shopping-contents-control">
                                <div class="num-box">
                                    <span class="this-page">1</span>
                                    <span>/</span>
                                    <span class="all-page">19</span>
                                </div>
                                <div class="btn-box">
                                    <a href="#" class="page-prev-btn"></a>
                                    <a href="#" class="page-next-btn"></a>
                                </div>
                            </div>
                            <div class="link-product-contents">
                                <div class="product-content1">1</div>
                                <div class="product-content2 display-none">2</div>
                                <div class="product-content3 display-none">3</div>
                                <div class="product-content4 display-none">4</div>
                                <div class="product-content5 display-none">5</div>
                                <div class="product-content6 display-none">6</div>
                                <div class="product-content7 display-none">7</div>
                                <div class="product-content8 display-none">8</div>
                                <div class="product-content9 display-none">9</div>
                                <div class="product-content10 display-none">10</div>
                                <div class="product-content11 display-none">11</div>
                                <div class="product-content12 display-none">12</div>
                                <div class="product-content13 display-none">13</div>
                                <div class="product-content14 display-none">14</div>
                                <div class="product-content15 display-none">15</div>
                                <div class="product-content16 display-none">16</div>
                                <div class="product-content17 display-none">17</div>
                                <div class="product-content18 display-none">18</div>
                                <div class="product-content19 display-none">19</div>
                            </div>
                            <div class="link-shoppingmall-contents display-none">
                                <div class="shoppingmall-content1 display-none">1</div>
                                <div class="shoppingmall-content2 display-none">2</div>
                                <div class="shoppingmall-content3 display-none">3</div>
                                <div class="shoppingmall-content4 display-none">4</div>
                                <div class="shoppingmall-content5 display-none">5</div>
                                <div class="shoppingmall-content6 display-none">6</div>
                                <div class="shoppingmall-content7 display-none">7</div>
                                <div class="shoppingmall-content8 display-none">8</div>
                                <div class="shoppingmall-content9 display-none">9</div>
                                <div class="shoppingmall-content10 display-none">10</div>
                                <div class="shoppingmall-content11 display-none">11</div>
                                <div class="shoppingmall-content12 display-none">12</div>
                                <div class="shoppingmall-content13 display-none">13</div>
                            </div>
                            <div class="link-men-contents display-none">
                                <div class="men-content1 display-none">1</div>
                                <div class="men-content2 display-none">2</div>
                                <div class="men-content3 display-none">3</div>
                                <div class="men-content4 display-none">4</div>
                                <div class="men-content5 display-none">5</div>
                                <div class="men-content6 display-none">6</div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="container">
            
        </div>
    </div>
    <script>
    </script>
</body>
</html>