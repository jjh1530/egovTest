<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
$(function() {
	
	$("#btn_submit").click(function(){
		var userid = $.trim($("#userid").val());
		var userpass = $.trim($("#userpass").val());
		if(userid == "") {
			alert("아이디를 입력해주세요.");	
			$("#userid").focuse();
			return false;
		}
		
		if(userpass == "") {
			alert("암호를 입력해주세요.");	
			$("#userpass").focuse();
			return false;
		}
		
		$.ajax({
			/* 전송 전 세팅 */
    		type:"POST",
    		data: "userid="+userid+ "&userpass=" + userpass,
    		url:"testLogin.do", //데이터를 보내는 곳
    		dataType:"text",     // 리턴 타입
    		
    		/* 전송 후 세팅  */
    		success: function(result) {
    			if(result == "ok") {
    				alert(userid + "님 로그인 되었습니다.");
    				location = "testBoardList.do";
    			} else {
    				alert("아이디 또는 패스워드를 확인해주세요.");
    			}
    		},
    		error: function() {  // 장애발생
    			alert("오류발생");
    		}
    	});	
	});
});

</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/nav.jsp"></jsp:include>
<div class="container">
  <h2>Panel Heading</h2>
  <div class="panel panel-default">
    <div class="panel-heading">로그인화면</div>
    <div class="panel-body">
    	 <form action="${contextPath}/testLogin.do" method="post">
      	<table class="table table-bordered" style="text-align:center; border: 1px solid #dddddd;" >
      	  <tr>
      	    <td style="width:110px; vertical-align: middle;">아이디</td>
      	    <td><input id="userid" name="userid" class="form-control" type="text" placeholder="아이디" maxlength="20"/></td>
      	  </tr>
      	  <tr>
      	    <td style="width:110px; vertical-align: middle;">비밀번호</td>
      	    <td colspan="2"><input id="userpass" name="userpass" class="form-control" type="password" placeholder="비밀번호" maxlength="20"/></td>
      	  </tr>
      	  <tr>
      	    <td colspan="2" style="text-align: left;">
      	    	<button type="button" id="btn_submit" name="btn_submit"  class="btn btn-primary btn-sm pull-right">로그인</button>
      	    </td>
      	  </tr>
      	</table>
      </form>
    </div>
    </div>
</div>
</body>
</html>