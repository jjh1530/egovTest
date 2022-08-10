<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/testBoardList.do">Home</a></li>
        <li><a href="/testBoardList.do">게시판</a></li>
      </ul>
      <c:if test="${empty userSession }">
	      <ul class="nav navbar-nav navbar-right">
	            <li><a href="/testLoginForm.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
	            <li><a href="/userRegisterForm.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
	      </ul>
      </c:if>
      
      <c:if test="${!empty userSession }">
	      <ul class="nav navbar-nav navbar-right">
	            <li><a href="${contextPath }/"><span class="glyphicon glyphicon-wrench"></span> 회원정보수정</a></li>
	            <li><a href="${contextPath }/"><span class="glyphicon glyphicon-picture"></span> 사진등록</a></li>
	            <li><a href="/testLogout.do"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
	      </ul>
      </c:if>
    </div>
  </div>
</nav>
</body>
</html>