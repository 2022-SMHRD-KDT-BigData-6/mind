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
    
    <!-- 애니메이션 가져옴 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>

<body>
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
                <a href="${cpath}/index.do" class="nav-item nav-link">홈</a>
                <a href="${cpath}/aboutTest.do" class="nav-item nav-link">HTP란?</a>
                <a href="${cpath}/testMain.do" class="nav-item nav-link">심리검사</a>
                <a href="${cpath}/diary.do" class="nav-item nav-link">감정일기</a>
                <a href="${cpath}/treeList.do" class="nav-item nav-link">나무목록</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style = "color: #E48B77 !important;">마이페이지</a>
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
                <p class="nav-item nav-link">${mvo.nickname}님</p>
            <a href="${cpath}/logout.do" class="nav-item nav-link">로그아웃</a>
            </c:if>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <!-- Page Header Start -->
    <div class="container-fluid page-header py-6 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center pt-5 pb-3">
            <h1 class="display-4 animated slideInDown mb-3" id="ATtypo">내 심리검사 결과</h1>
            <nav aria-label="breadcrumb animated slideInDown">
               
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    
    
    <h3 style="color:#E47665; font-size:45px; padding-top:50px;">미리님의 그림 분석 결과</h3>
    
    <!-- 결과 페이지  시작, -->
    <div class="container-xxl py-6">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                   <div id="explainPhoto" float:left; style="text-align:center;">
                       <img src="${cpath}/resources/img/upload.jpg" alt="" style="width:400px;">
                    </div>
               </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="1s">
                    <div class="h-100" float:left;> 
                        <p class="emphasis" style="font-size:25px">
                           생각이 많음, 혼란스러움. 현재에 만족감, 안정감. 적극적, 공격성. 불안감, 욕구불만, 회피. 통제력 약함, 상실감, 감수성이 강함
                        </p>
                        <p class="aboutEx">어디로 가야할지 방향을 잡지 못하고 있거나 또는 어떤 결정을 내리지 못하는 갈등상황에 있으며 주어진 상황 안에서 만족하고 안정적인 것을 추구하고자 합니다. </p>
                   <p class="aboutEx">평소 에너지가 많고 환경에 적극적이나 과하면 즉흥적이고 공격적으로 보일 때가 있습니다.</p>
                   <p class="aboutEx"> 때로는 감정에 대한 적절한 조절이 어려울 때가 있습니다. 평소 에너지가 많고 환경에 적극적이나 과하면 즉흥적이고 공격적으로 보일 때가 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <!-- 결과 페이지  끝 -->
   
   <!-- 그래프시작 -->
    <div style="text-align:center; transform: translate(0, 100px); animation: fadeIn 3s;"> 
         <div style="width:40%; margin:auto; margin-bottom: 200px;">
         <canvas id="myChart"></canvas>
       </div>
    </div>
   <!-- 그래프끝 -->
   
   <!-- 버튼 시작 -->
   <section class="testGoContent">
               <div class="confirmBox bg-1">
                  <div class="buttonContainer"
                      onclick="location.href='${cpath}/testLoading.do'">
                     <button type="submit"
                           class="button button--nina button--text-thick button--text-upper button--size-s"
                           data-text="심리케어하러가기" id="confirmBtn">
                        <span class="confText">결</span>
                        <span class="confText">과</span>&nbsp;
                        <span class="confText">페</span>
                        <span class="confText">이</span> 
                        <span class="confText">지</span>
                        <span class="confText">로</span>&nbsp; 
                        <span class="confText">이</span>
                        <span class="confText">동</span> 
                        <span class="confText">합</span>
                        <span class="confText">니</span>
                        <span class="confText">당</span>
                     </button>
                  </div>
               </div>
            </section>
   <!-- 버튼 끝 -->
    

  <!-- Copyright Start -->
    <div class="container-fluid copyright text-light py-4 wow fadeIn" data-wow-delay="0.1s" id="copy">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; <a href="https://github.com/2022-SMHRD-KDT-BigData-6/cmind">캐치 마인드</a>, All Right Reserved.
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
   <!-- 그래프 부트스트랩 -->;
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   
   <script>
   //그래프 구현하는 자바스크립트
     const labels = [
       '공격성',
       '현실성',
       '성취욕',
       '행동조절',
       '외로움',
       '배고픔',
     ];
   
     const data = {
       labels: labels,
       datasets: [{
         label: 'ㅇㅇ님의 감정 그래프',
         backgroundColor: 'rgb(255, 255, 132)', //그래프 점 색
         borderColor: 'rgb(255, 99, 132)', //그래프 선 색
         data: [0, 10, 5, 2, 20, 30, 50, 100], //라벨 데이터
       }]
     };
   
     const config = {
       type: 'line',   //그래프 타입 지정
       data: data,      //가져올 데이터
       options: {
          plugins: {
             legend: {
                labels: {
                   usePointStyle:true,
                },
             }
          }
       }
     };
   </script>
   
   <script>
   //차트 렌더링
    const myChart = new Chart(
      document.getElementById('myChart'),
    config
     );
   </script>
   
</body>

</html>