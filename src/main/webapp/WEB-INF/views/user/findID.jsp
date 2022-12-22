<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FindID</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
	integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
	font-size: 30px;
	margin: 0;
	justify-content: center;
	margin: 50px 0px;
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

.form-collection {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.join-btn {
	padding: 10px 40px;
	font-size: 18px;
	text-align: center;
	margin-bottom: 50px;
	justify-content: center;
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
<head>
</head>
<body>





	<form method="post" action="findID" name="findID">
	
		<div class="container-md">
		<div class="row logo">아이디 찾기</div>
			
			
			<div class="box justify-content-center">
				<div id="form" class="row justify-content-center">
					<div class="col-12 col-md-5">

						<div>
							<label for="u_name" class="form-label">이름</label> <br>
							<div class="input-group flex-nowrap ">
								<input type="text" id="u_name" class="form-control pt-3 pb-3"
									name="u_name" />
							</div>
						</div>
						<br>

						<div class="form-label-group">
							<label for="u_phone" class="form-label">전화번호</label> <br>
							<div class="input-group flex-nowrap">
								<input type="text" id="u_phone" class="form-control pt-3 pb-3"
									name="u_phone" />
							</div>
						</div>
						<br>
						<div class="row justify-content-center">
							<div class="col-4">
								<input class="btn btn-primary pt-3 pb-3" type="submit"
									value="찾아보기" id="submitButton" disabled>
							</div>
						</div>
						<!-- 이름과 전화번호가 일치하지 않을 때-->
						<%-- <c:if test="${check == 1}">
							<script>
								opener.document.findform.name.value = "";
								opener.document.findform.phone.value = "";
							</script>
							<label>일치하는 정보가 존재하지 않습니다.</label>
						</c:if> --%>

						<!-- 이름과 비밀번호가 일치하지 않을 때 -->
						<%-- <c:if test="${check == 0}">
							<label>찾으시는 아이디는 &lt;${u_id}&gt; 입니다.</label>
							<div>
								<input type="button" value="OK" onclick="closethewindow()">
							</div>
						</c:if> --%>

						<c:if test="${check == 1}">
							<div id="modal" class="modal-overlay">
								<div class="modal-window">
									<div class="close-area">×</div>
									<div class="content word">
										<script>
								opener.document.findform.name.value = "";
								opener.document.findform.phone.value = "";
							</script>
										<h2>일치하는 정보가 존재하지 않습니다.</h2>
									</div>
								</div>
							</div>
						</c:if>

						<c:if test="${check == 0}">
							<div id="modal" class="modal-overlay">
								<div class="modal-window">
									<div class="close-area">×</div>
									<div class="content word">
										<label>찾으시는 아이디는 &lt;${u_id}&gt; 입니다.</label>
									</div>
								</div>
							</div>
						</c:if>

					</div>
				</div>
			</div>
		</div>
	</form>

	<script>
		function closethewindow() {
			self.close();
		}

		document
				.getElementById('u_name')
				.addEventListener(
						'input',
						function(event) {
							document.getElementById('submitButton').disabled = !this.value;
						}, false);

		document
				.getElementById('u_phone')
				.addEventListener(
						'input',
						function(event) {
							document.getElementById('submitButton').disabled = !this.value;
						}, false);
		// 모달
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