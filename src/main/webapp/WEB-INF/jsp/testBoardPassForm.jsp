<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>비밀번호 입력</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/nav.jsp"></jsp:include>

	<div class="container">
		<h2>비밀번호 입력</h2>
		<div class="panel panel-default">
			<div class="panel-heading">비밀번호 입력</div>
			<div class="panel-body">
				<form id="form1" name="form1" class="form-horizontal" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-sm-2" for="boardpass">패스워드입력 :</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="boardpass"  name="boardpass"
								placeholder="패스워드 입력하세요">
						</div>
					</div>
					<input type="hidden" id="idx"value="${vo.idx }"/>
					<div style="text-align: center;">
						<input type="button" value="입력" id="btnPassCheck" name="btnPassCheck"
							class='btn btn-primary' /> 
						<input type="button" value="리스트" onclick="location.href='/testBoardList.do'" class='btn btn-success' />
					</div>
				</form>
			</div>
			<div class="panel-footer">egovTest</div>
		</div>
	</div>
</body>

<script>

$(function() {
	$("#btnPassCheck").click(function(){
		var boardpass = $.trim($("#boardpass").val());
		var idx = $.trim($("#idx").val());
		$.ajax({
			type:"POST",
			data : "boardpass=" +boardpass + "&idx=" + idx,
			url : "boardPassCheck.do",
			dataType:"text",
			success: function(result) {
	   			if(result == 1) {
	   				location = "testBoardDetail.do?idx=" + idx;
	   				
	   			} else {
	   				alert("패스워드를 확인해주세요.");
	   			}
	   		},
	   		error: function() {  // 장애발생
	   			alert("오류발생");
	   		}
		});
	});
	
	
});
	

 </script>
 
 

</html>