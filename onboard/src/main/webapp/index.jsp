<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome OnBoard</title>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<style>
#content {
	height: 300px;
}
.board {
	width: 30%;
	float: left;
	margin-left: 20px;
	margin-right: 20px;
}
.card {
	width: 18%;
	float: left;
	margin-left: 20px;
}
#pageTitle {
	margin-left: 30px;
}
#thumbnail {
	height: 300px;
}
</style>
</head>
<body id="page-top">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<div class="masthead">
		<!-- 이미지 구역 -->
		
	<div class="container" id="content">
		<div class="board">
			<table class="table table-bordered">
				<thead>
					<tr>
						<td colspan="3">공지사항</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="5%">0</td>
						<td width="75%">제목</td>
						<td width="20%">작성일</td>
					</tr>
					<tr>
						<td>0</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
					<tr>
						<td>0</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
					<tr>
						<td>0</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
					<tr>
						<td>0</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="board">
			<table class="table table-bordered">
				<thead>
					<tr>
						<td colspan="3">자유게시판</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="5%">0</td>
						<td width="75%">제목</td>
						<td width="20%">작성일</td>
					</tr>
					<tr>
						<td>0</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
					<tr>
						<td>0</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
					<tr>
						<td>0</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
					<tr>
						<td>0</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="board">
			<table class="table table-bordered">
				<thead>
					<tr>
						<td colspan="3">후기게시판</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="5%">0</td>
						<td width="75%">제목</td>
						<td width="20%">작성일</td>
					</tr>
					<tr>
						<td>0</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
					<tr>
						<td>0</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
					<tr>
						<td>0</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
					<tr>
						<td>0</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="container" id="thumbnail">
		
		<div class="d-grid" id="pageTitle">
			<p>사진게시판</p>
		</div>
	
		<div class="card">
			<div class="card-header">
				<img src="resources/assets/img/portrait_black.png" width="100%" height="170px" />
			</div>
			<div class="card-body">
				<p class="card-text">제목 들어갈 자리</p>
				<p class="card-text">등록일</p>
			</div>
		</div>
		
		<div class="card">
			<div class="card-header">
				<img src="" width="100%" height="170px" />
			</div>
			<div class="card-body">
				<p class="card-text">제목 들어갈 자리</p>
				<p class="card-text">등록일</p>
			</div>
		</div>
		
		<div class="card">
			<div class="card-header">
				<img src="" width="100%" height="170px" />
			</div>
			<div class="card-body">
				<p class="card-text">제목 들어갈 자리</p>
				<p class="card-text">등록일</p>
			</div>
		</div>
		<div class="card">
			<div class="card-header">
				<img src="" width="100%" height="170px" />
			</div>
			<div class="card-body">
				<p class="card-text">제목 들어갈 자리</p>
				<p class="card-text">등록일</p>
			</div>
		</div>
		<div class="card">
			<div class="card-header">
				<img src="" width="100%" height="170px" />
			</div>
			<div class="card-body">
				<p class="card-text">제목 들어갈 자리</p>
				<p class="card-text">등록일</p>
			</div>
		</div>
	</div>
	
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>