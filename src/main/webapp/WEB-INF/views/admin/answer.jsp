<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
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
		


		<!-- 1:1 문의 답변보기 -->
		<div class="row">
	  			<div class="col form-floating mb-3">
					<div id="answerList">
						<label for="floatingPlaintextInput">Answer</label>
						
					</div>
				</div>
		</div>
		
		
		<%-- 이미지 출력 --%>
				<div>
					<c:forEach items="${questContent.fileName }" var="name">
						<div>
							<img class="img-fluid img-thumbnail" src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/question/${questContent.q_number }/${URLEncoder.encode(name, 'utf-8')}" alt="">
						</div>
					</c:forEach>		
				</div>
		
		
		
		<!-- 1:1 문의 답변달기 -->
		<div class="col">
			<input type="hidden" id="adminId" name="ad_id" value="111">
			<input type="hidden" id="userId" name="u_id" value="aa">
			<input type="hidden" id="answerId" name="a_id" >
			<input type="hidden" id="questionNum" value="${questContent.q_number }">
			<div class="input-group">
			  <div class="form-floating">
				  <textarea class="form-control" placeholder="Leave a comment here" id="answerInput" style="height: 100px"></textarea>
				  <label for="floatingTextarea2">1:1 문의 답변을 해주세요.</label>
			  </div>
			  <button class="btn btn-outline-secondary" id="replyButton">전송</button>
			</div>	
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
document.querySelector("#replyButton").addEventListener("click", function() {
	const q_number = document.querySelector("#questionNum").value;
	const ad_id = document.querySelector("#adminId").value;
	const u_id = document.querySelector("#userId").value;
	const a_content = document.querySelector("#answerInput").value;
	
	const data = {q_number, ad_id, u_id, a_content };
	
	fetch(`\${ctx}/admin/add`, {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(res => res.json())
	.then(data => {
		document.querySelector("#answerInput").value = "";
	})
	.then(() => answerView());
});






function answerView() {
	const questionId = document.querySelector("#questionNum").value;
	fetch(`\${ctx}/admin/answerList/\${questionId}`)
	.then(res => res.json())
	.then(list => {

		/* 답변 내용 중복막기 */
		const answerList = document.querySelector("#answerList");
		answerList.innerHTML = "";
		
		for (const item of list) {
			
			const answerRemoveBtnId = `remveBtn\${item.a_id}`;
			
			const answerModifyBtnId = `modifyBtn\${item.a_id}`;
			// console.log(item.id);
			const answerDiv = `
				<div>
					<button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#modifyReplyFormModal" data-reply-id="\${item.a_id}" id="\${answerModifyBtnId}">
						<i class="fa-solid fa-pen"></i>
					</button>
					<button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#removeReplyConfirmModal" data-reply-id="\${item.a_id}" id="\${answerRemoveBtnId}">
						<i class="fa-solid fa-x"></i>
					</button>
				</div>
			
			`
			const replyDiv = `
				<div class="list-group-item d-flex">
					<div class="me-auto">
						<h5>
							<i class="fa-solid fa-user"></i>
							\${item.writer}
						</h5>
						<div>
							\${item.content}
						</div>
						<small class="text-muted">
							<i class="fa-regular fa-clock"></i> 
							\${item.ago}
						</small>
					</div>
					\${item.editable ? editButton : ''}
				</div>`;
				
				answerList.insertAdjacentHTML("beforeend", replyDiv);
			
			if (item.editable) {
				// 수정 폼 모달에 댓글 내용 넣기
				document.querySelector("#" + answerModifyBtnId)
					.addEventListener("click", function() {
						document.querySelector("#modifyFormModalSubmitButton").setAttribute("data-answer-id", this.dataset.replyId);
						readReplyAndSetModalForm(this.dataset.replyId);
					});
				
				
				// 삭제확인 버튼에 replyId 옮기기
				document.querySelector("#" + answerRemoveBtnId)
					.addEventListener("click", function() {
						// console.log(this.id + "번 삭제버튼 클릭됨");
						console.log(this.dataset.replyId + "번 댓글 삭제할 예정, 모달 띄움")
						document.querySelector("#removeConfirmModalSubmitButton").setAttribute("data-answer-id", this.dataset.answerId);
						// removeReply(this.dataset.replyId);
					});
			}
		}
	});
}




function removeReply(replyId) {
	// /reply/remove/{id}, method:"delete"
	fetch(ctx + "/reply/remove/" + replyId, {
		method: "delete"
	})
	.then(res => res.json())
	.then(data => {
		document.querySelector("#replyMessage1").innerText = data.message;
		toast.show();
	})
	.then(() => listReply());
}

const replySendButton1 = document.querySelector("#replySendButton1");
if (replySendButton1 != null) {
	document.querySelector("#replySendButton1").addEventListener("click", function() {
		const questionId = document.querySelector("#questionNum").value;
		const content = document.querySelector("#replyInput1").value;
		
		const data = {
			questionId,
			content
		};
		
		fetch(`\${ctx}/reply/add`, {
			method : "post",
			headers : {
				"Content-Type" : "application/json"
			},
			body : JSON.stringify(data)
		})
		.then(res => res.json())
		.then(data => {
			document.querySelector("#replyInput1").value = "";
			document.querySelector("#replyMessage1").innerText = data.message;
			toast.show();
		})
		.then(() => listReply());
	});
}

</script>
	
</body>
</html>