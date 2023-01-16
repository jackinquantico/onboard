<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome OnBoard</title>
<style>
#content { height: 500px; }

#pageTitle { padding-bottom: 50px;}

#pageTitle h4, #pageTitle a {
	display: inline-block;
	width: 150px;
}

#titlearea {
	display: inline-block;
	width: 30%;
	float: left;
}
#pageTitle, #inputTable, #btnarea {
	width: 50%;
	margin-left: 25%;
}
#btnarea button {
	width: 45%;
	display: inline-block;
	margin: 0 15px;
	float: left;
}
#noticeContent {
	height: 300px;
}
#back {
	display: inline-block;
	width: 60%;
	float: left;
	text-align: right;
}
</style>
</head>
<body id="page-top">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="masthead">

	<div class="container" id="content">
	
		<div id="pageTitle">
			<div id="titlearea" style="float: left">
				<h4>자유게시판</h4>
			</div>
			<div id="back" style="float: right;">
				<a href="list.fb" class="btn btn-primary">목록보기</a>
			</div>
		</div>
		
		<div class="d-grid">
			<table id="inputTable" class="table">
				<tr>
					<td>제목</td>
					<td colspan="5">
						${ b.boardTitle }
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						${ b.userNo }
					</td>
					<td>작성일</td>
					<td>
						${ b.writeDate }
					</td>
					<td>조회수</td>
					<td>
						${ b.count }
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="5" height="250px">
						${ b.boardContent }
					</td>
				</tr>
			</table>
		</div>
		
		<br>
		
		<c:if test="${ loginUser.userId eq b.userNo }">
			<div id="btnarea">
		        <button type="button" onclick="updateBoard(1);" class="btn btn-outline-primary rounded-pill btn-lg">
		        	수정하기
		        </button>
				<button type="button" onclick="updateBoard(2);" class="btn btn-primary rounded-pill btn-lg">
		            	삭제하기
		        </button>
	        </div>
        </c:if>
        
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
function updateBoard(num) {
	
	if (num == 1) {
		location.href = "updateForm.fb?bno=" + ${ b.boardNo };
	} else {
		location.href = "delete.fb?bno=" + ${ b.boardNo };
	}
}
</script>

</body>
</html>