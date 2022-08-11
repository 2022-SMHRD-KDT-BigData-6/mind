<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 프로젝트의 contextpath 값을 동적으로 가져오는 방법 -->
<c:set var="cpath" value="${ pageContext.request.contextPath }"/>
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
    <link href="${cpath}/resources/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
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
                <a href="${cpath}/aboutTest.do" class="nav-item nav-link" style = "color: #E48B77 !important;">HTP란?</a>
                <a href="${cpath}/testMain.do" class="nav-item nav-link">심리검사</a>
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
            <h1 class="display-4 animated slideInDown mb-3" id="ATtypo">" HTP 검사란 무엇인가요? "</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- About Start -->
    <div class="container-xxl py-6">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div id="explainPhoto" float:left;>
                            <img src="${cpath}/resources/img/explainall-1.png" alt="">
                        </div>
            </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="h-100" float:left;> 
                        <h1 class="display-6 mb-4"><br>H(house)-T(tree)-P(person) Test</h1>
                        <br>
                        <p class="aboutEx">1948년 벅(Buck)이 개발한 <span class="emphasis">투사적 그림검사</span>로, 1958년 햄머(Hammer)에 의해 크게 발전되었습니다.
                            집, 나무, 사람은 누구에게나 친밀한 주제이므로 이 그림을 통해 개인의 <span class="emphasis">무의식</span>을 파악할 수 있습니다.</p>
                        <p class="aboutEx">HTP그림의 해석은, 정신분석에서 밝혀진 상징에 대한 의미, 정신증 환자들이 보이는 방어기제와 강박적 사고, 강박적 행동, 
                            공포와 불안 등의 <span class="emphasis">여러 병리적 현상에서 나타나는 상징성</span>을 연구하며 얻은 단서들을 해석에 적용해 왔습니다. <br> </p>
                        <hr style="background-color: #AAAD8F;">
                            <div class="row g-2 mb-4">
                            <div class="col-sm-6">
                                <i class="fa fa-check text-primary me-2"></i>간단한 검사 도구
                            </div>
                            <div class="col-sm-6">
                                <i class="fa fa-check text-primary me-2"></i>짧은 검사 시간
                            </div>
                            <div class="col-sm-6">
                                <i class="fa fa-check text-primary me-2"></i>언어 능력의 무제약
                            </div>
                            <div class="col-sm-6">
                                <i class="fa fa-check text-primary me-2"></i>다요인적 해석 가능
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-xxl py-6">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="h-100" float:left;> 
                        <h1 class="display-6 mb-4"><br>HTP 검사는 어떻게 하나요?</h1>
                        <br>
                        <p class="aboutEx">먼저, A4 종이와 4B 연필을 준비합니다.</p>
                        <p class="aboutEx"> 편안한 분위기에서 안내에 따라 집, 나무, 사람을 그립니다. 정해진 형식은 없습니다.
                            그리고 싶은 것을 마음껏 그려주세요. </p>
                        <p class="aboutEx">그림을 그린 뒤 해석 기준에 따른 심리 상태 결과를 받아보세요.</p>
                        <p class="aboutEx"><span class="emphasis">'집'</span>은 집과 형제에 대한 생각과 태도를, <br>
                            <span class="emphasis">'나무'</span>는 무의식적 자아상을, <br>
                            <span class="emphasis">'사람'</span>은 의식적 자아상을 의미합니다.</p>
                        <a href="testMain.do">  <button type="button" class="btn btn-outline-success btn-lg" 
                        style="--bs-btn-padding-y: .30rem; --bs-btn-padding-x: .6rem; --bs-btn-font-size: .9rem;">검사하러 가기</button></a>
                    </div>
                </div> 
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div id="explainPhoto" float:left;>
                        <img src="${cpath}/resources/img/explain4-1.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->

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
</body>

</html>