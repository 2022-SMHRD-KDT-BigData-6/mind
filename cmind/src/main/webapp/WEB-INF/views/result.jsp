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
<link href="${cpath}/resources/css/style.css?aas" rel="stylesheet">

<!-- 애니메이션 가져옴 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
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
            <img src="${cpath}/resources/img/logo.png" style="width:100px; height:100px; margin-top:20px;">
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
    style = "background: linear-gradient(rgba(0, 0, 0, .6), rgba(0, 0, 0, .6)), url(${cpath}/resources/img/resultHeader.jpg) center center no-repeat;
    background-size:cover;">
        <div class="container text-center pt-5 pb-3">
            <h1 class="display-4 animated slideInDown mb-3" id="ATtypo">${mvo.nickname}님 심리검사 결과</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
	<!-- Page Header End -->

	<!-- 결과 페이지  시작, -->
	<div class="container-xxl py-6">
		<div class="container">
			<div class="row g-5">
				<div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
					<div id="explainPhoto"float:left;>
						<img src="data:image/jpeg;base64,${img}" alt="" style="width: 500px;" class="img-thumbnail">
					</div>
				</div>
				<div class="col-lg-6 wow fadeIn" data-wow-delay="1s">
					<div class="h-100"float:left;>
						<p class="aboutEx">${mvo.nickname}님의 그림 해석결과입니다. </p> <br><br>
						<p class="aboutEx">${result.diagnosis_result}</p>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 결과 페이지  끝 -->

	<!-- 그래프시작 -->
	<div
		style="text-align: center; transform: translate(0, 100px);">
		<div style="width: 40%; margin: auto; margin-bottom: 200px;">
			<canvas id="myChart"></canvas><br>
			<p class="aboutEx">${result.ma} 케어가 필요해 보입니다.</p>
		</div>
	</div>
	<!-- 그래프끝 -->

	<!-- 버튼 시작 -->
	<section class="testGoContent">
		<div class="confirmBox bg-1">
			<div class="buttonContainer"
				onclick="location.href='${cpath}/care.do'">
				<button type="submit"
					class="button button--nina button--text-thick button--text-upper button--size-s"
					data-text="심리케어하러가기" id="confirmBtn">
					<span class="confText">케</span> <span class="confText">어</span>&nbsp;
					<span class="confText">페</span> <span class="confText">이</span> <span
						class="confText">지</span> <span class="confText">로</span>&nbsp; <span
						class="confText">이</span> <span class="confText">동</span> <span
						class="confText">합</span> <span class="confText">니</span> <span
						class="confText">다.</span>
				</button>
			</div>
		</div>
	</section>
	<!-- 버튼 끝 -->

	<!-- Copyright Start -->
	<div class="container-fluid copyright text-light py-4 wow fadeIn"
		data-wow-delay="0.1s" id="copy">
		<div class="container">
			<div class="row">
				<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
					&copy; <a href="https://github.com/2022-SMHRD-KDT-BigData-6/cmind">캐치
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
	<script src="${cpath}/resources/js/main.js"></script>
	<!-- 그래프 부트스트랩 -->
	;
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<script>
		//그래프 구현하는 자바스크립트
		const labels = [ '공격성', '불안', '우울', '낮은 자존감', '공상' ];

		const data = {
			labels : labels,
			datasets : [{
				label : "그림 해석에 따른 감정 그래프",
			    backgroundColor: ["#F5D5CD", "#EFD0B8","#C6CCB1","#96ADAF","#B4CDD9"], //그래프 점 색
				borderColor : 'rgb(255, 99, 132)', //그래프 선 색
				data : [${result.agganx},${result.socialanx},${result.sadanx},${result.complexanx},${result.reganx}]
			}]
		};

		const config = {
			type : 'bar', //그래프 타입 지정
			data : data, //가져올 데이터
			options : {
				plugins : {
					legend : {
						labels : {
							usePointStyle : true,
							display:false},
					}
				}
			}
		};
	</script>

	<script>
		//차트 렌더링
		const myChart = new Chart(document.getElementById('myChart'), config);
	</script>

</body>

</html>