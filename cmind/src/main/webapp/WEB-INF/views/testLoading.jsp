<%@page import="java.util.ArrayList"%>
<%@page import="org.springframework.web.multipart.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 프로젝트의 contextpath 값을 동적으로 가져오는 방법 -->
<c:set var="cpath" value="${ pageContext.request.contextPath }" />
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
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Playfair+Display:wght@600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="${cpath}/resources/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${cpath}/resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="${cpath}/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${cpath}/resources/css/style.css?aaa" rel="stylesheet">
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
				<a href="${cpath}/index.do" class="nav-item nav-link">홈</a> <a
					href="${cpath}/aboutTest.do" class="nav-item nav-link">HTP란?</a> <a
					href="${cpath}/testMain.do" class="nav-item nav-link"
					style="color: #E48B77 !important;">심리검사</a> <a
					href="${cpath}/care.do" class="nav-item nav-link">심리케어</a> <a
					href="${cpath}/diary.do" class="nav-item nav-link">감정일기</a>
					<a href="${cpath}/treeList.do" class="nav-item nav-link">나무목록</a>
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown">마이페이지</a>
					<div class="dropdown-menu m-0">
						<a href="${cpath}/myPage.do" class="dropdown-item">감정 일기 통계</a> <a
							href="${cpath}/result.do" class="dropdown-item">심리검사 결과</a>
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
	<div class="container-fluid page-header py-6 wow fadeIn"
		data-wow-delay="0.1s" id="TMheader"
		style="background: linear-gradient(rgba(0, 0, 0, .6), rgba(0, 0, 0, .6)), url(${cpath}/resources/img/testheader01.jpg) center center no-repeat;
    background-size:cover;">
		<div class="container text-center pt-5 pb-3">
			<h1 class="display-4 animated slideInDown mb-3" id="ATtypo">로딩페이지</h1>
			<nav aria-label="breadcrumb animated slideInDown"></nav>
		</div>
	</div>
	<!-- Page Header End -->

	<!--로딩텍스트-->
	<div class="loadMes">
		<span>딥</span><span>러</span><span>닝</span><span>으</span><span>로</span>&nbsp;
		<span>${mvo.nickname}</span><span>님</span><span>의</span>&nbsp; <span>나</span><span>무</span><span>를</span>&nbsp;
		<span>해</span><span>석</span><span>하</span><span>고</span>&nbsp; <span>있</span><span>습</span><span>니</span><span>다.</span>&nbsp;
		<span>곧</span>&nbsp;<span>검</span><span>사</span><span>결</span><span>과</span><span>가</span>&nbsp;
		<span>나</span><span>옵</span><span>니</span><span>다</span><span>!</span>
	</div>

	<!--로딩바-->
	<div class="loadBox">
		<div class="loader4">
			<div id="loadMes">
				<span id="loadMesIn">사진 업로드 중 입니다.</span>
			</div>
		</div>

	</div>

	<div id="loadInfo">
		<span style="color: #E48B77";> I N F O R M A T I O N <br>
			<br></span> 해당 그림상담은 기본적인 내용만을 담고 있으며,<br> 간단한 그림을 통해 사람의 심리를 어느
		정도 파악할 수 있다는 것을 알립니다. <br> 따라서 그림을 그린 사람의 환경이나 현재의 심리상태에 따라<br>
		분석 내용은 달라질 수 있으며, 그림에 대한 보다 정확한 해석은 <br> 정신의학이나 심리학에 대한 전반적인 이해를
		가진 <br> 전문가가 직접 해야 한다는 점을 알려드립니다. <br> 인천우리병원 최성환 진료부장
		(정신건강의학과 전문의)
	</div>

	<!-- Copyright Start -->
	<div class="container-fluid copyright text-light py-4 wow fadeIn"
		data-wow-delay="0.1s" id="copy">
		<div class="container">
			<div class="row">
				<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
					&copy; <a href="https://github.com/2022-SMHRD-KDT-BigData-6/mind">캐치
						마인드</a>, All Right Reserved.
				</div>
				<div class="col-md-6 text-center text-md-end">
					<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
					Designed By <a href="https://htmlcodex.com">(주) 미리</a> <br>Distributed
					By: <a class="border-bottom" href="https://smhrd.or.kr/"
						target="_blank">스마트인재개발원</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Copyright End -->

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${cpath}/resources/lib/wow/wow.min.js"></script>
	<script src="${cpath}/resources/lib/easing/easing.min.js"></script>
	<script src="${cpath}/resources/lib/waypoints/waypoints.min.js"></script>
	<script src="${cpath}/resources/lib/counterup/counterup.min.js"></script>
	<script src="${cpath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="${cpath}/resources/js/main.js"></script>

	<script>
		//일정 시간마다 텍스트 갱신
		setTimeout(function() {
			$("#loadMesIn").html("딥러닝 해석중입니다.");
		}, 2000);

		setTimeout(function() {
			$("#loadMesIn").html("해석이 끝났습니다.");

		}, 6000);

		setTimeout(function() {
			$("#loadMesIn").html("결과를 받아오는 중 입니다.");
		}, 8000);

		setTimeout(function() {
			$("#loadMesIn").html("결과 페이지로 안내합니다!");
			$.ajax({
				url : '${cpath}/resultGo.do',
				type : 'POST',
				success : function() {
					$.ajax({
						url : '${cpath}/result.do',
						type : 'POST',
						success : function() {
							location.href = "http://localhost:8081/web/result.do"
						},
						error : function() {
						}

					});
					
				},
				error : function() {
				}

			});
		}, 12000);
	</script>

</body>

</html>