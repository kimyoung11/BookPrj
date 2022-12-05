<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

ul {
	padding: 0;
}

a {
	color: #333;
	text-decoration: none;
}

.table {
	margin: 30px 0;
}

.table>tbody {
	vertical-align: middle;
	height: 140px;
}

.delete-btn, .order-btn {
	padding: 6px 26px;
	margin-left: 4px;
}

.card {
	font-size: 20px;
}
</style>
<body>
	<div class="container-md text-center">
		<div class="row">
			<h2>장바구니</h2>
			<p style="opacity: 0.8">주문하실 상품과 수량을 확인해주세요.</p>

			<table class="table">
				<thead>
					<tr>
						<th>선택</th>
						<th>상품사진</th>
						<th>상품명</th>
						<th>수량</th>
						<th>금액</th>
						<th>합계금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cartlist }" var="cart" varStatus="status">
						<tr>
							<td><input 
								data-user-id="${cart.u_id }"
								data-book-code="${cart.b_code }"
								data-cart-count="${cart.c_count }"
								value="${cart.b_price }" onchange="boxValueChange()" id="selectbox${status.index }" name="pricecheck" type="checkbox" checked></td>

							<td><img src="${cart.b_img }" alt=""style="width: 80px; height: 100px;"></td>

							<td>${cart.b_title }</td>

							<td><input value="${cart.c_count }" onchange="sumAllPrice(this)"
								data-checkbox-target="#selectbox${status.index }" data-price="${cart.b_price }"
								data-price-target="#priceTarget${status.index }" class="cntInput" id="cnt${status.index }" style="width: 50px" type="number">권
							</td>	

							<td id="price">${cart.b_price }</td>

							<td class="totalPrice" id="priceTarget${status.index }">
							${cart.b_price * cart.c_count}
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="card">
				<div class="card-body">
					선택된 상품의 합계 금액 = <span id="totalPriceHolder"></span>
				</div>
			</div>


			<div style="margin-top: 30px; margin-bottom: 30px;">
				<button data-bs-toggle="modal" data-bs-target="#deleteModal"
   				type="button" class="btn btn-primary delete-btn">선택삭제 하기</button>
   				
				<button data-bs-toggle="modal" data-bs-target="#orderModal" 
				type="button" class="btn btn-primary order-btn">선택주문 하기</button>
			</div>
		</div>
	</div>
	
	<div style="display: none;">
		<c:url value="/ths/deleteCart" var="deleteLink" />
		<form action="${deleteLink }" id="deleteForm" method="post"></form>
	</div>
	
	<div style="display: none;">
		<c:url value="/ths/order" var="toOrderLink" />
		<form action="${toOrderLink }" id="toOrderForm" method="post"></form>
	</div>
	
	<!-- 장바구니 선택 삭제 모달  -->
	<!-- Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">장바구니 목록 삭제</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        장바구니에서 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button id="deleteButton"  type="button" class="btn btn-primary">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 장바구니 선택 주문 모달  -->
	<!-- Modal -->
	<div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">결제 페이지 이동</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        결제 페이지로 이동하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button id="orderButton" type="button" class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
      	const bprice = document.querySelectorAll(".totalPrice");
      	let bpSum = 0;
      	for (const e of bprice) {
      		bpSum = bpSum + parseInt(e.innerText);
      	}
      	document.getElementById("totalPriceHolder").innerText = bpSum;
      
      
        function sumAllPrice(elem){
	 		const a = elem.value;
	       	const b = elem.dataset.price;
	        document.querySelector(elem.dataset.priceTarget).innerText = a * b;
	        	 
	       	const checkBox = document.querySelector(elem.dataset.checkboxTarget);
	       	checkBox.dataset.cartCount = elem.value;
	       	checkBox.value = a * b;
	       	
	       	boxValueChange();
        }
         
       	function boxValueChange() {
			const checkList = document.querySelectorAll("input[name='pricecheck']:checked");
			
			let sum = 0;
			for (const box of checkList) {
				console.log(box);
				console.log(box.value);
				sum = sum + Number(box.value);
			}
			document.getElementById("totalPriceHolder").innerText = sum;
		}
        
       	// 선택삭제 기능
       
       	document.querySelector("#deleteButton").addEventListener("click", function(){
       		// 1. 비어있는 form 가져오기
       		const form = document.forms.deleteForm;
       		// 2. 체크된 체크박스들 가져오기
       		const boxList = document.querySelectorAll("input[name='pricecheck']:checked");
       		
       		for (const box of boxList) {
	       		// 3. 체크박스에 있는 값들로 input 만들어서
	       		const userId = box.dataset.userId;
	       		const bookCode = box.dataset.bookCode;
	       		
	       		const userIdInput = `<input name="u_id" value="\${userId}" />`;
	       		const bookCodeInput = `<input name="b_code" value="\${bookCode}" />`;
	       		
	       		// 4. 비어있는 form에 채우기
       			form.insertAdjacentHTML('beforeend', userIdInput);
       			form.insertAdjacentHTML('beforeend', bookCodeInput);
       		}
       		
       		// 5. form 전송하기
       		form.submit();
       		
       	});
       	
       	
     // 선택 결제 기능
        
       	document.querySelector("#orderButton").addEventListener("click", function(){
       		// 1. 비어있는 form 가져오기
       		const form = document.forms.toOrderForm;
       		// 2. 체크된 체크박스들 가져오기
       		const boxList = document.querySelectorAll("input[name='pricecheck']:checked");
       		
       		for (const box of boxList) {
	       		// 3. 체크박스에 있는 값들로 input 만들어서
	       		const userId = box.dataset.userId;
	       		const bookCode = box.dataset.bookCode;
	       		const cartCount = box.dataset.cartCount;
	       		
	       		const userIdInput = `<input name="u_id" value="\${userId}" />`;
	       		const bookCodeInput = `<input name="b_code" value="\${bookCode}" />`;
	       		const cartCountInput = `<input name="c_count" value="\${cartCount}" />`;
	       		
	       		// 4. 비어있는 form에 채우기
       			form.insertAdjacentHTML('beforeend', userIdInput);
       			form.insertAdjacentHTML('beforeend', bookCodeInput);
       			form.insertAdjacentHTML('beforeend', cartCountInput);
       		}
       		
       		// 5. form 전송하기
       		form.submit();
       		
       	});
       	
      
         
	</script>
</body>
</html>