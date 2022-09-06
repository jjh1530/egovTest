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
		listHtml+="<td id='t"+obj.idx+"'><a href='javascript:goContent("+obj.idx+")'>"+obj.title+"</a></td>";
		listHtml+="<td>"+obj.writer+"</td>";
		listHtml+="<td>"+obj.indate.split(' ')[0]+"</td>";
		listHtml+="<td id='cnt"+obj.idx+"'>"+obj.count+"</td>";
		listHtml+="</tr>";
		
		//내용 (디테일)
		listHtml+="<tr id='c"+obj.idx+"' style='display:none'>";  //아이디 지정 후 idx 붙여줌
		listHtml+="<td>내용</td>";
		listHtml+="<td colspan='4'>";
		listHtml+="<textarea id='ta"+obj.idx+"' rows='7' class='form-control' readonly='readonly'>"+obj.content+"</textarea>";
		listHtml+="</br>";
		listHtml+="<span id ='up"+obj.idx+"'><button class='btn btn-success btn-sm' onclick='goUpdateForm("+obj.idx+")'>수정화면</button></span>&nbsp;";
		listHtml+="<button class='btn btn-warning btn-sm' onclick='goDelete("+obj.idx+")'>삭제</button>";  
		listHtml+="</td>";
		listHtml+="</tr>";
	});  //반복문함수 (데이터, 함수)  function(인덱스, 데이터)
	
	listHtml+="<tr>";
	listHtml+="<td colspan='5'>";
	listHtml+="<button class='btn btn-primary btn-sm' onclick='goForm()'>글쓰기</button>";  
	listHtml+="</td>";
	listHtml+="</tr>";
	listHtml+="</table>";
	$("#view").html(listHtml);  //view 아이디를 가진 div에 listHtml을 넣어줌 
	
}

function goForm() { // 글쓰기 버튼
	$("#view").css("display","none"); //view의 css를 가져와 보이지 않게
	$("#wform").css("display","block"); //글쓰기는 보이게
}

function goList() { //리스트 버튼
	$("#view").css("display","block"); 
	$("#wform").css("display","none");
}
function goInsert() { //등록 버튼
	//제목 내용 작성자를 작성하기 위해 frm 내의 id 지정
	//var title = $("#title").val();
	//var content = $("#content").val();
	//var writer = $("#writer").val();
	// form 내의 모든 데이터
	var fData = $("#frm").serialize(); //폼내의 모든 데이터를 직렬화하여 가져옴
	$.ajax({
		url : "ajaxWrite.do",
		type : "post",
		data : fData, // title,content, writer
		success : loadList,  //insert 후 다시 리스트 페이지 호출
		error : function() { alert("error"); }
	});
	$("#view").css("display","block"); 
	$("#wform").css("display","none");
	//글 쓰기 후 그 전 기록 남아있기 때문에 값 초기화
	$("#title").val("");
	$("#content").val("");
	$("#writer").val("");
}

//디테일
function goContent(idx) {
	if ($("#c"+idx).css("display")== "none") {  //디테일 안열려있으면 
		$("#c"+idx).css("display","table-row");  //colspan을 위해 block이 아닌 table-row
	}else {
		$("#c"+idx).css("display","none");  //보이지 않게
		
		// 상세보기 닫힐 때 조회수 증가
		$.ajax({
			url : "ajaxCount.do",
			type : "get",
			data : {"idx" : idx} ,
			dataType : "json" ,
			success : function(data) {
				$("#cnt"+idx).text(data.count);
			},
			error : function() { alert("error"); }
		});
	}
}
function goDelete(idx){
	$.ajax({
		url : "ajaxDelete.do",
		type : "get",
		data : {"idx" : idx},
		success : loadList(), //삭제후 리스트 호출
		error : function(){ alert("error"); }
	});
}
function goUpdateForm(idx) {
	$("#ta"+idx).attr("readonly",false); //수정가능하게 readonly 속성 변경
	var title = $("#t"+idx).text();  //원 제목 값
	//수정화면 클릭시 newInput으로 html변경
	//id지정하여 goUpdate와 연결
	var newInput="<input type='text' id='nt"+idx+"' class='form-control' value='"+title+"'/>";
	
	$("#t"+idx).html(newInput);
	
	var newButton="<button class='btn btn-info btn-sm' onclick='goUpdate("+idx+")'>수정</button>"
	$("#up"+idx).html(newButton);
}

function goUpdate(idx) {
	var title = $("#nt"+idx).val();
	var content = $("#ta"+idx).val();
	
	$.ajax({
		url : "ajaxUpdate.do",
		type : "post",
		data : {"idx":idx,"title":title, "content": content},
		success : loadList,
		error : function() {alert("error");}
	});
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
    <!-- 글쓰기 폼 -->
 	 <div class="panel-body" id="wform" style="display:none"> <!-- 보이지않게 -->
    <form id="frm"> <!-- 데이터를 보내기위해 id만 지정 -->
      <table class="table">
         <tr>
           <td>제목</td>
           <td><input type="text" id="title" name="title" class="form-control"/></td>
         </tr>
         <tr>
           <td>내용</td>
           <td><textarea rows="7" class="form-control" id="content" name="content"></textarea> </td>
         </tr>
         <tr>
           <td>작성자</td>
           <td><input type="text" id="writer" name="writer" class="form-control"/></td>
         </tr>
         <tr>
           <td colspan="2" align="center">
               <button type="button" class="btn btn-success btn-sm" onclick="goInsert()">등록</button>
               <button type="reset" class="btn btn-warning btn-sm" id="fclear">취소</button>
               <button type="button" class="btn btn-info btn-sm" onclick="goList()">리스트</button>
           </td>
         </tr>
      </table>
     </form>
    </div>
    <div class="panel-footer">Ajax게시판</div>
  </div>
</div>

</body>
</html>