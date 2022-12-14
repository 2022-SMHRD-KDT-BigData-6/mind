<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 프로젝트의 contextpath 값을 동적으로 가져오는 방법 -->
<c:set var="cpath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<style>
   #calendar{
   width: 800px;
   height: 550px;
   margin-left: auto;
   margin-right: auto;
   margin-top: 5em;
   }
   
   .fc .fc-toolbar{
    display: flex;
    justify-content: space-evenly;
    }
    
   .event-icon{
   width: 60px;
   height: 60px;

   }
   
   .calendar{
   height: 800px;
   
   }
   .fc-toolbar-title{
   font-family: 'KyoboHand' !important; 
   }
   
   #calendar > div.fc-header-toolbar.fc-toolbar > div:nth-child(3) > button{
   background-color: #E48B77;
   }
   
   .fc-view-harness.fc-view-harness-active {
   width:60%;
   margin:auto;
   }
   
   .fc-prev-button.fc-button.fc-button-primary{
   float: left;
   }
   .fc-toolbar-title{
   float: left;
   }
   .fc-next-button.fc-button.fc-button-primary{
   float: left;
   }
   .fc-today-button.fc-button.fc-button-primary{
   float: left;
   }

</style>
<head>
<meta charset="utf-8" />
<link href="resources/fullcalendar/main.css" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/cccstyle.css" />
<script src="resources/fullcalendar/main.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
    
    <script>
    
    
	$(document).ready(// 1. 데이터베이스로부터 이모티콘, 날짜를 가져오기
			 
			
					function() {
						 $.ajax({
					            url : '${cpath}/boardSelect.do',
					            //  : 보내줄 데이터를 객체형식으로 넘겨줬었음! {'idx':idx}
					            data : {'userid':"${mvo.userid}"},
					            // 요청 방식
					            type : 'post',
					            dataType : 'json',
					            // 실패했을 때 실행할 함수
					            success : function(text){
					            	
					            	console.log(text);
					            	var eventsList = [];
					            	// start, imgurl
					            	for(var i = 0; i < text.length; i++){

					            		e = {
					            				"start" : "",
					            				"imageurl" : ""
					            		}
					            		
					            		e.start = text[i].writedate.split(" ")[0]
					            		
					            		if(text[i].emotion == 'happy'){
					            			e.imageurl = 'resources/img/happy.png';
					            		}else if(text[i].emotion == 'tired'){
					            		 	e.imageurl = 'resources/img/tired.png';
					            		}else if(text[i].emotion == 'love'){
					            			e.imageurl = 'resources/img/love.png';
					            		}else if(text[i].emotion == 'mad1'){
					            			e.imageurl = 'resources/img/mad1.png';
					            		}else if(text[i].emotion == 'pleasure'){
					            			e.imageurl = 'resources/img/pleasure.png';
					            		}else if(text[i].emotion == 'upset'){
					            			e.imageurl = 'resources/img/upset.png';
					            		}else if(text[i].emotion == 'depress1'){
					            			e.imageurl = 'resources/img/depress1.png';
					            		}else if(text[i].emotion == 'regret'){
					            			e.imageurl = 'resources/img/regret.png';
					            		}else if(text[i].emotion == 'sad'){
					            			e.imageurl = 'resources/img/sad.png';
					            		}
					            		eventsList.push(e)
					            	}
					            	
					            	var calendarEl = document.getElementById("calendar");
									var calendar = new FullCalendar.Calendar(
											calendarEl,
											{
												initialView : "dayGridMonth",
												headerToolbar : {
													start : "",
													center : "prev title next",
													end : "today",
												},

												titleFormat : function(date) {
													// YYYY년 MM월
													return date.date.year + "년"
															+ (date.date.month + 1) + "월";
												},
												contentHeight : 400,
												fixedWeekCount : false,
												showNonCurrentDates : true,
												dayHeaderContent : function(date) {
													let weekList = [ "일", "월", "화", "수","목", "금", "토" ];
													return weekList[date.dow];
												},
												//   datesSet: function (dateInfo) {
												//     // date의 set이 처음 초기화 되거나 변경되었을 때
												//     // 처음 진입했을 때, prev 또는 next 버튼 눌렀을 때 실행되는 것 같음.
												//     console.log(dateInfo);
												//   },
												
												// 2. DB에서 가져온 데이터를 보여주기위해서 for-each문을 돌면서 화면에 뿌려주기
													
												events : eventsList,
												/* events : [ 
													{
													start : "2022-08-02",
													imageurl : "resources/img/zz.jpg"
												} ], */
												eventContent : function(arg) {
													console.log(arg.event._def.extendedProps.imageurl);
													const eventTitle = arg.event.title;
													
													var date = new Date(arg.event.start)
													
													//console.log(date.getMonth()+"-"+date.getDate())
						
													var datemonth = "";
													
													if((date.getMonth()+1)<10){
														datemonth = "0"+(date.getMonth()+1)
													}else{
														datemonth = ""+(date.getMonth()+1)
													}
													
												var userwritedate = date.getFullYear()+"-"+datemonth+"-"+date.getDate()
													console.log(userwritedate)
													
													return {
														html : '<center><a onclick ="" href="diaryoneday?date='+userwritedate+'"><img src="'+arg.event._def.extendedProps.imageurl+'" class="event-icon" /></a></center>',
													};
												},
												dateClick : function(dateClickInfo) {
													const gray = "#787878";
													// looks like single selection
													// // get all fc-day element
													// const fcDayElements = document.querySelectorAll(
													//   ".fc-daygrid-day.fc-day"
													// );
													// // init background color found element
													// fcDayElements.forEach((element, key, parent) => {
													//   element.style.backgroundColor = "";
													// });
													// // set background color clicked Element
													// dateClickInfo.dayEl.style.backgroundColor = gray;

													// looks like multi-selection
													if (dateClickInfo.dayEl.style.backgroundColor) {
														dateClickInfo.dayEl.style.backgroundColor = "";
													} else {
														dateClickInfo.dayEl.style.backgroundColor = gray;
													}
												},
												eventDidMount : function(event, eventElement) {
													if (event.imageurl) {
														eventElement.find("div.fc-daygrid-day-frame fc-scrollgrid-sync-inner")
																.prepend("<img src='" + event.imageurl+"' width='16' height='16'>");
													}
												}
											});
									calendar.render();
					            	
					            },
					            
					            error : function() {
					               alert('실패!');
					            }
					         })
		
		
		
						
					});
</script>
</head>

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
            <h1 class="display-4 animated slideInDown mb-3" id="ATtypo">감정일기 </h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    
    	<div id="calendar"></div>
	<div class="test">	       
		<div class="test2"></div>	   
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
    
</body>

</html>