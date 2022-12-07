<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
	integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet" />
<title>Insert title here</title>
</head>
<style>
* {
	font-family: "Noto Sans KR", sans-serif;
	margin: 0;
	padding: 0;
}
#reviewForm fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}
#reviewForm2 fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#reviewForm fieldset legend {
	text-align: right;
}
#reviewForm2 fieldset legend {
	text-align: right;
}

#reviewForm input[type=radio] {
	display: none;
}
#reviewForm2 input[type=radio] {
	display: none;
}

#reviewForm label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}
#reviewForm2 label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#reviewForm label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewForm2 label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewForm label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewForm2 label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewForm input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewForm2 input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}


</style>
<body>
	<my:headerBar></my:headerBar>
	<div class="container-md bg" style="width: 1200px">
		<div class="top-section">
			<h4 style="font-weight: 600; padding-top: 30px; padding-bottom: 30px">
				마이페이지</h4>
			<div
				class="login-box mb-3 mt-3 rounded d-flex align-items-center flex-row p-3"
				style="width: 400px; height: 200px; background-color: #bed6e0">
				<input type="hidden" id="u_id" value="${user.u_id }">
				<div class="col align-items-center">
					<c:url value="/user/yjh/editInfo" var="editLink">
						<c:param name="u_id" value="${user.u_id }" />
					</c:url>
					<a class="left-box m-2 row" href="${editLink }"
						style="background: #fff; width: 90px; height: 90px; border-radius: 70%; overflow: hidden; position: relative; box-shadow: 0 0 14px #8cc1db;">
						<span class="fa-regular fa-user fa-2xl"
						style="position: absolute; top: 46px; left: 19px"></span>
					</a>
					<div class="row">
						<h5 style="margin-left: 14px">${user.u_id }님</h5>
					</div>
				</div>
				<div class="right-box d-flex align-items-center gap-2"
					style="margin-right: 12px">
					<div class="like-box rounded"
						style="width: 100px; height: 100px; background-color: #fff; margin-right: 5px; box-shadow: 0 0 14px #8cc1db;">
						<h1 class="mt-2" style="color: #333; text-align: center">${user.countLike}</h1>
						<h5 style="color: #333; text-align: center">좋아요</h5>
					</div>
					<div class="backet-box rounded"
						style="width: 100px; height: 100px; background-color: #fff; box-shadow: 0 0 14px #8cc1db;">
						<h1 class="mt-2" style="color: #333; text-align: center">${user.countCart }</h1>
						<h5 style="color: #333; text-align: center">장바구니</h5>
					</div>
				</div>
			</div>
		</div>
		
		<div class="mid-section mb-3">
	        <div class="btn-group d-flex gap-2" role="group">
	          	<button id="OrderListButton1" class="btn btn-primary rounded mt-3 mb-3 p-3" style="width: 95%">
	            주문 배송 내역
		        </button>
		        
		        <button id="LikeListButton1" class="btn btn-primary rounded mt-3 mb-3 p-3" style="width: 95%">
		            좋아요 보기
		        </button>
		        
		        <button id="ReviewListButton1" class="btn btn-primary rounded mt-3 mb-3 p-3" style="width: 95%">
		            리뷰 관리
		        </button>
		      
		        <button id="QuestListButton1" class="btn btn-primary rounded mt-3 mb-3 p-3" style="width: 95%">
		            내 문의
		        </button>
	        </div>
        </div>
         <!--리뷰 버튼 출력 -->
		        <div class="btn-group d-flex gap-2" role="group" id="reviewButtonGroup">
		        
		       </div> 
        
        <!-- 테이블 출력 -->
		        <div class="row mt-3 mb-3">
		        	<div class="col">
		        		<div class="list-group" id="tableContainer">
		        			<div class="list-section">
								<table class="table" id="dataTable"
									style="border: 2px solid black; border-radius: 10px">
									<thead id = "tableHead">
										
									</thead>
									<tbody id = "tableBody">
											
									</tbody>
								</table>
								<br />
							</div>
		        		</div>
		        	</div>
		        </div>
        
		        
		 
	</div>
	
	
	<!-- 리뷰 작성 모달 -->
		<div class="modal fade" id="makeReviewModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 작성</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form class="mb-3" id="reviewForm" method="post">
						<div class="modal-body">
							<fieldset>
								<span class="text-bold">별점을 선택해주세요</span> 
								<input type="radio"name="r_starRadio" value="5" id="rate1"><label for="rate1">★</label>
								<input type="radio" name="r_starRadio" value="4" id="rate2"><label for="rate2">★</label> 
								<input type="radio" name="r_starRadio"value="3" id="rate3"><label for="rate3">★</label> 
								<input type="radio" name="r_starRadio" value="2" id="rate4"><label for="rate4">★</label>
								<input type="radio" name="r_starRadio" value="1" id="rate5"><label for="rate5">★</label>
							</fieldset>
	
							<div class="mb-3">
								<label for="message-text" class="col-form-label"></label>
								<textarea class="form-control" id="reviewContent" placeholder="리뷰를 작성해주세요."></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button id="reviewSendButton" type="button" data-bs-dismiss="modal"
								class="btn btn-primary">작성</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- 리뷰 수정 모달 -->
		<div class="modal fade" id="modifyReviewModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 수정</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form class="mb-3" id="reviewForm2" method="post">
						<div class="modal-body">
							<fieldset>
								<span class="text-bold">별점을 선택해주세요</span> 
								<input type="radio" name="modi_r_starRadio" value="5" id="rate11"><label for="rate11">★</label>
								<input type="radio" name="modi_r_starRadio" value="4" id="rate22"><label for="rate22">★</label> 
								<input type="radio" name="modi_r_starRadio" value="3" id="rate33"><label for="rate33">★</label> 
								<input type="radio" name="modi_r_starRadio" value="2" id="rate44"><label for="rate44">★</label>
								<input type="radio" name="modi_r_starRadio" value="1" id="rate55"><label for="rate55">★</label>
							</fieldset>
	
							<div class="mb-3">
								<label for="message-text" class="col-form-label"></label>
								<textarea class="form-control" id="reviewModifyContent" placeholder="리뷰를 작성해주세요."></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button id="reviewModifyButton" type="button" data-bs-dismiss="modal"
								class="btn btn-primary">수정</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- 리뷰 삭제 모달 -->
		<div class="modal fade" id="removeReviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 삭제</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        리뷰를 삭제하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button id="reviewRemoveButton" type="button" data-bs-dismiss="modal" class="btn btn-danger">삭제</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 리뷰 메세지 토스트 -->
		<div id="reviewMessageToast" class="toast align-items-center top-0 start-50 translate-middle-x position-fixed" role="alert" aria-live="assertive" aria-atomic="true">
		  <div class="d-flex">
		    <div id="reviewMessage1" class="toast-body">
		    </div>
		    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
		  </div>
		</div>

	<my:footer></my:footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
		
