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
#pageTitle, #inputTable, #btnarea, #resultarea {
	width: 50%;
	margin-left: 25%;
}

#resultarea {
	margin-top: 50px;
}

</style>
</head>
<body id="page-top">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="masthead">

	<div class="container" id="content">
	
		<div id="pageTitle">
			<div id="titlearea" style="float: left">
				<h4>아이디 찾기</h4>
			</div>
		</div>
		
		<div class="d-grid">
			<table id="inputTable">
				<tr>
					<td>이름 : </td>
					<td>
						<input type="text" class="form-control" id="userName">
					</td>
				</tr>
				<tr>
					<td>이메일 : </td>
					<td>
						<input type="email" class="form-control" id="useremail">
					</td>
				</tr>
			</table>
		</div>
		
		<br>
		
		<div class="d-grid" id="btnarea">
			<button type="button" onclick="findId();" class="btn btn-primary rounded-pill btn-lg" id="submitbtn">
	            	아이디 찾기
	        </button>
        </div>
        
        <div id="resultarea">
        
        </div>
        
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
function findId() {
	
	$.ajax({
		url: "findId.me",
		data: {
			userName: $("#userName").val(),
			email: $("#useremail").val()
		},
		success: function(result) {
			
			if (result != "") {
				$("#resultarea").text("아이디는 " + result + "입니다.");
			} else {
				$("#resultarea").text("존재하지 않거나 탈퇴한 회원입니다.");
			}
		},
		error: function() {
			console.log("아이디 찾기 실패");
		}
	});
}
</script>

</body>
</html>