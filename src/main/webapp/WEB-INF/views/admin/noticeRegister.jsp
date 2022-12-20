<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<h1 style="font-size: 34px; margin-bottom: 20px;">공지사항 작성</h1>

		<hr class="line" style="border: solid 1px #000;">

		<%-- ${pageContext.request.contextPath }/customer/notice --%>
		<form action="" method="post">
			<div class="mb-4 row mt-5">
				<label class="col-sm-1 col-form-label">공지제목</label>
				<div class="col-sm-10">
					<input type="text" name="n_title" class="form-control">
				</div>
			</div>
			<div class="mb-5 row">
				<label class="col-sm-1 col-form-label">공지본문</label>
				<div class="col-sm-10">
					<textarea name="n_content" class="form-control" rows="3"
						style="padding-bottom: 200px;"></textarea>
				</div>
			</div>
			<hr>
			<c:if test="${u_id != admin}">  
			<input type="hidden" name="u_id" value="<%=(String)session.getAttribute("id")%>"> 
			</c:if>
			<input type="submit" class="btn btn-primary regist-btn" value="등록">
		</form>

	</div>
	
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
	
<script>
</body>
</html>