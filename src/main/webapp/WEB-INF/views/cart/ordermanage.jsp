<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/cart/ordermanage" var="ordersList"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 관리</title>
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

        #hr_line {
            height: 3px;
            padding: 0;
            background-color: green;
            color: green;
            opacity: 1;
        }
        
        td {
        	vertical-align: middle;
        }
        
        select {
        width: 100px;
        border-radius: 5px;
        border-width: 1px;
        height: 40px;
        margin: 0;
        padding: 0;
        }
        
        #selectButton{
        width: 50px;
        border-radius: 5px;
        border: 0.5px;
        height: 40px;
        margin: 0;
        padding: 0;
        color: white;
        background-color: #0d6efd;
        }
    </style>
</head>
<body>
	<div style="margin-top: 100px"></div>
    <div class="container-md" style="text-align: center;">
        <a href="/cart/ordermanage"><h2>주문관리</h2></a>
        <hr id="hr_line">
        <div style= "vertical-align: middle; text-align: right">
            <form action="${orderList }">
            
            <select name="q">
                <option value="">전체</option>
                <option ${param.q == "입금확인" ? "selected" : "" } value="입금확인">입금확인</option>
                <option ${param.q == "배송중" ? "selected" : "" } value="배송중">배송중</option>
                <option ${param.q == "배송완료" ? "selected" : "" } value="배송완료">배송완료</option>
                <option ${param.q == "판매완료" ? "selected" : "" } value="판매완료">판매완료</option>
            </select>
            
            <button id="selectButton" type="submit">조회</button>
            
            </form>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>주문번호</th>
                    <th>주문일</th>
                    <th>상품명</th>
                    <th>회원명</th>
                    <th>주문수량</th>
                    <th>금액</th>
                    <th>진행상태</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                   <c:forEach items="${orders }" var="order" varStatus="sts">
                   		<tr>
                   			<td >${order.o_number }</td>	
                   			<td>${order.o_date }</td>
                   			<td>${order.b_title }</td>
                   			<td>${order.u_name}</td>
                   			<td>${order.o_count}</td>
                   			<td>${order.b_price * order.o_count }</td>
                   			<td>${order.o_status}</td>
                   			<td>
                   			<form action="/cart/orderDelete" method="post" id="deleteFrom${sts.index }">
                   			<input name="o_number" type="hidden" value="${order.o_number }">
                   			<button class="btn btn-outline-danger" onclick= "setFormId(this)" type="button" data-bs-toggle="modal" data-bs-target="#orderDeleteModal" data-form = "deleteFrom${sts.index }">삭제</button>
                   			</form>
                   			</td>
                   		</tr>
                   </c:forEach>
                </tr>
            </tbody>
        </table>
    </div>
    
    <!-- 주문 삭제 모달  -->
	<!-- Modal -->
	<div class="modal fade" id="orderDeleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">주문 목록 삭제</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	주문 목록에서 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button id="OrderDeleteButton" type="button" class="btn btn-danger">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
    
    <nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	  	
	    <li class="page-item"><a class="page-link" href="/cart/ordermanage?page=1&q=${param.q}"><i class="fa-solid fa-angles-left"></i></a></li>
		
	 	<li class="page-item"><a class="page-link" href="/cart/ordermanage?page=${pageInfo.prePageNumber }&q=${param.q}"><i class="fa-solid fa-angle-left"></i></a></li>	
	  
	 	
	    <c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="pageNumber">
	    <c:url value="/cart/ordermanage" var="pageLink">
	    	<c:param name="page" value="${pageNumber }"></c:param>
	    	<c:param name="q" value="${param.q }"></c:param>
	    </c:url>
	    <li class="page-item
	    	<%-- 현재 페이지에 active 클래스 추가 --%>
	    	${pageInfo.currentPageNumber eq pageNumber ? 'active' : '' }
	    "><a class="page-link" href="${pageLink }">${pageNumber }</a></li>
	    </c:forEach>
	    <li class="page-item"><a class="page-link" href="/cart/ordermanage?page=${pageInfo.nextPageNumber }&q=${param.q}"><i class="fa-solid fa-angle-right"></i></a></li>
	    <li class="page-item"><a class="page-link" href="/cart/ordermanage?page=${pageInfo.lastPageNumber }&q=${param.q}"><i class="fa-solid fa-angles-right"></i></a></li>
	
	  </ul>
	</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
	function setFormId(elem){
		document.querySelector("#OrderDeleteButton").dataset.form = elem.dataset.form
	}

	document.querySelector("#OrderDeleteButton").addEventListener("click", function(){
		const form = document.querySelector("#"+this.dataset.form);
		form.submit();
	})

</script>
</body>
</html>