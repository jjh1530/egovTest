<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>

  <title>회원사진등록</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>

<jsp:include page="/WEB-INF/jsp/nav.jsp"></jsp:include>
<div class="container">
  <span><button class="btn" id="userDetail" onclick="userDetail();">회원정보</button>
  		<button class="btn" id="imageUpdate" onclick="imageUpdate();">사진등록</button>
  		<button class="btn" id="passUpdate" onclick="passUpdate();">비밀번호 변경</button>
  </span>
   
  <div class="panel panel-default">
    <div class="panel-heading">회원정보변경</div>
    <div class="panel-body" id="view"></div>
    <div class="panel-body" id="image">
    	 <form action="testImageUpload.do" method="post" enctype="multipart/form-data">
    	 <input type="hidden" name="userid" value="${userSession.userid }"/>
    	 <input type="hidden" name="pass" value="${userSession.userpass}"/>
      	<table class="table table-bordered" style="text-align:center; border: 1px solid #dddddd;" >
      	  <tr>
      	    <td style="width:15%; vertical-align: middle;">아이디</td>
      	    <td>${userSession.userid}</td>
      	  </tr>
      	  <tr>
      	    <td style="width:15%; vertical-align: middle;">사진업로드</td>
      	    <td colspan="2">
      	    	  이미지를 업로드하세요.<input type="file" id="uploadFile" name="uploadFile"/>
      	    </td>
      	  </tr>
      	  <tr>
      	    <td colspan="2" style="text-align: left;">
      	    	<input type="submit" value="등록" class="btn btn-primary btn-sm pull-right"/>
      	    </td>
      	  </tr>
      	</table>
      </form>
    </div>
    
    <div class="panel-body" id="passUpdateCheck">
    	<form id="passfrm" name="passfrm"  action="userPassUpdate.do" method="post">
        <input type="hidden" name="userid" id="userid" value="${userSession.userid }"/>
      	<table class="table table-bordered" style="text-align:center; border: 1px solid #dddddd;" >
      	  <tr>
      	    <td style="width:15%; vertical-align: middle;">아이디</td>
      	    <td>${userSession.userid }</td>
      	  </tr>
      	  <tr>
      	    <td style="width:15%; vertical-align: middle;">비밀번호</td>
      	    <td colspan="2"><input id="userpass" name="userpass" onkeyup="passwordCheck();" class="form-control" type="password" placeholder="비밀번호" maxlength="20"/></td>
      	  </tr>
      	  <tr>
      	    <td style="width:15%; vertical-align: middle;">비밀번호 확인</td>
      	    <td colspan="2"><input id="userpass2" name="userpass2" onkeyup="passwordCheck();" class="form-control" type="password" placeholder="비밀번호 확인" maxlength="20"/></td>
      	  </tr>
     
      	  <tr>
      	    <td colspan="3" style="text-align: left;">
      	    	<span id="passMessage" style="color:red;"></span>
      	    	<input type="button" value="수정" data-toggle="modal" data-target="#updateModal" class='btn btn-primary  btn-sm pull-right'/>
      	    </td>
      	  </tr>
      	</table>
      </form>
    </div>
    <div class="panel-footer">test</div>
</div>
  
  </div>
</body>

<!-- 삭제 Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">비밀번호 변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            비밀번호를 정말 변경하시겠습니까?
      </div>
      <div class="modal-footer">
      	<button type="button" id="btn_submit" class="btn btn-primary">변경</button>
       	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	userDetail();
});

function userDetail() {
	$("#view").css("display","block"); 
	$("#image").css("display","none"); 
	$("#passUpdateCheck").css("display","none");
	var userid = '<c:out value="${userSession.userid}"/>';
	var username = '<c:out value="${userSession.username}"/>';
	var useremail = '<c:out value="${userSession.useremail}"/>';
	var listHtml="<div class='panel-heading'>회원정보</div>"
		listHtml+="<div class='form-group'>";
		listHtml+="<label class='control-label col-sm-2' >아이디 :</label>";
		listHtml+="<div class='col-sm-10'>";
		listHtml+=" <input type='text' class='form-control' id='userid' readonly='readonly' name='userid' value='"+userid+"''>";
		listHtml+="</div>";
		listHtml+="</div>";
		listHtml+="<div class='form-group'>";
		listHtml+="<label class='control-label col-sm-2' >이름 :</label>";
		listHtml+="<div class='col-sm-10'>";
		listHtml+=" <input type='text' class='form-control' id='username' name='username'readonly='readonly' value='"+username+"''>";
		listHtml+="</div>";
		listHtml+="</div>";
		listHtml+="<div class='form-group'>";
		listHtml+="<label class='control-label col-sm-2' >유저메일 :</label>";
		listHtml+="<div class='col-sm-10'>";
		listHtml+="<input type='text' class='form-control' id='useremail' name='useremail' readonly='readonly' value='"+useremail+"''>";
		listHtml+="</div>";
		listHtml+="</div>";
		listHtml+="<c:if test="${userSession.filename ne null }">";
		listHtml+="<label class='control-label col-sm-2' >유저 사진 :</label>";
		listHtml+="<div class='col-sm-10'>";
		listHtml+="<img src='<c:out value='file_repo/${userSession.filename}'/>' style='width:500px;height:300px;'";
		listHtml+="</div>";
		listHtml+="</div>";
		listHtml+="</c:if>";
		$("#view").html(listHtml);
}

function imageUpdate() {
	$("#view").css("display","none"); 
	$("#image").css("display","block");
	$("#passUpdateCheck").css("display","none");
}

function passUpdate() {
	$("#view").css("display","none"); 
	$("#image").css("display","none");
	$("#passUpdateCheck").css("display","block");
}


function passwordCheck() {
	var userpass = $("#userpass").val();
	var userpass2 = $("#userpass2").val();
	if (userpass != userpass2) {
		$("#passMessage").html("비밀번호가 일치하지 않습니다.");
	}else {
		$("#passMessage").html("");
	}		
}
$(function() {
	
	$("#btn_submit").click(function(){
		
		var userpass = $.trim($("#userpass").val());
		var userpass2 =  $.trim($("#userpass2").val());
		
		if(userpass == "") {
			alert("암호를 입력해주세요.");	
			$("#userpass").focuse();
			return false;
		}
	
		if(userpass != userpass2) {
			alert("비밀번호가 다릅니다.")	
			return false;
		}

		  document.passfrm.action="<c:url value='/userPassUpdate.do'/>"; 
		  document.passfrm.submit();
	});
});

$(document).ready(function(){
	if(${!empty msgType}){
		$("#messageType").attr("class","modal-content panel-success");
		$("#myMessage").modal("show");	
	}
});
</script>
</html>
