<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

ul {
	padding: 0;
}

a {
	color: #333;
	text-decoration: none;
}

h2 {
	font-size: 22px;
}

.product_img {
	width: 100px;
}

#address_button {
	background-color: white;
	color: black;
	border-color: grey;
}

#hr_line {
	opacity: 1;
	margin: 0;
}

thead {
	line-height: 50px;
}

.form-control {
	width: 300px;
	display: inline;
}

.input-group {
	width: 500px;
}

.adress-input {
	margin: 10px 187px;
}

.order-btn {
	padding: 6px 36px;
	font-size: 18px;
	margin-bottom: 40px;
	margin-top: 20px;
}

.content {
	width: 1100px;
	margin: 0 auto;
	margin-top: 30px;
}
</style>
</head>
<body>
	<div class="container-md">
		<h2>주문 / 결제</h2>
		<hr id="hr_line">
		<table class="table" style="text-align: center;">
			<thead>
				<tr>
					<th>상품이미지</th>
					<th>상품정보</th>
					<th>수량</th>
					<th>할인금액</th>
					<th>최종결제금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a href=""><img class="product_img" src="img/01.png"
							alt="제품 상세 페이지"></a></td>
					<td class="align-middle">Spanish Painting2</td>
					<td class="align-middle">1개</td>
					<td class="align-middle">5000원</td>
					<td class="align-middle">5000원</td>
				</tr>
			</tbody>
		</table>


		<!-- 배송지정보 -->

		<h2 style="margin-top: 80px;">배송지 정보</h2>
		<hr id="hr_line">
		<form action="/main/orderend">
			<div class="content">
				<div class="mb-3 row">
					<label for="staticEmail" class="col-sm-2 col-form-label">배송지</label>

					<div class="col-sm-3 input-group">
						<input type="text" class="form-control"
							aria-label="readonly input example" readonly
							data-bs-toggle="modal" data-bs-target="#addressInputModal">
						<button id="addressSearchBtn" class="btn btn-outline-secondary"
							type="button" data-bs-toggle="modal"
							data-bs-target="#addressInputModal">주소검색</button>
					</div>
					<div class="row adress-input">
						<input id="mainAddress" class="form-control" type="text"
							placeholder="주소" aria-label="readonly input example" readonly
							style="margin-right: 10px;"> <input id="detailAddress"
							class="form-control" type="text" placeholder="상세주소">

					</div>
				</div>



				<div class="mb-3 row">
					<label for="inputPassword" class="col-sm-2 col-form-label">수령인</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword">
					</div>
				</div>
				<div class="mb-3 row">
					<label for="inputPassword" class="col-sm-2 col-form-label">연락처</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword">
					</div>
				</div>
				<div class="mb-3 row">
					<label for="inputPassword" class="col-sm-2 col-form-label">배송요청사항</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword">
					</div>
				</div>
				<div style="text-align: center;">
					<input class="btn btn-primary order-btn" type="submit" value="결제하기" />
				</div>
		</form>

		</tbody>
		</table>
	</div>
	</div>
	</div>

	<%-- 주소 입력 모달 --%>
	<div class="modal" id="addressInputModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">주소를 입력해주세요</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<input type="text" class="form-control" id="addressInput" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button id="addressSubmitBtn" type="button" class="btn btn-primary"
						data-bs-dismiss="modal">입력</button>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
		const ctx = "${pageContext.request.contextPath}";
		document.querySelector("#addressSubmitBtn").addEventListener("click",
				function() {
					let address = document.querySelector("#addressInput").value
					document.querySelector("#mainAddress").value = address;
				});
	</script>
</body>
</html>