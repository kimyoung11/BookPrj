<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
	integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	$(document).ready(function() {
		$("#btnLogin").click(function() {
			// 태크.val() : 태그에 입력된 값
			// 태크.val("값") : 태그의 값을 변경 
			var u_id = $("#u_id").val();
			var u_pw = $("#u_pw").val();

			if (u_id == "" && u_pw == "") {
				alert("아이디와 비밀번호를 입력해주세요.");
				$("#u_id").focus(); // 입력포커스 이동
				return; // 함수 종료
			}
			if (u_id == "") {
				alert("아이디를 입력해주세요.");
				$("#u_id").focus(); // 입력포커스 이동
				return; // 함수 종료
			}
			if (u_pw == "") {
				alert("비밀번호를 입력해주세요.");
				$("#u_pw").focus();
				return;
			}
			// 폼 내부의 데이터를 전송할 주소
			//document.form1.action="${path}/user/loginCheck.do"
			// 제출
			document.form1.submit();
		});
	});
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 0;
}

ul {
	padding: 0;
}

li {
	list-style: none;
}

a {
	color: #333;
	text-decoration: none;
}

li {
	display: inline;
}

.clearfix::before, .clearfix::after {
	content: '';
	display: block;
	clear: both;
}

#form {
	margin-top: 200px;
}

.logo {
	text-align: center;
	margin-bottom: 30px;
}

#login_button {
	margin-top: 20;
}

.link {
	text-align: center;
}

#test li:nth-child(n+2) {
	position: relative;
	margin-left: 5px;
	padding-left: 10px;
}

#test li:nth-child(n+2)::after {
	position: absolute;
	left: 0;
	top: 3px;
	content: "";
	width: 1px;
	height: 15px;
	background-color: black;
}

#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	z-index: 1000;
}

#modal .modal-window {
	background-color: #f5faf3; /* rgba(69, 139, 197, 0.70); */
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 150px;
	position: relative;
	top: -100px;
	padding: 10px;
}

#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: #4eac27;
}
</style>
</head>
<body>


	<c:if test="${u_id == null}">

		<c:if test="${param.check == 1}">
			<div id="modal" class="modal-overlay">
				<div class="modal-window">
					<div class="title">
						
					</div>
					<div class="close-area">×</div>
					<div class="content word">
						<h2>로그인에 실패했습니다.</h2>
					</div>
				</div>
			</div>
		</c:if>

		<div class="container-md">
			<div class="box justify-content-center">
				<div id="form" class="row justify-content-center">
					<div class="col-12 col-md-5">
						<div class="logo">
							<img src="${pageContext.request.contextPath}/content/logo.png"
								alt="로고사진" />
						</div>

						<form action="loginCheck.do" name="form1" method="post">


							<label for="inputPassword5" class="form-label">ID 로그인</label><br>
							
							<div class="input-group flex-nowrap ">
								<span class="input-group-text" id="addon-wrapping"><i
									class="fa-solid fa-user"></i></span> <input type="text"
									  placeholder="아이디" name="u_id" class="form-control pt-3 pb-3"
									id="u_id" aria-label="Username">
							</div>
							<div class="input-group flex-nowrap">
								<span class="input-group-text">
									<i class="fa-solid fa-lock"></i>
								</span> <input type="password" class="form-control pt-3 pb-3"
									placeholder="비밀번호" name="u_pw" id="u_pw" aria-label="Username">
							</div>




							<div id="login_button " class="d-grid gap-2 mt-5 mb-2">
								<button class="btn pt-3 pb-3" type="button"
									class="btnLogin" id="btnLogin" style="background-Color:#4eac27; color: white; font-weight: 500">로그인</button>
								<div class="link mt-2">
									<ul id="test">
										<li><a
											href="${pageContext.request.contextPath}/user/findPassword">비밀번호
												찾기</a></li>
										<li><a
											href="${pageContext.request.contextPath}/user/findID">아이디
												찾기</a></li>
										<li><a
											href="${pageContext.request.contextPath}/user/signup">회원가입</a></li>
									</ul>
								</div>




							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
	</c:if>
	<c:if test="${u_id != null}">
		<h1>이미 로그인 되었습니다</h1>
	</c:if>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">
		
	</script>
	<script>
	// 엔터키로 로그인
		$(document).ready(function() {
			$("#u_id").keyup(function(event) {
				if (event.which === 13) {
					$("#btnLogin").click();
				}
			});
		});
		$(document).ready(function() {
			$("#u_pw").keyup(function(event) {
				if (event.which === 13) {
					$("#btnLogin").click();
				}
			});
		});
		
	// 로그인 실패시 메세지
		const closeBtn = modal.querySelector(".close-area")
		closeBtn.addEventListener("click", e => {
		    modal.style.display = "none"
		})
		
		modal.addEventListener("click", e => {
   		const evTarget = e.target
    	if(evTarget.classList.contains("modal-overlay")) {
        	modal.style.display = "none"
   		}
})
	</script>
</body>
</html>