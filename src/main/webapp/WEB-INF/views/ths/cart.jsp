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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
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

.table{margin: 30px 0;}

.table>tbody{
    vertical-align: middle;
    height: 140px;

}
.delete-btn,
.order-btn {
    padding: 6px 26px;
    margin-left: 4px;
}
.card{
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
            <tbody >
            	<c:forEach items="${cartlist }" var="cart" varStatus="status">
	            	<tr>
	       				<td>
	       					<input checked name="pricecheck" type="checkbox" value="priceTarget${status.index }">
	       				</td>
	       				
	       				<td>
	       					<img src="${cart.b_img }" alt="" style="width: 80px; height: 100px;">
	       				</td>
	       				
	            		<td>
	            			${cart.b_title }
	            		</td>
	            		
	            		<td>
	            			<input value="1" onchange="sumAllPrice(this)" data-price="${cart.b_price }" data-price-target="#priceTarget${status.index }" class="cntInput" id="cnt${status.index }" style="width: 50px" type="number">개
	            		</td>
	            		
	            		<td id="price">
	            		${cart.b_price }
	            		</td>
	            		
	            		<td class="totalPrice" id="priceTarget${status.index }">
	            		${cart.b_price }
	            		</td>
	            	</tr>
            	</c:forEach>
            </tbody>
        </table>

            <div class="card">
                <div class="card-body">
                    선택된 상품의 합계 금액 = 
 					<span id = dvalue></span>                   
                    <span id = "totalPriceHolder"></span>
                </div>
              </div>

        
        <div style="margin-top: 30px; margin-bottom: 30px;">
            <button type="button" class="btn btn-primary delete-btn">선택 삭제 하기</button>
            <button type="button" class="btn btn-primary order-btn" >선택 주문 하기</button>
        </div>
    </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
      <script>
      	const bprice = document.querySelectorAll(".totalPrice");
      	let bpSum = 0;
      	for (const e of bprice) {
      		bpSum = bpSum + parseInt(e.innerText);
      	}
      	document.getElementById("totalPriceHolder").innerText = bpSum;
      
      
         function sumAllPrice(elem){
        	 console.log(elem.value);
        	 console.log(elem.dataset.price);
        	 const a = elem.value;
        	 const b = elem.dataset.price;
        	 console.log(a * b);
        	 console.log(elem.dataset.priceTarget);
        	 document.querySelector(elem.dataset.priceTarget).innerText = a * b;
        	 
        	const c =  document.querySelectorAll(".totalPrice");
        	console.log(c);
        	
        	let sum = 0;
        	for(const d of c) { 
        		sum = sum + Number(d.innerText);
        	}
        	console.log(sum);
        	document.getElementById("totalPriceHolder").innerText = sum;
         }
         
        /*  const arr = [];
         const checkedPrice = document.getElementByName("pricecheck");
        	for(const f : checkedPrice) {
        		if(checkedPrice[f].checked == true) {
        			arr.push(checkedPrice[f].value);
        		}
        		
        		console.log(arr);
        	} */
         
	</script>
</body>
</html>