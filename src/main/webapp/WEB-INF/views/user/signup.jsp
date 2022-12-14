<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<!-- 다음 우편번호찾기 API-->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="register.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<style>
.logo {
	font-size: 30px;
	margin: 0;
	justify-content: center;
	margin: 50px 0px;
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
</style>
</head>
<body>


	<!-- Header나 navBar를 통해 이 페이지로 올 수 있도록 경로 확보(taglib으로) -->
	<!-- <(태그 입력):navBar active="signup"></(태그 입력):navBar> -->




	<div class="container-md">
		<div class="row logo">회원가입</div>
		<div class="row">
			<div class="col form-collection">
				<form action="" method="post" class="w-50">

					<!-- ID -->
					<div class="mb-3">
						<label for="" class="form-label">아이디</label>
						<div class="input-group">
							<input type="text" class="form-control" id="userIdInput"
								name="u_id" />
							<button id="userIdExistButton" class="btn btn-outline-secondary"
								type=button>중복확인</button>
						</div>
						<div id="userIdText" class="form-text text-danger">아이디 중복
							확인을 해주세요</div>
					</div>



					<!-- 비밀번호 -->
					<div class="mb-3">
						<label for="" class="form-label">비밀번호</label> <input
							type="password" class="form-control" id="passwordInput1"
							name="u_pw" />

						<div id="confirmPassword" class="form-text text-danger">암호
							확인 결과...</div>
					</div>


					<!-- 비밀번호 재확인  -->
					<div class="mb-3">
						<label for="" class="form-label">비밀번호 재확인</label> <input
							type="password" class="form-control" id="passwordInput2" />
					</div>


					<!-- 이름 -->
					<div class="mb-3">
						<label for="" class="form-label">이름</label> <input type="text"
							class="form-control" name="u_name" />
					</div>


					<!-- 전화번호 -->
					<div class="mb-3">
						<label for="" class="form-label">전화번호("-" 제외)</label> 
						<div class="input-group">
							<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" id="userPhoneInput" name="u_phone" />
							<button id="userPhoneExistButton" class="btn btn-outline-secondary" type="button">중복확인</button>
						</div>	
						<div id="userPhoneText" class="form-text text-danger">전화번호 중복 확인을 해주세요</div>
					</div>		
					
				
					<!-- 이메일 -->
					<div class="mb-3">
						<label for="" class="form-label">이메일</label> 
						<div class="input-group">	
							<input type="email" class="form-control" id="userEmailInput" name="u_email" />
							<button id="userEmailExistButton" class="btn btn-outline-secondary" type="button">중복확인</button>
						</div>
						<div id="userEmailText" class="form-text text-danger">이메일 중복
							확인을 해주세요</div>
					</div>




					<!-- 자택주소 -->
					<div class="mb-3">
						<label for="" class="form-label">자택주소</label>

						<div class="input-group">
							<input type="text" class="form-control" placeholder="우편번호"
								id="postcode" aria-label="우편번호" aria-describedby="button-addon2"
								name="u_address" readonly />

							<button type="button" class="btn btn-secondary"
								onclick="execDaumPostcode()">우편번호 찾기</button>

						</div>


						<input type="text" class="form-control" id="roadAddress"
							placeholder="도로명주소" name="u_address" readonly /> <input
							type="text" class="form-control" id="exampleFormControlInput1"
							placeholder="상세주소" name="u_address" />
					</div>


					<div class="row justify-content-center">
						<div class="col-4">
							<input disabled class="btn btn-primary join-btn" type="submit"
								id="submitButton" value="가입하기" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		function execDaumPostcode() {
			const postcode = document.querySelector("#postcode");
			const roadAddress = document.querySelector("#roadAddress");
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
					console.log(postcode);
					console.log(roadAddress);
					console.log(data.zonecode); // 우편번호
					console.log(data.roadAddress); // 기본주소
					postcode.value = data.zonecode;
					roadAddress.value = data.roadAddress;
					// console.log(data.jibunAddress); // 도로명주소
					console.log(data);
				},
			}).open();
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
	</script>
	<script> 
	const ctx = "${pageContext.request.contextPath}";
	
	// 버튼 사용 가능
	
	// 아이디 사용 가능
	let availableId = false;
	// 패스워드 사용 가능
	let availablePassword = false;
	// 전화번호 사용 가능
	let availablePhone = false;
	// 이메일 사용 가능
	let availableEmail = false;
	
	
	function enableSubmitButton() {
		const button = document.querySelector("#submitButton");
		if (availableId && availablePassword && availableEmail && availablePhone) {
			button.removeAttribute("disabled")
		} else {
			button.setAttribute("disabled", "");
		}
	} 
	
	
	// ID input 변경시 submit 버튼 비활성화
	document.querySelector("#userIdInput").addEventListener("keyup", function() {
		availableId = false;
		enableSubmitButton();
	});

	// 전화번호 input 변경시 submit 버튼 비활성화
	document.querySelector("#userPhoneInput").addEventListener("keyup", function() {
		availablePhone = false;
		enableSubmitButton();
	});

	// 이메일 input 변경시 submit 버튼 비활성화
	document.querySelector("#userEmailInput").addEventListener("keyup", function() {
		availableEmail = false;
		enableSubmitButton();
	});
	
	
	
	// 아이디 중복 확인
	document.querySelector("#userIdExistButton").addEventListener("click", function() {
		// 입력된 userId
		const u_id = document .querySelector("#userIdInput").value;
		
		// fetch 요청 보내기
		fetch(ctx + "/user/existId/" + u_id)
			.then(res => res.json())
			.then(data => {
				// 응답 받아서 메세지 출력
				document.querySelector("#userIdText").innerText = data.message;
				if (data.status == "not exist") {
					availableId = true;
					enableSubmitButton();
				}
			}); 		
	});
	
	
	// 전화번호 중복 확인
	document.querySelector("#userPhoneExistButton").addEventListener("click", function() {
		availablePhone = false;
		// 입력된 userPhone
		const u_phone = document .querySelector("#userPhoneInput").value;
		
		// fetch 요청 보내기
		fetch(ctx + "/user/existPhone/" + u_phone)
			.then(res => res.json())
			.then(data => {
				// 응답 받아서 메세지 출력
				document.querySelector("#userPhoneText").innerText = data.message;
				
				if (data.status == "not exist") {
					availablePhone = true;
					enableSubmitButton();
				}
			}); 		
	});
	
	
	// 이메일 중복 확인
	document.querySelector("#userEmailExistButton").addEventListener("click", function() {
		// 입력된 userEmail
		const u_email = document .querySelector("#userEmailInput").value;
		
		// fetch 요청 보내기
		fetch(ctx + "/user/existEmail/" + u_email)
			.then(res => res.json())
			.then(data => {
				// 응답 받아서 메세지 출력
				document.querySelector("#userEmailText").innerText = data.message;
				if (data.status == "not exist") {
					availableEmail = true;
				}
			}); 		
	});
	
	
	// 패스워드 일치하는지 확인
	const passwordInput1 = document.querySelector("#passwordInput1");
	const passwordInput2 = document.querySelector("#passwordInput2");
	const confirmPassword = document.querySelector("#confirmPassword");
	
	function matchPassword() {
		availablePassword = false;
		
		const value1 = passwordInput1.value;
		const value2 = passwordInput2.value;
	
	if (value1 == value2) {
		confirmPassword.innerText = "비밀번호가 일치합니다.";
		availablePassword = true;
	} else {
		confirmPassword.innerText = "비밀번호가 일치하지 않습니다.";
		}
	
		enableSubmitButton();
		
	}
	
	
	
	passwordInput1.addEventListener("keyup", matchPassword);
	passwordInput2.addEventListener("keyup", matchPassword);
	// keyup: 키보드에서 손이 떨어 졌을 떄
	</script>
</body>
</html>













