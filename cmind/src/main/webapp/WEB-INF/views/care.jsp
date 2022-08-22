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
    <link href="${cpath}/resources/css/style.css?sfa" rel="stylesheet">
    
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
		
	
	<!-- 케어콘텐츠 안내 -->
	
<!-- 자존감 에에쎄말 시작 -->
	<div class="swiper-container lovCon">
		<div class="careTit">ASMR</div>
		<div class="swiper-wrapper">
			
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=yRnL4ldauL0&t=3s">
					<img src="${cpath}/resources/careIMG/lovCon01.webp">
				</a>
				<p class="careCon">[ASMR]자존감에 대하여</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=6Cg-hqnVHAE">
					<img src="${cpath}/resources/careIMG/lovCon02.webp">
				</a>
				<p class="careCon">인간관계를 긍정멘탈로</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=6A-XJ4UgJjg">
					<img src="${cpath}/resources/careIMG/lovCon03.webp">
				</a>
				<p class="careCon">자존감이 바닥일때 듣는 asmr</p>
			</div>
			<!-- 공통 -->
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=HsnnP6kRnTU">
					<img src="${cpath}/resources/careIMG/allCon01.webp">
				</a>
				<p class="careCon">마음이 편해지는 베이킹 사운드</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=xv3XNJGLoU8">
					<img src="${cpath}/resources/careIMG/allCon02.webp">
				</a>
				<p class="careCon">[ASMR]천둥번개 + 빗소리</p>
			</div>
			<!-- 공통 -->
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 자존감 에에쎄말 끝 -->

<!-- 우울 에에쎄말 시작 -->
	<div class="swiper-container depCon">
		<div class="careTit">ASMR</div>
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=GDqJ01EcBRk">
					<img src="${cpath}/resources/careIMG/depCon01.webp">
				</a>
				<p class="careCon">[ASMR]나의 우울에게</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=TuNY0cxaPKY">
					<img src="${cpath}/resources/careIMG/depCon02.webp">
				</a>
				<p class="careCon">안녕. 나는 너의 우울이야!</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=ZNBVsljlohI">
					<img src="${cpath}/resources/careIMG/depCon03.webp">
				</a>
				<p class="careCon">우울에 관하여</p>
			</div>
			<!-- 공통 -->
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=HsnnP6kRnTU">
					<img src="${cpath}/resources/careIMG/allCon01.webp">
				</a>
				<p class="careCon">마음이 편해지는 베이킹 사운드</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=xv3XNJGLoU8">
					<img src="${cpath}/resources/careIMG/allCon02.webp">
				</a>
				<p class="careCon">[ASMR]천둥번개 + 빗소리</p>
			</div>
			<!-- 공통 -->
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 우울 에에쎄말 끝 -->

<!-- 공격성 에에쎄말 시작 -->
	<div class="swiper-container madCon">
		<div class="careTit">ASMR</div>
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=YtYIb8Qy8mw">
					<img src="${cpath}/resources/careIMG/madCon01.webp">
				</a>
				<p class="careCon">나의 분노를 극복하는 법</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=z5sSJoTvdOo">
					<img src="${cpath}/resources/careIMG/madCon02.webp">
				</a>
				<p class="careCon">[ASMR]화가 날 때 대처하기</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=ZQWrleq-NhQ">
					<img src="${cpath}/resources/careIMG/madCon03.webp">
				</a>
				<p class="careCon">기분이 잔잔해지는 힐링음악</p>
			</div>
			<!-- 공통 -->
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=HsnnP6kRnTU">
					<img src="${cpath}/resources/careIMG/allCon01.webp">
				</a>
				<p class="careCon">마음이 편해지는 베이킹 사운드</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=xv3XNJGLoU8">
					<img src="${cpath}/resources/careIMG/allCon02.webp">
				</a>
				<p class="careCon">[ASMR]천둥번개 + 빗소리</p>
			</div>
			<!-- 공통 -->
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 공격성 에에쎄말 끝 -->