<script>

const ctx = "${pageContext.request.contextPath}";

// ↓↓↓↓↓↓↓ 테이블 비동기 방식으로 변경하기 위한 테이블 생성 변수들 ↓↓↓↓↓↓↓↓

// 테이블 뼈대
const tableDiv = `
	<div class="list-section">
		<table class="table"
			style="border: 2px solid black; border-radius: 10px">
			<thead id = "tableHead">
				
			</thead>
			<tbody id = "tableBody">
					
			</tbody>
		</table>
		<br />
	</div>`;

// 오더 리스트 테이블 헤더
const orderTableHead = 
	`<tr>
		<th scope="col">주문일자</th>
		<th scope="col">주문번호</th>
		<th scope="col">배송상태</th>
	</tr>`;

// 좋아요 리스트 테이블 헤더
const b_likeTableHead = 
	`<tr>
		<th scope="col">좋아요 누른 책</th>
	</tr>`;

// 작성완료 리뷰 리스트 테이블 헤더
const reviewTableHead = 
	`<tr>
		<th scope="col">책 제목</th>
		<th scope="col">별점</th>
		<th scope="col">내용</th>
		<th scope="col">버튼</th>
	</tr>`;
	
// 작성 가능한 리뷰 리스트 테이블 헤더
const makeReviewTableHead = 
	`<tr>
		<th scope="col">책 제목</th>
		<th scope="col">리뷰 작성</th>
	</tr>`;
	
