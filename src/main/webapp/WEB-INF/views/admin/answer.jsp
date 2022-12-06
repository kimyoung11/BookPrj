<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>답변하기</title>
</head>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

a {
	color: #333;
	text-decoration: none;
}
</style>
<body>
	<div class="container">
		<div style="text-align: center; margin-top: 30px;" class="mb-5">
			<h1 style="font-size: 34px">1:1문의답변</h1>
		</div>

		<hr style="border: 1px solid #000;">

		<div class="row justify-content-between">
			<div class="col-4">
				<p>${questContent.q_title }</p>
			</div>
			<div class="col-4">
				<span>${questContent.q_date }</span>
			</div>
			<div class="col-4">
				<span>유저아이디 : ${questContent.u_id }</span>
			</div>
		</div>
		<hr>
		<div class="view_body">
			<p>${questContent.q_content }</p>
		</div>

		<hr>
		</div>
</body>
</html>