<!-- 공상 에에쎄말 시작 -->>
	<div class="swiper-container thiCon">
		<div class="careTit">ASMR</div>
		<div class="swiper-wrapper">
			<div class="swiper-slide thiCon">
				<a href="https://www.youtube.com/watch?v=wIBnaNuhuCQ">
					<img src="${cpath}/resources/careIMG/thiCon01.webp">
				</a>
				<p class="careCon">[ASMR]뉴욕 로스쿨 도서관</p>
			</div>
			<div class="swiper-slide thiCon">
				<a href="https://www.youtube.com/watch?v=E24KXKCMg1o">
					<img src="${cpath}/resources/careIMG/thiCon02.webp">
				</a>
				<p class="careCon">집중할 때 듣는 귀청소 ASMR</p>
			</div>
			<div class="swiper-slide thiCon">
				<a href="https://www.youtube.com/watch?v=Zj7b40Kd8y4">
					<img src="${cpath}/resources/careIMG/thiCon03.webp">
				</a>
				<p class="careCon">공부할 때 듣기 좋은 소리 모음</p>
			</div>
			<!-- 공통 -->
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=HsnnP6kRnTU">
					<img src="${cpath}/resources/careIMG/allCon01.webp">
				</a>
				<p class="careCon">마음이 편해지는 베이킹 사운드</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=xv3XNJGLoU8">
					<img src="${cpath}/resources/careIMG/allCon02.webp">
				</a>
				<p class="careCon">[ASMR]천둥번개 + 빗소리</p>
			</div>
			<!-- 공통 -->
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 공상 에에쎄말 끝 -->
<!-- 불안 에에쎄말 시작 -->
	<div class="swiper-container feaCon">
	<div class="careTit">ASMR</div>
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=u2k-x6JextA&t=1926s">
					<img src="${cpath}/resources/careIMG/feaCon01.webp">
				</a>
				<p class="careCon">[ASMR]당신의 낮잠과 함께</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=zAIZpNbYytI">
					<img src="${cpath}/resources/careIMG/feaCon02.webp">
				</a>
				<p class="careCon">불안장애를 치유하는 수면영상</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=mGH6RaMX2EE">
					<img src="${cpath}/resources/careIMG/feaCon03.webp">
				</a>
				<p class="careCon">불안을 줄여주는 마술같은 최면</p>
			</div>
			<!-- 공통 -->
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=HsnnP6kRnTU">
					<img src="${cpath}/resources/careIMG/allCon01.webp">
				</a>
				<p class="careCon">마음이 편해지는 베이킹 사운드</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=xv3XNJGLoU8">
					<img src="${cpath}/resources/careIMG/allCon02.webp">
				</a>
				<p class="careCon">[ASMR]천둥번개 + 빗소리</p>
			</div>
			<!-- 공통 -->
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 불안 에에쎄말 끝 -->
			

	<!--  케어콘텐츠 안내 -->	
