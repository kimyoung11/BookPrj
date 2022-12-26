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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<title>마이페이지</title>
</head>
<style>
<%@include file="/WEB-INF/views/css/profileCard.css"%>
<%@include file="/WEB-INF/views/css/myPageNav.css"%>
<%@include file="/WEB-INF/views/css/reviewModal.css"%>
<%@include file="/WEB-INF/views/css/orderStatus.css"%>
<%@include file="/WEB-INF/views/css/mypage_b_like.css"%>
<%@include file="/WEB-INF/views/css/mypage_myreview.css"%>
<%@include file="/WEB-INF/views/css/mypage_myquest.css"%>
</style>
<body>
<!-- 헤더 태그 -->	
<my:headerBar></my:headerBar>
		<div class="nav-wrapper">
			<!-- 마이페이지 nav/tab -->
		   <div class="navbar">
		      <ul>
		         <li class="navli">
		           <a href="#" id="QuestListButton1">
		           나의 문의
		           </a>
		         </li>
		        <li class="active navli">
		           <a href="#" id="OrderListButton1">
		            나의 쇼핑
		           </a>
		        </li>
		        
		        <li class="navli">
		          <a href="#" id="LikeListButton1">
		          좋아요
		          </a>
		        </li>
		        
		       <li class="navli">
		          <a href="#" id="ReviewListButton1">
		            나의 리뷰
		          </a>
		        </li>
		        
		       </ul>                        
		        <div class="line">
		           <div class="indicator"></div>
		        </div>
		   </div>     
		</div> 
<div class="container mypage">
	<main class="content">		
		<div class="container-md bg mt-5" style="width: 1200px">
				<div class="top-section">
		              <div class="row mb-5">
		              	<!-- 프로필 -->
						<div class="col profile-card">
		                    <div id="setButton">
		                        <button class="btn btn-white"  id="userInfoModalOpenButton" data-bs-toggle="modal" data-bs-target="#exampleModal">
		                            <i class="fa-solid fa-gear"></i>
		                        </button>
		                    </div>
					        <div class="image">
					        	<img src="${pageContext.request.contextPath}/content/person.png" alt="로고사진" class="profile-img" />
					        </div>
					        <div class="text-data">
					            <span class="name">${user.u_id }
		                        </span>   
					        </div>
						        <input type="hidden" id="u_id" value="${user.u_id }">
						        <input type="hidden" id="o_status_ready" value="${user.o_status_ready}">
						        <input type="hidden" id="o_status_start" value="${user.o_status_start}">  
						        <input type="hidden" id="o_status_ing" value="${user.o_status_ing}">  
						        <input type="hidden" id="o_status_complete" value="${user.o_status_complete}">    
						        <div class="analytics">
						            <div class="data">
			                            <i class="fa-solid fa-heart"></i>
			                            <span class="iconName">좋아요</span>
			                            <span class="number">${user.countLike }</span>
						            </div>
						            <div class="data">
			                            <i class="fa-solid fa-cart-shopping"></i>
			                            <span class="iconName">장바구니</span>
			                            <span class="number">${user.countCart }</span>
						            </div>
			                        <div class="data">
			                            <i class="fa-solid fa-ticket"></i>
			                            <span class="iconName">쿠폰</span>
			                            <span class="number">0</span>
						            </div>
						        </div>
					        </div>
					        <section class="mypage-cont col" id="mypageContent">
								 <!-- 배송 현황 출력 -->
								 <div id="orderStatus"></div>
								  
								 <div id="dataTextDiv"></div>
							     <!--리뷰 버튼 출력 -->
								 <div class=" rvbtn_group" id="reviewButtonGroup"></div>
								 <!-- 테이블 출력 -->
								 <div id="tableContainer"></div>
				   			 </section>
			 </div>		        
		</div>			
			<!-- 리뷰 작성 모달 -->
				<div class="modal fade" id="makeReviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 작성</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<form class="mb-3 reviewModal" id="reviewForm" method="post">
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
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									<button id="reviewSendButton" type="button" data-bs-dismiss="modal" class="btn btn-primary">작성</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<!-- 리뷰 수정 모달 -->
				<div class="modal fade reviewModal" id="modifyReviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 수정</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<form class="mb-3 " id="reviewForm2" method="post">
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
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									<button id="reviewModifyButton" type="button" data-bs-dismiss="modal" class="btn btn-primary">수정</button>
								</div>
							</form>
						</div>
					</div>
				</div>		
				<!-- 리뷰 삭제 모달 -->
				<div class="modal fade reviewModal" id="removeReviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
												<button class="btn btn-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
												비밀번호 변경</button>
											</p>
											<div class="collapse" id="collapseExample" style="width: 420px;">
												<div class="card card-body">
							                      <div class="mb-2 row mt-2">
							                        <label for="inputPassword" class="col-4 col-form-label">새 비밀번호</label>
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
												<input id="userName" type="text" class="form-control" readonly />
											</div>
										</div>
										<div class="mb-2 row mt-2">
											<label for="inputEmail" class="col-3 col-form-label">E-MAIL</label>
											<div class="col-sm-9">
												<div class="input-group">
													<input id="emailInput1" type="text" class="form-control" name="u_email" readonly />
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
												<input type="text" class="form-control" id="userPhone"name="u_phone" />
											</div>
										</div>
										<div class="mb-2 row mt-2">
											<label for="inputAddress" class="col-3 col-form-label">주소</label>
											<div class="col-sm-9">
											   <input type="text" class="form-control" id="userAddress"name="u_address" />
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
				
				<!-- 문의 보기 모달 -->
				<div class="modal fade questModal" id="questModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">1:1문의답변</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="container">						
								<div class="row justify-content-between">
									<div class="col-4" id= "questTitle"></div>
									<div class="col-4" id= "questDate"></div>
								</div>
								<hr>
								<div class="view_body" id= "questContent"></div>
								<hr>														
								<%-- 이미지 출력 --%>
								<div id= "questFile"></div>														
								<!-- 1:1 문의 답변보기 -->
								<div class="row">
							  			<div class="col form-floating mb-3">
											<div id="questAnswer"></div>
										</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
				
			</div>
	</main>	
