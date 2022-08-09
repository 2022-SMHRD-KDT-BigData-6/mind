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


<body style="background-color: #F2D9C9;">

    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
        <a href="${cpath}/index.do" class="navbar-brand ms-4 ms-lg-0">
            <h1 class="text-primary m-0" id="title">마음:체</h1>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav mx-auto p-4 p-lg-0">
                <a href="${cpath}/index.do" class="nav-item nav-link active">홈</a>
                <a href="${cpath}/aboutTest.do" class="nav-item nav-link">HTP란?</a>
                <a href="${cpath}/testMain.do" class="nav-item nav-link">심리검사</a>
                <a href="${cpath}/diary.do" class="nav-item nav-link">감정일기</a>
                <a href="${cpath}/treeList.do" class="nav-item nav-link">나무목록</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
                    <div class="dropdown-menu m-0">
                        <a href="${cpath}/myPage.do" class="dropdown-item">내 정보</a>
                        <a href="${cpath}/myTree.do" class="dropdown-item">내 나무</a>
                        <a href="${cpath}/result.do" class="dropdown-item">심리검사 결과</a>
                    </div>
                </div>
                <c:if test="${empty mvo}">
                <a href="${cpath}/login.do" class="nav-item nav-link">로그인/회원가입</a>
                </c:if>
                <c:if test="${!empty mvo}">
                <p class="nav-item nav-link">${mvo.username}님</p>
				<a href="${cpath}/logout.do" class="nav-item nav-link">로그아웃</a>
				</c:if>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <!-- Carousel Start -->
    <div class="container-fluid p-0 pb-5 wow fadeIn" data-wow-delay="0.2s">
        <div class="owl-carousel header-carousel position-relative">
            <div class="owl-carousel-item position-relative" style="text-align: right;">
                <img class="img-fluid" src="${cpath}/resources/img/drawHand.png" alt="">
                <div class="owl-carousel-inner">
                    <div class="container" id="mainDv">
                        <div class="row justify-content-start">
                            <div class="col-lg-8" id="titleDv">
                                <!--<p class="text-primary text-uppercase fw-bold mb-2">// The Best Bakery</p>-->
                                <h1 class="display-1 text-light mb-4 animated slideInDown" id="mainTypo">그림에 담긴 마음을 알아보세요</h1>
                                <h2 class="display-1 text-light mb-4 animated slideInDown" id="subTypo">마음:체는 딥러닝 기반의 그림분석 서비스입니다.</h1>
                                <p class="text-light fs-5 mb-4 pb-3" id="indexP">당신이 직접 그린 그림으로 당신의 심리 상태를 분석합니다.<br>
                                    마음:체만의 다채로운 심리 케어 컨텐츠와 함께하면서<br>
                                    마음의 나무에 영양제를 주는 시간을 가져보세요!</p>
                                <!--<a href="" class="btn btn-primary rounded-pill py-3 px-5">Read More</a>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Carousel End -->

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