<!-- 자존감 명상 시작 -->
	<div class="swiper-container lovCon">
		<div class="careTit">명상</div>
		<div class="swiper-wrapper">

			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=r8Oh6UmblgE">
					<img src="${cpath}/resources/careIMG/lovCon04.webp">
				</a>
				<p class="careCon">사랑스러운 사람이 되는 법</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=92L4xmRPuiA">
					<img src="${cpath}/resources/careIMG/lovCon05.webp">
				</a>
				<p class="careCon">자존감을 기르는 저녁 명상</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=4SrtMIpFwJw">
					<img src="${cpath}/resources/careIMG/lovCon06.webp">
				</a>
				<p class="careCon">자존감 회복을 도와드릴게요</p>
			</div>
			<!-- 공통 시작 -->
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=nlX8Bj6VT4o">
					<img src="${cpath}/resources/careIMG/allCon03.webp">
				</a>
				<p class="careCon">머리를 비우는 숲속 명상음악</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=Rl6_OzuG73s">
					<img src="${cpath}/resources/careIMG/allCon04.webp">
				</a>
				<p class="careCon">마음챙김 - 초보자 명상 가이드</p>
			</div>
			<!-- 공통 끝 -->
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 자존감 명상 끝 -->
<!-- 우울 명상 시작 -->
	<div class="swiper-container depCon">
		<div class="careTit">명상</div>
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=6eP8DVGxBws">
					<img src="${cpath}/resources/careIMG/depCon04.webp">
				</a>
				<p class="careCon">데일리 마음정화 명상</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=cvPS_25gRPs">
					<img src="${cpath}/resources/careIMG/depCon05.webp">
				</a>
				<p class="careCon">부정적인 생각을 없애는 명상</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=LKFVy2G3JEY">
					<img src="${cpath}/resources/careIMG/depCon06.webp">
				</a>
				<p class="careCon">우울증, 진짜 나를 찾아가는 과정</p>
			</div>
			<!-- 공통 시작 -->
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=nlX8Bj6VT4o">
					<img src="${cpath}/resources/careIMG/allCon03.webp">
				</a>
				<p class="careCon">머리를 비우는 숲속 명상음악</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=Rl6_OzuG73s">
					<img src="${cpath}/resources/careIMG/allCon04.webp">
				</a>
				<p class="careCon">마음챙김 - 초보자 명상 가이드</p>
			</div>
			<!-- 공통 끝 -->
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 우울 명상 끝 -->
<!-- 공격성 명상 시작 -->
	<div class="swiper-container madCon">
		<div class="careTit">명상</div>
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=TYGYOAFVIE4">
					<img src="${cpath}/resources/careIMG/madCon04.webp">
				</a>
				<p class="careCon">정목스님- 화가 치밀어오를 때</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=-JwdQQNX90k">
					<img src="${cpath}/resources/careIMG/madCon05.webp">
				</a>
				<p class="careCon">화를 편하게 다스리는 법</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=4H3qPmmCruk">
					<img src="${cpath}/resources/careIMG/madCon06.webp">
				</a>
				<p class="careCon">내가 가지고 있는 분노를  흘려보내세요</p>
			</div>
			<!-- 공통 시작 -->
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=nlX8Bj6VT4o">
					<img src="${cpath}/resources/careIMG/allCon03.webp">
				</a>
				<p class="careCon">머리를 비우는 숲속 명상음악</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=Rl6_OzuG73s">
					<img src="${cpath}/resources/careIMG/allCon04.webp">
				</a>
				<p class="careCon">마음챙김 - 초보자 명상 가이드</p>
			</div>
			<!-- 공통 끝 -->
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 공격성 명상 끝 -->
<!-- 공상 명상 시작 -->
	<div class="swiper-container thiCon">
		<div class="careTit">명상</div>
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=I64BgPA_1pw">
					<img src="${cpath}/resources/careIMG/thiCon04.webp">
				</a>
				<p class="careCon">성공하는 사람들의 습관! 명상</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=dZewQEbQQM0">
					<img src="${cpath}/resources/careIMG/thiCon05.webp">
				</a>
				<p class="careCon">(5분명상)뇌를 위한 최고의 휴식법</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=rAFZVs0YY5g">
					<img src="${cpath}/resources/careIMG/thiCon06.webp">
				</a>
				<p class="careCon">1분 초집중력 뇌 만들기</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=nlX8Bj6VT4o">
					<img src="${cpath}/resources/careIMG/allCon03.webp">
				</a>
				<p class="careCon">머리를 비우는 숲속 명상음악</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=Rl6_OzuG73s">
					<img src="${cpath}/resources/careIMG/allCon04.webp">
				</a>
				<p class="careCon">마음챙김 - 초보자 명상 가이드</p>
			</div>
			<!-- 공통 끝 -->
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 공상 명상 끝 -->
<!-- 불안 명상 시작 -->
	<div class="swiper-container feaCon">
		<div class="careTit">명상</div>
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=iUbqSELh2vs">
					<img src="${cpath}/resources/careIMG/feaCon04.webp">
				</a>
				<p class="careCon">걱정을 해소하는 위로명상 </p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=7BthVsfkoWU">
					<img src="${cpath}/resources/careIMG/feaCon05.webp">
				</a>
				<p class="careCon">불안을 다스리는 법</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=dFfhohEk90s">
					<img src="${cpath}/resources/careIMG/feaCon06.webp">
				</a>
				<p class="careCon">불안한 마음을 위한 8분 명상</p>
			</div>
			<!-- 공통 시작 -->
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=nlX8Bj6VT4o">
					<img src="${cpath}/resources/careIMG/allCon03.webp">
				</a>
				<p class="careCon">머리를 비우는 숲속 명상음악</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=Rl6_OzuG73s">
					<img src="${cpath}/resources/careIMG/allCon04.webp">
				</a>
				<p class="careCon">마음챙김 - 초보자 명상 가이드</p>
			</div>
			<!-- 공통 끝 -->
		</div>
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 불안 명상 끝 -->		
	
	
	
	<!--  케어콘텐츠 안내 상품-->

