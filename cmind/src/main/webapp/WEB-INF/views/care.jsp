<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 프로젝트의 contextpath 값을 동적으로 가져오는 방법 -->
<c:set var="cpath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>마음체</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${cpath}/resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${cpath}/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${cpath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${cpath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${cpath}/resources/css/style.css?a" rel="stylesheet">
    
    <!-- 슬라이드 기능에 필요한 링크-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
</head>

<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->
	
	<!-- Navbar Start -->
    <nav style="position:fixed;" class="navbar navbar-expand-lg navbar-dark fixed-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
        <a href="index.do" class="navbar-brand ms-4 ms-lg-0" style="position:absolute; z-index:3;">
            <img src="${cpath}/resources/img/logo.png" style="width:100px; height:100px; margin-top:10px;">
        </a>
       <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav mx-auto p-4 p-lg-0">
                <a href="${cpath}/index.do" class="nav-item nav-link">홈</a>
                <a href="${cpath}/aboutTest.do" class="nav-item nav-link">HTP란?</a>
                <a href="${cpath}/testMain.do" class="nav-item nav-link">심리검사</a>
                <a href="${cpath}/care.do" class="nav-item nav-link"  style = "color: #E48B77 !important;">심리케어</a>
                <a href="${cpath}/diary.do" class="nav-item nav-link">감정일기</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
                    <div class="dropdown-menu m-0">
                        <a href="${cpath}/myPage.do" class="dropdown-item">감정 일기 통계</a>
                        <a href="${cpath}/result.do" class="dropdown-item">심리검사 결과</a>
                    </div>
                </div>
                <c:if test="${empty mvo}">
                <a href="${cpath}/login.do" class="nav-item nav-link">로그인</a>
                </c:if>
                <c:if test="${!empty mvo}">
                <p class="nav-item nav-link">${mvo.nickname}님</p>
				<a href="${cpath}/logout.do" class="nav-item nav-link">로그아웃</a>
				</c:if>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

	<!-- Page Header Start -->
    <div class="container-fluid page-header py-6 wow fadeIn" data-wow-delay="0.1s" id = "TMheader"
    style = "background: linear-gradient(rgba(0, 0, 0, .6), rgba(0, 0, 0, .6)), url(${cpath}/resources/img/careHeader02.jpg) center center no-repeat;
    background-size:cover;">
        <div class="container text-center pt-5 pb-3">
            <h1 class="display-4 animated slideInDown mb-3" id="ATtypo">심리 케어</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
	
	<!-- 배경에 이미지 깔려고 만든 div -->
	<div style="width:100%; background-image:url('${cpath}/resources/img/bk01.png');">
	
		<!-- 자존감 아이콘과 설명 시작 -->
		<div id="loveMe" style="display:none">
			<div class="careTypo">
				<div>
					<img src="${cpath}/resources/img/loveMe.png" class="careImg">
				</div>
				<div class="infoCon">
					<div class="mindInfo">
						<h3>자존감</h3>
						<br><br>
						<p>자신이 사랑받을 만한 가치가 있는 소중한 존재이고 어떤 성과를 이루어낼 만한 유능한 사람이라고 믿는 마음</p>
					</div>
				</div>
			</div>
		
		<div class="careMsg">
			<p>
				나는 나를 얼마나 잘 알고 있을까? ${mvo.nickname}님의 떨어지는 자존감을 회복시키고 건강한 인간관계를 만들어 갈 수 있도록 
				마음:체가 이름이름이름님에게 맞춤 컨텐츠를 추천해 드릴게요.
			</p>
			<button class="custom-btn btn-12">
			<span>심리상담사 추천받기</span>
			<span>지금 나와 맞는 상담사를 찾고 있나요?</span>
			</button>
		</div>
		</div>
		<!-- 자존감 아이콘과 설명 끝 -->
		
		<!-- 우울 아이콘과 설명 시작 -->
		<div id="depress" style="display:none">
			<div class="careTypo">
				<div class="infoCon">
					<img src="${cpath}/resources/img/depress.png" class="careImg">
				</div>
				<div>
					<div class="mindInfo">
						<h3>우울</h3>
						<br><br>
						<p>근심스럽거나 답답해서 활기가 안 드는 것에 대해서  반성이나 공상이 따르는 슬픈 감정</p>
					</div>
				</div>
			</div>
			
		<div class="careMsg">
			<p>
				가라앉은 마음이 회복되지 않을 때, ${mvo.nickname}님이 충분히 슬퍼하고 다시 시작할 수 있게 <br>
				마음:체가 이름이름이름님에게 맞춤 컨텐츠를 추천해 드릴게요.
			</p>
			<button class="custom-btn btn-12">
			<span>심리상담사 추천받기</span>
			<span>지금 나와 맞는 상담사를 찾고 있나요?</span>
			</button>
		</div>
		</div>
		<!-- 우울 아이콘과 설명 끝 -->
		
		<!-- 공격성 아이콘과 설명 시작 -->
		<div id="mad" style="display:none">
			<div class="careTypo">
				<div>
					<img src="${cpath}/resources/img/mad.png" class="careImg">
				</div>
				<div class="infoCon">
					<div class="mindInfo">
						<h3>공격성</h3>
						<br><br>
						<p>공격적인 행동을 하려는 당당하고 호전적인 마음. 
							용기와 비례하며 신경성과 반비례하는 경향</p>
					</div>
						
				</div>
			</div>
		<div class="careMsg">
			<p>
				부쩍 나를 힘들게 하는 일이 있을 때, <br>
				${mvo.nickname}님이 감정을 건강하고 시원하게 해소하도록 맞춤 추천할게요.
			</p>
			<button class="custom-btn btn-12">
			<span>심리상담사 추천받기</span>
			<span>지금 나와 맞는 상담사를 찾고 있나요?</span>
			</button>
		</div>
		</div>
		<!-- 공격성 아이콘과 설명 끝 -->
		
		<!-- 불안 아이콘과 설명 시작 -->
		<div id="fear" style="display:none">
			<div class="careTypo" >
				<div>
					<img src="${cpath}/resources/img/fear.png" class="careImg">
				</div>
				<div class="infoCon">
					<div class="mindInfo">
						<h3>불안</h3>
						<br><br>
						<p>특정한 대상이 없이 막연히 나타나는 불쾌한 마음, 
						안도감이나 확신이 상실된 상태
						</p>
					</div>
						
				</div>
			</div>
		<div class="careMsg">
			<p>
				두근거리는 마음이 좀처럼 안정되지 않을 때, <br>
				${mvo.nickname}님의 마음에 위안이 될 수 있도록 맞춤 추천할게요.
			</p>
			<button class="custom-btn btn-12">
			<span>심리상담사 추천받기</span>
			<span>지금 나와 맞는 상담사를 찾고 있나요?</span>
			</button>
		</div>
		</div>
		<!-- 불안 아이콘과 설명 끝 -->
		
		<!-- 공상 아이콘과 설명 시작 -->
		<div id="think" style="display:none">
			<div class="careTypo">
				<div class="infoCon">
					<img src="${cpath}/resources/img/think.png" class="careImg">
				</div>
				<div class="infoCon">
					<div class="mindInfo">
						<h3>공상</h3>
						<br><br>
						<p>현실감이 떨어지거나 실현될 가능성이 적은 것을
						막연하게 생각하는 마음</p>			
					</div>
				</div>
			</div>
		
		<div class="careMsg">
			<p>
				자꾸만 이상한 생각이 마구 떠오를 때, <br>
				${mvo.nickname}님의 마음과 일상을 들여다볼 수 있도록 맞춤 추천할게요

			</p>
			<button class="custom-btn btn-12">
			<span>심리상담사 추천받기</span>
			<span>지금 나와 맞는 상담사를 찾고 있나요?</span>
			</button>
		</div>
		</div>
		<!-- 공상 아이콘과 설명 끝 -->
		
		
	</div>
		
	
	
	<!--  케어콘텐츠 안내 -->
	<div class="careTit">ASMR</div>
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<!-- 슬라이드 항목 하나 시작 -->
			<div class="swiper-slide">
				<a href="http://www.naver.com"> <!-- 링크 달 거면 a태그 살려주기! 아니면 그냥 빼면 돼요! 아래 div에는 a태그 없음 -->
					<img src="https://i.ytimg.com/an_webp/Kr7eiJz0kvc/mqdefault_6s.webp?du=3000&sqp=CPOd-5cG&rs=AOn4CLBcYXxyDsBBnn-tuTFVRFchTJXZSg">
					<p class="careCon">공부하는 소리 asmr</p>
				</a>
			</div>
			<!-- 슬라이드 항목 하나 끝 -->
			
			<div class="swiper-slide"><img src="https://i.ytimg.com/an_webp/PD90OLzok_8/mqdefault_6s.webp?du=3000&sqp=CMCB-5cG&rs=AOn4CLDHMEyo60PRDlSTzldufgDLsr6Wng">
				<p class="careCon">화장품 부수기</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/an_webp/9Xn79E69Dgw/mqdefault_6s.webp?du=3000&sqp=CICj-5cG&rs=AOn4CLCTKW4xft6Ika8AOXU6UQIS2Q8UgQ">
				<p class="careCon">팅글 영상 20분 모음</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/an_webp/IJCWC6JSTUA/mqdefault_6s.webp?du=3000&sqp=CNCh-5cG&rs=AOn4CLBYsVjX_0nWuvyoUlMvlgBFwSGYSg">
				<p class="careCon">장작불과 풀벌레 소리</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/an_webp/HrO74lj5QBs/mqdefault_6s.webp?du=3000&sqp=CMv3-pcG&rs=AOn4CLCuzOZuO5WKoqZwQUUfslmBNrjJLg">
				<p class="careCon">새벽 공원의 빗소리</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/an_webp/JOckUlv4m9I/mqdefault_6s.webp?du=3000&sqp=CMbp-pcG&rs=AOn4CLDXnrWwXSxFoLNEg55K9WZk1FPr4A">
				<p class="careCon">잠오는 베이킹 사운드</p>
			</div>
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>

	<!--  케어콘텐츠 안내 -->
	<div class="careTit">명상</div>
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide"><img src="https://i.ytimg.com/an_webp/yiysD0Jl2Wo/mqdefault_6s.webp?du=3000&sqp=CIbx-pcG&rs=AOn4CLA1AzAQpKi0FNJCpaxjikuc_jKUcw">
				<p class="careCon">삶에 명상 한스푼</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/an_webp/PIoK5ZdYk6E/mqdefault_6s.webp?du=3000&sqp=CICl-5cG&rs=AOn4CLA6xvn3zHoYHneTOUOk4XRMi9c4Rg">
				<p class="careCon">5분 아침 명상</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/an_webp/xeul9fEvo-Q/mqdefault_6s.webp?du=3000&sqp=CNyn-5cG&rs=AOn4CLD4wIhUjjqYTK8pWzGtdEl-MOKcNg">
				<p class="careCon">7분 자신감 채우기</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/vi/y3deSlrQ7qY/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLByegqQFfSG-0bbtVFQL4b3PJVjEQ">
				<p class="careCon">마음이 편해지는 싱잉볼</p>
			</div>
			<div class="swiper-slide"><img src=https://i.ytimg.com/an_webp/PY2qCvdgP9E/mqdefault_6s.webp?du=3000&sqp=CNCm-5cG&rs=AOn4CLA3xyhLrau433LPl01_C3-bjopI-g>
				<p class="careCon">정목스님의 아침명상</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/an_webp/zAIZpNbYytI/mqdefault_6s.webp?du=3000&sqp=CI6i-5cG&rs=AOn4CLCFd_pk_w2olWS1u2ovDA6JngC4wA">
				<p class="careCon">명상하면서 잠들어보세요</p>
			</div>
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
	
	
	
	
	<!--  케어콘텐츠 안내 -->
	<div class="careTit">상품</div>
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide"><img src="https://i.ytimg.com/an_webp/LsmZEPmQChY/mqdefault_6s.webp?du=3000&sqp=CPKa-5cG&rs=AOn4CLA7P76BuEKy0iMmdQ2duq5O8H9o6w">
				<p class="careCon">러쉬 배쓰밤 16종</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/an_webp/QXH1-NuzJr4/mqdefault_6s.webp?du=3000&sqp=CPaG-5cG&rs=AOn4CLDmg4Vmpl6XAK9A-62d-L-q64TXmA">
				<p class="careCon">마호가니 칼림바</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/an_webp/RaWdi2xS7J0/mqdefault_6s.webp?du=3000&sqp=CKmK-5cG&rs=AOn4CLC5Rr-_qt_kuq7Y99qPd_XK4CqDfQ">
				<p class="careCon">[불리]1803</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/an_webp/7vCkiopL9sg/mqdefault_6s.webp?du=3000&sqp=CMCw-5cG&rs=AOn4CLAT9bQh74zoYwCDXzZf-F-v1knZ5w">
				<p class="careCon">양모펠트  DIY키트</p>
			</div>
			<div class="swiper-slide"><img src=https://i.ytimg.com/an_webp/SJOQbwDI_DQ/mqdefault_6s.webp?du=3000&sqp=CNjh-pcG&rs=AOn4CLDBoJFfnC4Lw05mWc_-g69IsQqdtQ>
				<p class="careCon">가정용 불멍 에탄올 화로</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/an_webp/V0bvhB_ufDo/mqdefault_6s.webp?du=3000&sqp=CKii-5cG&rs=AOn4CLCIhXcSKigtmKlL397IWIsvyzJD_Q">
				<p class="careCon">[힐링]미니어쳐 쿠킹</p>
			</div>
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
	
	
	

  <!-- Copyright Start -->
    <div class="container-fluid copyright text-light py-4 wow fadeIn" data-wow-delay="0.1s" id="copy">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; <a href="https://github.com/2022-SMHRD-KDT-BigData-6/mind">캐치 마인드</a>, All Right Reserved.
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    Designed By <a href="https://htmlcodex.com">(주) 미리</a>
                    <br>Distributed By: <a class="border-bottom" href="https://smhrd.or.kr/" target="_blank">스마트인재개발원</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright End -->
	
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${cpath}/resources/lib/wow/wow.min.js"></script>
	<script src="${cpath}/resources/lib/easing/easing.min.js"></script>
	<script src="${cpath}/resources/lib/waypoints/waypoints.min.js"></script>
	<script src="${cpath}/resources/lib/counterup/counterup.min.js"></script>
	<script src="${cpath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${cpath}/resources/js/main.js"></script>

	<!-- 슬라이드 기능에 필요한 링크 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

	<!--스크롤 애니메이션들 (아이디로 구분)-->
	<script>
	$(document).ready(function() {
	    $(window).scroll( function(){
	        $('.careTypo').each( function(i){
	            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
	            var bottom_of_window = $(window).scrollTop() + $(window).height();
	            if( bottom_of_window > bottom_of_element ){
	                $(this).animate({'opacity':'1'},700);	}	}); 	});	});
	
	$(document).ready(function() {
	    $(window).scroll( function(){
	        $('.careMsg').each( function(i){
	            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
	            var bottom_of_window = $(window).scrollTop() + $(window).height();
	            if( bottom_of_window > bottom_of_element ){
	                $(this).animate({'opacity':'1'},800);	}	});	});	});
	
	//슬라이드 기능에 필요
	new Swiper('.swiper-container', {

	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 1,

	// 그룹수가 맞지 않을 경우 빈칸으로 메우는 기능
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
	});
	
	//심리상태에 따른 안내문구 출력
	window.onload = function() {
		var mad = document.getElementById("mad");
		var dep = document.getElementById("depress");
		var fea = document.getElementById("fear");
		var lov = document.getElementById("loveMe");
		var thi = document.getElementById("think");
		var ma = "${result.ma}";
		
		if(ma==="공격성") {
			mad.style.display='block';
		} else if (ma==="우울") {
			dep.style.display='block';
		} else if (ma==="불안") {
			fea.style.display='block';
		} else if (ma==="자존감") {
			lov.style.display='block';
		} else if (ma==="공상") {
			thi.style.display='block';
		}
		
	}
	
	
	</script>
	
	
</body>

</html>