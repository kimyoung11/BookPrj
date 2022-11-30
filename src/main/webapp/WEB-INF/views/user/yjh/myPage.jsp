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
#reviewForm fieldset{
	display: inline-block;
	direction: rtl;
	border: 0;
}
#reviewForm fieldset legend{
	text-align: right;
}
#reviewForm input[type=radio]{
	display: none;
}
#reviewForm label{
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}
#reviewForm label:hover{
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewForm label:hover ~ label{
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewForm input[type=radio]:checked ~ label{
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
</style>
<body>
	<my:header></my:header>
	<div class="container-md bg" style="width: 1200px">
		<div class="top-section">
			<h4 style="font-weight: 600; padding-top: 30px; padding-bottom: 30px">
				마이페이지</h4>
			<div
				class="login-box mb-3 mt-3 rounded d-flex align-items-center flex-row p-3"
				style="width: 400px; height: 200px; background-color: #bed6e0">
				<div class="col align-items-center">
					<c:url value="/user/editInfo" var="editLink">
						<c:param name="id" value="${user.id }" />
					</c:url>
					<a class="left-box m-2 row" href="${editLink }"
						style="background: #fff; width: 90px; height: 90px; border-radius: 70%; overflow: hidden; position: relative; box-shadow: 0 0 14px #8cc1db;">
						<span class="fa-regular fa-user fa-2xl"
						style="position: absolute; top: 46px; left: 19px"></span>
					</a>
					<div class="row">
						<h5 style="margin-left: 14px">${user.id }님</h5>
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

		<div class="accordion accordion-flush" id="accordionFlushExample">

			<!-- 주문 리스트 출력 -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingOne">
					<button
						class="accordion-button collapsed btn btn-primary rounded mt-3 mb-3 p-3"
						style="width: 95%" type="button" data-bs-toggle="collapse"
						data-bs-target="#flush-collapseOne" aria-expanded="false"
						aria-controls="flush-collapseOne">주문 배송 내역</button>
				</h2>
				<div id="flush-collapseOne"
					class="list-section accordion-collapse collapse"
					aria-labelledby="flush-headingOne"
					data-bs-parent="#accordionFlushExample">
					<table class="table accordion-body"
						style="border: 2px solid black; border-radius: 10px">
						<thead>
							<tr>
								<th scope="col">주문일자</th>
								<th scope="col">주문번호</th>
								<th scope="col">배송상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orderList }" var="order">
								<tr>
									<th scope="row">${order.orderDate }</th>
									<td>${order.orderNum}</td>
									<td>${order.orderStatus}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br />
				</div>
			</div>

			<!-- 좋아요 리스트 출력 -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingTwo">
					<button
						class="accordion-button collapsed btn btn-primary rounded mt-3 mb-3"
						style="width: 95%" type="button" data-bs-toggle="collapse"
						data-bs-target="#flush-collapseTwo" aria-expanded="false"
						aria-controls="flush-collapseTwo">좋아요 보기</button>
				</h2>

				<div id="flush-collapseTwo"
					class="list-section accordion-collapse collapse"
					aria-labelledby="flush-headingTwo"
					data-bs-parent="#accordionFlushExample">
					<table class="table table-sm accordion-body"
						style="border: 2px solid black; border-radius: 10px">
						<thead>
							<tr>
								<th scope="col">좋아요 누른 책</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${likeList }" var="like">
								<tr>
									<th scope="row" class="" style="justify-content : center">${like.bookTitle }</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br />
				</div>
			</div>

			<!-- 리뷰 리스트 출력 -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingThree">
					<button
						class="accordion-button collapsed btn btn-primary rounded mt-3 mb-3"
						style="width: 95%" type="button" data-bs-toggle="collapse"
						data-bs-target="#flush-collapseThree" aria-expanded="false"
						aria-controls="flush-collapseThree">리뷰 관리</button>
				</h2>

				<div id="flush-collapseThree"
					class="list-section accordion-collapse collapse"
					aria-labelledby="flush-headingThree"
					data-bs-parent="#accordionFlushExample">
					<table class="table accordion-body"
						style="border: 2px solid black; border-radius: 10px">
						<thead>
							<tr>
								<th scope="col">책 제목</th>
								<th scope="col">별점</th>
								<th scope="col">내용</th>
								<th scope="col">리뷰버튼</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${reviewList }" var="review">
								<tr>
									<th scope="row">${review.bookTitle }</th>
									<td>${review.reviewStar}</td>
									<td>${review.reviewContent}</td>
									<td>
										<button id="reviewButton" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">
										  리뷰 작성
										</button>
										
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br />
				</div>
			</div>

			<!-- 문의 리스트 출력 -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingFour">
					<button
						class="accordion-button collapsed btn btn-primary rounded mt-3 mb-3"
						type="button" style="width: 95%" data-bs-toggle="collapse"
						data-bs-target="#flush-collapseFour" aria-expanded="false"
						aria-controls="flush-collapseFour">내 문의</button>
				</h2>
				<div id="flush-collapseFour"
					class="list-section accordion-collapse collapse"
					aria-labelledby="flush-headingFour"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<table class="table"
							style="border: 2px solid black; border-radius: 10px">
							<thead>
								<tr>
									<th scope="col">문의 제목</th>
									<th scope="col">문의 내용</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${questList }" var="quest">
									<tr>
										<th scope="row">${quest.q_title}</th>
										<td>${quest.q_content}</td>
										<td>${quest.q_date}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br />
					</div>
				</div>
			</div>
		</div>


	</div>
	<!-- 리뷰 작성 모달창 -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 작성</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form class="mb-3" name="reviewForm" id="reviewForm" method="post">
							<fieldset>
								<span class="text-bold">별점을 선택해주세요</span>
								<input type="radio" name="reviewStar" value="5" id="rate1"><label for="rate1">★</label>
								<input type="radio" name="reviewStar" value="4" id="rate2"><label for="rate2">★</label>
								<input type="radio" name="reviewStar" value="3" id="rate3"><label for="rate3">★</label>
								<input type="radio" name="reviewStar" value="2" id="rate4"><label for="rate4">★</label>
								<input type="radio" name="reviewStar" value="1" id="rate5"><label for="rate5">★</label>
							</fieldset>
						</form>
						<form>
				          <div class="mb-3">
				            <label for="recipient-name" class="col-form-label">제목</label>
				            <input type="text" class="form-control" id="recipient-name">
				          </div>
				          <div class="mb-3">
				            <label for="message-text" class="col-form-label">내용</label>
				            <textarea class="form-control" id="message-text"></textarea>
				          </div>
				        </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button id="reviewConfirmButton" type="button" class="btn btn-primary">작성</button>
					</div>
				</div>
			</div>
		</div>

	<my:footer></my:footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
<script>
	document.querySelector("#reviewConfirmButton").addEventListener("click", function(){
		
	})
</script>	
</body>
</html>