<!-- 자존감 상품 시작-->
	<div class="swiper-container lovCon">
		<div class="careTit">상품</div>
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=_yP28CsACa0">
					<img src="${cpath}/resources/careIMG/lovCon07.webp">
				</a>
				<p class="careCon">폼롤러로 더 건강한 내가 되기</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=HKJcQI5ziIQ">
					<img src="${cpath}/resources/careIMG/lovCon08.webp">
				</a>
				<p class="careCon">나를 사랑하는 다이어리</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=kY9VeVNcxBo">
					<img src="${cpath}/resources/careIMG/lovCon09.webp">
				</a>
				<p class="careCon">찢었다!! 도장</p>
			</div>
			<!-- 공통 시작 -->
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=1fOOVU7LxnI">
					<img src="${cpath}/resources/careIMG/allCon05.webp">
				</a>
				<p class="careCon">원데이 수제 비누 만들기 키드</p>
			</div>
			<div class="swiper-slide">
				<a href=https://www.youtube.com/watch?v=CBfHJnkwTZA>
					<img src="${cpath}/resources/careIMG/allCon06.webp">
				</a>
				<p class="careCon">터프팅 원데이 클래스 패키지</p>
			</div>
			<!-- 공통 끝 -->
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 자존감 상품 끝-->


<!-- 우울 상품 시작 -->
	<div class="swiper-container depCon">
		<div class="careTit">상품</div>
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=99lheteDJJs">
					<img src="${cpath}/resources/careIMG/depCon07.webp">
				</a>
				<p class="careCon">우울을 완화하는 책 5종</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=rApn0GbO3Dg">
					<img src="${cpath}/resources/careIMG/depCon08.webp">
				</a>
				<p class="careCon">빛의 효과! 라이트 테라피</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=aLm2KA_ac8s">
					<img src="${cpath}/resources/careIMG/depCon09.webp">
				</a>
				<p class="careCon">()안정+힐링)인센스 스틱</p>
			</div>
			<!-- 공통 시작 -->
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=1fOOVU7LxnI">
					<img src="${cpath}/resources/careIMG/allCon05.webp">
				</a>
				<p class="careCon">원데이 수제 비누 만들기 키드</p>
			</div>
			<div class="swiper-slide">
				<a href=https://www.youtube.com/watch?v=CBfHJnkwTZA>
					<img src="${cpath}/resources/careIMG/allCon06.webp">
				</a>
				<p class="careCon">터프팅 원데이 클래스 패키지</p>
			</div>
			<!-- 공통 끝 -->
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 우울 상품 끝 -->

<!-- 공격성 상품 시작 -->
	<div class="swiper-container madCon">
		<div class="careTit">상품</div>
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=IKz_1FdOphQ">
					<img src="${cpath}/resources/careIMG/madCon07.webp">
				</a>
				<p class="careCon">마음이 편안해지는 소이캔들</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=0Pmxa6-pZlQ">
					<img src="${cpath}/resources/careIMG/madCon08.webp">
				</a>
				<p class="careCon">매일 나의 감정을 기록해보세요</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=0wTpZLbHgEY">
					<img src="${cpath}/resources/careIMG/madCon09.webp">
				</a>
				<p class="careCon">잡생각이 없어지는 자수 스타터</p>
			</div>
			<!-- 공통 시작 -->
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=1fOOVU7LxnI">
					<img src="${cpath}/resources/careIMG/allCon05.webp">
				</a>
				<p class="careCon">원데이 수제 비누 만들기 키드</p>
			</div>
			<div class="swiper-slide">
				<a href=https://www.youtube.com/watch?v=CBfHJnkwTZA>
					<img src="${cpath}/resources/careIMG/allCon06.webp">
				</a>
				<p class="careCon">터프팅 원데이 클래스 패키지</p>
			</div>
			<!-- 공통 끝 -->
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 공격성 상품 끝 -->

