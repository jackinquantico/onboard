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

</style>
</head>
<body id="page-top">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="masthead">

	<div class="container" id="content">
	
		<div id="pageTitle">
			<div id="titlearea" style="float: left">
				<h4>공지사항 작성</h4>
			</div>
		</div>
		
		<form action="insert.no">
			<div class="d-grid">
				<table id="inputTable">
					<tr>
						<td width="15%">제목</td>
						<td width="85%">
							<input type="text" name="noticeTitle" maxlength="20" class="form-control" required>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea id="noticeContent" name="noticeContent" class="form-control" maxlength="165" required></textarea>
						</td>
					</tr>
				</table>
			</div>
			
			<br>
			
			<div id="btnarea">
		        <button type="reset" class="btn btn-outline-primary rounded-pill btn-lg">
		        	초기화
		        </button>
				<button type="submit" class="btn btn-primary rounded-pill btn-lg">
		            	작성하기
		        </button>
	        </div>
		</form>
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>