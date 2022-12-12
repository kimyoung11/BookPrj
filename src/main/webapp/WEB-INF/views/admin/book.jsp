<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
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
<title>Insert title here</title>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

a {
	color: #333;
	text-decoration: none;
}

#align-center {
	text-align: center;
}

.align-left {
	text-align: left;
}
.regist-btn{
	font-size: 18px;
	padding: 5px 50px;
}
</style>
</head>
<body>

	<my:adminHeader></my:adminHeader>
	
	<div id="align-center" class="container">
		<h1 style="font-size: 34px; margin-bottom: 20px;">책 등록</h1>

		<hr class="line" style="border: solid 1px #000;">

		<%-- ${pageContext.request.contextPath }/customer/notice --%>
		<form action="" method="post">
			<div class="mb-1 row mt-2">
				<label class="col-sm-1 col-form-label">책제목</label>
				<div class="col-sm-10">
					<input type="text" name="b_title" class="form-control">
				</div>
			</div>
			<div class="mb-1 row mt-2">
				<label class="col-sm-1 col-form-label">책 저자</label>
				<div class="col-sm-10">
					<input type="text" name="b_writer" class="form-control">
				</div>
			</div>
			<div class="mb-1 row mt-2">
				<label class="col-sm-1 col-form-label">책 출판일</label>
				<div class="col-sm-10">
					<input type="text" name="b_pubDate" class="form-control">
				</div>
			</div>
			<div class="mb-1 row mt-2">
				<label class="col-sm-1 col-form-label">책 가격</label>
				<div class="col-sm-10">
					<input type="number" name="b_price" class="form-control">
				</div>
			</div>
			<div class="mb-1 row mt-2">
				<label class="col-sm-1 col-form-label">책 장르</label>
				<div class="col-sm-10">
					<input type="text" name="b_genre" class="form-control">
				</div>
			</div>
			<div class="mb-1 row mt-2">
				<label class="col-sm-1 col-form-label">책 이미지</label>
				<div class="col-sm-10">
					<input type="file" name="b_img" class="form-control" accept="image/png, image/jpg">
				</div>
			</div>
			<hr>
			<input type="submit" class="btn btn-primary regist-btn" value="등록">
		</form>
	</div>

</body>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</html>