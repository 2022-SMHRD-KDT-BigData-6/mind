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
    <link href="${cpath}/resources/css/style.css?s" rel="stylesheet">
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
                <a href="${cpath}/testMain.do" class="nav-item nav-link" style = "color: #E48B77 !important;">심리검사</a>
                <a href="${cpath}/care.do" class="nav-item nav-link">심리케어</a>
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
            <h1 class="display-4 animated slideInDown mb-3" id="ATtypo">검사 준비하기</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


	<!-- 심리 검사 설명-->
	<div id="info" style="animation: fadeInUp 1s;">
		<h4 style="text-align: center;" id="slideInfo">
			현재 마음:체는 HTP 검사의 '집 - 나무 - 사람' 중, <span class="emphasis">나무를
				통한 심리 검사 분석</span>만 실시하고 있습니다.
		</h4>
	</div>
	<hr style="width: 70%; margin-left: auto; margin-right: auto;">

	<!-- 넘어가기 자바스크립트 실험중-->
	<div id="slide">
		<div id="s1" style="display: block; animation: fadeIn 1s;">
			<h4 class="slideEx">첫 번째.</h4>
			<p class="slideEx1">
				<span class="emphasis">A4용지</span>와 연하지 않은 <span class="emphasis">펜</span>을
				준비한 뒤 편안한 기분을 유지해 주세요.
			</p>
			<p class="butDiv">
				<span class="befB" onclick="changeB(1)" style="visibility: hidden;"><-이전</span>
				<button type="button" class="btn btn-outline-success btn-lg" 
                        style="--bs-btn-padding-y: .30rem; --bs-btn-padding-x: .6rem; --bs-btn-font-size: .9rem;"><span class="nexB" onclick="changeN(1)">다음-></span></button>
			</p>
		</div>

		<div id="s2" style="display: none; animation: fadeIn 1s;">
			<h4 class="slideEx">두 번째.</h4>
			<p class="slideEx1">
				준비한 종이에 <span class="emphasis">나무</span>를 그려주세요. 정해진 형식은 아무것도 없습니다.
			</p>
			<p class="butDiv">
				<button type="button" class="btn btn-outline-success btn-lg" 
                        style="--bs-btn-padding-y: .30rem; --bs-btn-padding-x: .6rem; --bs-btn-font-size: .9rem;"><span class="befB" onclick="changeB(2)"><-이전</span></button> <button type="button" class="btn btn-outline-success btn-lg" 
                        style="--bs-btn-padding-y: .30rem; --bs-btn-padding-x: .6rem; --bs-btn-font-size: .9rem;"><span class="nexB" onclick="changeN(2)">다음-></span></button>
			</p>
		</div>

		<div id="s3" style="display: none; animation: fadeIn 1s;">
			<h4 class="slideEx" style=" animation: fadeIn 1s;">잠시만요!</h4>
			<p class="slideEx1">
				그림 실력을 보는 검사가 아닙니다. 마음이 가는 대로 <span class="emphasis">자유롭게</span>
				그려주세요!
			</p>
			<p class="butDiv">
				<button type="button" class="btn btn-outline-success btn-lg" 
                        style="--bs-btn-padding-y: .30rem; --bs-btn-padding-x: .6rem; --bs-btn-font-size: .9rem;"><span class="befB" onclick="changeB(3)"><-이전</span></button>
                        <button type="button" class="btn btn-outline-success btn-lg" 
                        style="--bs-btn-padding-y: .30rem; --bs-btn-padding-x: .6rem; --bs-btn-font-size: .9rem;"><span class="nexB" onclick="changeN(3)">다음-></span></button>
			</p>
		</div>

		<div id="s4" style="display: none; animation: fadeIn 1s;">
			<h4 class="slideEx">마지막으로,</h4>
			<p class="slideEx1">
				<span class="emphasis">밝은 곳</span>에서 나무를 <span class="emphasis">정면</span>으로
				촬영해주세요. 제출 버튼을 누르면 잠시 후 검사 결과가 나타납니다.
			<p class="butDiv">
				<button type="button" class="btn btn-outline-success btn-lg" 
                        style="--bs-btn-padding-y: .30rem; --bs-btn-padding-x: .6rem; --bs-btn-font-size: .9rem;"><span class="befB" onclick="changeB(4)"><-이전</span></button> 
                        <button type="button" class="btn btn-outline-primary btn-lg" 
                        style="--bs-btn-padding-y: .30rem; --bs-btn-padding-x: .6rem; --bs-btn-font-size: .9rem;"><a href="testGo.do"><span class="nexB">검사하러 가기</span></a></button>
			</p>
			</p>
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



	<script>
		var num = 1;

		//슬라이드 자바스크립트
		function changeN(idx) {
			const s1 = document.getElementById('s1');
			const s2 = document.getElementById('s2');
			const s3 = document.getElementById('s3');
			const s4 = document.getElementById('s4');
			if (idx == 1) {
				s1.style.display = 'none';
				s2.style.display = 'block';
			} else if (idx == 2) {
				s2.style.display = 'none';
				s3.style.display = 'block';
			} else if (idx == 3) {
				s3.style.display = 'none';
				s4.style.display = 'block';
			}
		}

		function changeB(idx) {
			const s1 = document.getElementById('s1');
			const s2 = document.getElementById('s2');
			const s3 = document.getElementById('s3');
			const s4 = document.getElementById('s4');
			if (idx == 2) {
				s2.style.display = 'none';
				s1.style.display = 'block';
			} else if (idx == 2) {
				s3.style.display = 'none';
				s2.style.display = 'block';
			} else if (idx == 3) {
				s3.style.display = 'none';
				s2.style.display = 'block';
			} else if (idx == 4) {
				s4.style.display = 'none';
				s3.style.display = 'block';
			}
		}
	</script>
</body>

</html>