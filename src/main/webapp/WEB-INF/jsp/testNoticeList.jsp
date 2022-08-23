<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
  
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
pre{
    background-color: #fff;
    padding:10px;
    overflow:auto;
    white-space: pre-wrap; /* pre tag내에 word wrap */
}  
</style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/nav.jsp"></jsp:include>
<div class="container">

		 <h2 style="text-align:center;">공지사항</h2>	
		 <c:forEach var="result" items="${list }" varStatus="loop">
			<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
			<!-- The Grid -->
		      <h4>작성자 : ${result.writer }</h4><br>
		      <h3>${result.title }</h3>
		      <hr class="w3-clear">
		      <pre>${result.content }</pre>
		      <c:if test="${result.noticeimg != null && result.noticeimg!='' }">
			<div style="vertical-align: middle;">
				<img src="<c:out value='file_repo/${result.noticeimg }'/>"
					width="450px" height="200px" style="margin:20px;">
			</div>
			</c:if>
			<a href="testNoticeDetail.do?nidx=${result.nidx }" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>Comment</a>
		  </div>
		 </c:forEach>
</div>
</body>
</html>