<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome OnBoard</title>
<style>
#content { height: 600px; }

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
#btnarea {
	display: inline-block;
	width: 60%;
	float: left;
	text-align: right;
}
.table td { height: 50px; }

#paging-area {
	width: 55%;
	float: right;
}
.pagination a { color: black; }
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
			<c:if test="${ not empty loginUser }">
				<div id="btnarea" style="float: right;">
					<a href="enroll.fb" class="btn btn-primary">작성하기</a>
				</div>
			</c:if>
		</div>
		
		<br>
	
		<table class="table table-boardered">
			<thead align="center">
				<tr>
					<th width="7%">글 번호</th>
					<th width="68%">글 제목</th>
					<th width="10%">작성자</th>
					<th width="10%">작성일</th>
					<th width="5%">조회수</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:choose>
					<c:when test="${ empty blist }">
						<tr>
							<td colspan="5" align="center">
								현재 작성된 게시글이 없습니다.
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="b" items="${ blist }">
							<tr>
								<td align="center">${ b.boardNo }</td>
								<td><a href="detail.fb?bno=${ b.boardNo }" class="atag">${ b.boardTitle }</a></td>
								<td align="center">${ b.userNo }</td>
								<td align="center">${ b.writeDate }</td>
								<td align="center">${ b.count }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<br>
	
		<div id="paging-area">
			<ul class="pagination">
			
				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link" href="list.fb?cpage=${ pi.currentPage - 1 }"><</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="list.fb?cpage=${ pi.currentPage - 1 }"><</a></li>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<li class="page-item"><a class="page-link" href="list.fb?cpage=${ p }">${ p }</a></li>
			  	</c:forEach>
			  	
			  	<c:choose>
			  		<c:when test="${ pi.currentPage eq pi.maxPage }">
			  			<li class="page-item disabled"><a class="page-link" href="list.fb?cpage=${ pi.currentPage + 1 }">></a></li>
			  		</c:when>
			  		<c:otherwise>
			  			<li class="page-item"><a class="page-link" href="list.fb?cpage=${ pi.currentPage + 1 }">></a></li>
			  		</c:otherwise>
			  	</c:choose>
			</ul>
		</div>
	
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>