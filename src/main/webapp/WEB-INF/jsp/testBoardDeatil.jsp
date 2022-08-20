<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

function boardDelete() {
    location.href="${contextPath}/testBoardDelete.do?idx=${vo.idx }";
}

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <h2>상세보기</h2>
  <div class="panel panel-default">
  <div class="panel-heading">게시판 상세보기</div>
  <div class="panel-body">
  <form id="form1" name="form1" class="form-horizontal" method="post">
  	<div class="form-group">
    <label class="control-label col-sm-2">제목:</label>
      <div class="col-sm-10">
      <pre ><c:out value="${vo.title}"/></pre>
    </div>
    </div> 
	<div class="form-group">
    <label class="control-label col-sm-2">내용:</label>
      <div class="col-sm-10">
        <pre><c:out value="${vo.content}"/></pre>
      </div>
    </div> 
    <div class="form-group">
    <label class="control-label col-sm-2">작성자 :</label>
      <div class="col-sm-10">
        <pre><c:out value="${vo.writer}"/></pre>
      </div>
    </div> 
     <div class="form-group">
    <label class="control-label col-sm-2">작성시간 :</label>
      <div class="col-sm-10">
        <pre><c:out value="${fn:split(vo.indate,' ')[0]}"/></pre>
      </div>
    </div>
    <c:if test="${vo.filename !=null && vo.filename!=''}">
		<div style="vertical-align: middle;">
			<img src="<c:out value='file_repo/${vo.filename}'/>"
				width="90%" height="600px">
		</div>
	</c:if>
    </form>
    <input type="button" value="리스트" onclick="location.href='${contextPath}/testBoardList.do'" class='btn btn-success'/>
	<c:if test="${userSession.userid == vo.writer }">
		<input type="button" value="수정" onclick="location.href='${contextPath}/testBoardUpdateForm.do?idx=${vo.idx }'" class='btn btn-primary'/>
		<input type="button" value="삭제" data-toggle="modal" data-target="#deleteModal" class='btn btn-warning'/>
	</c:if>
</div>
 <div class="panel-footer">게시판</div>
 </div>
</div>
<!-- 삭제 Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">게시물 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        게시물을 정말 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" onclick="boardDelete();">삭제하기</button>
       	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
      </div>
    </div>
  </div>
</div>

</body>
</body>
</html>