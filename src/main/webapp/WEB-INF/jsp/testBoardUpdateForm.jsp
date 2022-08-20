<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <title>게시판</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
function testBoardUpdate(){
 	// form의 데이터 유효성 체크..
 	var title = $("#title").val();
	var content = $("#content").val();
	var writer = $("#writer").val();
 	if(title !="" && content !="" && writer !="" ){
	 	document.form1.action="<c:url value='/testBoardUpdate.do'/>"; 
	 	document.form1.submit();
 	}
  }
 
 
 $(function() {
		
		$("#btn_update").click(function(){
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
</script>
</head>
<body>
<div class="container">
  <h2>게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판 수정</div>
    <div class="panel-body">
   		<form id="form1" name="form1" class="form-horizontal" method="post" enctype="multipart/form-data" >
   			<input type="hidden" name="idx" value="${vo.idx }"/>
   			<table class="table table-bordered">
   				<tr>
   					<td>제목</td>
   					<td><input type="text" id="title" name="title" class="form-control" value="${vo.title }" /></td>
   				</tr>
   				<tr>
   					<td>내용</td>
   					<td><textarea rows="7" class="form-control" id="content" name="content">${vo.content }</textarea></td>
   				</tr>
				<tr>
   					<td>작성자</td>
   					<td><input type="text" id="writer" n ame="writer" class="form-control" value="${vo.writer }" readonly="readonly"/></td>
   				</tr>
   				<tr>
   					<td>첨부파일</td>
   					<td><input type="file" id="uploadFile" name="uploadFile"  style="width:30%"></td>
   				</tr>
   				<tr>
   					<td colspan="2" align="center">
   						<input type="button" value="수정" id ="btn_update" name="btn_update" class='btn btn-primary' onclick="testBoardUpdate()"/>
						<input type="reset" value="취소" class="btn btn-warning"/>
						<input type="button" value="목록" class="btn" onclick="location.href='${contextPath }/testBoardList.do'"/>
   					</td>
   				</tr>
   			</table>
   		</form>
    </div>
    <div class="panel-footer">게시판</div>
  </div>
</div>
<!-- 수정 Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">게시물 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        게시물을 정말 수정하시겠습니까?
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" onclick="testBoardUpdate();">수정하기</button>
       	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>