<!-- 공상 상품 시작 -->
	<div class="swiper-container thiCon">
		<div class="careTit">상품</div>
		<div class="swiper-wrapper">
			<div class="swiper-slide thiCon">
				<a href="https://www.youtube.com/watch?v=JHTEmryXnNI">
					<img src="${cpath}/resources/careIMG/thiCon07.webp">
				</a>
				<p class="careCon">나만의 미니어쳐 집 만들기</p>
			</div>
			<div class="swiper-slide thiCon">
				<a href="https://www.youtube.com/watch?v=upYvRu6ubnA">
					<img src="${cpath}/resources/careIMG/thiCon08.webp">
				</a>
				<p class="careCon">효율 업! 집중 타이머<p>
			</div>
			<div class="swiper-slide thiCon">
				<a href="https://www.youtube.com/watch?v=r1gIhiBgPDg">
					<img src="${cpath}/resources/careIMG/thiCon09.webp">
				</a>
				<p class="careCon">요즘 힐링템! 감정 부스팅 오일</p>
			</div>
			<!-- 공통 시작 -->
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=1fOOVU7LxnI">
					<img src="${cpath}/resources/careIMG/allCon05.webp">
				</a>
				<p class="careCon">원데이 수제 비누 만들기 키드</p>
			</div>
			<div class="swiper-slide">
				<a href=https://www.youtube.com/watch?v=CBfHJnkwTZA>
					<img src="${cpath}/resources/careIMG/allCon06.webp">
				</a>
				<p class="careCon">터프팅 원데이 클래스 패키지</p>
			</div>
			<!-- 공통 끝 -->
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 공상 상품 끝 -->

<!-- 불안 상품 시작 -->
	<div class="swiper-container feaCon">
		<div class="careTit">상품</div>
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=9KSLQ6VZ1Pw ">
					<img src="${cpath}/resources/careIMG/feaCon07.webp">
				</a>
				<p class="careCon">불안한 마음에 아로마스톤</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=riC4jsSlJPA">
					<img src="${cpath}/resources/careIMG/feaCon08.webp">
				</a>
				<p class="careCon">마음이 편해지는 인센스 콘</p>
			</div>
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=zIzWMRaINrc">
					<img src="${cpath}/resources/careIMG/feaCon09.webp">
				</a>
				<p class="careCon">폭닥 안겨있기 좋은 인형 3종</p>
			</div>
			<!-- 공통 시작 -->
			<div class="swiper-slide">
				<a href="https://www.youtube.com/watch?v=1fOOVU7LxnI">
					<img src="${cpath}/resources/careIMG/allCon05.webp">
				</a>
				<p class="careCon">원데이 수제 비누 만들기 키드</p>
			</div>
			<div class="swiper-slide">
				<a href=https://www.youtube.com/watch?v=CBfHJnkwTZA>
					<img src="${cpath}/resources/careIMG/allCon06.webp">
				</a>
				<p class="careCon">터프팅 원데이 클래스 패키지</p>
			</div>
			<!-- 공통 끝 -->
		</div>
	
		<!-- 이전다음 버튼-->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- 페이징 넘기는거 -->
		<div class="swiper-pagination"></div>
	</div>
<!-- 불안 상품 끝 -->

	
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
	observer: true,
	observeParents: true,

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
	
	//심리상태에 따른 안내문구, 컨텐츠  출력
	window.onload = function() {
		//심리상태
		var ma = "${result.ma}";
		
		//안내문구
		var mad = document.getElementById("mad");
		var dep = document.getElementById("depress");
		var fea = document.getElementById("fear");
		var lov = document.getElementById("loveMe");
		var thi = document.getElementById("think");

		//추천컨텐츠
		var thiCon = document.getElementsByClassName('thiCon');
		var madCon = document.getElementsByClassName('madCon');
		var depCon = document.getElementsByClassName('depCon');
		var feaCon = document.getElementsByClassName('feaCon');
		var lovCon = document.getElementsByClassName('lovCon');
		
		
		if(ma==="공격성") {
			mad.style.display='block';
			for(var i = 0; i<madCon.length; i++){
				madCon[i].style.display='block';
			}
		} else if (ma==="우울") {
			dep.style.display='block';
			for(var i = 0; i<depCon.length; i++){
				depCon[i].style.display='block';
			}
		} else if (ma==="불안") {
			fea.style.display='block';
			for(var i = 0; i<feaCon.length; i++){
				feaCon[i].style.display='block';
			}
		} else if (ma==="자존감") {
			lov.style.display='block';
			for(var i = 0; i<lovCon.length; i++){
				lovCon[i].style.display='block';
			}
		} else if (ma==="공상") {
			thi.style.display='block';
			for(var i = 0; i<thiCon.length; i++){
				thiCon[i].style.display='block';
			}
		}
	}
	
	
	
	
	</script>
	
	
</body>

</html>