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
		
		<!-- 1:1 문의 답변달기 -->
		<div class="col">
			<input type="hidden" id="adminId" name="ad_id" value="111">
			<input type="hidden" id="userId" name="u_id" value="aa">
			<input type="hidden" id="questionNum" value="${questContent.q_number }">	
			<input type="text" id="answerReply" >
			<button id="replyButton">답변달기</button>
		</div>
	</div>


	
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
crossorigin="anonymous"></script>
	
<script>


const ctx = "${pageContext.request.contextPath}";

document.querySelector("#replyButton").addEventListener("click",function(){
	const q_number = document.querySelector("#questionNum").value;
	const ad_id = document.querySelector("#adminId").value;
	const u_id = document.querySelector("#userId").value;
	const a_content = document.querySelector("#answerReply").value;
	
	const data = {q_number, ad_id, u_id, a_content };
	
	console.log(data)
	
	fetch( `\${ctx}/admin/add`,{
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
});





</script>
	
</body>
</html>