// 내 문의 리스트 테이블 헤더
const questTableHead = 
	`<tr>
		<th scope="col">문의 제목</th>
		<th scope="col">문의 내용</th>
		<th scope="col">작성일</th>
	</tr>`;


// ↓↓↓↓↓↓↓ 마이 페이지 각종 리스트 비동기 실행 함수들 ↓↓↓↓↓↓↓↓
	
	
// 페이지 실행시 주문리스트 바로 출력
orderList();


//리뷰 crud 메세지 toast
const toast = new bootstrap.Toast(document.querySelector("#reviewMessageToast"));

// 주문 배송 페이지 나오기
function orderList(){
	const u_id = document.querySelector("#u_id").value;
	fetch(`\${ctx}/user/yjh/orderList/\${u_id}`)
	.then(res => res.json())
	.then(orderList => {
		const orderListData = document.querySelector("#orderListData");
		document.querySelector("#reviewButtonGroup").innerHTML = "";
		document.querySelector("#tableContainer").innerHTML = "";
		document.querySelector("#tableContainer").insertAdjacentHTML("beforeend", tableDiv);		
		document.querySelector("#tableHead").insertAdjacentHTML("beforeend", orderTableHead);
		
		for (const order of orderList) {
				const orderTableBody = 
					`
					<tr>
						<td>\${order.o_date }</td>
						<td>\${order.o_id}</td>
						<td>\${order.o_status}</td>
					</tr>
					`;
			document.querySelector("#tableBody").insertAdjacentHTML("beforeend", orderTableBody);
		}											
	});
}
// 주문 배송 리스트 버튼 클릭 함수
document.querySelector("#OrderListButton1").addEventListener("click", function(){
	orderList();
});
		
// 좋아요 페이지 나오기
document.querySelector("#LikeListButton1").addEventListener("click", function(){
	const u_id = document.querySelector("#u_id").value;
	fetch(`\${ctx}/user/yjh/bookLikeList/\${u_id}`)
	.then(res => res.json())
	.then(bookLikeList => {
		const tableContainer = document.querySelector("#tableContainer");
		document.querySelector("#reviewButtonGroup").innerHTML = "";
		document.querySelector("#tableContainer").innerHTML = "";
		document.querySelector("#tableContainer").insertAdjacentHTML("beforeend", tableDiv);
		document.querySelector("#tableHead").insertAdjacentHTML("beforeend", b_likeTableHead);
		for (const b_like of bookLikeList) {
			const b_likeTableBody = 
				`
				<tr>
					<td>\${b_like.b_title}</td>
				</tr>
				`;
			document.querySelector("#tableBody").insertAdjacentHTML("beforeend", b_likeTableBody);
		}
	});
})