</div>	
	<!-- footer바 태그 -->
	<my:footer></my:footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"> </script>		
<script>
const ctx = "${pageContext.request.contextPath}";

const u_id = document.querySelector("#u_id").value; 

//navbar 이동
const navBar = document.querySelector(".navbar");
const allLi = document.querySelectorAll(".navli");
        
 allLi.forEach((li, index) => {
    li.addEventListener("click" , e =>{
     e.preventDefault();
     navBar.querySelector(".active").classList.remove("active");
     li.classList.add("active");
     const indicator = document.querySelector(".indicator");
     indicator.style.transform = `translateX(calc(\${index * 100}px))`;     
     });
 });
 // 배송현황 값
 const statusReady = document.querySelector("#o_status_ready").value;
 const statusStart = document.querySelector("#o_status_start").value;
 const statusIng = document.querySelector("#o_status_ing").value;
 const statusComplete = document.querySelector("#o_status_complete").value;
 
 // 배송현황 비동기 방식 생성 변수
 const orderStatusDiv = `
 		<div>
 			<h5 style="font-weight: bold; margin-top: -25px;" class="mb-3">주문/배송 내역</h5>
 			<p style="text-align-last: end; font-size: small; font-family: emoji; margin-bottom: 1px;">(최근 한 달 이내 배송현황)</p>
 		</div>
		<div class="orderData">	
			<div class="tracking">
				<div class="data">
					<span class="status-count">\${statusReady}</span>
					<span class="titleName">상품 준비중</span>
				</div>
				<div class="data">
					<span class="status-count">\${statusStart}</span>
					<span class="titleName">배송 시작</span>
				</div>
				<div class="data">
					<span class="status-count">\${statusIng}</span>
					<span class="titleName">배송중</span>
				</div>
				<div class="data">
					<span class="status-count">\${statusComplete}</span>
					<span class="titleName">배송 완료</span>
				</div>
			</div>
		</div>`;

// ↓↓↓↓↓↓↓ 테이블 비동기 방식으로 변경하기 위한 테이블 생성 변수들 ↓↓↓↓↓↓↓↓
// 내역 없을때
const dataNullText = `<span style="display: inline-block; padding-top: 30px;">내역이 없습니다.</span>`;

// 섹션 뼈대
const sectionDiv = `
	<!-- 배송 현황 출력 -->
	 <div id="orderStatus"></div>	 
    <!--리뷰 버튼 출력 -->
	 <div class=" rvbtn_group" id="reviewButtonGroup"></div>
	 `;

