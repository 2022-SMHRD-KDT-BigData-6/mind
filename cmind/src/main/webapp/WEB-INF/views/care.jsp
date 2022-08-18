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
    <link href="${cpath}/resources/css/style.css?was" rel="stylesheet">
    
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
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
        <a href="index.do" class="navbar-brand ms-4 ms-lg-0">
            <h1 class="text-primary m-0" id="title">마음:체</h1>
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
    style = "background: linear-gradient(rgba(0, 0, 0, .6), rgba(0, 0, 0, .6)), url(${cpath}/resources/img/explainHeader1.jpg) center center no-repeat;
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
		<div>
			<h1> ${mvo.nickname} 님이 가장 신경써줬으면 하는 ${mvo.nickname}님의 감정 </h1>
					</div>
		<!-- 심리상태 아이콘과 설명 시작 -->
		<div id="careTypo">
			<div>
				<img src="${cpath}/resources/img/emot01.png">
			</div>
			<div>
				<div id="mindInfo">
					<h3>자존감</h3>
					<br>
					<p>자신이 사랑받을 만한 가치가 있는 소중한 존재이고 어떤 성과를 이루어낼 만한 유능한 사람이라고 믿는 마음</p>
				</div>
					
			</div>
		</div>
		<!-- 심리상태 아이콘과 설명 끝 -->
	</div>	
		<!-- 케어 안내 문구 시작-->
		<div id="careMsg">
			<p>
				부쩍 힘든 일이 생겼을 때 이름이름이름님의 감정을 건강하고 시원하게 해소할 수 있도록 <br>
				마음:체가 이름이름이름님에게 맞춤 컨텐츠를 추천해 드릴게요
			</p>
			<button class="custom-btn btn-12">
			<span>심리상담사 추천받기</span>
			<span>지금 나와 맞는 상담사를 찾고 있나요?</span>
			</button>
		</div>
		<!-- 케어 안내 문구 끝-->
	
	
	<!--  케어콘텐츠 안내 -->
	<div class="careTit">ASMR</div>
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<!-- 슬라이드 항목 하나 시작 -->
			<div class="swiper-slide">
				<a href="http://www.naver.com"> <!-- 링크 달 거면 a태그 살려주기! 아니면 그냥 빼면 돼요! 아래 div에는 a태그 없음 -->
					<img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/16/bbaec165038fa1fe6a645937ef3fdaa31.jpg">
					<p class="careCon">크로플</p>
				</a>
			</div>
			<!-- 슬라이드 항목 하나 끝 -->
			
			<div class="swiper-slide"><img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/16/bbaec165038fa1fe6a645937ef3fdaa31.jpg">
				<p class="careCon">개맛있겠지..</p>
			</div>
			<div class="swiper-slide"><img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/16/bbaec165038fa1fe6a645937ef3fdaa31.jpg">
				<p class="careCon">주말에 먹을까</p>
			</div>
			<div class="swiper-slide"><img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/16/bbaec165038fa1fe6a645937ef3fdaa31.jpg">
				<p class="careCon">플레인으로</p>
			</div>
			<div class="swiper-slide"><img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/16/bbaec165038fa1fe6a645937ef3fdaa31.jpg">
				<p class="careCon">먹을까</p>
			</div>
			<div class="swiper-slide"><img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/16/bbaec165038fa1fe6a645937ef3fdaa31.jpg">
				<p class="careCon">ㅠㅠㅠ</p>
			</div>
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>

	<!--  케어콘텐츠 안내 -->
	<div class="careTit">아로마</div>
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide"><img src="https://i.ytimg.com/vi/ikD7ZefHP9g/maxresdefault.jpg">
				<p class="careCon">크로플도</p>
			</div>
			<div class="swiper-slide"><img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/16/bbaec165038fa1fe6a645937ef3fdaa31.jpg">
				<p class="careCon">좋지만..</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/vi/ikD7ZefHP9g/maxresdefault.jpg">
				<p class="careCon">당근케이크도</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/vi/ikD7ZefHP9g/maxresdefault.jpg">
				<p class="careCon">진짜진짜</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/vi/ikD7ZefHP9g/maxresdefault.jpg">
				<p class="careCon">최고라고</p>
			</div>
			<div class="swiper-slide"><img src="https://i.ytimg.com/vi/ikD7ZefHP9g/maxresdefault.jpg">
				<p class="careCon">생각해...</p>
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
	        $('#careTypo').each( function(i){
	            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
	            var bottom_of_window = $(window).scrollTop() + $(window).height();
	            if( bottom_of_window > bottom_of_element ){
	                $(this).animate({'opacity':'1'},700);	}	}); 	});	});
	
	$(document).ready(function() {
	    $(window).scroll( function(){
	        $('#careMsg').each( function(i){
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
	
	</script>
	
	
</body>

</html>