<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
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

<title>1:1문의</title>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
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



</style>
</head>
<body>
	<my:adminHeader></my:adminHeader>
	<div class="container">
		<div style="text-align: center; margin-top: 30px;" class="mb-5">
			<h1 style="font-size: 34px">1:1문의 관리자</h1>
		</div>

		<table class="table" style="margin-top: 50px; line-height: 50px;">
			<thead style="border-top: solid 1px;">
				<tr>
					<th>NO</th>
					<th>문의사항</th>
					<th>날짜</th>
					<th>유저아이디</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${questionList }" var="question">
					<tr>
						<th>${question.q_number }</th>
						<td class="align-left">
							${question.q_title }
						</td>
						<td>${question.q_date }</td>
						<td>${question.u_id }</td>
						<td>
						<c:url value="/admin/answer" var="answerLink">
							<c:param name="q_number" value="${question.q_number }"></c:param>
						</c:url>
						<a class="btn btn-primary" href="${answerLink }">답변하기</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>


<!-- pagination -->

 	<div class="row">
			<div class="col">
				<nav class="mt-3" aria-label="Page navigation example">
					<ul class="pagination justify-content-center">

					<!-- 맨앞 버튼은 1페이지가 아니면 존재함 -->
				  	<c:if test="${pageInfo.currentPageNumber ne 1 }">
				  		
				  		<c:url value="/admin/question" var="questionLink">
				  			<c:param name="page" value="1" />
				  		</c:url>

						<li class="page-item">
							<a class="page-link" href="${questionLink }">
								<i class="fa-solid fa-angles-left"></i>
							</a>
						</li>
				  	</c:if>
				  	
				  	<c:if test="${pageInfo.hasPrevButton }">
				  		<c:url value="/admin/question" var="questionLink">
				  			<c:param name="page" value="${pageInfo.jumpPrevPageNumber }"/>
				  		</c:url>
				  		<li class="page-item">
				  			<a href="${questionLink }" class="page-link">
				  				<i class="fa-solid fa-angle-left"></i>
				  			</a>
				  		</li>
				  	</c:if>
				  
				  	<c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="pageNumber">
				  		<c:url value="/admin/question" var="questionLink">
				  			<c:param name="page" value="${pageNumber }" />
				  		</c:url>
				  		
				  		<!-- 현재페이지에 active 클래스 추가 -->
					    <li class="page-item ${pageInfo.currentPageNumber eq pageNumber ? 'active' : '' }">
					    	<a class="page-link" href="${questionLink }">${pageNumber }</a>
					    </li>
				  	</c:forEach>
				  	
				  	<c:if test="${pageInfo.hasNextButton }">
				  		<c:url value="/admin/question" var="questionLink">
				  			<c:param name="page" value="${pageInfo.jumpNextPageNumber }"></c:param>
				  		</c:url>
				  		<li class="page-item">
				  			<a href="${questionLink }" class="page-link">
				  				<i class="fa-solid fa-angle-right"></i>
				  			</a>
				  		</li>
				  	</c:if>
				  	
				  	
				  	<c:if test="${pageInfo.currentPageNumber ne pageInfo.lastPageNumber }">
				  		<c:url value="/admin/question" var="questionLink">
				  			<c:param value="${pageInfo.lastPageNumber }" name="page" />
				  		</c:url>
				  		<!-- li.page-item>a.page-link{맨뒤버튼} -->
				  		<li class="page-item">
				  			<a href="${questionLink }" class="page-link">
				  				<i class="fa-solid fa-angles-right"></i>
				  			</a>
				  		</li>
				  	</c:if>
								
					</ul>
				</nav>
			</div>
		</div>

		<!-- pagination-end -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>

	</script>
</body>
</html>