// 오더 리스트 테이블
const orderTable = 
	`
		<div id="orderFrame">
	        <span style="font-size: 17px; font-weight: bold; display: inline-block; padding: 10px 10px;">주문 정보</span>
	        <table id="productInfo">
	            <thead>
	                <tr>
	                    <th>주문번호</th>
	                    <th>주문일자</th>
	                    <th style="width: 500px;">상품정보(주문상세)</th>
	                    <th>구매금액</th>
	                    <th>주문처리상태</th>
	                </tr>
	            </thead>
	            <tbody id="orderTableBody"></tbody>
	        </table>
	            <div id="dataTextDiv" align="center"> </div>
	    </div>
	`;

// 좋아요 리스트 뼈대
const b_likeSection = 
	`<header class="section-title">
            <h1 class="tit">좋아요</h1>
        </header>
        <div id="dataTextDiv"></div>
        <ul class="my-like list-row" id="b_likeContentLi">
        </ul>`;
//리뷰관리 뼈대
const myReviewSection = `
		<!--리뷰 버튼 출력 -->
		<header class="section-title" id="reviewTitle">
	    </header>
	    <table class="n-table table-col my-review" id="wrapReviewArea">
	        
	    </table>
	    <div id="dataTextDiv"></div>
	    `; 
// 작성한 리뷰 테이블 틀
const reviewArea = `<thead>
					    <tr>
					    <th scope="col">책 정보</th>
					    <th scope="col">구매일</th>
					    <th scope="col">리뷰 수정</th>
					</tr>
					</thead>
					<tbody id="myReviewTableBody">
					
					</tbody>`;
//작성한 리뷰 타이틀	
const myReviewTitle = `<h1 class="tit">내가 작성한 리뷰</h1>`;
//작성가능한 리뷰 테이블 틀
const makeReviewArea = `
	   	        <thead>
	   	            <tr>
	   	                <th scope="col">책 정보</th>
	   	                <th scope="col">구매일</th>
	   	                <th scope="col">리뷰 작성</th>
	   	            </tr>
	   	        </thead>
	   	        <tbody id="makeReviewTableBody">   	            
	   	        </tbody>`;
	   	        
const makeReviewTitle = `<h1 class="tit">작성 가능한 리뷰</h1>`;	   	    

// ↓↓↓↓↓↓↓ 마이 페이지 각종 리스트 비동기 실행 함수들 ↓↓↓↓↓↓↓↓

//리뷰 crud 메세지 toast
const toast = new bootstrap.Toast(document.querySelector("#messageToast"));

// 주문 배송 페이지 나오기
function orderList(){
	
	document.getElementById("OrderListButton1").style.color ="#4eac27";
    document.getElementById("LikeListButton1").style.color ="black";
    document.getElementById("ReviewListButton1").style.color ="black";
    document.getElementById("QuestListButton1").style.color ="black";
	
	fetch(`\${ctx}/user/orderList/\${u_id}`)
	.then(res => res.json())
	.then(orderList => {
		const orderListData = document.querySelector("#orderListData");
		document.querySelector("#mypageContent").innerHTML = "";
		document.querySelector("#mypageContent").insertAdjacentHTML("beforeend", sectionDiv);
		document.querySelector("#reviewButtonGroup").innerHTML = "";
		document.querySelector("#orderStatus").innerHTML = "";
		document.querySelector("#orderStatus").insertAdjacentHTML("beforeend", orderStatusDiv);
		document.querySelector("#mypageContent").insertAdjacentHTML("beforeend", orderTable);		
		if(orderList != 0){			
			for (const order of orderList) {
					const orderTableBody = 
						`<tr > 
							<td>\${order.o_number}</td>
							<td>\${order.o_date}</td>
							<td style="cursor:pointer;" id="orDetailPage" onclick="location.href='\${ctx}/cart/orderdetail?o_number=\${order.o_number}'">\${order.b_title} 등 \${order.o_count}권</td>
							<td>\${(order.o_total).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}원</td>
							<td>\${order.o_status}</td>
						 </tr>
						`;
				document.querySelector("#orderTableBody").insertAdjacentHTML("beforeend", orderTableBody);
			}											
		} else {
			document.querySelector("#dataTextDiv").insertAdjacentHTML("beforeend", dataNullText);
		}
	});
}
// 주문 배송 리스트 버튼 클릭 함수
document.querySelector("#OrderListButton1").addEventListener("click", function(){
	orderList();
});
		
