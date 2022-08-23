<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/nav.jsp"></jsp:include>
<h2 style="text-align:center;">TestMainPage</h2>

<!-- Swiper -->
    <section class="notice">
    <div class="swiper mySwiper" >
      <div class="swiper-wrapper">
	        <c:forEach var="notice" items="${notice }" varStatus="Loop">
	        <div class="swiper-slide">
		        <span><img src="<c:out value='file_repo/${notice.noticeimg}'/>" style="weight:1000px;height:600px;" />
		        <br/><a href="testNoticeDetail.do?nidx=${notice.nidx }" class="btn btn-info">자세히 보기 </a>
		        </span>
	        </div>
	       </c:forEach>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
    </div>
    
     <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        lazy: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
    
    </section>
     <!-- Swiper -->
     
     <!-- FOOTER -->
  <footer>
    <div class="inner">

      <ul class="menu">
        <li><a href="javascript:void(0)">TestMainPage 홈페이지</a></li>
      </ul>
      <div class="btn-group">
        <a href="javascript:void(0)" class="btn btn--white">찾아오시는 길</a>
        <a href="javascript:void(0)" class="btn btn--white">신규입점제의</a>
        <a href="javascript:void(0)" class="btn btn--white">사이트 맵</a>
      </div>

      <div class="info">
        <span>사업자등록번호 ???</span>
        <span>TestMainPage</span>
        <span>TEL : ??? / FAX : ???</span>
        <span>개인정보 책임자 : </span>
      </div>

      <p class="copyright">
        &copy; <span class="this-year"></span> TestMainPage
      </p>

    </div>
  </footer>
     
</body>
</html>