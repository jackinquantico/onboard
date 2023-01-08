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
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

</head>
<body id="page-top">

	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm" id="mainNav">
	    <div class="container px-5">
	        <a class="navbar-brand fw-bold" href="/onboard">Welcome OnBoard</a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	            Menu
	            <i class="bi-list"></i>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarResponsive">
	            <ul class="navbar-nav ms-auto me-4 my-3 my-lg-0">
	                <li class="nav-item"><a class="nav-link me-lg-3" href="list.no">공지사항</a></li>
	                <li class="nav-item"><a class="nav-link me-lg-3" href="#">일반게시판</a></li>
	            </ul>
	            
	            <c:choose>
	            	<c:when test="${ empty loginUser }">
			            <!-- 로그인 모달창 뜨도록 -->
			            <button class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0" data-bs-toggle="modal" data-bs-target="#loginModal">
			                <span class="d-flex align-items-center">
			                    <i class="bi-chat-text-fill me-2"></i>
			                    <span class="small">Login</span>
			                </span>
			            </button>
			            
			            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			            
			            <!-- 회원 가입 페이지로 이동하게 -->
			            <button class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0" onclick="location.href='enrollForm.me'">
			                <span class="d-flex align-items-center">
			                    <i class="bi-chat-text-fill me-2"></i>
			                    <span class="small">Sign up</span>
			                </span>
			            </button>
		            </c:when>
		            <c:otherwise>
		            	<!-- 회원 마이페이지로 이동 -->
			            <button class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0">
			                <span class="d-flex align-items-center">
			                    <i class="bi-chat-text-fill me-2"></i>
			                    <span class="small">MyPage</span>
			                </span>
			            </button>
			            
			            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			            
			            <!-- 로그아웃 -->
			            <button class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0" onclick="location.href='logout.me'">
			                <span class="d-flex align-items-center">
			                    <i class="bi-chat-text-fill me-2"></i>
			                    <span class="small">Logout</span>
			                </span>
			            </button>
		            </c:otherwise>
	            </c:choose>
	        </div>
	    </div>
	</nav>
	
	<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="feedbackModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header p-4">
                    <h5 class="modal-title font-alt" id="feedbackModalLabel">OnBoard Login</h5>
                    <button class="btn-close btn-close-white" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body border-0 p-4">
                    <form action="login.me" method="post" id="contactForm">
                        <!-- Name input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="name" name="userId" type="text" required />
                            <label for="name">ID</label>
                            <!-- 
                            ajax, js 로 유효성 검사
                            <div class="invalid-feedback">ID is required.</div>
                             -->
                        </div>
                        <!-- Email address input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="email" name="userPwd" type="password" required />
                            <label for="email">Password</label>
                            <!-- 
                            ajax, js 로 유효성 검사
                            <div class="invalid-feedback">An email is required.</div>
                            <div class="invalid-feedback">Email is not valid.</div>
                            -->
                        </div>
                        
                        <!-- Submit Button-->
                        <div class="d-grid"><button class="btn btn-primary rounded-pill btn-lg" id="submitButton" type="submit">Login</button></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	
	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>


</body>
</html>