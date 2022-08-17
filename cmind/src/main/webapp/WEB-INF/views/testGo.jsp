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
<link href="${cpath}/resources/css/style.css?w" rel="stylesheet">
</head>

<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<!-- Navbar Start -->
	<nav
		class="navbar navbar-expand-lg navbar-dark fixed-top py-lg-0 px-lg-5 wow fadeIn"
		data-wow-delay="0.1s">
		<a href="index.do" class="navbar-brand ms-4 ms-lg-0">
			<h1 class="text-primary m-0" id="title">마음:체</h1>
		</a>

		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav mx-auto p-4 p-lg-0">
				<a href="${cpath}/index.do" class="nav-item nav-link ">홈</a> <a
					href="${cpath}/aboutTest.do" class="nav-item nav-link">HTP란?</a> <a
					href="${cpath}/testMain.do" class="nav-item nav-link"
					style="color: #E48B77 !important;">심리검사</a> <a
					href="${cpath}/diary.do" class="nav-item nav-link">감정일기</a> <a
					href="${cpath}/treeList.do" class="nav-item nav-link">나무목록</a>
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown">마이페이지</a>
					<div class="dropdown-menu m-0">
						<a href="${cpath}/myPage.do" class="dropdown-item">내 정보</a> <a
							href="${cpath}/myTree.do" class="dropdown-item">내 나무</a> <a
							href="${cpath}/result.do" class="dropdown-item">심리검사 결과</a>
					</div>
				</div>
				<c:if test="${empty mvo}">
					<a href="${cpath}/login.do" class="nav-item nav-link">로그인/회원가입</a>
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
		style="background: linear-gradient(rgba(0, 0, 0, .6), rgba(0, 0, 0, .6)), url(${cpath}/resources/img/explainHeader1.jpg) center center no-repeat;
    background-size:cover;">
		<div class="container text-center pt-5 pb-3">
			<h1 class="display-4 animated slideInDown mb-3" id="ATtypo">그림
				제출</h1>
			<nav aria-label="breadcrumb animated slideInDown"></nav>
		</div>
	</div>
	<!-- Page Header End -->

	<!-- 그림 업로드 페이지 -->
	<div class="container">
		<div class="image-upload" id="image-upload"
			style="animation: fadeIn 1s;">

			<form method="post" enctype="multipart/form-data" id="form">
				<input type="hidden" name="userid" value="${mvo.userid}">

				<div class="button">
					<label for="chooseFile">
						<h4>
							나무 그림을 업로드해주세요 <br> <span id="uploadbtn11" class="emphasis"
								style="font-size: 30px;">[업로드하기]&nbsp;</span>
						</h4>
					</label>
				</div>

				<input type="file" id="chooseFile" name="chooseFile"
					accept="image/*" onchange="loadFile(this)">

				<div class="image-show" id="image-show"></div>

				<div class="fileContainer">
					<div class="fileInput">
						<h4>파일명:</h4>
						<h4 id="fileName"></h4>
					</div>
				</div>
				
				<div style="font-size:25px; text-align:center;">
					<input type="checkbox" id="open" name="open" value="y"> &nbsp;&nbsp;
					내 그림을 다른 사람들에게 공개합니다
				</div>
				
				<section class="testGoContent">
					<div class="confirmBox bg-1">
						<div class="buttonContainer">
							<button type="button"
								class="button button--nina button--text-thick button--text-upper button--size-s"
								data-text="결과 보시려면 클릭!" id="confirmBtn" onclick="location.href='${cpath}/testLoading.do'">
								<span class="confText">결</span> <span class="confText">과</span>&nbsp;
								<span class="confText">페</span> <span class="confText">이</span>
								<span class="confText">지</span> <span class="confText">로</span>&nbsp;
								<span class="confText">이</span> <span class="confText">동</span>
								<span class="confText">합</span> <span class="confText">니</span>
								<span class="confText">당</span>
							</button>
						</div>
					</div>
				</section>
			</form>
		</div>
	</div>
	<!-- 그림 업로드 페이지 끝 -->

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
	<script src="${cpath}/resources/js/main.js"></script>

	<script>
		//이미지 미리보기 뜨는거
		function loadFile(input) {

			var file = input.files[0];
			$('#image-show').empty();

			var name = document.getElementById('fileName');
			name.textContent = file.name;

			var newImage = document.createElement("img");
			newImage.setAttribute("class", 'img');

			newImage.src = URL.createObjectURL(file);

			newImage.style.width = "40%";
			newImage.style.maxHeight = "400px";

			newImage.style.objectFit = "contain";

			var container = document.getElementById('image-show');
			container.appendChild(newImage);
		}
	</script>
	<script>
		$(function() {

			$('#confirmBtn').on('click', function() {
				uploadFile();
			});

		});

		function uploadFile() {

			var form = $('#form')[0];
			var formData = new FormData(form);

			$.ajax({
				url : 'http://172.30.1.72:5000/upload',
				type : 'POST',
				data : formData,
				contentType : false,
				processData : false,
				success : function(res) {
					console.log(res);
				},
				error : function() {
				}

			});
		}
	</script>

</body>

</html>