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
    <link href="${cpath}/resources/css/style.css?ss" rel="stylesheet">
    
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
                <a href="${cpath}/care.do" class="nav-item nav-link">심리케어</a>
                <a href="${cpath}/diary.do" class="nav-item nav-link">감정일기</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style = "color: #E48B77 !important;">마이페이지</a>
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
            <h1 class="display-4 animated slideInDown mb-3" id="ATtypo">감정일기 통계페이지</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
	
	
	<h2 class="fadeIn" id="statTit">그동안 ${mvo.nickname}님이 <span style="color:#F59F36;">마음:체</span>에 쌓아주신 감정을 모아왔어요.</h2>
	
	
				<!-- 퍼센트를 어떻게 해줘야 할까 고민하는데... 달별 일수 / 감정 카운트로 나눈 수치를 여기 변수에 넣을 수 있었으면 좋겠어요
		    		예를 들어서 8월 20일이고 기쁨10일 슬픔5일 화남5일이면... 기쁨은 20/10 해서 50퍼센트 이렇게 들어갈 수 있게.... -->
	
	
	
	<div style="margin:auto; width:800px; text-align:center;">
		
		<table id="expT">
			<tr style="border-bottom: 1px solid #444444;">
				<td colspan="3" style="margin-bottom: 10px; font-weight:bolder; font-size:20px;">감정 분류</td>
			</tr>
			<tr>
				<td>기쁨, 행복, 설렘</td>
				<td>우울, 슬픔, 후회</td>
				<td>짜증, 분노, 피곤</td>
			</tr>
			<tr>
				<td><div style="width:50px; height:50px; border-radius:50%; background:#A0D59B; margin:auto;"></div></td>
				<td><div style="width:50px; height:50px; border-radius:50%; background:#9BB2D5; margin:auto;"></div></td>
				<td><div style="width:50px; height:50px; border-radius:50%; background:#E08585; margin:auto;"></div></td>
			</tr>
		</table>
		
		
		<table id="mainT">
			<tr style="font-size:30px;">
				<td class="chartT">- 저번 달의 기록 -</td>
				<td class="chartT">- 이번 달의 기록 -</td>
			</tr>
			<tr>
				<td>
				<div class="chartI">
				<div style="border:3px solid #A0D59B; background: rgba(160, 213, 155, 0.5);">20%</div>
				<div style="border:3px solid #9BB2D5; background: rgba(155, 178, 213, 0.5);">30%</div>
				<div style="border:3px solid #E08585; background: rgba(224, 133, 133, 0.5);">50%</div>
				</div>
				</td>


				<td>
				<div class="chartI">
				<div style="border:3px solid #A0D59B; background: rgba(160, 213, 155, 0.5);">40%</div>
				<div style="border:3px solid #9BB2D5; background: rgba(155, 178, 213, 0.5);">30%</div>
				<div style="border:3px solid #E08585; background: rgba(224, 133, 133, 0.5);">30%</div>
				</div>
				</td>
			</tr>
			<tr>
				<td class="chartT"><div class="chartBef"></div></td> <!-- 저번달 그래프 -->
				<td class="chartT"><div class="chartNow"></div></td> <!-- 이번달 그래프 -->
			</tr>
		</table>
		

		
		<table id="allD">
			<tr style="border-bottom: 1px solid #444444;">
				<td colspan="9" style=" font-weight:bolder; font-size:20px;">상세 통계</td>
			</tr>
			<tr>
				<td>기쁨</td>
				<td>행복</td>
				<td>설렘</td>
				<td>우울</td>
				<td>슬픔</td>
				<td>후회</td>
				<td>짜증</td>
				<td>분노</td>
				<td>피곤</td>
			</tr>
			<tr>
				<td>3</td>
				<td>5</td>
				<td>3</td>
				<td>8</td>
				<td>2</td>
				<td>0</td>
				<td>6</td>
				<td>2</td>
				<td>1</td>
			</tr>
		</table>
		<div class="d-grid gap-2 col-6 mx-auto" id="linkB">
		<button type="button" class="btn btn-outline-info btn-lg" style="margin: 70px 0px;">감정일기 쓰러 가기</button>
		</div>
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
	        $('#expT').each( function(i){
	            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
	            var bottom_of_window = $(window).scrollTop() + $(window).height();
	            if( bottom_of_window > bottom_of_element ){
	                $(this).animate({'opacity':'1'},1500);	}	}); 	});	});
	
	$(document).ready(function() {
	    $(window).scroll( function(){
	        $('#mainT').each( function(i){
	            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
	            var bottom_of_window = $(window).scrollTop() + $(window).height();
	            if( bottom_of_window > bottom_of_element ){
	                $(this).animate({'opacity':'1'},800);	}	});	});	});
	
	
	$(document).ready(function() {
	    $(window).scroll( function(){
	        $('#allD').each( function(i){
	            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
	            var bottom_of_window = $(window).scrollTop() + $(window).height();
	            if( bottom_of_window > bottom_of_element ){
	                $(this).animate({'opacity':'1'},1500);	}	});	});	});
	
	$(document).ready(function() {
	    $(window).scroll( function(){
	        $('#linkB').each( function(i){
	            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
	            var bottom_of_window = $(window).scrollTop() + $(window).height();
	            if( bottom_of_window > bottom_of_element ){
	                $(this).animate({'opacity':'1'},1700);	}	});	});	});
	
	
	
	
	//차트그리기
	
	//저번달 그래프
	$(window).ready(function(){
	    var i=1;
	    var func1 = setInterval(function(){
	        if(i<26){
	            color1(i);
	            i++;
	        } else if(i<70){
	            color2(i);
	            i++;
	        } else if(i<101){
	            color3(i);
	            i++;
	        } else {
	            clearInterval(func1);
	        }
	    },10);
	});


	function color1(i){
	    $(".chartBef").css({
	        "background":"conic-gradient(#DAA1A1 0% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	    
	}
	function color2(i){
	    $(".chartBef").css({
	        "background":"conic-gradient(#DAA1A1 0% 25%, #9BB2D5 25% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	     
	}
	function color3(i){
	    $(".chartBef").css({
	        "background":"conic-gradient(#DAA1A1 0% 25%, #9BB2D5 25% 70%, #E08585 70% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	     
	}

	//이번달 그래프
	$(window).ready(function(){
	    var i=1;
	    var func1 = setInterval(function(){
	        if(i<10){
	            color4(i);
	            i++;
	        } else if(i<40){
	            color5(i);
	            i++;
	        } else if(i<101){
	            color6(i);
	            i++;
	        } else {
	            clearInterval(func1);
	        }
	    },10);
	});


	function color4(i){
	    $(".chartNow").css({
	        "background":"conic-gradient(#A0D59B 0% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	    
	}
	function color5(i){
	    $(".chartNow").css({
	        "background":"conic-gradient(#A0D59B 0% 10%, #9BB2D5 10% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	     
	}
	function color6(i){
	    $(".chartNow").css({
	        "background":"conic-gradient(#A0D59B 0% 10%, #9BB2D5 10% 40%, #E08585 40% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	     
	}
	

	
	
	</script>
	
	
	
	
	
	
	
	
</body>

</html>