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
<link href="${cpath}/resources/css/style.css" rel="stylesheet">
</head>

<style>

/*검사결과 목록*/
.ls_wrap {
	margin: 30px 0 30px 0;
	padding: 0 10px 0 10px;
}

.ls_div_content {
	width: 80%;
	margin: auto;
	height: 275px;
	border: 1px solid #dadada;
}

.ls_testidx {
	font-size: 13px;
	color: #3e74ab;
	clear: both;
}

.ls_treeName {
	color: #333;
	font-size: 15px;
	font-weight: bold;
	clear: both;
}

.ls_div_subject {
	font-weight: bold;
	font-size: 26px;
	padding-bottom: 10px;
}

.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}

.active {
	background-color: #cdd5ec;
}

/*팝업창 */
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
}

.wrap {
	padding: 10px;
}

.btn_open {
	font-weight: bold;
	margin: 5px;
	background: #000;
	color: #fff;
}

.btn_close{
	test-align: center;
	margin: auto;
	margin-left: 10px;
	margin-right: 0;
}

.pop_wrap {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0, 0, 0, .5);
	font-size: 0;
	text-align: center;
}

.pop_wrap:after {
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	content: '';
}

.pop_wrap .pop_inner {
	display: inline-block;
	padding: 20px 30px;
	background: #fff;
	width: 600px;
	height: 400px;
	vertical-align: middle;
	font-size: 15px;
}

.pageInfo_btn.next {
	test-align: center;
	margin: auto;
	margin-left: 10px;
	margin-right: 0;
}

.pageInfo_btn.previous {
	test-align: center;
	margin: auto;
	margin-left: 0;
	margin-right: 10px;
}

img {
	max-width: 600px;
	max-height: 300px;
	width: auto;
	height: auto;
}
</style>

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
                <a href="${cpath}/care.do" class="nav-item nav-link"  >심리케어</a>
                <a href="${cpath}/diary.do" class="nav-item nav-link">감정일기</a>
                <a href="${cpath}/treeList.do" class="nav-item nav-link" style = "color: #E48B77 !important;">나무목록</a>
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
     style = "background: linear-gradient(rgba(0, 0, 0, .6), rgba(0, 0, 0, .6)), url(${cpath}/resources/img/treeList.jpg) center center no-repeat;
    background-size:cover;">
        <div class="container text-center pt-5 pb-3">
            <h1 class="display-4 animated slideInDown mb-3" id="ATtypo">" 나무 목록 "</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
	<!-- Page Header End -->

	<!-- About Start -->
	<div class="container-xxl py-6">
		<div class="container">
			<div class="ls_wrap">
				<div class="ls_div_subject">
					<h3>최근 검사 결과</h3>
				</div>
				<div class="wrap">

					<table class="table table-bordered">
						<tr>
						<c:if test="${list.size() > 0}">
							<c:forEach var="num" begin="0" end="${list.size()-1}" step="1">
								<td>
									<div class="image_wrap" style="text-align: center">
										<a href="#pop_info_${num}" class="btn_open"> 
										<img src="data:image/jpeg;base64,${list.get(list.size()-num-1).image}" class="img-thumbnail">
										</a>
										<div class="ls_testidx" align="center">
											<span>${list.get(list.size()-num-1).idx_num}</span>
										</div>
										<div class="ls_treeName" align="center">${list.get(list.size()-num-1).nickname}</div>
									</div>
								</td>
								<div id="pop_info_${num}" class="pop_wrap"
									style="display: none;">
									<div class="pop_inner">
										<img src="data:image/jpeg;base64,${list.get(list.size()-num-1).image}" class="img-thumbnail" style="float: left">
										<h3>추천 받은 케어 항목</h3>
										<c:forEach var="cvo" items="${cvo}">
											<p style="font-size: large;">- ${cvo.content_info} -</p>
											<p style="font-size: large;">${cvo.content_name}</p>
										</c:forEach>
										<div class="ls_treeName" align="center">${list.get(list.size()-num-1).nickname}</div>
										<button type="button" class="btn_close">
											<p style="font-size: medium;">닫기</p>
										</button>
									</div>

								</div>
							</c:forEach>
							</c:if>
						</tr>
					</table>

				</div>
			</div>
		</div>
	</div>

	<!-- About End -->

	<div class="pageInfo_wrap">
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pagination justify-content-center">

				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn previous"><a
						href="${cpath}/treeList.do?pageNum=${pageMaker.startPage-1}">[이전]</a></li>
				</c:if>
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "
						active":""}" class="page-item"><a class="page-link"
						href="${cpath}/treeList.do?pageNum=${num}">${num}</a></li>
				</c:forEach>

				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageInfo_btn next"><a
						href="${cpath}/treeList.do?pageNum=${pageMaker.endPage + 1}">[다음]</a>
					</li>
				</c:if>

			</ul>
		</div>
	</div>

	<form id="moveForm" action="/treeList" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>


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

		let moveForm = $("#moveForm");
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/treeList");
			moveForm.submit();
		});

		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							moveForm
									.append("<input type='hidden' name='idx_num' value='"
											+ $(this).attr("href") + "'>");
							moveForm.attr("action", "/treeList");
							moveForm.submit();
						});

		var target = document.querySelectorAll('.btn_open');
		var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
		var targetID;

		// 팝업 열기
		for (var i = 0; i < target.length; i++) {
			target[i].addEventListener('click', function() {
				targetID = this.getAttribute('href');
				document.querySelector(targetID).style.display = 'block';
			});

		}
		// 팝업 닫기
		for (var j = 0; j < target.length; j++) {
			btnPopClose[j].addEventListener('click', function() {
				this.parentNode.parentNode.style.display = 'none';
			});
		}
	</script>
</body>

</html>