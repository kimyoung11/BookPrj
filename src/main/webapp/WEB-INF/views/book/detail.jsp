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

.front-stars, .back-stars, .star-rating {
  display: flex;
}

.star-rating {
  align-items: center;
  font-size: 3em;
  justify-content: center;
  margin-top: 50px;
}

.back-stars {
  color:lightgrey;
  position: relative;
  text-shadow: 4px 4px 10px #843a3a;
}

.front-stars {
  color:rgb(250 208 0 / 99%);
  overflow: hidden;
  position: absolute;
  text-shadow: 2px 2px 5px #d29b09;
  top: 0;
  transition: all 0.5s;
}

.percent {
  color:rgb(250 208 0 / 99%);
  font-size: 1.5em;
}
#btn-button:hover{
	color: white;
	background-color: #4eac27;
	border-color: #4eac27;
}

#btn-button2:active{
		color: white;
		background-color: #4eac27;
		border-color: #4eac27;
		}
	
#btn-button{
	color:#4eac27;
	border-color: #4eac27;
}

	.pagination{
		--bs-pagination-color: #4eac27;
		}


</style>
<body>
	<my:headerBar></my:headerBar>
	
	<div class="container-fluid container-wrapper" style="width: 62.5%">
		<div id="modalComponent"></div>
		<div class="book-info">
			<div class="row">
				<div class="col-4">
					<img src="https://bookproject-20221208.s3.ap-northeast-2.amazonaws.com/book/${book.b_code }/${URLEncoder.encode(book.b_img,'utf-8')}" alt="" class="mt-2" style="height: 480px; width: 320px;">
				</div>
				<div class="col-8 mt-3">
					<div class="row">
						<h3 class="mb-5 col">${book.b_title }</h3>
						<c:if test="${u_id!=null }">
							<div class="col-1 likeIcon">
								<c:if test="${likeStatus }">
									<i class="fa-solid fa-heart fa-xl"  style="color:#4eac27"></i>
								</c:if>
								<c:if test="${!likeStatus }">
									<i class="fa-regular fa-heart fa-xl" style="color:#4eac27"></i>
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

						<span id="likeContainer">
							</span>
					</div>
					<div class="mb-3" style="font-weight: 500">회원가</div>
					<span id="priceInput">${book.b_price }</span>
					<hr>
					<div class="mb-3" style="font-weight: 500">카테고리</div>
					국내도서 > ${book.b_genre }
					<hr>
					<div class="mb-3" style="font-weight: 500">배송 예정</div>
					구매 후 3일 이내
					<hr>
					<div class="mb-3 row justify-content-end">
						<div class="col">
						<c:url value="${pageContext.request.contextPath}/order"
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
					</div>
					<div class="row">
						<div class="col">
						<c:if test="${u_id != null }">
							<button type="button" class="btn btn-dark mb-1 buy"
								style="width: 100%; background: #4eac27; border: none; background-color:#4eac27;" value="${book.b_code }" onclick="buyBook()">바로
								구매하기</button>
						</c:if>
						<c:if test="${u_id ==null }">
							<c:url value="/user/login.do" var="loginLink"></c:url>
		                 	<a type="button" class="btn btn-dark mb-1 buy"
								style="width: 100%; background: #4eac27; border: none; background-color:#4eac27;" href="${loginLink }">
		                 		바로 구매하기
		                 	</a>
						</c:if>
						</div>
						<div class="col">
						<c:if test="${u_id != null }">
						<button type="button" class="btn btn-light" id="btn-button"
							style="width: 100%;" value="${book.b_code }" onclick="wantBook()">장바구니</button>
						</c:if>
						<c:if test = "${u_id ==null }">
							<c:url value="/user/login.do" var="loginLink"></c:url>
	                 	<a type="button" class="btn btn-light" id="btn-button"
							style="width: 100%;" href="${loginLink }">
	                 		장바구니
	                 	</a>
						</c:if>
						</div>
					</div>
					<div>
						<c:url value="${pageContext.request.contextPath }/cart"
							var="link2"></c:url>
						<form class="d-flex mb-3" action="${link2 }" style="float: right;"
							id="submitForm2">
							<input type="hidden" value="${book.b_code }" name="b_code">
							<input id="buyInput" class="cntValidate" type="hidden"
								style="width: 100px;" text-align: center" placeholder="수량 입력"
								name="c_cnt" required="required">
						</form>
					</div>
				</div>
			</div>
		</div>
		<div>
	</div>
		<div class="book-detail mt-3 mb-5">
			<h6 style="font-weight: 500;">도서 상세정보</h6>
			<hr style="border: 1px solid black;">
			<div align="right">
				<br>
				쪽수,무게,크기 : 260쪽 | 308g | 128*188*20mm <br>
				ISBN13 : 912938123 <br>
				ISBN10 : 123918232
			</div>
		</div>
		<div class="book-category mt-3 mb-5">
			<h6 style="font-weight: 500">카테고리 분류</h6>
			<hr style="border: 1px solid black;">
			<div>국내도서 > ${book.b_genre }</div>
		</div>
		<div class="book-introduce mt-3 mb-5">
			<h6 style="font-weight: 500">책 소개</h6>
			<hr style="border: 1px solid black;">
			<div class="row">
			<img class="col-4" src="${pageContext.request.contextPath}/content/book1.jpg" alt="책사진" height="332px;"/>
			<pre class="col-6" style="font-size: 15px;">
			
	아프고 다친 채로도 살아갈 수 있는 세계를 꿈꾸며
	“패배자”들을 향해 뛰는 심장으로 써내려간 뜨거운 글쓰기
	
	슬픔의 자리에서 비로소 열리는
	가능성에 관하여
	
	“인생의 예기치 않은 사건 앞에서,
	책 속의 말들이 다 무너지는 걸 목도하고도
	다시 책 앞에 선 사람의 이야기”
	_김애란(소설가)
	
	슬픔에게 건네는 온기 어린 마침표
			</pre></div>
		</div>
		<div class="book-detail-page mt-3 mb-5">
			<h6 style="font-weight: 500">상세 페이지</h6>
			<hr style="border: 1px solid black;">
			<div style="padding-top: 20px; padding-bottom: 30px;"><p>나를 이렇게 대한 여자는 네가 처음이야.” 왜 12시였을까. 왜 그렇게 황급히 떠났을까. 내 아내가 되고 싶어 온 게 아닌가? <br>
			아름다운 여인은 많았지만 너무 뻔했어요. 다들 좀 비슷비슷하달까. 아무도 나를 완전히 사로잡지는 못했죠. <br>
			그런데 그녀가 왔다간 다음, 나는 예전의 내 자리로 돌아갈 수가 없게 됐어요. <br>아, 그녀는 내가 뭐에 미치는지 너무 잘 알았던 게 아닐까요? 
			묘하게 엇박이 나던 춤은 도대체 어디서 배운 거지? <br> ---「〈신데렐라〉 왕자, 그 후의 인터뷰」중에서</p>

			<p>왕자는 바다에 빠졌고 인어공주는 사랑에 빠졌다. 어딘가에 빠졌다는 것은 그 어딘가로부터 빠져나와야 할 것 같은 기분이 들게 한다. <br>
			그런데 그 깊이가 만만치 않다. 충분히 일어서서 걸어 나올 수 있는 깊이였다는 것은 시간이 지나고 나서야 알게 될 뿐이다. <br>
			---「〈인어공주〉 나는 나를 파괴할 권리가 있다」중에서</p>
		</div>
		<div class="book-review mt-3">
			<h6 style="font-weight: 500">고객 리뷰</h6>
			<hr style="border: 1px solid black;">
			<div class="d-flex justify-content-center align-item-center">
				<div class="star-rating">
				    <div class="back-stars">
				        <i class="fa fa-star" aria-hidden="true"></i>
				        <i class="fa fa-star" aria-hidden="true"></i>
				        <i class="fa fa-star" aria-hidden="true"></i>
				        <i class="fa fa-star" aria-hidden="true"></i>
				        <i class="fa fa-star" aria-hidden="true"></i>
				        
				        <div class="front-stars" style="width:  ${reviewAvg*20}%">
				            <i class="fa fa-star" aria-hidden="true"></i>
				            <i class="fa fa-star" aria-hidden="true"></i>
				            <i class="fa fa-star" aria-hidden="true"></i>
				            <i class="fa fa-star" aria-hidden="true"></i>
				            <i class="fa fa-star" aria-hidden="true"></i>
				        </div>
				    </div>
				</div>  
			</div>
			<div class="d-flex justify-content-center mt-3 mb-5">
				<span class="starValue"><span style="font-size: 20px; font-weight: 700">${peopleCnt}</span>명의 회원이 평가한 평균별점 :<span style="font-size: 20px; font-weight: 700">${reviewAvg }</span></span>
			</div>
		</div>
		<c:forEach var="item" items="${review }">
			<div class="card mb-2">
			  <div class="card-header">
			    <div><i class="fa-solid fa-user"></i> : ${item.u_id }</div>
			  </div>
			  <div class="card-body">
			    <blockquote class="blockquote mb-0">
			      <p style="font-size:13px;">${item.r_content }</p>
			      	<div class="review" style="float: right">
			      		<span style="font-size: 11px; font-weight: 700">별점:</span>
			      		<c:forEach begin="1" end="${item.r_star }">
			      			<i class="fas fa-star" style="color:rgb(250 208 0 / 99%);"></i>
			      		</c:forEach>
			      		<c:forEach begin="1" end="${5-item.r_star }">
			      			<i class="fas fa-star" style="color:lightgrey"></i>
			      		</c:forEach>
			      	</div>
			    </blockquote>
			  </div>
			</div>	
		</c:forEach>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
		
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js" integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>	
		
	<script>
	
	const ctx = "${pageContext.request.contextPath}";
	
	
	let priceInput = document.querySelector("#priceInput");
	priceInput.innerText = Number(priceInput.innerText).toLocaleString()+" 원";

	let likeIcon = document.querySelector(".likeIcon");
	let toggle = ${likeStatus};
	document.querySelector(".likeIcon").addEventListener("click",function(){
		
		const data = {
				b_code : ${book.b_code},
				u_id : `<%= session.getAttribute("id")%>`
		}
		console.log(data);
		if(toggle === true){
			likeIcon.innerHTML =`<i class="fa-regular fa-heart fa-xl" style="color:#4eac27"></i>`;
			fetch(`${ctx}/book/like`,{
				method : "put",
				headers :{
					"Content-Type" : "Application/json"
				},
				body : JSON.stringify(data)
			}).then((res) => res.json())
			.then(() => toggle = !toggle)
		/* 	.then(location.reload()); */ 
		}else{
			likeIcon.innerHTML =`<i class="fa-solid fa-heart fa-xl" style="color:#4eac27"></i>`;
			fetch(`${ctx}/book/like`, {
				method : "post",
				headers : {
					"Content-Type" : "Application/json"
				},
				body : JSON.stringify(data)
			}).then((res) => res.json())
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
 				     	<button id="deleteButton"  type="button" class="btn btn-primary" onclick ="location.href = '${ctx}/book/cart/cart'">예</button>
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