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
$(document).ready(function(){
	if(${!empty msgType}){
		$("#messageType").attr("class","modal-content panel-success");
		$("#myMessage").modal("show");	
	}
});

function fn_prev(page, range, rangeSize, listSize, searchType, keyword1, keyword2) {
	
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	var url = "/testBoardList.do";
	url += "?page=" + page;
	url += "&range=" + range;
	url += "&listSize=" + listSize;
	url += "&searchType=" + searchType;
	url += "&keyword1=" + keyword1;
	url += "&keyword2=" + keyword2;
	location.href= url;
}

function fn_pagination(page, range, rangeSize, listSize, searchType, keyword1, keyword2) {
	var url = "/testBoardList.do";
		url += "?page=" + page;
		url += "&range=" + range;
		url += "&listSize=" + listSize;
		url += "&searchType=" + searchType;
		url += "&keyword1=" + keyword1;
		url += "&keyword2=" + keyword2;
		location.href= url;
}

function fn_next(page, range, rangeSize, listSize, searchType, keyword1, keyword2) {
	
	var page = parseInt((range * rangeSize)) +1;
	var range = parseInt(range) +1;
	var url = "/testBoardList.do";
	url += "?page=" + page;
	url += "&range=" + range;
	url += "&listSize=" + listSize;
	url += "&searchType=" + searchType;
	url += "&keyword1=" + keyword1;
	url += "&keyword2=" + keyword2;
	location.href= url;
}
$(document).on('click','#btnSearch',function(e){
	e.preventDefault();
	var url = "/testBoardList.do";
	url += "?searchType=" + $('#searchType').val();
	url += "&keyword1=" + $('#keyword1').val();
	url += "&keyword2=" + $('#keyword2').val();
	location.href = url;
	console.log(url);
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/nav.jsp"></jsp:include>
<div class="container">
  <h2>게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판 조회</div>
    <div class="panel-body">
     <form id="form1" name="form1" class="form-horizontal" method="post"  >
		   <div class="form-group">
		    <label class="control-label col-sm-2" for="title">제목 :</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="keyword1" name="keyword1" placeholder="제목을 입력하세요">
		    </div>
		     <label class="control-label col-sm-2" for="writer">작성자 :</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="keyword2" name="keyword2" placeholder="작성자를 입력하세요">
		    </div>
		      <button class="btn btn-primary" name="btnSearch" id="btnSearch" onclick="btnSearch" style="padding: 10px;"  >
			검색</button>
		    </div>
		
    </form>
    <!-- 
    <table> 
 	<tr>
	<th style="padding-right: 10px; width:15%">
	 <select class="form-control form-cotrol-sm" name="searchType" id="searchType">
				<option value="title">제목</option>
				<option value="writer">작성자</option>
	</select>
	</th>
	
	<th style="padding-right: 10px; width: 15%;">
		<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
	</th>
	
	<th style="text-align:left;">
		<button class="btn btn-primary" name="btnSearch" id="btnSearch" onclick="btnSearch" style="padding: 10px;"  >
		검색</button>
	</th>
	</tr>
	</table>
	 -->
		<table class="table table-striped text-center">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vo }" varStatus="loop">
					<tr>
						<td>${vo.idx}</td>
						<!-- <td><a href="testBoardDetail.do?idx=${vo.idx}">${vo.title}</a></td> -->
						<c:if test="${vo.boardpass != '' }">  <!-- 비밀번호 있음 -->
							<td><a href="testBoardPassForm.do?idx=${vo.idx }" >${vo.title}</a></td>
						</c:if>
						<c:if test="${vo.boardpass == '' }">
							<td><a href="testBoardDetail.do?idx=${vo.idx}">${vo.title}</a></td>
						</c:if>
						<td>${vo.count}</td>
						<td>${vo.writer}</td>
						<td>${fn:split(vo.indate,' ')[0]}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${userSession.userid != null  }">
	    	<button type="button"  class="btn btn-default pull-right" onclick="location='testBoardWriteForm.do'">글쓰기</button>
	    </c:if>
    </div>
    <!-- 페이징 -->
		<div id ="paginationBox" class="text-center">
			<ul class="pagination" style="justify-content: center; ">
			
				<c:if test="${pagination.prev }">
					<li class="page-item"><a class="page-link" href="#" 
					onclick="fn_prev('${pagination.page }','${pagination.range }', '${pagination.rangeSize }','${pagination.listSize2 }'
					,'${search.searchType }', '${search.keyword1}', '${search.keyword2}')">이전</a>
				</c:if>
				<c:forEach begin="${pagination.startPage }" end="${pagination.endPage}" var="title">
					<li class="page-item <c:out value="${pagination.page ==  title ? 'active' : ''}"/> ">
					<a class="page-link" href="#" 
						onclick="fn_pagination('${title }', '${pagination.range }','${paginationf.rangeSize }',
						'${pagination.listSize2 }','${search.searchType}', '${search.keyword1}', '${search.keyword2}')">
						${title}</a></li>
				</c:forEach>	
				
				<c:if test="${pagination.next }">
					<li class="page-item"><a class="page-link" href="#" 
					onclick="fn_next('${pagination.page }','${pagination.range }', '${pagination.rangeSize }',
						'${pagination.listSize2 }','${search.searchType }', '${search.keyword1}', '${search.keyword2}')">다음</a>
					</li>
				</c:if>
			
			</ul>
		</div> 
		<!-- 페이징 종료 -->
	<div class="panel panel-footer">게시판</div>
</div>
</div>

<!-- 모달 -->
<div class="modal fade" id="myMessage" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div id="messageType" class="modal-content panel-info">
        <div class="modal-header panel-heading">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">${msgType }</h4>
        </div>
        <div class="modal-body">
          <p>${msg }</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</body>
</html>