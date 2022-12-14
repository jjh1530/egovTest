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
var idx ="";
var rno = "";

$(document).ready(function() {  

$('#updateModal').on('show.bs.modal', function(event) {          
    idx = $(event.relatedTarget).data('replyidx');
    rno = $(event.relatedTarget).data('replyrno');
});

});

function replyUpdate() {
 	 var content = $("#upreply").val();
 	 location.href='/replyUpdate.do?idx='+idx + '&rno=' +rno+ '&content=' +content;
  }
function boardDelete() {
    location.href="${contextPath}/testBoardDelete.do?idx=${vo.idx }";
}

function replyAdd(){
 	// form의 데이터 유효성 체크..
	var content = $.trim($("#content").val());
 	if(content !=""){
	 	document.rfrm1.action="<c:url value='/replyInsert.do'/>"; 
	 	document.rfrm1.submit();
 	}
  }
 
 $(function() {
		
		$("#btn_add").click(function(){
			var content = $.trim($("#content").val());
	
			if(content == "") {
				alert("내용을 입력해주세요.");	
				$("#content").focuse();
				return false;
			}
		});
	});

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/nav.jsp"></jsp:include>
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

 <!-- 댓글 입력 -->
 <div class="panel panel-default">
   
   
 <div class="panel-body">
  
  <form id="rfrm1" name="rfrm1" class="form-horizontal" method="post">
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="content">댓글 :</label>
		    <div class="col-sm-10">
		      <textarea  class="form-control" id="content" name="content" placeholder="댓글을 입력하세요" rows="5"></textarea>
		    </div>
		  </div>
		     <input type="hidden" class="form-control" id="idx" name="idx" style="width:30%;" value=${vo.idx } readonly="readonly">
		   	 <input type="hidden" class="form-control" id="writer" name="writer" style="width:30%;" value=${userid } readonly="readonly">
		   <div style="text-align:center;">
		   <c:if test="${userSession.userid != null }">
	   	   <input type="button" value="댓글등록" id ="btn_add" name="btn_add" class='btn btn-primary' onclick="replyAdd()"/>
	   	   </c:if>
   		</div>
    </form>
</div>
 </div>
 
 <!-- 댓글 -->
   <div class="panel panel-default">
    
 <div class="panel-body">
  <form id="form1" name="form1" class="form-horizontal" method="post">
  	<c:forEach var="reply" items="${reply }" varStatus="loop">
  		<div class="form-group">
         <label class="control-label col-sm-2">
         <c:if test="${reply.profile != null }">
   			<img src="<c:out value='file_repo/${reply.profile}'/>" style="width:50px; height:50px;" class="img-circle">
   		 </c:if> 댓글 :</label>
         <div class="col-sm-10">
           <pre><c:out value="${reply.content}"/></pre>
            	작성자 : <c:out value="${reply.writer}"/>
            	<!-- 작성시간 : <c:out value="${fn:split(reply.indate, ' ')[0]}"/> -->
            	작성시간 : <c:out value="${reply.indate}"/>
            	<c:if test="${reply.writer == userid}">
					<div style="text-align:right;">
					<input type="text" id="idx" name="idx" value="${reply.idx }"/>
					<input type="text" id="rno" name="rno" value="${reply.rno }"/>
					<button type="button" class="btn btn-defualt" onclick="location.href='/replyDelete.do?rno=${reply.rno}&idx=${reply.idx }'">삭제하기</button>
					<button type="button" class="btn btn-defualt" data-toggle="modal" data-target="#updateModal"
            				 data-replyidx="${reply.idx }"  data-replyrno="${reply.rno}">수정</button>
					</div>           	
            	</c:if>
         </div>
    	</div> 
 
    </c:forEach>
    </form>
	</div>
 	</div>
</div>
<!-- 댓글 수정 Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">댓글 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
     	<input type="text" class="form-control" placeholder="댓글을 입력하세요." id="upreply" name="upreply"/> 
   	
      </div>
      <div class="modal-footer">
      	
      	<button type="button" class="btn btn-primary" onclick="replyUpdate();">수정하기</button>
       	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>