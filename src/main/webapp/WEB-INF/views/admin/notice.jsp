<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<title>공지사항</title>
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

#align-center {
	text-align: center;
}

.align-left {
	text-align: left;
}
.modifyBtn{
	padding: 8px 30px;
}
.btn-primary{
--bs-btn-bg:#eee;
--bs-btn-border-color:#eee;
color:#555;
}
.btn:hover{
background-color:#4eac27;
border-color:#4eac27;
}
.active>.page-link, .page-link.active{
background-color:#4eac27;
border-color:#4eac27;

}

.btn-check:checked+.btn, .btn.active, .btn.show, .btn:first-child:active, :not(.btn-check)+.btn:active{
background-color:#4eac27;
border-color:#4eac27
}

</style>
</head>
<body>
	<my:adminHeader></my:adminHeader>
	<div id="align-center" class="container">
			<div id="align-center" class="container">
		<div style="text-align: center; margin-top: 30px;" class="mb-5">
			<h1 style="font-size: 34px">관리자 공지사항</h1>
		</div>
	
	
	<table class="table table-hover" style="margin-top: 50px; line-height: 50px;">
			<thead style="border-top: solid 1px;">
				<tr>
					<th>NO</th>
					<th>공지사항</th>
					<th>날짜</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeList }" var="notice">
					<tr>
						<th>${notice.n_id }</th>
						<td class="align-left">
							<div class="noticeTitle">${notice.n_title }</div>
						</td>
						<td>${notice.n_date }</td>
						<td><c:url value="/admin/modify" var="modifyLink">
							<c:param name="n_id" value="${notice.n_id }"></c:param>
							</c:url>
						<a class="btn btn-primary modifyBtn" href="${modifyLink }">공지수정</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
		
	<div id="align-center" class="container">
		<div class="row">
			<div class="col">
				<nav class="mt-3" aria-label="Page navigation example">
					<ul class="pagination justify-content-center">

					<%-- 맨앞 버튼은 1페이지가 아니면 존재함 --%>
				  	<c:if test="${pageInfo.currentPageNumber ne 1 }">
				  		
				  		<c:url value="/admin/notice" var="listLink">
				  			<c:param name="page" value="1" />
				  		</c:url>

						<li class="page-item">
							<a class="page-link" href="${listLink }">
								<i class="fa-solid fa-angles-left"></i>
							</a>
						</li>
				  	</c:if>
				  	
				  	<c:if test="${pageInfo.hasPrevButton }">
				  		<c:url value="/admin/notice" var="listLink">
				  			<c:param name="page" value="${pageInfo.jumpPrevPageNumber }"/>
				  		</c:url>
				  		<li class="page-item">
				  			<a href="${listLink }" class="page-link">
				  				<i class="fa-solid fa-angle-left"></i>
				  			</a>
				  		</li>
				  	</c:if>
				  
				  	<c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="pageNumber">
				  		<c:url value="/admin/notice" var="listLink">
				  			<c:param name="page" value="${pageNumber }" />
				  		</c:url>
					    <li class="page-item
					    
					    	<%-- 현재페이지에 active 클래스 추가 --%>
					    	${pageInfo.currentPageNumber eq pageNumber ? 'active' : '' }
					    
					    "><a class="page-link" href="${listLink }">${pageNumber }</a></li>
				  	</c:forEach>
				  	
				  	<c:if test="${pageInfo.hasNextButton }">
				  		<c:url value="/admin/notice" var="listLink">
				  			<c:param name="page" value="${pageInfo.jumpNextPageNumber }"></c:param>
				  		</c:url>
				  		<li class="page-item">
				  			<a href="${listLink }" class="page-link">
				  				<i class="fa-solid fa-angle-right"></i>
				  			</a>
				  		</li>
				  	</c:if>
				  	
				  	
				  	<c:if test="${pageInfo.currentPageNumber ne pageInfo.lastPageNumber }">
				  		<c:url value="/admin/notice" var="listLink">
				  			<c:param value="${pageInfo.lastPageNumber }" name="page" />
				  		</c:url>
				  		<!-- li.page-item>a.page-link{맨뒤버튼} -->
				  		<li class="page-item">
				  			<a href="${listLink }" class="page-link">
				  				<i class="fa-solid fa-angles-right"></i>
				  			</a>
				  		</li>
				  	</c:if>
					</ul>		
				</nav>
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