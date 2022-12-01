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
</style>
</head>
<body>
	<div id="align-center" class="container">
	<h1>공지사항 작성</h1>
	
	<form action="${pageContext.request.contextPath }/customer/notice" method="post">
		제목 <input type="text" placeholder="공지제목" name="n_title" ><br>
		본문 <textarea placeholder="공지본문" name="n_content"></textarea><br>
		<input type="hidden" name="ad_id" value="111">
		<input type="submit" value="등록">
	</form>	
	
	
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
		</div>
</body>
</html>