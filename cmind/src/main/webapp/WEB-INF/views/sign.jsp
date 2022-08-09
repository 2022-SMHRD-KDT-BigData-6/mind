<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 프로젝트의 contextpath 값을 동적으로 가져오는 방법 -->
<c:set var="cpath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>

<head>
	<style>
	button{
		padding: 0;
		border: none;
		background: none;
	}
	</style>
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
    
    <!-- 로그인 템플릿에 필요한 스타일시트 -->
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
        <a href="index.html" class="navbar-brand ms-4 ms-lg-0">
            <h1 class="text-primary m-0" id="title">마음:체</h1>
        </a>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav mx-auto p-4 p-lg-0">
                <a href="${cpath}/index.do" class="nav-item nav-link">홈</a>
                <a href="${cpath}/aboutTest.do" class="nav-item nav-link">HTP란?</a>
                <a href="${cpath}/testMain.do" class="nav-item nav-link">심리검사</a>
                <a href="${cpath}/diary.do" class="nav-item nav-link">감정일기</a>
                <a href="${cpath}/treeList.do" class="nav-item nav-link">나무목록</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
                    <div class="dropdown-menu m-0">
                        <a href="myPage.html" class="dropdown-item">내 정보</a>
                        <a href="myTree.html" class="dropdown-item">내 나무</a>
                        <a href="result.html" class="dropdown-item">심리검사 결과</a>
                    </div>
                </div>
                <c:if test="${empty mvo}">
                <a href="${cpath}/login.do" class="nav-item nav-link" style = "color: #E48B77 !important;">로그인/회원가입</a>
                </c:if>
                <c:if test="${!empty mvo}">
                <p class="nav-item nav-link">${mvo.username}님</p>
				<a href="${cpath}/logout.do" class="nav-item nav-link">로그아웃</a>
				</c:if>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <!-- Page Header Start -->
    <div class="container-fluid page-header py-6 wow fadeIn" data-wow-delay="0.1s" id="TMheader">
        <div class="container text-center pt-5 pb-3">
            <h1 class="display-4 animated slideInDown mb-3" id="ATtypo">회원가입
            </h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- 회원가입 시작-->
    <div class="logmain">
    <div id="firstSelect">
    <!--일반인/전문가 선택-->
        <p id="selectOption" style="text-align: center;"> [ 일반인 / 전문가를 선택해주세요 ]</p>
        
        </div>
            <p class="JoinOp" onclick="normalShow()">일반인</p>
            <p class="JoinOp" onclick="expertShow()">전문가</p>

    <!--일반인회원가입-->
    <form class="formNo" id="normalForm" style="display: block;" action="${cpath}/insert.do">
        <input name = "userid" class="un" type="text" align="center" placeholder="아이디">
        <input name = "userpw" class="pass" type="password" align="center" placeholder="비밀번호">
        <input class="pass" type="password" align="center" placeholder="비밀번호확인">
        <input name = "username" class="un" type="text" align="center" placeholder="닉네임"> 
		<input name = "email" class="un" type="text" align="center" placeholder="이메일"> 
		
        <div style="text-align:center">
        <a  class="loginBtn signin"><button type="submit">회원가입하기</button></a>
        </div>
    </form>

        <!--전문가회원가입-->
    <form class="formNo" id="expertForm" style="display: none;" action="${cpath}/insert.do">
        <input name = "userid" class="un" type="text" align="center" placeholder="아이디">
        <input name = "userpw" class="pass" type="password" align="center" placeholder="비밀번호">
        <input class="pass" type="password" align="center" placeholder="비밀번호확인">
        <input name = "username" class="un" type="text" align="center" placeholder="이름"> 
        <input name = "email" class="un" type="text" align="center" placeholder="이메일"> 
        <input name = "procheck" class="un" type="text" align="center" placeholder="전문가 인증 여부">
        <input name = "facilityid" class="un" type="text" align="center" placeholder="병원식별번호">
            
        <div style="text-align:center">
            <a class="loginBtn signin"><button type="submit">회원가입</button></a>
        </div>
    </form>

</div>
    <!-- 회원가입 끝-->
    

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

    <!-- 일반인버튼 누르면 일반인 회원가입 보임-->
    <script>
        function normalShow() {
            var nmf = document.getElementById("normalForm");
            var epf = document.getElementById("expertForm");
            var sho = document.getElementById("firstSelect");
            
            if(nmf.style.display=='none'){ 		
    	        nmf.style.display = 'block';
    	        epf.style.display = 'none';
    	        sho.style.display = 'none';
            }else{ 		
    	        nmf.style.display = 'none';	
    	        sho.style.display = 'block'; 	
            } 
        }

        function expertShow() {
            var nmf = document.getElementById("normalForm");
            var epf = document.getElementById("expertForm");
            var sho = document.getElementById("firstSelect");
            
            if(epf.style.display=='none'){ 		
    	        epf.style.display = 'block';
    	        nmf.style.display = 'none';
    	        sho.style.display = 'none';
            }else{ 		
    	        epf.style.display = 'none';	
    	        sho.style.display = 'block'; 	
            } 
        }

    </script> 
</body>

</html>