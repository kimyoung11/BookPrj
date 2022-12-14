<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>공지사항 수정</title>
</head>
<body>
	<my:adminHeader></my:adminHeader>
	<div class="container-md">
		<div class="row">
			<div class="col mt-5">
			
		<div style="text-align: center;" class="mb-5">
			<h1 style="font-size: 34px;">${notice.n_id}번 게시물</h1>
		</div>

	
	<div class="container-sm">
	<form id="modifyForm" action="" method="post">
		
		<input type="hidden" name="n_id" value="${notice.n_id }">
		
		<div class="mb-4 row mt-5">
				<label class="col-sm-1 col-form-label">공지제목</label>						
				<div class="col-sm-10">
					<input type="text" name="n_title" value="${notice.n_title }" class="form-control">
				</div>
		</div>


						<div class="mb-5 row">
							<label class="col-sm-1 col-form-label">공지내용</label>
							<div class="col-sm-10">
								<textarea name="n_content" class="form-control" rows="3"
									style="padding-bottom: 200px;">${notice.n_content }</textarea>
							</div>
						</div>

						<div class="mb-4 row mt-5">
							<label class="col-sm-1 col-form-label">작성일시</label>
							<div class="col-sm-10">
								<input type="datetime-local" class="form-control" value="${notice.n_date}" readonly>
							</div>
						</div>
						
	</form>
						
		<div class="row justify-content-center" style="text-align: center; margin-top: 30px;">		
			<div class="col-1">
				<input type="submit" value="수정" class="btn btn-secondary btn-qusetion " data-bs-toggle="modal" data-bs-target="#modifyModal">
			</div>
			
			<!-- 삭제 -->
			<div class="col-1">
				<c:url value="/admin/remove" var="removeLink"></c:url>
				<form id="deleteForm" action="${removeLink }" method="post">
					<input type="hidden" name="id" value="${notice.n_id }">
				</form>
				<input type="submit"  class="btn btn-primary regist-btn" value="삭제" data-bs-toggle="modal" data-bs-target="#removeModal">
			</div>
		</div>	
	
			</div>
		</div>
	</div>
</div>
	
	<!-- 수정 모달창 -->	
	<div class="modal" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">공지사항 수정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p>공지사항을 수정하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button id="modifyConfirm" type="button" class="btn btn-primary">수정</button>
	      </div>
	    </div>
	  </div>
	</div>


		<!-- 삭제 모달창 -->	
	<div class="modal" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">공지사항 삭제</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p>공지사항을 삭제하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button id="removeConfirm" type="button" class="btn btn-primary">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
crossorigin="anonymous"></script>

<script>
document.querySelector("#modifyConfirm").addEventListener("click",function(){
	document.querySelector("#modifyForm").submit();
})
document.querySelector("#removeConfirm").addEventListener("click",function(){
	document.querySelector("#deleteForm").submit();
})
</script>

</body>
</html>










