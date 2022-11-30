<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>1:1문의</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet" />
<style>
* {
	font-family: "Noto Sans KR", sans-serif;
	margin: 0;
	padding: 0;
}

ul {
	padding: 0;
}

li {
	list-style: none;
	text-align: center;
}

a {
	color: #333;
	text-decoration: none;
}

span {
	font-size: 12px;
	margin-left: 100px;
}

.btn-bd-primary { -
	-bs-btn-font-weight: 300;
}

.btn-edit {
	font-size: 18px;
	padding: 10px 40px;
}

.container-sm {
	max-width: 1000px;
}

.content-size {
	width: 800px;
	margin-bottom: 30px;
}
</style>
</head>

<body>
	<div class="container-md">
		<div class="row">
			<form id="editForm" action="" method="post">
			<div class="col mt-5">
				<div style="text-align: left" class="mb-4">
					<h1 style="font-size: 24px">회원정보 수정</h1>
				</div>

				<hr class="line" style="border: solid 1px #000" />
					<div class="container-sm content-size">
						<div class="input-group mb-3">
							<label for="inputID" class="col-2 col-form-label">ID</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" value="${user.id }"
									readonly />
							</div>
						</div>

						<p>
							<button class="btn btn-secondary" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseExample"
								aria-expanded="false" aria-controls="collapseExample">
								비밀번호 변경</button>
						</p>
						<div class="collapse" id="collapseExample">
							<div class="card card-body">
								<div class="input-group mb-3">
									<label for="inputPassword" class="col-2 col-form-label">새
										비밀번호</label> <input type="text" class="form-control"
										placeholder="새 비밀번호를 입력하세요." aria-label="Recipient's username"
										aria-describedby="button-addon2" name="pw">
								</div>
								<div class="input-group mb-3">
									<label for="inputPassword" class="col-2 col-form-label">새
										비밀번호 확인</label> <input type="text" class="form-control"
										placeholder="비밀번호를 확인하세요." aria-label="Recipient's username"
										aria-describedby="button-addon2">
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr />
				<div class="container-sm content-size">
					<div class="mb-2 row mt-2">
						<label for="inputName" class="col-2 col-form-label">이름</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" value="${user.name }"
								readonly />
						</div>
					</div>
					<div class="mb-2 row mt-2">
						<label for="inputEmail" class="col-2 col-form-label">E-MAIL</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" value="${user.email }"
								name="email" />
						</div>
					</div>
					<div class="mb-2 row mt-2">
						<label for="inputPhone" class="col-2 col-form-label">전화번호</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" value="${user.phone }"
								name="phone" />
						</div>
					</div>
					<div class="mb-2 row mt-2">
						<label for="inputAddress" class="col-2 col-form-label">주소</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" value="${user.address }"
								name="address" />
						</div>
					</div>
				</div>
			<hr />
			<div style="text-align: center; margin-top: 10px">
				<button type="button" id="editConfirmButton" class="btn btn-secondary btn-edit" 
					style="margin-right: 6px">수정</button>
				<button type="button" class="btn btn-secondary btn-edit">
					취소</button>
			</div>
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
		
	<script>
		document.querySelector("#editConfirmButton").addEventListener("click", function(){
			document.querySelector("#editForm").submit();
		})
	</script>	
</body>
</html>
