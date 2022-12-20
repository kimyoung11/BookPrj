<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>답변보기</title>
</head>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

a {
	color: #333;
	text-decoration: none;
}

.btnStyle {
	margin:10px;
}
</style>
<body>
	<div class="container">
		<div style="text-align: center; margin-top: 30px;" class="mb-5">
			<h1 style="font-size: 34px">1:1문의 답변</h1>
		</div>

		<hr style="border: 1px solid #000;">

		<div class="row justify-content-between">
			<div class="col-4">
				<p>제목: ${questContent.q_title }</p>
			</div>
			<div class="col-4">
				<span>작성일: ${questContent.q_date }</span>
			</div>
		</div>
		<hr>
		<div class="view_body">
			<p>본문: ${questContent.q_content }</p>
		</div>

		<hr>
		
		<%-- 이미지 출력 --%>
				<div>
					<c:forEach items="${questContent.fileName }" var="name">
						<div>
							<img class="img-fluid img-thumbnail" style="width:350px; height:300px;" src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/question/${questContent.q_number }/${name}" alt="">
						</div>
					</c:forEach>		
				</div>
		<hr>
				<!-- 1:1 문의 답변보기 -->
		<div class="row">
	  		<div class="col form-floating mb-3 mt-3">
				<div id="answerList">
					<label for="floatingPlaintextInput">관리자<i class="fa-solid fa-comment"></i></label>
						<p>${questContent.a_content}</p>
				</div>
			</div>
		</div>
	</div>
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
crossorigin="anonymous"></script>	
</body>
</html>