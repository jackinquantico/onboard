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

#enrollTable tr {
	height: 50px;
}

#btnarea {
	width: 80%;
	margin-left: 125px;
}

#btnarea button {
	width: 45%;
	display: inline-block;
	margin: 0 15px;
	float: left;
}
</style>
<!-- 우편번호 검색을 위한 API-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body id="page-top">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="masthead">

	<div class="container">
	<form action="" method="post" id="enrollForm" enctype="multipart/form-data">
		
		<div class="d-grid" id="pageTitle">
			<h4>마이페이지</h4>
		</div>
		<br>
		
		<div class="d-grid">
			<table id="enrollTable">
				<tr>
					<td width="15%">아이디</td>
					<td width="50%">
						<input type="hidden" name="userNo" value="${ loginUser.userNo }">
						<input type="hidden" name="userId" value="${ loginUser.userId }">
						<input type="text" name="userId" value="${ loginUser.userId }" class="form-control" disabled>
					</td>
					<td width="35%"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<button type="button" class="btn btn-primary" onclick="location.href='initPwd.me'">비밀번호 변경하기</button>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="userName" id="userName" value="${ loginUser.userName }" class="form-control" maxlength="30" disabled>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="email" name="email" id="email" value="${ loginUser.email }" class="form-control" maxlength="50" disabled>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td>
						<input type="text" name="phone" id="phone" value="${ loginUser.phone }" class="form-control" placeholder="- 포함" oninput="autoHyphen(this)" disabled>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="date" name="birth" class="form-control" value="${ loginUser.birth }">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" class="form-control" id="sample6_postcode">
					</td>
					<td>
						<input type="button" name="address_search" class="btn btn-primary" style="display:inline-block;  vertical-align: top;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="text" name="address" class="form-control" id="sample6_address" maxlength="66" value="${ loginUser.address }">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>프로필 사진</td>
					<td>
						<img src="resources/images/${ loginUser.profile }" id="profile" height="300px" />
						<input type="hidden" name="originFile" class="form-control" value="${ loginUser.profile }">
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="file" id="changeFile" name="changeFile" class="form-control" onchange="addImg(this, '#profile');">
					</td>
					<td></td>					
				</tr>
			</table>
		</div>
		
		<br>
		
		<div id="btnarea">
	        <button type="button" onclick="return updateMember(1);" class="btn btn-outline-primary rounded-pill btn-lg" id="submitbtn">
	            탈퇴하기
	        </button>
			<button type="button" onclick="updateMember(2);" class="btn btn-primary rounded-pill btn-lg" id="submitbtn">
	            변경하기
	        </button>
        </div>
        <br>
		
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
	}
}

function updateMember(num) {
	
	if (num == 1) {
		
		if (confirm("OnBoard 에서 탈퇴하시겠습니까?")) {
			
			$("#enrollForm").attr("action", "delete.me");
			$("#enrollForm").submit();
		} else {
			return false;
		}
	} else {
		$("#enrollForm").attr("action", "update.me");
		$("#enrollForm").submit();
	}
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                var extraAddress = extraAddr;
            
            } else {
            	var extraAddress = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr + "," + extraAddress;
        }
    }).open();
}	

</script>


</body>
</html>