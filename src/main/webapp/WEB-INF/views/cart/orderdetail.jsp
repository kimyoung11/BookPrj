<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
      integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
      crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
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

        #hr_line {
            height: 3px;
            padding: 0;
            background-color: green;
            color: green;
            opacity: 1;
        }
        
        th {
        	vertical-align: middle;
        }
        
        p {
        	text-align: left;
        }
</style>
</head>
<body>
	<div style="margin-top: 100px"></div>
    <div class="container-md" style="text-align: center;">
        <a href="/cart/orderdetail?o_number=${orderDetailList[0].o_number }"><h2>주문상세</h2></a>
        <hr id="hr_line">
        <p>주문번호 : ${orderDetailList[0].o_number}</p>
        <p>주문일시 : ${orderDetailList[0].o_date }</p>
        <p>결제금액 : ${orderDetailList[0].o_total }</p>
        <table class="table">
        	<thead>
				<tr>
					<th>상품 정보</th>
					<th>상품명</th>
					<th>수량</th>
					<th>합계금액</th>
				</tr>
				<tbody>
				<c:forEach items="${orderDetailList}" var="orderDetailList">
				<tr>
					<th><img src="${orderDetailList.b_img }" alt=""></th>
					<th>${orderDetailList.b_title }</th>
					<th>${orderDetailList.od_count }</th>
					<th>${orderDetailList.b_price * orderDetailList.od_count}원</th>
				</tr>       	
				</c:forEach>
				</tbody>
        	</thead>
        </table>
    </div>
</body>
</html>