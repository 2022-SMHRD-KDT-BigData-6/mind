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
    
    <nav style="position:fixed;" class="navbar navbar-expand-lg navbar-dark fixed-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
        <a href="index.do" class="navbar-brand ms-4 ms-lg-0" style="position:absolute; z-index:3;">
            <img src="${cpath}/resources/img/logo.png" style="width:100px; height:100px; margin-top:10px;">
        </a>
       <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav mx-auto p-4 p-lg-0">
                <a href="${cpath}/index.do" class="nav-item nav-link" style = "color: #E48B77 !important;">홈</a>
                <a href="${cpath}/aboutTest.do" class="nav-item nav-link">HTP란?</a>
                <a href="${cpath}/testMain.do" class="nav-item nav-link">심리검사</a>
                <a href="${cpath}/care.do" class="nav-item nav-link">심리케어</a>
                <a href="${cpath}/diary.do" class="nav-item nav-link">감정일기</a>
                <a href="${cpath}/treeList.do" class="nav-item nav-link">나무목록</a>
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

    <!-- 슬라이드 -->
    <div class="container-fluid p-0 pb-5 wow fadeIn" data-wow-delay="0.2s">
        <div class="owl-carousel header-carousel position-relative">
           <!-- 첫번째 슬라이드 -->
            <div class="owl-carousel-item position-relative" style="text-align: right;">
                <img class="img-fluid" src="${cpath}/resources/careIMG/index002.jpg" alt="">
                <div class="owl-carousel-inner">
                    <div class="container" style="padding-bottom: 200px;">
                        <div class="row justify-content-start">
                            <div class="col-lg-8" id="titleDv">
                                <h1 class="display-1 text-light mb-4 animated slideInDown" id="mainTypo">그림에 담긴 마음을 알아보세요</h1>
                                <h2 class="display-1 text-light mb-4 animated slideInDown" id="subTypo">마음:체는 딥러닝 기반의 그림분석 서비스입니다.</h2>
                                <p class="text-light fs-5 mb-4 pb-3" id="indexP">당신이 직접 그린 그림으로 당신의 심리 상태를 분석합니다.<br>
                                    간단한 나무 그림만 있으면<br>
                                    당신의 심리 상태를 알려드립니다!</p>
                                <a href="${cpath}/testGo.do" class="btn btn-primary rounded-pill py-3 px-5">심리검사 하러 가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 두번째 슬라이드 -->
            <div class="owl-carousel-item position-relative" style="text-align: right;">
                <img class="img-fluid" src="${cpath}/resources/careIMG/index003.jpg" alt="">
                <div class="owl-carousel-inner">
                    <div class="container" style="padding-bottom: 200px;">
                        <div class="row justify-content-start">
                            <div class="col-lg-8" id="titleDv">
                                <h1 class="display-1 text-light mb-4 animated slideInDown" id="mainTypo">매일의 감정을 모으면 당신이 됩니다.</h1>
                                <h2 class="display-1 text-light mb-4 animated slideInDown" id="subTypo">감정을 매일 기록하는 마음:체의 감정일기와 함께하세요</h2>
                                <p class="text-light fs-5 mb-4 pb-3" id="indexP">감정을 기록하면 감정 통계를 열람할 수 있습니다.<br>
                                  저번 달의 나와 이번 달의 나를 비교해보세요<br>
                                   어제보다 더 멋진 내가 되어있을지도 몰라요!</p>
                                <a href="${cpath}/diary.do" class="btn btn-primary rounded-pill py-3 px-5">감정일기 쓰러 가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 세번째 슬라이드 -->
            <div class="owl-carousel-item position-relative" style="text-align: right;">
                <img class="img-fluid" src="${cpath}/resources/careIMG/index005.jpg" alt="">
                <div class="owl-carousel-inner">
                    <div class="container" style="padding-bottom: 200px;">
                        <div class="row justify-content-start">
                            <div class="col-lg-8" id="titleDv">
                                <h1 class="display-1 text-light mb-4 animated slideInDown" id="mainTypo">나에게 맞는 심리케어는 무엇일까?</h1>
                                <h2 class="display-1 text-light mb-4 animated slideInDown" id="subTypo">다채로운 케어컨텐츠를 이용해보세요!</h2>
                                <p class="text-light fs-5 mb-4 pb-3" id="indexP">마음:체는 현재 심리상태 기반의 심리케어 컨텐츠를 제공합니다.<br>
                ASMR, 명상, 상품 등을 자유롭게 둘러보세요<br>
                                    더 다채로운 컨텐츠가 추가 예정이에요!</p>
                                <a href="${cpath}/care.do" class="btn btn-primary rounded-pill py-3 px-5">케어컨텐츠 추천받기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
    <!-- Copyright Start -->

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