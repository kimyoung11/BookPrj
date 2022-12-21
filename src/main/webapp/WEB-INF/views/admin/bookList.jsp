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

<title>책 리스트</title>
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

.btncolor1{
background-color: #fff;
border-color: #4EAC27;
color: #4EAC27;
}
.btncolor1:hover,
.btncolor1:active{
background-color: #489f23;

}

.btncolor2{
background-color: #4EAC27;
border-color: #4EAC27;
}
.btncolor2:hover,
.btncolor2:active{
background-color: #489f23;
}


</style>
</head>
<body>

	<my:adminHeader></my:adminHeader>
	<div class="container">
		<div style="text-align: center; margin-top: 30px;" class="mb-5">
			<h1 style="font-size: 34px">책 리스트</h1>
		</div>

		<table class="table" style="margin-top: 50px; line-height: 50px;">
			<thead style="border-top: solid 1px;">
				<tr>
					<th>NO</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>가격</th>
					<th>책 이미지</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${bookList }" var="item">
					<tr>
						<th>${item.b_code }</th>
						<td class="align-left">${item.b_title }</td>
						<td>${item.b_writer }</td>
						<td>${item.b_price }</td>
						<td>
						<img src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/${item.b_code }/${URLEncoder.encode(item.b_img,'utf-8')}" alt="책" style="width: 50px; height: 60px;"/>
						</td>
				 		<td>
							<button type="button" class="btn btn-primary btncolor1" data-bs-toggle="modal" data-bs-target="#modifyModal" data-book-code="${item.b_code }">책 정보 수정</button>
							<button type="button" class="btn btn-primary modifyButton btncolor2" onclick="clickModify(this)" data-book-code="${item.b_code }">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">${item.b_code }번 책정보 수정</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <form action="${pageContext.request.contextPath}/admin/modifyBook" method="post" id="modifyForm" enctype="multipart/form-data">
					        	<label for="recipient-name" class="col-form-label">등록번호:</label>
					        	<input type="text" class="form-control" value="${item.b_code }" readonly="readonly" style="background-color: lightgrey;" required="required">
					     	    <input type="hidden" class="form-control" name="b_code" value="${item.b_code }" required="required" id="bookCode">
					          <div class="mb-3">
					            <label for="recipient-name" class="col-form-label">책제목:</label>
					            <input type="text" class="form-control" name="b_title" required="required">
					          </div>
					          <div class="mb-3">
					            <label for="message-text" class="col-form-label">책저자:</label>
					            <input type="text" class="form-control" name="b_writer" required="required">
					          </div>
					          <div class="mb-3">
					            <label for="message-text" class="col-form-label">책출판일:</label>
					            <input type="text" class="form-control" name="b_pubDate" required="required">
					          </div>
					          <div class="mb-3">
					            <label for="message-text" class="col-form-label">책가격:</label>
					            <input type="text" class="form-control" name="b_price" required="required">
					          </div>
					          <div class="mb-3">
					            <label for="message-text" class="col-form-label">책장르:</label>
					            <select class="form-select" id="myForm" data-placeholder="Choose one thing" name="b_genre">
							        <option value="소설">소설</option>
							        <option value="에세이">에세이</option>
							        <option value="인문">인문</option>
							        <option value="역사">역사</option>
							        <option value="만화">만화</option>
							        <option value="어린이">어린이</option>
							        <option value="수험서">수험서</option>	
							        <option value="육아">육아</option>
							        <option value="예술">예술</option>
							    </select>
					          </div>
					          <div class="mb-3">
					            <label for="message-text" class="col-form-label">책사진:</label>
					           		<input type="file" name="file" class="form-control" accept="image/*" required="required">
					          </div>
					        </form>
					        
					      </div>
					      <div class="modal-footer">
					      	<button type="button" class="btn btn-primary" onclick="document.querySelector('#modifyForm').submit()">수정</button>
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">나가기</button>
					      </div>
					    </div>
					  </div>
					</div>
		
</body>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
		
<script>
 	const ctx = "${pageContext.request.contextPath}";
	
	const modifyButton = document.querySelector(".modifyButton");
 	function clickModify(target){
		const b_code =target.dataset.bookCode;
		console.log(b_code);
		 fetch(`${ctx}/admin/deleteBook`,{
			method : 'delete',
			headers :{
				'Content-Type' : 'application/json',
			},
			body: JSON.stringify({b_code})
		}).then(() =>{
			location.reload();
		})
	}  
	const exampleModal = document.getElementById('modifyModal')
	exampleModal.addEventListener('show.bs.modal', event => {

	  const button = event.relatedTarget
	  const recipient = button.getAttribute('data-book-code')
	  const modalTitle = exampleModal.querySelector('.modal-title')
	  const modalBodyInput = exampleModal.querySelector('.modal-body input')

	  modalBodyInput.value = recipient
	  document.querySelector("#bookCode").value = recipient
	})
</script>
</html>