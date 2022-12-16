<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">
<title>1:1문의</title>
<style>
<%@ include file="/WEB-INF/views/css/question.css"%>
</style>
</head>
<body>
	<my:headerBar></my:headerBar>
	<my:subMenu active="question"></my:subMenu>

	<div class="container-md">
		<div class="row">
			<div class="col mt-5">

				<div style="text-align: center;" class="mb-5">
					<h1 style="font-size: 34px;">문의를 작성해주세요.</h1>
				</div>

				<hr class="line" style="border: solid 1px #000;">

				<!-- selected -->
				<div class="container-sm">
					<form id="registerForm1" action="" method="post" enctype="multipart/form-data">
						<div class="mb-4 row mt-5">

							<select id="selectBox" name="q_option" class=" form-select" aria-label="Default select example">
								<option value="1:1문의">1:1 문의하기</option>
								<option value="배송문의">배송 문의하기</option>
								<option value="교환문의">교환 문의하기</option>
								<option value="반품문의">반품 문의하기</option>
							</select>
						</div>
						<!-- selector-end -->
	
						<div class="mb-4 row mt-5">
							<label class="col-sm-1 col-form-label">문의제목</label>
							<div class="col-sm-10">
								<input type="text" name="q_title" class="form-control">
							</div>
						</div>
						
						<div class="mb-5 row">
							<label class="col-sm-1 col-form-label">문의내용</label>
							<div class="col-sm-10">
								<textarea name="q_content" class="form-control" rows="3"
									style="padding-bottom: 200px;"></textarea>
							</div>
						</div>
						
						<div class="mb-3 row">
							<label for="inputPassword" class="col-sm-1 col-form-label">첨부파일</label>
							<div class="col-sm-4">
								<input multiple name="files" accept="image/*" type="file" class="form-control">
							</div>
							<span class="guide-top">첨부가능 용량은 파일당 6MB 미만이며, 최대 6개까지 가능합니다.</span> 
							<span class="guide-bottom">첨부가능 파일 확장자: JPG,PNG,GIF</span>
						</div>
						
						<!-- 유저아이디 넘겨줌 -->						
						<input type="hidden" id="getUserId" name="u_id" value="<%=(String)session.getAttribute("id")%>">
						

						<hr>
						<div style="text-align: center; margin-top: 30px;">
							<!-- 문의 등록 버튼 -->
								<a type="button" id="submitButton1" class="btn btn-secondary btn-qusetion">문의 등록</a>

							<!-- 내 문의보기 버튼 -->
								<button id="submitButton2" class="btn btn-secondary btn-qusetion">
								내 문의 보기</button>
						</div>
					</form>
				</div>
					
			<%-- 메시지 토스트 --%>
			<div id="MessageToast" class="toast align-items-center top-0 start-50 translate-middle-x position-fixed" role="alert" aria-live="assertive" aria-atomic="true">
			  <div class="d-flex">
			    <div id="questionMessage" class="toast-body">
			    게시물이 등록되었습니다.
			    </div>
			    <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
			  </div>
			</div>
	

			</div>
		</div>
	</div>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous">
</script>


<script>
const UserId = document.querySelector("#getUserId").value;




	/* 빈값일 때 alert창 띄우기, submit  */
	document.querySelector("#submitButton1").addEventListener("click", function(e) {
		debugger;
		console.log(UserId);
		if(UserId != 'null'){
			// submit 진행 중지
			console.log(UserId);
			e.preventDefault();
			
			// 제목input 입력한 값 가져와서
			// 빈칸만 있는지 확인?
			let titleValue = document.querySelector(`#registerForm1 input[name="q_title"]`).value
			// 본문 textarea 입력한 값 가져와서
			// 빈칸만 있는지 확인?
			let contentValue = document.querySelector(`#registerForm1 textarea[name="q_content"]`).value		
		
			// 위 테스트 다 통과하면 submit
			if (titleValue.trim() != "" 
					&& contentValue.trim() != "" ) {
				
				document.querySelector("#registerForm1").submit();


			} else {
				alert("문의를 작성해주세요.");
		
			}	
			
		} else if(UserId == 'null'){
				
					console.log(UserId);
					location.assign('/user/login.do');
			};
	});

	/* 등록 토스트 */
	const toast = new bootstrap.Toast(document.querySelector("#MessageToast"));
	
	toast.show();


</script>
</body>
</html>