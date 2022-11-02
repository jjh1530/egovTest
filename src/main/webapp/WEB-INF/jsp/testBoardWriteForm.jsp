<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
 function testBoardAdd(){
	 	// form의 데이터 유효성 체크..
	 	var title = $("#title").val();
		var content = $("#content").val();
		var writer = $("#writer").val();
	 	if(title !="" && content !="" && writer !="" ){
		 	document.form1.action="<c:url value='/testBoardWrite.do'/>"; 
		 	document.form1.submit();
	 	}
	  }
	 
	 
	 $(function() {
			
			$("#btn_add").click(function(){
				var title = $.trim($("#title").val());
				var content = $.trim($("#content").val());
				var writer = $.trim($("#writer").val());
				if(title == "") {
					alert("제목을 입력해주세요.");	
					$("#title").focuse();
					return false;
				}
				
				if(content == "") {
					alert("내용을 입력해주세요.");	
					$("#content").focuse();
					return false;
				}
				
				if(writer == "") {
					alert("이름을 입력해주세요.");	
					$("#writer").focuse();
					return false;
				}
				
		
				
			});
		});
	 function passwordCheck() {
			var boardpass = $("#boardpass").val();
			var boardpass2 = $("#boardpass2").val();
			if (boardpass != boardpass2) {
				$("#passMessage").html("비밀번호가 일치하지 않습니다.");
			}else {
				$("#passMessage").html("");
			}		
		}
 </script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <h2>게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판 글작성</div>
    <div class="panel-body">
     <form id="form1" name="form1" class="form-horizontal" method="post" enctype="multipart/form-data" >
		   <div class="form-group">
		    <label class="control-label col-sm-2" for="title">제목 :</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
		    </div>
		    </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="content">내용 :</label>
		    <div class="col-sm-10">
		      <textarea  class="form-control" id="content" name="content" placeholder="내용을 입력하세요" rows="5"></textarea>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="writer">작성자 :</label>
		    <div class="col-sm-10">
		     <input type="text" class="form-control" id="writer" name="writer" style="width:30%;"  value=${userSession.userid } >
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="uploadFile">첨부파일 :</label>
		    <div class="col-sm-10">
		     <input multiple="multiple"type="file" id="uploadFile" name="uploadFile"  style="width:30%">
		    </div>
		    </div>
		    <div class="form-group">
				<label class="control-label col-sm-2" for="boardpass">게시글 비밀번호 :</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="boardpass" name="boardpass" onkeyup="passwordCheck();"
						placeholder="비밀번호를 입력하세요">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="boardpass2">비밀번호 확인 :</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="boardpass2" name="boardpass2" onkeyup="passwordCheck();"
						placeholder="비밀번호를 입력하세요">
				</div>
			</div>
			<div>
			   <span>비밀번호는 필수 입력이 아닙니다.</span><br>
      	       <span id="passMessage" style="color:red;"></span>
			</div>
		    <div style="text-align:center;">
	   	   <input type="button" value="등록" id ="btn_add" name="btn_add" class='btn btn-primary' onclick="testBoardAdd()"/>
	       <input type="button" value="리스트"  onclick="location.href='${contextPath}/testBoardList.do'" class='btn btn-success'/>
   			</div>
    </form>
    </div>
    <div class="panel-footer">게시판</div>
  </div>
</div>
</body>
</html>