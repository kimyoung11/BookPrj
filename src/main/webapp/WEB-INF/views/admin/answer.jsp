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

.btnStyle {
	margin:10px;
}
</style>
<body>
	<my:adminHeader></my:adminHeader>
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
				<span> 유저 아이디: ${questContent.u_id }</span>
			</div>
		</div>
		<hr>
		<div class="view_body">
			<p>${questContent.q_content }</p>
		</div>

		<hr>

		
		<%-- 이미지 출력 --%>
				<div>
					<c:forEach items="${questContent.fileName }" var="name">
						<div>
							<img class="img-fluid img-thumbnail" src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/question/${questContent.q_number }/${URLEncoder.encode(name, 'utf-8')}" alt="">
						</div>
					</c:forEach>		
				</div>
		
		
				<!-- 1:1 문의 답변보기 -->
		<div class="row">
	  			<div class="col form-floating mb-3">
					<div id="answerList">
						<label for="floatingPlaintextInput">Answer</label>
						
					</div>
				</div>
		</div>
		
		
		<!-- 1:1 문의 답변달기 -->
		<div class="col">
		 	<input type="hidden" id="userId" name="u_id" value="${questContent.u_id }">
			<input type="hidden" id="answerId" name="a_id" >
			<input type="hidden" id="questionNum" value="${questContent.q_number }">
			<div class="input-group">
			  <div class="form-floating">

				  <textarea id="answerInput" class="form-control" placeholder="Leave a comment here" style="height: 100px"></textarea>

				  <label for="floatingTextarea2">1:1 문의 답변을 해주세요.</label>
			  </div>
			  <button class="btn btn-outline-secondary" id="replyButton">전송</button>
			</div>	
		</div>
	</div>
	

	<%-- 댓글 삭제 확인 모달 --%>
	<!-- Modal -->
	<div class="modal fade" id="removeConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">답변 삭제 확인</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	       답변을 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" data-bs-dismiss="modal" id="removeConfirmModalSubmitButton" class="btn btn-danger">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<%-- 댓글 수정 모달 --%>
	<!-- Modal -->
	<div class="modal fade" id="modifyFormModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5">답변 수정</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <input type="text" class="form-control" id="modifyReplyInput">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" data-bs-dismiss="modal" id="modifyFormModalSubmitButton" class="btn btn-primary">수정</button>
	      </div>
	    </div>
	  </div>
	</div>
	
		<%-- 댓글 메시지 토스트 --%>
	<div id="replyMessageToast" class="toast align-items-center top-0 start-50 translate-middle-x position-fixed" role="alert" aria-live="assertive" aria-atomic="true">
	  <div class="d-flex">
	    <div id="Message1" class="toast-body">
	      Hello, world! This is a toast message.
	    </div>
	    <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
	  </div>
	</div>

	
	
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
crossorigin="anonymous"></script>
	
<script>


const ctx = "${pageContext.request.contextPath}";

answerView();



/* 답변 추가하기 */

/* 입력 후 인풋창에 남아있지 않게 설정 */

document.querySelector("#replyButton").addEventListener("click", function() {
	const q_number = document.querySelector("#questionNum").value;
	const u_id = document.querySelector("#userId").value;
	const a_content = document.querySelector("#answerInput").value;
	
	const data = {q_number, u_id, a_content };
	
	fetch(`\${ctx}/admin/add`, {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(data => {
		document.querySelector("#answerInput").value = "";
	})
	.then(() => answerView());
});


/* 답변 삭제 수정하기 */
function answerView() {
	const questionId = document.querySelector("#questionNum").value;
	// console.log(questionId);
	
	fetch(`\${ctx}/admin/answerList/\${questionId}`)
	.then(res => res.json())
	.then(list => {

		/* 답변 내용 중복막기 */
		const answerList = document.querySelector("#answerList");
		answerList.innerHTML = "";
		
		for (const item of list) {
			console.log(item);
			const answerRemoveBtnId = `answerRemoveBtnId\${item.a_id}`;
			
			const answerModifyBtnId = `answerModifyBtnId\${item.a_id}`;
			console.log(item.a_id);
		
			const editButton = `
				<div class="btnStyle">
					<button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#modifyFormModal" data-answer-id="\${item.a_id}" id="\${answerModifyBtnId }">
						수정 
					</button>
					<button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#removeConfirmModal" data-answer-id="\${item.a_id}" id="\${answerRemoveBtnId }">
						삭제 
					</button>
					
				</div>
			
			`
			const replyDiv = `
				<div class="alert alert-warning" role="alert">
				  <h5 class="alert-heading">Answer</h5>
				  <p>\${item.a_content}</p>
				  <small><p class="mb-0">\${item.a_date}</p></small>
				</div> `;
				
				answerList.insertAdjacentHTML("beforeend", replyDiv);
				answerList.insertAdjacentHTML("beforeend", editButton);
				
			
			
				// 수정 폼 모달에 댓글 내용 넣기
				document.querySelector("#" + answerModifyBtnId)
					.addEventListener("click", function() {
						document.querySelector("#modifyFormModalSubmitButton").setAttribute("data-answer-id", this.dataset.answerId);
						readAnswer(this.dataset.answerId);
					});
				
				
				document.querySelector("#" + answerRemoveBtnId)
					.addEventListener("click", function() {
						// console.log(this.id + "번 삭제버튼 클릭됨");
						console.log(this.dataset.answerId + "번 댓글 삭제할 예정, 모달 띄움")
						document.querySelector("#removeConfirmModalSubmitButton").setAttribute("data-answer-id", this.dataset.answerId);
						document.querySelector("#removeConfirmModalSubmitButton").addEventListener("click", function(){
							removeAnswer(this.dataset.answerId);
						})
					});
			}
		});
	}


/* 답변 수정할 때 input content 가져오기 */
function readAnswer(a_id) {
	console.log(a_id);
	fetch(`\${ctx}/admin/getAnswer/\${a_id}`)
	.then(res => res.json())
	.then(answer => {
		document.querySelector("#modifyReplyInput").value = answer.a_content;
	});
}




//댓글 crud 메시지 토스트
const toast = new bootstrap.Toast(document.querySelector("#replyMessageToast"));

/* 답변 수정하기, 수정하기 메세지 보여주기 */ 
document.querySelector("#modifyFormModalSubmitButton").addEventListener("click", function() {
	
	const a_content = document.querySelector("#modifyReplyInput").value;
	const a_id = this.dataset.answerId;
	const data = {a_id, a_content};

	fetch(`\${ctx}/admin/modifyAnswer`, {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(res => res.json())
	.then(data => {
		document.querySelector("#Message1").innerText = data.message;
		toast.show();
	})
	.then(() => answerView());
});



/* 답변 삭제하기, 삭제 메세지 보여주기 */ 
function removeAnswer(answerId) {
	console.log(answerId);
	// /reply/remove/{id}, method:"delete"
	fetch(ctx + "/admin/remove/" + answerId, {
		method: "delete"
	})
	.then(res => res.json())
	.then(data => {
		document.querySelector("#Message1").innerText = data.message;
		toast.show();
	})
	.then(() => answerView());	
}




</script>
	
</body>
</html>