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

<style>

.Form{
	width: 200px;
}

.imoge{
	width: 110px;
	height: 110px;	
}

.btn-group{
	width:500px;
	margin-left: auto;
	margin-right: auto;
	
}

</style>

<body>
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
                <a href="${cpath}/index.do" class="nav-item nav-link">홈</a>
                <a href="${cpath}/aboutTest.do" class="nav-item nav-link">HTP란?</a>
                <a href="${cpath}/testMain.do" class="nav-item nav-link">심리검사</a>
                <a href="${cpath}/care.do" class="nav-item nav-link">심리케어</a>
                <a href="${cpath}/diary.do" class="nav-item nav-link" style = "color: #E48B77 !important;">감정일기</a>
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
    style = "background: linear-gradient(rgba(0, 0, 0, .6), rgba(0, 0, 0, .6)), url(${cpath}/resources/img/diary.jpg) center center no-repeat;
    background-size:cover;">
        <div class="container text-center pt-5 pb-3">
            <h1 class="display-4 animated slideInDown mb-3" id="ATtypo">감정일기 쓰기</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

    <div class="container-xxl py-6">
        <div class="container">
            
            <form name="Form" id="Form" action="${cpath}/insert.do" method="POST">
				<!-- 1. img 경로 2.이모티콘이 보여야하는 날짜 -->
				<table class="table table-bordered">
					<tr>
						<th align="center">
							<div id="insertview"></div>
						</th>
					</tr>
				</table>
			</form>
            
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
    <!-- Copyright End -->


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


