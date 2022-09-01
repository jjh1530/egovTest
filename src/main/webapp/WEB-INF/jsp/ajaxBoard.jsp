<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	loadList();
	
});

//서버와 통신 : 게시판 리스트 가져오기
function loadList(){
	$.ajax({
		url : "ajaxList.do",
		type : "get",       // 보내는 형식
		dataType : "json",  //받는 타입
		success : makeView,  //콜백 함수
		error : function() {alert("error"); }
	});
}

function makeView(data) {
	//HTML
	var listHtml="<table class='table table-borderd'>";
	listHtml+="<tr>";
	listHtml+="<td>번호</td>";
	listHtml+="<td>제목</td>";
	listHtml+="<td>작성자</td>";
	listHtml+="<td>작성일</td>";
	listHtml+="<td>조회수</td>";
	listHtml+="</tr>";
	$.each(data,function(index,obj) {
		listHtml+="<tr>";
		listHtml+="<td>"+obj.idx+"</td>";
		listHtml+="<td>"+obj.title+"</td>";
		listHtml+="<td>"+obj.writer+"</td>";
		listHtml+="<td>"+obj.indate+"</td>";
		listHtml+="<td>"+obj.count+"</td>";
		listHtml+="</tr>";
	});  //반복문함수 (데이터, 함수)  function(인덱스, 데이터)
	listHtml+="</table>";
	$("#view").html(listHtml);  //view 아이디를 가진 div에 listHtml을 넣어줌 
	
}
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/nav.jsp"></jsp:include>
<div class="container">
  <h2>Ajax게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD</div>
    <div class="panel-body" id="view"></div>
 
    <div class="panel-footer">Ajax게시판</div>
  </div>
</div>

</body>
</html>