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


</style>
</head>
<body>
	<my:navBar></my:navBar>
	<my:subMenu active="notice"></my:subMenu>

	<div id="align-center" class="container">
		<div style="text-align: center; margin-top: 30px;" class="mb-5">
			<h1 style="font-size: 34px">공지사항</h1>
		</div>

		<table class="table" style="margin-top: 50px; line-height: 50px;">
			<thead style="border-top: solid 1px;">
				<tr>
					<th>NO</th>
					<th>공지사항</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeList }" var="notice">
					<tr>
						<th>${notice.n_id }</th>
						<td class="align-left">
							<div class="noticeTitle" data-value="${notice.n_id }" onclick="clickNotice(this)">${notice.n_title }</div>
						</td>
						<td>${notice.n_date }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- pagination -->
		<div class="row">
			<div class="col">
				<nav class="mt-3" aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						
						<!-- 1페이지가 아니면 맨 앞 버튼 -->
						<c:if test="${pageInfo.currentPageNumber ne 1 }">
					  		<li class="page-item"><a class="page-link" href="#"><i
									class="fa-solid fa-angles-left"></i></a></li>
					    </c:if>

						
								
						<c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="pageNum">
							<c:url value="/customer/notice" var="pageLink">
								<c:param name="page" value="${pageNum }"></c:param>
							</c:url>
							<li class="page-item ${pageInfo.currentPageNumber eq pageNumber ? 'active' : ''}">
								<a class="page-link" href="pageLink">${pageNum }</a></li>
						</c:forEach>
						
						<li class="page-item">
						<a class="page-link" href=""><iclass="fa-solid fa-angles-right"></i></a></li>
								
								
					<c:if test="${pageInfo.currentPageNumber ne pageInfo.lastPageNumber }">
				    	<c:url value="/boardEx/list" var="listLink">
				    		<c:param value="${pageInfo.lastPageNumber }" name="page" />
				    	</c:url>
				    	<li class="page-item">
				    		<a href="${listLink }" class="page-link">맨뒤버튼</a>
				    	</li>
			    	</c:if>


								
					</ul>
				</nav>
			</div>
		</div>
		<!-- pagination-end -->
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
	const title = document.querySelector(".noticeTitle");
	
	const ctx = "${pageContext.request.contextPath}";
	
	function clickNotice(target){
		const n_id = target.dataset.value;
/*  		fetch(`\${ctx}/customer/listContent/\${n_id}`); */
			location.assign(`\${ctx}/customer/listContent/\${n_id}`); 
	}
	</script>
</body>
</html>