<script type="text/javascript">
	var urlSearch = new URLSearchParams(location.search);
    var wdate = urlSearch.get('date')
	
	
	$(document).ready(function() {
		loadList(); // --> 호출

	})
	// 2. 서버에 요청하는 ajax 함수를 생성
	function loadList() {
		$.ajax({
			// 서버 url
			url : '${cpath}/userdaydiary.do',
			// 요청방식
			type : 'post',

			data : {"userid":"${mvo.userid}",
					"writedate": wdate
			},
			// 받아올 데이터 타입 지정
			dataType : 'json',
			// 성공했을 때 실행할 함수
			success : function(data){

				console.log(wdate);
				// 내가 화면에 출력해줄 tr 태그들의 모음
				var blist = "";

				// for-each문을 사용하는 방법
				// $.each(어떤 데이터를 가지고 반복, 어떤 함수로 처리할건지)
					// function(인덱스번호, data안에 들어있는 각각의 값들을 어떤 변수로 받아줄건지)
					blist += "<form name='Form' id='Form' action='${cpath}/boardUpdate.do' method='POST'>";
					blist += "<div class='btn-group'>";
					var emotion = ['happy','tired','love','mad1','pleasure','upset','depress1','regret','sad']
					blist += '<div style="text-align:center"><table>';
		               blist += "<tr>";
		               for (var i = 0; i <emotion.length ; i++) {
		                  blist += "<td style='text-align:center'><img class='imoge' id = 'imoge' src='resources/img/"+emotion[i]+".png'></td>";
		               }
		               blist += "</tr>"
		               blist += "<tr>";
		               for (var i = 0; i <emotion.length ; i++) {
		               
		                  
		                  if (data.emotion === emotion[i]) {
		                     blist += "<td style='text-align:center'><input type='radio' name='emotion' id = 'imoge' class='btn btn-primary' value='"+emotion[i]+"' checked ></td>";
		                  }else{         
		                     blist += "<td style='text-align:center'><input type='radio' name='emotion' id = 'imoge' class='btn btn-primary' value='"+emotion[i]+"'></td>";
		                  }
		               
		               }
		               blist += "</tr>"
		               blist += "</table></div>";
				
					blist += '</div>';
					blist += '<div id="insertview">';
					blist += '<input type="hidden" class="form-control" name="userid" id="id" value="${mvo.userid}">';
					blist += '<input type="hidden" class="form-control" name="writedate" id="id" value="'+wdate+'">';
					blist += '<div class="form-group">';
					blist += '<label for="contents">내용:</label>';
					blist += '<textarea rows="10" class="form-control" id="contents" name="diarycontents">'+data.diarycontents+'</textarea>';
					blist += '</div>';
					if("${mvo.userid}"==data.userid){
						blist += "<td><button type = submit class = 'btn-sm btn-danger btn'>수정</button></td>";
					}else{
						blist += "<td><button disabled class = 'btn-sm btn-danger btn'>수정</button></td>";				
					}			
					blist += '</div>';
					blist += '</form>';
			
				$('#insertview').after(blist);
			},
			// 실패했을 때 실행할 함수
			error : function() {
				console.log(wdate);
				// 내가 화면에 출력해줄 tr 태그들의 모음
				var blist = "";
				// for-each문을 사용하는 방법
				// $.each(어떤 데이터를 가지고 반복, 어떤 함수로 처리할건지)
					// function(인덱스번호, data안에 들어있는 각각의 값들을 어떤 변수로 받아줄건지)
				blist += "<form name='Form' id='Form' action='${cpath}/insert.do' method='POST'>";
	               blist += "<div class='btn-group'>";
	               blist += '<div style="text-align:center"><table>';
	               blist += "<tr>";
	               var emotion = ['happy','tired','love','mad1','pleasure','upset','depress1','regret','sad']
	               for (var i = 0; i <emotion.length ; i++) {
	                  blist += "<td style='text-align:center'><img class='imoge' id = 'imoge' src='${cpath}/resources/img/"+emotion[i]+".png'></td>";
	               }
	               blist += "</tr>";
	               
	               blist += "<tr>";
	               blist += "<td> 행복";
	               blist += "</td>";
	               
	               blist += "<td> 피곤";
	               blist += "</td>";
	               
	               blist += "<td> 설렘";
	               blist += "</td>";
	               
	               blist += "<td> 분노";
	               blist += "</td>";
	               
	               blist += "<td> 기쁨";
	               blist += "</td>";
	               
	               blist += "<td> 짜증";
	               blist += "</td>";
	               
	               blist += "<td> 우울";
	               blist += "</td>";
	               
	               blist += "<td> 후회";
	               blist += "</td>";
	               
	               blist += "<td> 슬픔";
	               blist += "</td>";
	               blist += "</tr>";
	               
	               
	               blist += "<tr>";
	               for (var i = 0; i<emotion.length; i++){
	                  blist += "<td style='text-align:center'><input type='radio' name='emotion' id = 'imoge' class='btn btn-primary' value='"+emotion[i]+"'></td>";
	               }
	               blist += "</tr>";
	               blist += "</table></div>";

	               
	               blist += '</div>';
	               blist += '<div id="insertview">';
	               blist += '<input type="hidden" class="form-control" name="userid" id="id" value="${mvo.userid}">';
	               blist += '<input type="hidden" class="form-control" name="writedate" id="id" value="'+wdate+'">';
	               blist += '<div class="form-group">';
	               blist += '<label for="contents">내용:</label>';
	               blist += '<textarea rows="10" class="form-control" id="contents" name="diarycontents"></textarea>';
	               blist += '</div>';
	               blist += "<td><button type = submit class = 'btn-sm btn-danger btn'>삽입</button></td>";
	               blist += '</div>';
	               blist += '</form>';

	            $('#insertview').after(blist);
			}

		})
	}

	
	// 수정하기
	function boardUpdate(userid) {
		// 1. textarea안에 들어있는 데이터를 가져오기
		var contents = $("#vc"+userid+" textarea").val();
		
		// 2. ajax를 활용해서 controller에 수정을 요청
		$.ajax({
			url : '${cpath}/boardUpdate.do',
			// data : 보내줄 데이터를 객체형식으로 넘겨줬었음! {'idx':idx}
			data : {'userid':userid, 'diarycontents':diarycontents},
			// 요청 방식
			type : 'get',
			// 성공했을 때 실행할 함수
	// 4. 받아올 데이터는 x --> 성공했을때 loadList함수를 다시 한 번 실행
			success : loadList,
			// 실패했을 때 실행할 함수
			error : function() {
				alert('실패!');
			}
		})
	}
	</script>
	
	</body>

</html>