<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome OnBoard</title>
<style>
#content { height: 1000px; }

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
				<h4>자유게시판</h4>
			</div>
		</div>
		
		<br>
		
		<form action="insert.fb" enctype="multipart/form-data">
			<div class="d-grid">
				<table id="inputTable">
					<tr>
						<td width="15%">제목</td>
						<td width="85%">
							<input type="text" name="boardTitle" maxlength="20" class="form-control" required>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea id="noticeContent" name="boardContent" class="form-control" maxlength="165" required></textarea>
						</td>
					</tr>
					<tr>
						<td>대표 <br> 첨부파일</td>
						<td>
							<img src="https://media.istockphoto.com/id/922962354/vector/no-image-available-sign.jpg?b=1&s=170667a&w=0&k=20&c=VqpxaeBt-p0q2JlujQV-0fmCsaD3NeP4mmOUX4uZEIc=" 
								id="attachment" height="300px" />
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="file" multiple="multiple" id="changeFile" name="changeFile" class="form-control" onchange="addImg(this, '#attachment');">
							<br>
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
							<input type="file" multiple="multiple" name="changeFile" class="form-control">
							<input type="file" multiple="multiple" name="changeFile" class="form-control">
							<input type="file" multiple="multiple" name="changeFile" class="form-control">
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

<script>
function addImg(input, expression) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$(expression).attr("src", e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
		
	} else {
		$(expression).attr("src", "https://media.istockphoto.com/id/922962354/vector/no-image-available-sign.jpg?b=1&s=170667a&w=0&k=20&c=VqpxaeBt-p0q2JlujQV-0fmCsaD3NeP4mmOUX4uZEIc=");
	}
}
</script>

</body>
</html>