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
<title>공지사항 상세보기</title>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/nav.jsp"></jsp:include>

<div class="container">
  <h2>공지사항	</h2>
  <div class="panel panel-default">
    
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
           <p style="margin-right:50px;"><c:out value="${vo.content}"/></p>
         </div>
    	</div> 
    
    		<c:if test="${vo.noticeimg !=null && vo.noticeimg!=''}">
			<div style="vertical-align: middle; padding:30px; margin-left:50px;">
				<img src="<c:out value='file_repo/${vo.noticeimg}'/>"
					width="90%" height="600px">
			</div>
		</c:if>
		
    </form>
  
     <input type="button" value="리스트" onclick="location.href='/testNoticeList.do'" class='btn btn-success'/>

</div>
 <div class="panel-footer">infometa.kr</div>
 </div>
</div>
</body>


</html>