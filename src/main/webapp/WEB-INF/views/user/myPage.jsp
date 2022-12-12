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

span {
	font-size: 12px;
	margin-left: 100px;
}

.btn-bd-primary {
	-bs-btn-font-weight: 300;
}

.btn-edit {
	font-size: 18px;
	padding: 10px 40px;
}

.container-sm {
	max-width: 500px;
}

.content-size {
	width: 400px;
	margin-bottom: 20px;
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
					<span class="left-box m-2 row" 
						style="background: #fff; width: 90px; height: 90px; border-radius: 70%; overflow: hidden; position: relative; box-shadow: 0 0 14px #8cc1db;">
						<span class="fa-regular fa-user fa-2xl"
						style="position: absolute; top: 46px; left: 19px"></span>
					</span>
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
				<button class="left-box m-2 row" type="button" id="userInfoModalOpenButton" data-bs-toggle="modal" data-bs-target="#exampleModal">
						회원정보수정
				</button>
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
		
		<!-- 메세지 토스트 -->
		<div id="messageToast" class="toast align-items-center top-0 start-50 translate-middle-x position-fixed" role="alert" aria-live="assertive" aria-atomic="true">
		  <div class="d-flex">
		    <div id="message1" class="toast-body">
		    </div>
		    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
		  </div>
		</div>
		
		<!-- 회원정보수정 모달 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원정보수정</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body ">
		        <div class="container-md">
					<div class="row">
						<div class="col mt-1">
							<div style="text-align: left" class="mb-4">
								<h1 style="font-size: 24px">회원정보 수정</h1>
							</div>
			
							<hr class="line" style="border: solid 1px #000" />
								<div class="container-sm content-size">
									<div class="input-group mb-3">
										<label for="inputID" class="col-3 col-form-label">ID</label>
										<div class="col-sm-5">
											<input id="modalUserId" type="text" class="form-control" value="${user.u_id }"
												readonly />
										</div>
									</div>
			
									<p>
										<button class="btn btn-secondary" type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseExample"
											aria-expanded="false" aria-controls="collapseExample">
											비밀번호 변경</button>
									</p>
									<div class="collapse" id="collapseExample" style="width: 420px;">
										<div class="card card-body">
					                      <div class="mb-2 row mt-2">
					                        <label for="inputPassword" class="col-4 col-form-label">새
																		비밀번호</label>
					                        <div class="col-sm-7">
					                          <input type="password" id="newPasswordInput1" class="form-control" placeholder="새 비밀번호를 입력하세요."/>
					                        </div>
					                      </div>
					
					                      <div class="mb-2 row mt-2">
					                        <label for="inputPassword" class="col-4 col-form-label">비밀번호 확인</label>
					                        <div class="col-sm-7">
					                          <input type="password" id="newPasswordInput2" class="form-control" placeholder="비밀번호를 확인하세요."/>
					                        </div>
					                      </div>								
										</div>
										<div id="passwordText" class="form-text"></div>
									</div>
								</div>
							</div>
							<hr />
							<div class="container-sm content-size">
								<div class="mb-2 row mt-2">
									<label for="inputName" class="col-3 col-form-label">이름</label>
									<div class="col-sm-5">
										<input id="userName" type="text" class="form-control"
											readonly />
									</div>
								</div>
								<div class="mb-2 row mt-2">
									<label for="inputEmail" class="col-3 col-form-label">E-MAIL</label>
									<div class="col-sm-9">
										<div class="input-group">
											<input id="emailInput1" type="text" class="form-control"
												name="u_email" readonly />
											<button disabled id="emailButton1" type="button" class="btn btn-outline-secondary">
													중복확인
											</button>	
										</div>
										<div class="form-check form-switch">
										  <input class="form-check-input" type="checkbox" role="switch" id="emailCheckSwitch">
										  <label class="form-check-label" for="flexSwitchCheckDefault">이메일 변경</label>
										  <div id="emailText" class="form-text"></div>
										</div>
											
									</div>
									
								</div>
								<div class="mb-2 row mt-2">
									<label for="inputPhone" class="col-3 col-form-label">전화번호</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="userPhone"
											name="u_phone" />
									</div>
								</div>
								<div class="mb-2 row mt-2">
									<label for="inputAddress" class="col-3 col-form-label">주소</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="userAddress"
											name="u_address" />
									</div>
								</div>
							</div>
						<hr />
					</div>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary btn-edit" id="editConfirmButton" data-bs-dismiss="modal">수정</button>
		        <button type="button" class="btn btn-secondary btn-edit" data-bs-dismiss="modal" >취소</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	<my:footer></my:footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
		
<script>

const ctx = "${pageContext.request.contextPath}";

const u_id = document.querySelector("#u_id").value; 

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
const toast = new bootstrap.Toast(document.querySelector("#messageToast"));

// 주문 배송 페이지 나오기
function orderList(){
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
		document.querySelector("#message1").innerText = data.message;
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
		document.querySelector("#message1").innerText = data.message;
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
		document.querySelector("#message1").innerText = data.message;
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


//리뷰 수정 모달에 데이터 들어간다
function readReviewAndSetModalForm(r_id){
	fetch(`\${ctx}/review/yjh/get/\${r_id}`)
	.then(res => res.json())
	.then(review => {
		document.querySelector("#reviewModifyContent").value = review.r_content;	
	})	
}
	
// 회원정보 수정 모달에 데이터 들어간다
function readUserInfoAndSetModal(u_id){
	fetch(`\${ctx}/user/yjh/editInfo/\${u_id}`)
	.then(res => res.json())
	.then(user => {
		document.querySelector("#modalUserId").value = user.u_id;
		document.querySelector("#userName").value = user.u_name;
		document.querySelector("#userAddress").value = user.u_address;
		document.querySelector("#userPhone").value = user.u_phone;
		document.querySelector("#emailInput1").value = user.u_email; 
		
	})	
}
	
readUserInfoAndSetModal(u_id);
	
let availablePassword = true;
let availableEmail = true;

// 회원정보수정버튼 클릭
document.querySelector("#editConfirmButton").addEventListener("click", function(){
	const u_id = document.querySelector("#modalUserId").value;
	const u_pw = document.querySelector("#newPasswordInput1").value;
	const u_name = document.querySelector("#userName").value;
	const u_email = document.querySelector("#emailInput1").value;
	const u_phone = document.querySelector("#userPhone").value;
	const u_address = document.querySelector("#userAddress").value;
		
	const data = {
			u_id, u_pw, u_name, u_email, u_phone, u_address
	};
		
	fetch(ctx + "/user/yjh/editInfo" ,  {
		method : "put",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(res => res.json())
	.then(data => {
		document.querySelector("#message1").innerText = data.message;
		toast.show();
	})
	.then(() => myReview());
})

// 수정버튼 활성/비활성
function enableModifyButton(){
	const editButton = document.querySelector("#editConfirmButton");
		
	if(availablePassword && availableEmail){
		//수정 버튼 활성화
		editButton.removeAttribute("disabled")
	} else {
		//수정 버튼 비활성화
		editButton.setAttribute("disabled", "");
	}
}

// 새 비밀번호 일치여부 및 비밀번호 정규 표현식 적용
const newPasswordInput1 = document.querySelector("#newPasswordInput1");
const newPasswordInput2 = document.querySelector("#newPasswordInput2");
const passwordText = document.querySelector("#passwordText");
const passwordCheck = /(?=.*[0-9])(?=.*[a-z])(?=.*\W)(?=\S+$).{8,20}/ ;
newPasswordInput1.addEventListener("keyup", matchPassword);
newPasswordInput2.addEventListener("keyup", matchPassword);

function matchPassword(){
	availablePassword = false;
	if(!passwordCheck.test(newPasswordInput1.value)|| (newPasswordInput1.value).length<8){
		passwordText.innerText = "비밀번호는 영대소문자,숫자로 구성된 8글자 이상으로 조합하시오."	
	} else {
			
		if(newPasswordInput1.value == newPasswordInput2.value){
			passwordText.innerText = "암호가 일치합니다."
			availablePassword = true;
		} else {
			passwordText.innerText = "암호가 일치하지 않습니다."		
		}
	}
		
	enableModifyButton();
}


// 이메일 변경 관련
const emailButton1 = document.querySelector("#emailButton1");
const emailInput1 = document.querySelector("#emailInput1");
const emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/ ;
const emailText = document.querySelector("#emailText");

// 이메일 변경시 중복 검사 및 정규표현식

// 이메일 중복확인 버튼 클릭하면 일어나는일
emailButton1.addEventListener("click", function(){
	availableEmail = false;
		
	const email = emailInput1.value;
		
	fetch(`\${ctx}/user/yjh/changeEmail`,{
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify({email})
	})
	   .then(res => res.json())
	   .then(data => {
		   emailText.innerText = data.message;
		   if(data.status == "not change"){
			   availableEmail = true;
		   }
			   
		   enableModifyButton();
	   })
	
})

// 이메일 input창 키보드 입력시
emailInput1.addEventListener("keyup", function(){
	availableEmail = false;
	const oldEmail = emailInput1.dataset.oldEmail;
	const newEmail = emailInput1.value;
		
	if(oldEmail==newEmail){
		//기존 이메일과 같으면
		emailText.innerText = "";
		emailButton1.setAttribute("disabled", "disabled");
		availableEmail = true;
	} else{
		//기존 이메일과 다르면 중복체크 활성화
		emailText.innerText = "이메일 중복확인을 해주세요";
		emailButton1.removeAttribute("disabled");
	}
	
	enableModifyButton();
})
// 이메일 변경시 체크
document.querySelector("#emailCheckSwitch").addEventListener("change",function(){
	
	if(this.checked){
		emailInput1.removeAttribute("readonly");		
	} else {
		emailInput1.setAttribute("readonly","");		
	}
})
// 모달 내용 초기화
$("#makeReviewModal").on('hidden.bs.modal', function (e) {
	$(this).find('form')[0].reset();
}) 

$("#modifyReviewModal").on('hidden.bs.modal', function (e) {
	$(this).find('form')[0].reset();
})

</script>	
</body>
</html>