// 좋아요 페이지 나오기
document.querySelector("#LikeListButton1").addEventListener("click", function(){
	
	this.style.color ="#4eac27";
    document.getElementById("OrderListButton1").style.color ="black";
    document.getElementById("ReviewListButton1").style.color ="black";
    document.getElementById("QuestListButton1").style.color ="black";
    
	const u_id = document.querySelector("#u_id").value;
	fetch(`\${ctx}/user/bookLikeList/\${u_id}`)
	.then(res => res.json())
	.then(bookLikeList => {
		document.querySelector("#mypageContent").innerHTML = "";
		document.querySelector("#mypageContent").insertAdjacentHTML("beforeend", b_likeSection);
		if(bookLikeList != 0){
			for (const b_like of bookLikeList) {
				const b_likeContent = 
					` <li class="prd-row" >
						<a href="\${ctx}/book/detail/\${b_like.b_code}" class="img-block">
						<img src="${imgUrl}/book/\${b_like.b_code }/\${b_like.b_img}" >
		                </a>
		                <ul class="info">
		                    <li class="genre">\${b_like.b_genre}</li>
		                    <li class="title">\${b_like.b_title}
		                        <a href=""></a>
		                    </li>
		                    <li class="price">\${(b_like.b_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}원</li>
		                    <li class="like">♥\${b_like.b_like}</li>
		                </ul>
		              </li>`;
				document.querySelector("#b_likeContentLi").insertAdjacentHTML("beforeend", b_likeContent);
			}			
		} else {
			document.querySelector("#dataTextDiv").insertAdjacentHTML("beforeend", dataNullText);
		}
		
	});
})
var oneStar = `★`; 
var twoStar = `★★`; 
var threeStar = `★★★`; 
var fourStar = `★★★★`; 
var fiveStar = `★★★★★`;
const reviewButtonGroup = `<div class=" rvbtn_group" id="reviewButtonGroup"></div>`;
// 작성한 리뷰 나오는 함수
function myReview(){
	
	document.getElementById("OrderListButton1").style.color ="black";
    document.getElementById("LikeListButton1").style.color ="black";
    document.getElementById("ReviewListButton1").style.color ="#4eac27";
    document.getElementById("QuestListButton1").style.color ="black";
	
	
	fetch(`\${ctx}/user/reviewList/\${u_id}`)
	.then(res => res.json())
	.then(reviewList => {
		document.querySelector("#mypageContent").innerHTML = "";
		document.querySelector("#mypageContent").insertAdjacentHTML("beforeend", reviewButtonGroup);
		document.querySelector("#mypageContent").insertAdjacentHTML("beforeend", myReviewSection);
		document.querySelector("#reviewTitle").insertAdjacentHTML("beforeend", myReviewTitle);
		document.querySelector("#wrapReviewArea").insertAdjacentHTML("beforeend", reviewArea);
		var reviewButtonDiv = 
			`
			<div id="rvbtn_group" style="text-align: center;">
		        <button id="myReviewBtn" type="button">
		            내가 작성한 리뷰
		        </button>
		        <button id="makeReviewBtn" type="button">
		            작성 가능한 리뷰
		        </button>
		    </div>     
			`;
		document.querySelector("#reviewButtonGroup").insertAdjacentHTML("beforeend", reviewButtonDiv);
		
		if(reviewList != 0){
			for(review of reviewList) {
				var r_star = ``;
				if(`\${review.r_star}` == 5){
					r_star = fiveStar;
				} else if(`\${review.r_star}` == 4){
					r_star = fourStar;
				} else if(`\${review.r_star}` == 3){
					r_star = threeStar;
				} else if(`\${review.r_star}` == 2){
					r_star = twoStar;
				} else if(`\${review.r_star}` == 1){
					r_star = oneStar;
				}
				const reviewModifyButtonId = `reviewModifyButton\${review.r_id}`;
				const reviewRemoveButtonId = `reviewRemoveButton\${review.r_id}`;
				const reviewTableBody = 
					`
					<tr>
		                <td>
		                    <div class="prd-row">
		                    	<a href="\${ctx}/book/detail/\${review.b_code}" class="img-block">
		                       	 <img src="${imgUrl}/book/\${review.b_code }/\${review.b_img}" >
		                        </a>
		                        <ul class="info">
		                            <li class="genre">\${review.b_genre}</li>
		                            <li class="title">\${review.b_title}
		                                <a href=""></a>
		                            </li>
		                            <li class="star">\${r_star}</li>
		                        </ul>
		                    </div>
		                </td>
		                <td>2022-12-14</td>
		                <td>
		                    <div class="button-block">
		                        <button class="review-btn" id="\${reviewModifyButtonId}" data-bs-toggle="modal" data-bs-target="#modifyReviewModal" data-review-id="\${review.r_id}">수정</button>
		                    </div>
		                    <div class="button-block">                
		                        <button class="review-btn" id="\${reviewRemoveButtonId}" data-bs-toggle="modal" data-bs-target="#removeReviewModal" data-review-id="\${review.r_id}">삭제</button>
		                    </div>
		                </td>
		            </tr>
					`;
				document.querySelector("#myReviewTableBody").insertAdjacentHTML("beforeend",reviewTableBody );
				
				//리뷰 수정버튼에 내용 넣기
				document.querySelector("#" + reviewModifyButtonId).addEventListener("click", function(){
					document.querySelector("#reviewModifyButton").setAttribute("data-review-id", this.dataset.reviewId);
					readReviewAndSetModalForm(this.dataset.reviewId);
				})
				//제거 버튼에 데이터
				document.querySelector("#" + reviewRemoveButtonId).addEventListener("click", function(){
					document.querySelector("#reviewRemoveButton").setAttribute("data-review-id", this.dataset.reviewId);
				})
				document.getElementById("myReviewBtn").style.backgroundColor ="#4eac27";
			    document.getElementById("makeReviewBtn").style.backgroundColor ="rgba(0,0,0,0)";
			    document.getElementById("myReviewBtn").style.color ="white";
			    document.getElementById("makeReviewBtn").style.color ="rgb(211, 211, 211)";
			}
			
		} else {
			document.querySelector("#dataTextDiv").insertAdjacentHTML("beforeend", dataNullText);
			document.getElementById("myReviewBtn").style.backgroundColor ="#4eac27";
		    document.getElementById("makeReviewBtn").style.backgroundColor ="rgba(0,0,0,0)";
		    document.getElementById("myReviewBtn").style.color ="white";
		    document.getElementById("makeReviewBtn").style.color ="rgb(211, 211, 211)";
		}
			
		// 작성한 리뷰 목록 버튼 클릭시
		document.querySelector("#myReviewBtn").addEventListener("click", function(){
			
			document.querySelector("#reviewTitle").innerHTML = "";
			document.querySelector("#wrapReviewArea").innerHTML = "";
			document.querySelector("#dataTextDiv").innerHTML = "";
			document.querySelector("#reviewTitle").insertAdjacentHTML("beforeend", myReviewTitle);
			document.querySelector("#wrapReviewArea").insertAdjacentHTML("beforeend", reviewArea);
			if(reviewList != 0){
				for(review of reviewList) {
					var r_star = ``;
					if(`\${review.r_star}` == 5){
						r_star = fiveStar;
					} else if(`\${review.r_star}` == 4){
						r_star = fourStar;
					} else if(`\${review.r_star}` == 3){
						r_star = threeStar;
					} else if(`\${review.r_star}` == 2){
						r_star = twoStar;
					} else if(`\${review.r_star}` == 1){
						r_star = oneStar;
					}
					const reviewModifyButtonId = `reviewModifyButton\${review.r_id}`;
					const reviewRemoveButtonId = `reviewRemoveButton\${review.r_id}`;
					const reviewTableBody = 
						`
						<tr>
		                <td>
		                    <div class="prd-row">
		                    	<a href="\${ctx}/book/detail/\${review.b_code}" class="img-block">
		                    	<img src="${imgUrl}/book/\${review.b_code }/\${review.b_img}" >
		                        </a>
		                        <ul class="info">
		                            <li class="genre">\${review.b_genre}</li>
		                            <li class="title">\${review.b_title}
		                                <a href=""></a>
		                            </li>
		                            <li class="star">\${r_star}</li>
		                        </ul>
		                    </div>
		                </td>
		                <td>2022-12-14</td>
		                <td>
		                    <div class="button-block">
		                        <button class="review-btn" id="\${reviewModifyButtonId}" data-bs-toggle="modal" data-bs-target="#modifyReviewModal" data-review-id="\${review.r_id}">수정</button>
		                    </div>
		                    <div class="button-block">                
		                        <button class="review-btn" id="\${reviewRemoveButtonId}" data-bs-toggle="modal" data-bs-target="#removeReviewModal" data-review-id="\${review.r_id}">삭제</button>
		                    </div>
		                </td>
		            </tr>
						`;
					document.querySelector("#myReviewTableBody").insertAdjacentHTML("beforeend",reviewTableBody );
					
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
				
			} else {
				document.querySelector("#dataTextDiv").insertAdjacentHTML("beforeend", dataNullText);
			}
			
			
			document.getElementById("myReviewBtn").style.backgroundColor ="#4eac27";
		    document.getElementById("makeReviewBtn").style.backgroundColor ="rgba(0,0,0,0)";
		    document.getElementById("myReviewBtn").style.color ="white";
		    document.getElementById("makeReviewBtn").style.color ="rgb(211, 211, 211)";
		})
			
		// 작성 가능한 리뷰 목록 클릭
		document.querySelector("#makeReviewBtn").addEventListener("click", function(){
			makeReviewList();
			document.getElementById("makeReviewBtn").style.backgroundColor ="#4eac27";
		    document.getElementById("myReviewBtn").style.backgroundColor ="rgba(0,0,0,0)";
		    document.getElementById("makeReviewBtn").style.color ="white";
		    document.getElementById("myReviewBtn").style.color ="rgb(211, 211, 211)";
		})
	});
}

//작성한 리뷰 리스트 나오기 버튼 클릭
document.querySelector("#ReviewListButton1").addEventListener("click", function(){
	myReview();
})

// 리뷰 수정 모달에 데이터 들어간다
function readReviewAndSetModalForm(r_id){
	fetch(`\${ctx}/review/get/\${r_id}`)
	.then(res => res.json())
	.then(review => {
		document.querySelector("#reviewModifyContent").value = review.r_content;	
	})	
}

// 작성 가능한 리뷰 목록 나오는 함수
function makeReviewList(){
		const u_id = document.querySelector("#u_id").value;
		
		fetch(`\${ctx}/user/makeReviewList/\${u_id}`)
		.then(res => res.json())
		.then(makeReviewList => {
			document.querySelector("#reviewTitle").innerHTML = "";
			document.querySelector("#wrapReviewArea").innerHTML = "";
			document.querySelector("#dataTextDiv").innerHTML = "";
			document.querySelector("#reviewTitle").insertAdjacentHTML("beforeend", makeReviewTitle);
			document.querySelector("#wrapReviewArea").insertAdjacentHTML("beforeend", makeReviewArea);
			if(makeReviewList != 0){
				for (const review of makeReviewList) {
					const reviewB_code = `${review.b_code}`;
					const reviewButtonId = `reviewButton\${review.b_code}`;
					const makeReviewTableBody = 				
						`
						<tr>
			                <td>
			                    <div class="prd-row">
			                        <a href="\${ctx}/book/detail/\${review.b_code}" class="img-block">
			                        <img src="${imgUrl}/book/\${review.b_code }/\${review.b_img}" >
			                        </a>
			                        <ul class="info">
			                            <li class="genre">\${review.b_genre}</li>
			                            <li class="title">\${review.b_title}
			                                <a href=""></a>
			                            </li>
			                        </ul>
			                    </div>
			                </td>
			                <td>2022-12-14</td>
			                <td>
			                    <div class="button-block">
			                        <button class="review-btn" id="\${reviewButtonId}" data-bs-toggle="modal" data-bs-target="#makeReviewModal" data-review-id="\${review.b_code}">작성하기</button>
			                    </div>
			                    
			                </td>
			            </tr>`;		 
					document.querySelector("#makeReviewTableBody").insertAdjacentHTML("beforeend",makeReviewTableBody);
					document.querySelector("#" + reviewButtonId).addEventListener("click", function(){
						document.querySelector("#reviewSendButton").setAttribute("data-review-id", this.dataset.reviewId);	
					})
				}
			} else {
				document.querySelector("#dataTextDiv").insertAdjacentHTML("beforeend", dataNullText);
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
	fetch(`\${ctx}/review/add`, {
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
	fetch(`\${ctx}/review/modify`, {
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
	fetch(`\${ctx}/review/remove/\${reviewId}`, {
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

// 문의 리스트 뼈대
const myQuestSection = `
	<header class="section-title">
	    <h1 class="tit">나의 문의</h1>
	    <div class="quest-btn-div">
	        <button onclick="location.href='\${ctx}/customer/question'" class="quest-btn">문의 작성하기</button>
	    </div>	        
	</header>
	<table class="n-table table-col my-quest" id="wrapQuestArea">
	    <thead>
	        <tr>
	            <th scope="col">문의 유형</th>
	            <th scope="col">제목</th>
	            <th scope="col">처리상태</th>
	            <th scope="col">작성일</th>
	        </tr>
	    </thead>
	    <tbody id="questTableBody">
	    </tbody>
	</table>
	<div id="dataTextDiv"></div>
	`;


// 문의 리스트 나오기
document.querySelector("#QuestListButton1").addEventListener("click", function(){
	myQuestion();
});
function myQuestion(){
	document.getElementById("OrderListButton1").style.color ="black";
    document.getElementById("LikeListButton1").style.color ="black";
    document.getElementById("ReviewListButton1").style.color ="black";
    document.getElementById("QuestListButton1").style.color ="#4eac27";
	
	const u_id = document.querySelector("#u_id").value;
	fetch(`\${ctx}/user/questList/\${u_id}`)
	.then(res => res.json())
	.then(questList => {
		const tableContainer = document.querySelector("#tableContainer");
		document.querySelector("#mypageContent").innerHTML = "";
		document.querySelector("#mypageContent").insertAdjacentHTML("beforeend", myQuestSection);
		
		if(questList != 0){
			for (const quest of questList) {
				const questReadButtonId = `questButton\${quest.q_number}`;
				var questAnsBtn = ``;
				if(`\${quest.a_content}` != `null`){
					questAnsBtn = `	답변완료 <br>								
									<button onclick='window.open("\${ctx}/user/userAnswer?q_number=\${quest.q_number}", "_blank", "width=600, height=800, top=100px,left=100px,menubar=no,toolbar=no,location=no,status=no,scrollbar=no")' id="\${questReadButtonId}" 
									class="quest-btn" style = "border-radius: 5px; border-color: whitesmoke; margin-top: 3px;">답변 확인</button>`;
				} else {
					questAnsBtn = `답변 대기중`;
				}
				const questTableBody = 
					`
					<tr>
			            <td>\${quest.q_option}</td>
			            <td>\${quest.q_title}</a></td>
			            <td>
				            \${questAnsBtn}
			            </td>
			            <td>\${quest.q_date}</td>
			        </tr>
					`;
				document.querySelector("#questTableBody").insertAdjacentHTML("beforeend", questTableBody);
			}			
		} else {
			document.querySelector("#dataTextDiv").insertAdjacentHTML("beforeend", dataNullText);
		}
	});
};

//리뷰 수정 모달에 데이터 들어간다
function readReviewAndSetModalForm(r_id){
	fetch(`\${ctx}/review/get/\${r_id}`)
	.then(res => res.json())
	.then(review => {
		document.querySelector("#reviewModifyContent").value = review.r_content;	
	})	
}
	
// 회원정보 수정 모달에 데이터 들어간다
function readUserInfoAndSetModal(u_id){
	fetch(`\${ctx}/user/editInfo/\${u_id}`)
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
		
	fetch(ctx + "/user/editInfo" ,  {
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
	.then(() => myQuestion());
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

// 이메일 중복확인 버튼 클릭하면 일어나는일
emailButton1.addEventListener("click", function(){
	availableEmail = false;
		
	const email = emailInput1.value;
		
	fetch(`\${ctx}/user/changeEmail`,{
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
myQuestion();
// 모달 내용 초기화
$("#makeReviewModal").on('hidden.bs.modal', function (e) {
	$(this).find('form')[0].reset();
}); 

$("#modifyReviewModal").on('hidden.bs.modal', function (e) {
	$(this).find('form')[0].reset();
});

</script>	
</body>
</html>