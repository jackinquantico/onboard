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
#pageTitle {
	margin-left: 150px;
}

#enrollForm, #enrollTable {
	width: 100%;
	margin: auto;
}

#enrollTable {
	margin-left: 150px;
}

#btnarea {
	width: 80%;
	margin-left: 125px;
}
</style>
</head>
<body id="page-top">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="masthead">

	<div class="container">
		
		<div class="d-grid" id="pageTitle">
			<h4>회원가입</h4>
		</div>
		<br>
		
		<div class="d-grid">
			<form action="" method="post" id="enrollForm">
			<table id="enrollTable">
				<tr>
					<td width="15%">아이디</td>
					<td width="50%">
						<input type="text" name="userId" required class="form-control">
					</td>
					<td width="35%">
						<button class="btn btn-primary">중복체크</button>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="userPwd" required class="form-control">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td>
						<input type="password" required class="form-control">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="userName" required class="form-control">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="email" name="email" required class="form-control">
					</td>
					<td>
						<button class="btn btn-primary">이메일 인증</button>
					</td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td>
						<input type="phone" name="phone" required class="form-control">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="date" name="birth" class="form-control">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" class="form-control">
					</td>
					<td>
						<button class="btn btn-primary">도로명 주소 찾기</button>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="text" name="address" class="form-control">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>프로필 사진</td>
					<td>
						<input type="file" name="profile" class="form-control">
					</td>
					<td></td>
				</tr>
			</table>
			</form>
		</div>
		
		<br>
		
		<div class="d-grid" id="btnarea">
			<button type="submit" class="btn btn-primary rounded-pill btn-lg" id="submitbtn">
	            Sign up
	        </button>
        </div>
		
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>