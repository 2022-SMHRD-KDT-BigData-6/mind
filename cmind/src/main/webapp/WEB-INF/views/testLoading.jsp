<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 프로젝트의 contextpath 값을 동적으로 가져오는 방법 -->
<c:set var="cpath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<title>Maum-title</title>
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
                <a href="${cpath}/index.do" class="nav-item nav-link ">홈</a>
                <a href="${cpath}/aboutTest.do" class="nav-item nav-link">HTPasdsadasd란?</a>
                <a href="${cpath}/testMain.do" class="nav-item nav-link">심리검사</a>
                <a href="${cpath}/Diary.do" class="nav-item nav-link">감정일기</a>
                <a href="${cpath}/Help.do" class="nav-item nav-link">병원안내</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style = "color: #E48B77 !important;">마이페이지</a>
                    <div class="dropdown-menu m-0">
                        <a href="${cpath}/myPage.do" class="dropdown-item">내 정보</a>
                        <a href="${cpath}/myTree.do" class="dropdown-item">내 나무</a>
                        <a href="${cpath}/result.do" class="dropdown-item">심리검사 결과</a>
                    </div>
                </div>
                <c:if test="${empty mvo}">
                <a href="${cpath}/testLogin.do" class="nav-item nav-link">로그인/회원가입</a>
                </c:if>
                <c:if test="${!empty mvo}">
                <p class="nav-item nav-link">${mvo.username}님환영합니다</p>
					<button onclick='location.href="${cpath}/logout.do"'class="btn btn-default">로그아웃</button>
				</c:if>
                </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <!-- Page Header Start -->
    <div class="container-fluid page-header py-6 wow fadeIn" data-wow-delay="0.1s" id="TMheader" 
		 style=" background: linear-gradient(rgba(0, 0, 0, .6), rgba(0, 0, 0, .6)), url(${cpath}/resources/img/testheader1.jpg) center center no-repeat;
		 background-size:cover;">
            <h1 class="display-4 animated slideInDown mb-3" id="ATtypo">" 내 나무 "</h1>
            <nav aria-label="breadcrumb animated slideInDown">
               
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    
     <!--로딩텍스트-->
    <div class="loadMes">
        <span>딥</span><span>러</span><span>닝</span><span>으</span><span>로</span>&nbsp;
        <span>이름</span><span>님</span><span>의</span>&nbsp;
        <span>나</span><span>무</span><span>를</span>&nbsp;
        <span>해</span><span>석</span><span>하</span><span>고</span>&nbsp;
        <span>있</span><span>습</span><span>니</span><span>다.</span>&nbsp;
        <span>곧</span>&nbsp;<span>검</span><span>사</span><span>결</span><span>과</span><span>가</span>&nbsp;
        <span>나</span><span>옵</span><span>니</span><span>다</span><span>!</span>
    </div>

    <!--로딩바-->
    <div class="loadBox">
        <div class="loader4">
        <div id="loadMes"><span id="loadMesIn">간식먹는중</span></div> 
        </div>
        
      </div>
      
    <div id="loadInfo">
        <span style="color:#E48B77";> I N F O R M A T I O N <br><br></span>
        해당 그림상담은 기본적인 내용만을 담고 있으며,<br>
        간단한 그림을 통해 사람의 심리를 어느 정도 파악할 수 있다는 것을 알립니다. <br>
        따라서 그림을 그린 사람의 환경이나 현재의 심리상태에 따라<br>
        분석 내용은 달라질 수 있으며, 그림에 대한 보다 정확한 해석은 <br>
        정신의학이나 심리학에 대한 전반적인 이해를 가진 <br>
        전문가가 직접 해야 한다는 점을 알려드립니다. <br>
        인천우리병원 최성환 진료부장 (정신건강의학과 전문의)
    </div>

    
  


    <!-- Copyright Start -->
    <div class="container-fluid copyright text-light py-4 wow fadeIn" data-wow-delay="0.1s" id="copy">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; <a href="#">Your Site Name</a>, All Right Reserved.
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                    <br>Distributed By: <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


     <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${cpath}/resources/lib/wow/wow.min.js"></script>
    <script src="${cpath}/resources/lib/easing/easing.min.js"></script>
    <script src="${cpath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${cpath}/resources/lib/counterup/counterup.min.js"></script>
    <script src="${cpath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="${cpath}/resources/js/main.js"></script>
</body>

</html>