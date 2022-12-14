<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">
</head>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.star-rating {
	/* border:solid 1px #ccc; */
	display: flex;
	flex-direction: row-reverse;
	font-size: 1.5em;
	justify-content: space-around;
	padding: 0 .2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	color: #ccc;
	cursor: pointer;
}

.star-rating :checked ~ label {
	color: #f90;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	color: #f90;
}
</style>
<body>
	<my:headerBar></my:headerBar>
	<div class="container-fluid container-wrapper" style="width: 62.5%">
		<div id="modalComponent"></div>
		<div class="book-info">
			<div class="row">
				<div class="col-4">
					<img src="${book.b_img }" alt="" class="mt-2">
				</div>
				<div class="col-8 mt-3">
					<div class="row">
						<h4 class="mb-3 col">${book.b_title }</h4>
						<c:if test="${u_id!=null }">
							<div class="col-1 likeIcon">
								<c:if test="${likeStatus }">
									<i class="fa-solid fa-heart fa-xl"></i>
								</c:if>
								<c:if test="${!likeStatus }">
									<i class="fa-regular fa-heart fa-xl"></i>
								</c:if>
							</div>
						</c:if>
						<c:if test="${u_id ==null }">
							<div class="col-1">
								<c:if test="${likeStatus }">
									<i class="fa-solid fa-heart fa-xl"></i>
								</c:if>
								<c:if test="${!likeStatus }">
									<i class="fa-regular fa-heart fa-xl"></i>
								</c:if>
							</div>
						</c:if>

						${likeCount } ${bookCnt } <span id="likeContainer">
							${book.b_like } </span>
					</div>
					<div class="mb-3">회원가</div>
					${book.b_price }
					<hr>
					<div class="mb-3">배송비</div>
					2500원
					<hr>
					<div class="mb-3">배송 예정</div>
					구매 후 3일 이내
					<div class="mb-3">
						<c:url value="${pageContext.request.contextPath}/book/order"
							var="link"></c:url>
						<form class="d-flex mb-3" action="${link }" style="float: right;"
							id="submitForm1">
							<input type="hidden" value="${book.b_code }" name="b_code">
							<input class="cntValidate" type="number"
								style="width: 100px; text-align: center" placeholder="수량 입력"
								name="c_cnt" required="required"
								onchange='
							document.querySelector("#buyInput").value = this.value'>
						</form>
					</div>
					<hr>
					<div>
						<c:if test="${u_id != null }">
							<button type="button" class="btn btn-dark mb-1 buy"
								style="width: 100%;" value="${book.b_code }" onclick="buyBook()">바로
								구매하기</button>
						</c:if>
						<c:if test="${u_id ==null }">
							<c:url value="${pageContext.request.contextPath }/user/login.do" var="loginLink"></c:url>
		                 	<a type="button" class="btn btn-dark mb-1 buy"
								style="width: 100%;" href="${loginLink }">
		                 		바로 구매하기
		                 	</a>
						</c:if>
					</div>
					<div>
						<c:url value="${pageContext.request.contextPath }/book/cart"
							var="link2"></c:url>
						<form class="d-flex mb-3" action="${link2 }" style="float: right;"
							id="submitForm2">
							<input type="hidden" value="${book.b_code }" name="b_code">
							<input id="buyInput" class="cntValidate" type="hidden"
								style="width: 100px; text-align: center" placeholder="수량 입력"
								name="c_cnt" required="required">
						</form>
						<c:if test="${u_id != null }">
						<button type="button" class="btn btn-dark want"
							style="width: 100%;" value="${book.b_code }" onclick="wantBook()">장바구니</button>
						</c:if>
						<c:if test = "${u_id ==null }">
							<c:url value="${pageContext.request.contextPath }/user/login.do" var="loginLink"></c:url>
	                 	<a type="button" class="btn btn-dark want"
							style="width: 100%;" href="${loginLink }">
	                 		장바구니
	                 	</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="book-detail mt-3 mb-5">
			<h6>도서 상세정보</h6>
			<hr style="border: 1px solid black;">
			<div>Lorem ipsum dolor sit amet consectetur adipisicing elit.
				Praesentium ab soluta atque dolorum natus, ducimus incidunt
				cupiditate sunt culpa quisquam qui omnis, cum velit sint molestiae
				accusantium vel minus rerum.</div>
		</div>
		<div class="book-category mt-3 mb-5">
			<h6>카테고리 분류</h6>
			<hr style="border: 1px solid black;">
			<div>Lorem ipsum dolor sit amet consectetur adipisicing elit.
				Praesentium ab soluta atque dolorum natus, ducimus incidunt
				cupiditate sunt culpa quisquam qui omnis, cum velit sint molestiae
				accusantium vel minus rerum.</div>
		</div>
		<div class="book-introduce mt-3 mb-5">
			<h6>책 소개</h6>
			<hr style="border: 1px solid black;">
			<div>Lorem ipsum dolor sit amet consectetur adipisicing elit.
				Praesentium ab soluta atque dolorum natus, ducimus incidunt
				cupiditate sunt culpa quisquam qui omnis, cum velit sint molestiae
				accusantium vel minus rerum.</div>
		</div>
		<div class="book-detail-page mt-3 mb-5">
			<h6>상세 페이지</h6>
			<hr style="border: 1px solid black;">
			<div>Lorem ipsum dolor sit amet consectetur adipisicing elit.
				Praesentium ab soluta atque dolorum natus, ducimus incidunt
				cupiditate sunt culpa quisquam qui omnis, cum velit sint molestiae
				accusantium vel minus rerum.</div>
		</div>
		<div class="book-review mt-3">
			<h6>고객 리뷰</h6>
			<hr style="border: 1px solid black;">
			<div class="d-flex align-items-center ">
				<div class="star-rating" style="margin: 0 auto;">
					<input type="radio" id="5-stars" name="rating" value="5"
						onclick="check(1)" /> <label for="5-stars" class="star">&#9733;</label>
					<input type="radio" id="4-stars" name="rating" value="4"
						onclick="check(2)" /> <label for="4-stars" class="star">&#9733;</label>
					<input type="radio" id="3-stars" name="rating" value="3"
						onclick="check(3)" /> <label for="3-stars" class="star">&#9733;</label>
					<input type="radio" id="2-stars" name="rating" value="2"
						onclick="check(4)" /> <label for="2-stars" class="star">&#9733;</label>
					<input type="radio" id="1-star" name="rating" value="1"
						onclick="check(5)" /> <label for="1-star" class="star">&#9733;</label>
				</div>
			</div>
			<div class="d-flex justify-content-center">
				<span class="starValue"></span>
			</div>
			<hr style="border: 1px solid black;">
		</div>
		<div class="customer-review">
			<div class="review-1">
				<div>구매자 리뷰</div>
				<div>Lorem ipsum dolor sit amet consectetur adipisicing elit.
					Blanditiis vel laudantium sint est quod voluptates, dolores
					expedita doloribus quam enim amet facere consequatur saepe.
					Necessitatibus maiores fugit non debitis culpa.</div>
			</div>
			<div class="review-1">
				<div>구매자 리뷰</div>
				<div>Lorem ipsum dolor sit amet consectetur adipisicing elit.
					Blanditiis vel laudantium sint est quod voluptates, dolores
					expedita doloribus quam enim amet facere consequatur saepe.
					Necessitatibus maiores fugit non debitis culpa.</div>
			</div>
			<div class="review-1">
				<div>구매자 리뷰</div>
				<div>Lorem ipsum dolor sit amet consectetur adipisicing elit.
					Blanditiis vel laudantium sint est quod voluptates, dolores
					expedita doloribus quam enim amet facere consequatur saepe.
					Necessitatibus maiores fugit non debitis culpa.</div>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
	
	const ctx = "${pageContext.request.contextPath}";

	let likeIcon = document.querySelector(".likeIcon");
	let toggle = ${likeStatus};
	document.querySelector(".likeIcon").addEventListener("click",function(){
		
		const data = {
				b_code : ${book.b_code},
				u_id : `<%= session.getAttribute("id")%>`
		}
		console.log(data);
		if(toggle === true){
			likeIcon.innerHTML =`<i class="fa-regular fa-heart fa-xl"></i>`;
			fetch(`${ctx}/book/like`,{
				method : "put",
				headers :{
					"Content-Type" : "Application/json"
				},
				body : JSON.stringify(data)
			}).then((res) => res.json())
			.then((res) => document.getElementById("likeContainer").innerText = res.bookCnt)
			.then(() => toggle = !toggle)
		/* 	.then(location.reload()); */ 
		}else{
			likeIcon.innerHTML =`<i class="fa-solid fa-heart fa-xl"></i>`;
			fetch(`${ctx}/book/like`, {
				method : "post",
				headers : {
					"Content-Type" : "Application/json"
				},
				body : JSON.stringify(data)
			}).then((res) => res.json())
			.then((res) => document.getElementById("likeContainer").innerText = res.bookCnt)
			.then(() => toggle = !toggle)
			/* .then(location.reload()); */
		}
		
	})

	 function check(value){
         const ratings = document.querySelectorAll('input[name="rating"]')[value-1];
         document.querySelector(".starValue").innerHTML=`<h3>${ratings.value} / 5 </h3>`;
     }
	 
	 function makeAlert(){
		 const message = "${message}";
		 console.log(message);
	 }
	

	 function wantBook(target){ //장바구니
		 const c_cnt =document.querySelector(".cntValidate").value;
		 if(c_cnt != null && c_cnt >0){
			 document.querySelector('#submitForm2').submit();
			 document.querySelector("#modalComponent").innerHTML =`
				 <!-- Modal -->
 				<div class="modal fade" id="basketModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 				  <div class="modal-dialog">
 				    <div class="modal-content">
 				      <div class="modal-header">
 				        <h1 class="modal-title fs-5" id="exampleModalLabel">장바구니에 추가되었습니다.</h1>
 				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
 				      </div>
 				      <div class="modal-body">
 				      장바구니로 이동하시겠습니까?
 				      </div>
 				      <div class="modal-footer">
 				     	<button id="deleteButton"  type="button" class="btn btn-primary" onclick ="location.href = '${ctx}/cart/cart'">예</button>
 				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
 				        
 				      </div>
 				    </div>
 				  </div>
 				</div>
			 `;
			 const myModal = new bootstrap.Modal("#basketModal",{});
			 myModal.show();
		 }else{
			 alert('책 수량 입력해주세요');
		 }
		 
};
	 
	 
	 function buyBook(){ //바로구매
		 const c_cnt =document.querySelector(".cntValidate").value;
		 console.log(c_cnt);
		  if(c_cnt != null && c_cnt >0){
			 document.querySelector('#submitForm1').submit();
		 }else{	
			 alert('책 수량 입력해주세요');
		 } 
	 }
	 
	 
	</script>
</body>
</html>