// 작성한 리뷰 나오는 함수
function myReview(){
	
	const u_id = document.querySelector("#u_id").value;
	
	fetch(`\${ctx}/user/yjh/reviewList/\${u_id}`)
	.then(res => res.json())
	.then(reviewList => {
		const tableContainer = document.querySelector("#tableContainer");
		document.querySelector("#reviewButtonGroup").innerHTML = "";
		document.querySelector("#tableContainer").innerHTML = "";
		document.querySelector("#tableContainer").insertAdjacentHTML("beforeend", tableDiv);
		var reviewButtonDiv = 
			`
			<button id="myReviewBtn" class="btn btn-primary rounded mt-3 mb-3 p-3" style="width: 95%">
				내가 작성한 리뷰 보기 </button> 
			<button id="makeReviewBtn" class="btn btn-primary rounded mt-3 mb-3 p-3" style="width: 95%">
				작성 가능한 리뷰 보기 </button>
			`;
		document.querySelector("#reviewButtonGroup").insertAdjacentHTML("beforeend", reviewButtonDiv);
		document.querySelector("#tableHead").insertAdjacentHTML("beforeend", reviewTableHead);	
		for(review of reviewList) {
			const reviewModifyButtonId = `reviewModifyButton\${review.r_id}`;
			const reviewRemoveButtonId = `reviewRemoveButton\${review.r_id}`;
			const reviewTableBody = 
				`
				<tr>
					<td>\${review.b_title}</td>
					<td><i class="fa-sharp fa-solid fa-star" style="color:rgb(239, 220, 11)"></i>\${review.r_star}</td>
					<td>\${review.r_content}</td>
					<td>
					<button id="\${reviewModifyButtonId}" type="button" class="btn btn-primary" 
						data-bs-toggle="modal" data-bs-target="#modifyReviewModal" data-review-id="\${review.r_id}">
						수정
					</button>
					<button id="\${reviewRemoveButtonId}" type="button" class="btn btn-danger" 
						data-bs-toggle="modal" data-bs-target="#removeReviewModal" data-review-id="\${review.r_id}">
						삭제
					</button>	
				</td>
				</tr>
				`;
			document.querySelector("#tableBody").insertAdjacentHTML("beforeend",reviewTableBody );
			
			//리뷰 수정버튼에 내용 넣기
			document.querySelector("#" + reviewModifyButtonId).addEventListener("click", function(){
				document.querySelector("#reviewModifyButton").setAttribute("data-review-id", this.dataset.reviewId);
				readReviewAndSetModalForm(this.dataset.reviewId);
			})
			//제거 버튼에 데이터
			document.querySelector("#" + reviewRemoveButtonId).addEventListener("click", function(){
				document.querySelector("#reviewRemoveButton").setAttribute("data-review-id", this.dataset.reviewId);
			})
			
		}
			
		// 작성한 리뷰 목록 버튼 클릭시
		document.querySelector("#myReviewBtn").addEventListener("click", function(){
				
			document.querySelector("#tableContainer").innerHTML = "";
			document.querySelector("#tableContainer").insertAdjacentHTML("beforeend", tableDiv);
			document.querySelector("#tableHead").insertAdjacentHTML("beforeend", reviewTableHead);
			for(review of reviewList) {
				const reviewModifyButtonId = `reviewModifyButton\${review.r_id}`;
				const reviewRemoveButtonId = `reviewRemoveButton\${review.r_id}`;
				const reviewTableBody = 
					`
					<tr>
						<td>\${review.b_title}</td>
						<td><i class="fa-sharp fa-solid fa-star" style="color:rgb(239, 220, 11)"></i>\${review.r_star}</td>
						<td>\${review.r_content}</td>
						<td>
							<button id="\${reviewModifyButtonId}" type="button" class="btn btn-primary" 
								data-bs-toggle="modal" data-bs-target="#modifyReviewModal" data-review-id="\${review.r_id}">
								수정
							</button>
							<button id="\${reviewRemoveButtonId}" type="button" class="btn btn-danger" 
								data-bs-toggle="modal" data-bs-target="#removeReviewModal" data-review-id="\${review.r_id}">
								삭제
							</button>	
						</td>
					</tr>
					`;
				document.querySelector("#tableBody").insertAdjacentHTML("beforeend",reviewTableBody );
				
				//리뷰 수정버튼에 내용 넣기
				document.querySelector("#" + reviewModifyButtonId).addEventListener("click", function(){
					document.querySelector("#reviewModifyButton").setAttribute("data-review-id", this.dataset.reviewId);
					readReviewAndSetModalForm(this.dataset.reviewId);
				})
				//제거 버튼에 데이터
				document.querySelector("#" + reviewRemoveButtonId).addEventListener("click", function(){
					document.querySelector("#reviewRemoveButton").setAttribute("data-review-id", this.dataset.reviewId);
				})	
			}
		})
			
		// 작성 가능한 리뷰 목록 클릭
		document.querySelector("#makeReviewBtn").addEventListener("click", function(){
			makeReviewList();
		})
	});
}

//작성한 리뷰 리스트 나오기 버튼 클릭
document.querySelector("#ReviewListButton1").addEventListener("click", function(){
	myReview();
})

// 리뷰 수정 모달에 데이터 들어간다
function readReviewAndSetModalForm(r_id){
	fetch(`\${ctx}/review/yjh/get/\${r_id}`)
	.then(res => res.json())
	.then(review => {
		document.querySelector("#reviewModifyContent").value = review.r_content;	
	})	
}


