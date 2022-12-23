<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>책 상세 수정</title>
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
	
	<ul>
		<li>${book.b_code}</li>
		<li>${book.b_title}</li>
		<li>${book.b_writer}</li>
		<li>${book.b_pubDate}</li>
		<li>${book.b_price}</li>
		<li>${book.b_genre}</li>
		<li><img src="${book.b_img }" alt=""></li>
	</ul>
	
	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modifyModal" data-bs-whatever="@mdo">책 정보 수정</button>

<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">책 정보 수정</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="${pageContext.request.contextPath}/book/book/admin/modifyBook" method="post" id="modifyForm">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">책제목:</label>
            <input type="text" class="form-control" id="b_title">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">책저자:</label>
            <input type="text" class="form-control" id="b_writer">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">책출판일:</label>
            <input type="text" class="form-control" id="b_pubDate">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">책가격:</label>
            <input type="text" class="form-control" id="b_price">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">책장르:</label>
            <input type="text" class="form-control" id="b_genre">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">책사진:</label>
            <input type="file" class="form-control" id="b_img" accept="image/png, image/jpg">
          </div>
        </form>
        
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" onclick="
      	document.querySelector('.modifyForm').submit()">수정</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">나가기</button>
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