// 작성 가능한 리뷰 목록 나오는 함수
function makeReviewList(){
		const u_id = document.querySelector("#u_id").value;
		
		fetch(`\${ctx}/user/yjh/makeReviewList/\${u_id}`)
		.then(res => res.json())
		.then(makeReviewList => {
			document.querySelector("#tableContainer").innerHTML = "";
			document.querySelector("#tableContainer").insertAdjacentHTML("beforeend", tableDiv);
			document.querySelector("#tableHead").insertAdjacentHTML("beforeend", makeReviewTableHead);
			for (const review of makeReviewList) {
				const reviewB_code = `${review.b_code}`;
				const reviewButtonId = `reviewButton\${review.b_code}`;
				const makeReviewTableBody = 				
					`<tr>
						<td>\${review.b_title}</td>
						<td>
							<button id="\${reviewButtonId}" type="button" class="btn btn-primary" 
								data-bs-toggle="modal" data-bs-target="#makeReviewModal" data-review-id="\${review.b_code}">
								리뷰 작성
							</button>
						</td>
					</tr>`;			 
				document.querySelector("#tableBody").insertAdjacentHTML("beforeend",makeReviewTableBody);
				document.querySelector("#" + reviewButtonId).addEventListener("click", function(){
					document.querySelector("#reviewSendButton").setAttribute("data-review-id", this.dataset.reviewId);	
				})
			}
		}); 
}

// 리뷰 작성 확인 버튼
document.querySelector("#reviewSendButton").addEventListener("click", function(){
	const b_code = this.dataset.reviewId;
	const r_content = document.querySelector("#reviewContent").value;
	const r_star = document.querySelector('input[name="r_starRadio"]:checked').value; 
	const u_id = document.querySelector("#u_id").value;
	
	const data = {
			b_code , r_content, r_star, u_id
	};
	fetch(`\${ctx}/review/yjh/add`, {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(res => res.json())
	.then(data => {
		document.querySelector("#reviewMessage1").innerText = data.message;
		toast.show();
	})
	.then(() => myReview());
	
});

//리뷰 수정 확인 버튼
document.querySelector("#reviewModifyButton").addEventListener("click", function(){
	const r_id = this.dataset.reviewId;
	const r_content = document.querySelector("#reviewModifyContent").value;
	const r_star = document.querySelector('input[name="modi_r_starRadio"]:checked').value; 
	
	const data = {
			r_id , r_content, r_star
	};
	fetch(`\${ctx}/review/yjh/modify`, {
		method : "put",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(res => res.json())
	.then(data => {
		document.querySelector("#reviewMessage1").innerText = data.message;
		toast.show();
	})
	.then(() => myReview());
	
});

// 리뷰 삭제 함수
function removeReview(reviewId){
	fetch(`\${ctx}/review/yjh/remove/\${reviewId}`, {
		method : "delete"
	})
	.then(res => res.json())
	.then(data => {
		document.querySelector("#reviewMessage1").innerText = data.message;
		toast.show();
	})
	.then(() => myReview());
}

// 리뷰 삭제 모달 확인버튼
document.querySelector("#reviewRemoveButton").addEventListener("click" , function(){
	removeReview(this.dataset.reviewId);
})

// 문의 리스트 나오기
document.querySelector("#QuestListButton1").addEventListener("click", function(){
	const u_id = document.querySelector("#u_id").value;
	fetch(`\${ctx}/user/yjh/questList/\${u_id}`)
	.then(res => res.json())
	.then(questList => {
		const tableContainer = document.querySelector("#tableContainer");
		document.querySelector("#reviewButtonGroup").innerHTML = "";
		document.querySelector("#tableContainer").innerHTML = "";
		document.querySelector("#tableContainer").insertAdjacentHTML("beforeend", tableDiv);
		document.querySelector("#tableHead").insertAdjacentHTML("beforeend", questTableHead);
		for (const quest of questList) {
			const questTableBody = 
				`
				<tr>
					<td>\${quest.q_title}</td>
					<td>\${quest.q_content}</td>
					<td>\${quest.q_date}</td>
				</tr>
				`;
			document.querySelector("#tableBody").insertAdjacentHTML("beforeend", questTableBody);
		}
	});
})

// 모달 내용 초기화
$('.modal').on('hidden.bs.modal', function (e) {
	$(this).find('form')[0].reset();
})

</script>	
</body>
</html>